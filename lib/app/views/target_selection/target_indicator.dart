import 'package:cotadacao_moedas_app/app/general_classes/selection_indicator.dart';
import 'package:flutter/material.dart';

class TargetIndicator extends SelectionIndicator {
  final List<int> _selecteds = [];

  @override
  List<int> get getSelecteds => _selecteds;

  @override
  void select(int index) {
    if (_selecteds.contains(index)) return;

    _selecteds.add(index);
  }

  @override
  void unselect(int index) {
    _selecteds.remove(index);
  }
}
