import 'package:cotadacao_moedas_app/app/components/tile/currency_tile.dart';
import 'package:cotadacao_moedas_app/app/general_classes/enums/abbr_currency.dart';
import 'package:cotadacao_moedas_app/app/view_base_selection/base_indicator.dart';
import 'package:cotadacao_moedas_app/app/view_target_selection/target_indicator.dart';
import 'package:cotadacao_moedas_app/app/view_target_selection/target_presenter.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../res/strings.dart';
import '../view_target_selection/view_target_selection.dart';

class BasePresenter {
  final BaseIndicator baseIndicator = BaseIndicator();
  final int listLenght = AbbrCurrency.values.length;

  void goBackToEmptyView(BuildContext context) {
    Navigator.of(context).pop();
  }

  void goToTargetView(int selectedIndex,) {
    final presenter = TargetPresenter();
    final indicator = TargetIndicator();

    print('GoToTarget');
    
    Navigator.of(navigatorKey.currentContext!).pushReplacement(
      MaterialPageRoute(
        builder: (context) => TargetSelectionView(
            selectedIndex: selectedIndex,
            presenter: presenter,
            indicator: indicator),
      ),
    );
  }

  CurrencyTile getCurrencyTile(int index) {
    return CurrencyTile(
        historic: false,
        mainText: Strings.currencies[index],
        index: index,
        selectionIndicator: baseIndicator,
        onTap: (index) => baseIndicator.select(index),
        onDoubleTap: () => goToTargetView(index));
  }
}
