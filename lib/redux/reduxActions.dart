import 'package:flutter/cupertino.dart';

enum MetricUnits {
  KILOGRAM,
  GRAM,
  MILLIGRAM,
  MICROGRAM,
  NANOGRAM,
  PICOGRAM,
}

@immutable
class SetConversionValue {
  final double setConversionValue;

  const SetConversionValue({
    required this.setConversionValue,
  });
}

@immutable
class SetMetricUnitsValue {
  final MetricUnits setConversionValue;

  const SetMetricUnitsValue({
    required this.setConversionValue,
  });
}

@immutable
class IncrementByOne {
  final int updatedCounter = 1;
}

@immutable
class DecrementByOne {
  final int updatedCounter = 1;
}

@immutable
class SetCount {
  final int setValue;

  const SetCount({
    required this.setValue
  });
}
