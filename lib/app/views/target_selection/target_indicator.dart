import 'package:cotadacao_moedas_app/app/general_classes/selection_indicator.dart';

class TargetIndicator extends SelectionIndicator {
  final List<int> _selecteds = [];

  @override
  List<int> get getSelecteds => _selecteds;

  @override
  void select(int index) {
    _selecteds.add(index);
  }

  @override
  void unselect(int index) {
    _selecteds.remove(index);
  }

  void selectOrUnselect(int index) {
    if (_selecteds.contains(index)) {
      _selecteds.remove(index);
    } else {
      _selecteds.add(index);
    }
  }
}
