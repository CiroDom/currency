import 'package:cotadacao_moedas_app/app/components/tile/our_tile.dart';
import 'package:cotadacao_moedas_app/app/general_classes/enums/abbr_currency.dart';
import 'package:cotadacao_moedas_app/app/general_classes/abstract_classes/selection_indicator.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../target_selection/target_presenter.dart';
import '../target_selection/target_view.dart';

class BasePresenter extends ChangeNotifier implements SelectionIndicator {
  BasePresenter();

  final List<int> _selected = [0];
  @override
  List<int> get getSelecteds => _selected;
  final int listLenght = AbbrCurrency.values.length;

  final List<VoidCallback> _listeners = [];

  @override
  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  @override
  void notifyListeners() {
    for (final listener in _listeners) {
      listener.call();
    }
  }

  void select(int index) {
    if (_selected.contains(index)) return;

    _selected[0] = index;
    notifyListeners();
  }

  void goBackToEmptyView(BuildContext context) {
    Navigator.of(context).pop();
  }

  void goToTargetView(int selectedIndex) {
    if (!_selected.contains(selectedIndex)) return;

    final presenter = TargetPresenter(_selected[0]);

    Navigator.of(navigatorKey.currentContext!).pushReplacement(
      MaterialPageRoute(
        builder: (context) => TargetView(
          presenter: presenter,
        ),
      ),
    );
  }

  OurTile buildOurTile(int index, SelectionIndicator presenter) {
    return OurTile(
        historic: false,
        mainText: AbbrCurrency.values[index].name,
        index: index,
        presenter: presenter,
        onClick: (index) => select(index),
        secondOnClick: () => goToTargetView(index));
  }
}
