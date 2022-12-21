import 'package:flutter/material.dart';
import 'package:pharm_calc/PharmCalc.dart';
import 'package:pharm_calc/redux/reduxActions.dart';
import 'package:pharm_calc/redux/app_state.dart';
import 'package:pharm_calc/redux/reducer.dart';
import 'package:pharm_calc/root_pages/calculations.dart';
import 'package:pharm_calc/root_pages/dilutions.dart';
import 'package:pharm_calc/root_pages/formulations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PharmCalc(),
  ));
}

class FlutterReduxApp extends StatelessWidget {
  final Store<AppState> _store = Store<AppState>(
    IncrementByOneReducer,
    initialState: AppState(
      counter: 0
    ),
  );
  final String title;

  FlutterReduxApp({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // The StoreProvider should wrap your MaterialApp or WidgetsApp. This will
    // ensure all routes have access to the store.
    return StoreProvider(
      // Pass the store to the StoreProvider. Any ancestor `StoreConnector`
      // Widgets will find and use this value as the `Store`.
      store: _store,
      child: MaterialApp(
        theme: ThemeData.dark(),
        title: title,
        home: Scaffold(
          appBar: AppBar(title: Text(title)),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StoreConnector<AppState, int>(
                  converter: (store) => _store.state.counter,
                  builder: (context, int stateCount) {
                    return Text(
                      'The button has been pushed this many times: $stateCount',
                    );
                  },
                ),
                StoreConnector<AppState, VoidCallback>(
                  converter: (store) {
                    return () => store.dispatch(DecrementByOne());
                    },
                  builder: (context, callback) {
                    return FloatingActionButton(
                      onPressed: () => {
                        StoreProvider.of<AppState>(context).dispatch(SetCount(setValue: 0))
                      },
                      tooltip: 'Decrement',
                      child: Icon(Icons.exposure_zero)
                    );
                  },
                ),
                StoreConnector<AppState, VoidCallback>(
                  converter: (store) {
                    return () => store.dispatch(DecrementByOne());
                  },
                  builder: (context, callback) {
                    return FloatingActionButton(
                        onPressed: callback,
                        tooltip: 'Decrement',
                        child: Icon(Icons.exposure_minus_1)
                    );
                  },
                ),
              ],
            ),
          ),

          floatingActionButton: StoreConnector<AppState, VoidCallback>(
            converter: (store) {
              return () => store.dispatch(IncrementByOne());
            },
            builder: (context, callback) {
              return FloatingActionButton(

                onPressed: callback,
                tooltip: 'Increment',
                child: Icon(Icons.add),
              );
            },
          ),
        ),
      ),
    );
  }
}
