import 'package:cotadacao_moedas_app/app/view_exchanges/exchange_view.dart';
import 'package:cotadacao_moedas_app/app/view_target_selection/target_indicator.dart';
import 'package:cotadacao_moedas_app/app/view_target_selection/view_target_selection.dart';
import 'package:cotadacao_moedas_app/main.dart';
import 'package:flutter/material.dart';

import '../../res/strings.dart';
import '../components/tile/currency_tile.dart';
import '../general_classes/enums/abbr_currency.dart';
import '../general_classes/selection_indicator.dart';

class TargetPresenter {
  final TargetIndicator baseIndicator = TargetIndicator();
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
        selectionIndicator: baseIndicator,
        onTap: (index) => baseIndicator.select(index),
        onDoubleTap: () => goToExchangeView);
  }
}
