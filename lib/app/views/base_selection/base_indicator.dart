import 'package:cotadacao_moedas_app/app/general_classes/selection_indicator.dart';
import 'package:flutter/material.dart';

class BaseIndicator extends SelectionIndicator {
  final List<int> _selecteds = [0];

  @override
  List<int> get getSelecteds => _selecteds;

  @override
  void select(int index) {
    if (_selecteds.contains(index)) return;

    _selecteds[0] = index;
    print('index: ${index}');
    print('selecteds ${getSelecteds}');
  }

  @override
  void unselect(int index) {
    return;
  }
}
