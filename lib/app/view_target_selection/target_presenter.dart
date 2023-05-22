import 'package:cotadacao_moedas_app/app/view_exchanges/exchange_view.dart';
import 'package:cotadacao_moedas_app/app/view_target_selection/target_indicator.dart';
import 'package:cotadacao_moedas_app/main.dart';
import 'package:flutter/material.dart';

import '../../res/strings.dart';
import '../components/tile/currency_tile.dart';
import '../general_classes/enums/abbr_currency.dart';

class TargetPresenter {
  TargetPresenter(this._indicator);

  final TargetIndicator _indicator;

  final int listLenght = AbbrCurrency.values.length;

  void goBackToEmptyView(BuildContext context) {
    Navigator.of(context).pop();
  }

  void goToExchangeView() {
    Navigator.of(navigatorKey.currentContext!).pushReplacement(
      MaterialPageRoute(builder: (context) => const ExchangeView()),
    );
  }

  CurrencyTile getCurrencyTile(int index) {
    return CurrencyTile(
        historic: false,
        mainText: Strings.currencies[index],
        index: index,
        selectionIndicator: _indicator,
        onTap: (index) => _indicator.select(index),
        onDoubleTap: () => goToExchangeView);
  }
}
