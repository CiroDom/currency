import 'package:cotadacao_moedas_app/app/general_classes/selection_indicator.dart';
import 'package:flutter/cupertino.dart';

class BaseIndicator extends ChangeNotifier implements SelectionIndicator {
  final List<int> _selecteds = [0];

  @override
  List<int> get getSelecteds => _selecteds;

  @override
  void select(int index) {
    if (_selecteds.contains(index)) return;

    _selecteds[0] = index;
    notifyListeners();
  }

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener);

  @override
  void unselect(int index) {
    return;
  }
}
