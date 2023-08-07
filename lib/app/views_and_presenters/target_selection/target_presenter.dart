import 'package:cotadacao_moedas_app/app/general_classes/repos/currency_repo.dart';
import 'package:cotadacao_moedas_app/app/general_classes/abstract_classes/selection_indicator.dart';
import 'package:cotadacao_moedas_app/app/views_and_presenters/exchanges/exchanges_presenter.dart';
import 'package:cotadacao_moedas_app/main.dart';
import 'package:cotadacao_moedas_app/res/our_strings.dart';
import 'package:flutter/material.dart';

import '../../components/tile/our_tile.dart';
import '../../general_classes/enums/abbr_currency.dart';
import '../exchanges/exchanges_view.dart';

class TargetPresenter extends ChangeNotifier implements SelectionIndicator {
  TargetPresenter(this.base);

  final int base;

  final List<int> _selecteds = [];
  @override
  List<int> get getSelecteds => _selecteds;
  final int listLenght = AbbrCurrency.values.length;

  String getbaseText() => AbbrCurrency.values[base].name;

  void showSnackBar(BuildContext context) {
    const snackBar = SnackBar(
      content: Text(OurStrings.snackBarMessage),
      duration: Duration(milliseconds: 600),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void select(int index, BuildContext context) {
    if (index == base) {
      showSnackBar(context);
      return;
    }

    if (!_selecteds.contains(index)) {
      _selecteds.add(index);
    }

    notifyListeners();
  }

  void unselect(int index) {
    if (_selecteds.contains(index)) {
      _selecteds.remove(index);
    }

    notifyListeners();
  }

  void goBackToEmptyView(BuildContext context) {
    Navigator.of(context).pop();
  }

  void goToExchangeView() {
    if (_selecteds.isEmpty) return;

    final presenter = ExchangesPresenter(
        baseIndex: base,
        targetsIndexes: getSelecteds,
        repository: CurrencyRepo());

    Navigator.of(navigatorKey.currentContext!).pushReplacement(
      MaterialPageRoute(
          builder: (context) => ExchangeView(
                presenter: presenter,
              )),
    );
  }

  OurTile buildOurTile(
      int index, SelectionIndicator presenter, BuildContext context) {
    return OurTile(
      historic: false,
      mainText: AbbrCurrency.values[index].name,
      index: index,
      presenter: presenter,
      onClick: (index) => select(index, context),
      secondOnClick: () => unselect(index),
    );
  }
}
