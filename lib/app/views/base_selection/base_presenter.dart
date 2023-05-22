import 'package:cotadacao_moedas_app/app/components/tile/currency_tile.dart';
import 'package:cotadacao_moedas_app/app/general_classes/enums/abbr_currency.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../../res/strings.dart';
import '../target_selection/target_indicator.dart';
import '../target_selection/target_presenter.dart';
import '../target_selection/view_target_selection.dart';
import 'base_indicator.dart';

class BasePresenter {
  BasePresenter(this._baseIndicator);

  final BaseIndicator _baseIndicator;

  final int listLenght = AbbrCurrency.values.length;


  void goBackToEmptyView(BuildContext context) {
    Navigator.of(context).pop();
  }

  void goToTargetView(int selectedIndex,) {
    final indicator = TargetIndicator();
    final presenter = TargetPresenter(indicator);
    
    Navigator.of(navigatorKey.currentContext!).pushReplacement(
      MaterialPageRoute(
        builder: (context) => TargetSelectionView(
            selectedIndex: selectedIndex,
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
        selectionIndicator: _baseIndicator,
        onTap: (index) => _baseIndicator.select(index),
        onDoubleTap: () => goToTargetView(index));
  }
}
