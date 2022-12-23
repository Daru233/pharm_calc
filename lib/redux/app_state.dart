import 'package:flutter/cupertino.dart';
import 'package:pharm_calc/redux/reduxActions.dart';

@immutable
class AppState {
  final int counter;
  final double conversionValue;
  final MetricUnits metricUnitsValue;


  const AppState({
    this.counter = 0,
    this.conversionValue = 1.0,
    this.metricUnitsValue = MetricUnits.GRAM,
  });
}
