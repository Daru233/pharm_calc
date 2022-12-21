import 'package:flutter/cupertino.dart';

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
