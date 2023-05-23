import 'package:cotadacao_moedas_app/app/components/tile/currency_tile.dart';
import 'package:cotadacao_moedas_app/app/general_classes/enums/abbr_currency.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../../res/strings.dart';
import '../target_selection/target_presenter.dart';
import '../target_selection/target_view.dart';

class BasePresenter {
  BasePresenter();

  int _selected = 0;
  int get getSelected => _selected;
  final int listLenght = AbbrCurrency.values.length;

  void select(int index) {
    if (_selected == index) return;

    _selected = index;
    print('index: ${index}');
    print('selecteds ${getSelected}');
  }

  void goBackToEmptyView(BuildContext context) {
    Navigator.of(context).pop();
  }

  void goToTargetView(int selectedIndex) {
    final presenter = TargetPresenter(_selected);

    Navigator.of(navigatorKey.currentContext!).pushReplacement(
      MaterialPageRoute(
        builder: (context) => TargetView(
          presenter: presenter,
        ),
      ),
    );
  }

  CurrencyTile getCurrencyTile(int index) {
    return CurrencyTile(
        historic: false,
        mainText: Strings.currencies[index],
        index: index,
        onTap: (index) => select(index),
        onDoubleTap: () => goToTargetView(index));
  }
}
