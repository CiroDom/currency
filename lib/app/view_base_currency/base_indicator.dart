import 'package:cotadacao_moedas_app/app/general_classes/selection_indicator.dart';

class BaseIndicator implements SelectionIndicator {
  final List<int> _selecteds = [0];

  @override
  List<int> get getSelecteds => _selecteds;

  @override
  void select(int index) {
    if (_selecteds.contains(index)) return;

    _selecteds[0] = index;
    print('index: ${index}');
    print('selecteds ${_selecteds}');
  }

  @override
  void unselect(int index) {
    return;
  }
}
