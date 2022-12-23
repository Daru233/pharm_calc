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


class PharmCalc extends StatefulWidget {

  const PharmCalc({Key? key}) : super(key: key);

  @override
  State<PharmCalc> createState() => _PharmCalcState();
}

class _PharmCalcState extends State<PharmCalc> {

  final Store<AppState> _store = Store<AppState>(
    IncrementByOneReducer,
    initialState: const AppState(
      counter: 0,
      conversionValue: 3.0,
      metricUnitsValue: MetricUnits.GRAM,
    ),
  );

  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: StoreProvider(
            store: _store,
            child: Stack(
              children: [
                PageView(
                  controller: _controller,
                  children: [
                    Dilutions(),
                    Calculations(),
                    Formulations(),
                  ],
                ),
                smoothPageIndicator(),
              ],
            ),
          )
      ),
    );
  }

  Container smoothPageIndicator() {
    return Container(
      alignment: Alignment(0, 0.95),
      child: SmoothPageIndicator(
        controller: _controller,
        count: 3,
        effect:  SlideEffect(
          spacing:  14.0,
          radius:  4.0,
          dotWidth:  10.0,
          dotHeight:  10.0,
          paintStyle:  PaintingStyle.fill,
          strokeWidth:  2,
          dotColor:  Colors.white38,
          activeDotColor:  Colors.white,
        ),
      ),
    );
  }
}