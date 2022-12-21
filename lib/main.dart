import 'package:flutter/material.dart';
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
  runApp(FlutterReduxApp(
    title: 'Flutter Redux Demo',
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


























class PharmCalc extends StatefulWidget {
  const PharmCalc({Key? key}) : super(key: key);

  @override
  State<PharmCalc> createState() => _PharmCalcState();
}

class _PharmCalcState extends State<PharmCalc> {

  double left = 35.0;
  double right = 35.0;
  double top = 40.0;
  double bottom = 0.0;

  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              children: [
                Dilutions(),
                Calculations(),
                Formulations(),
              ],
            ),

            Container(
              alignment: Alignment(0, 0.8),
              child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect:  SlideEffect(
                      spacing:  12.0,
                      radius:  4.0,
                      dotWidth:  12.0,
                      dotHeight:  12.0,
                      paintStyle:  PaintingStyle.fill,
                      strokeWidth:  2,
                      dotColor:  Colors.white38,
                      activeDotColor:  Colors.white,
                  ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
