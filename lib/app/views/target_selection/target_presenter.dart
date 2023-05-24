import 'package:cotadacao_moedas_app/app/general_classes/repos/currency_repo.dart';
import 'package:cotadacao_moedas_app/app/views/exchanges/exchange_presenter.dart';
import 'package:cotadacao_moedas_app/main.dart';
import 'package:flutter/material.dart';

import '../../components/tile/our_tile.dart';
import '../../general_classes/enums/abbr_currency.dart';
import '../exchanges/exchange_view.dart';

class TargetPresenter {
  TargetPresenter(this.base);

  final int base;

  final List<int> _selecteds = [];
  final int listLenght = AbbrCurrency.values.length;

  String getbaseText() => AbbrCurrency.values[base].name;

  List<int> get selecteds => _selecteds;

  void selectOrUnselect(int index) {
    if (_selecteds.contains(index)) {
      _selecteds.remove(index);
    } else {
      _selecteds.add(index);
    }
  }

  void goBackToEmptyView(BuildContext context) {
    Navigator.of(context).pop();
  }

  void goToExchangeView() {
    final presenter = ExchangePresenter(
        baseIndex: base,
        selectedsCurrencies: selecteds,
        repository: CurrencyRepo());

    Navigator.of(navigatorKey.currentContext!).pushReplacement(
      MaterialPageRoute(
          builder: (context) => ExchangeView(
                presenter: presenter,
              )),
    );
  }

  OurTile buildOurTile(int index) {
    return OurTile(
        historic: false,
        mainText: AbbrCurrency.values[index].name,
        index: index,
        onTap: (index) => selectOrUnselect(index),
        onDoubleTap: () => goToExchangeView);
  }
}
