import 'package:cotadacao_moedas_app/app/view_base_selection/base_indicator.dart';
import 'package:cotadacao_moedas_app/app/view_base_selection/base_presenter.dart';
import 'package:cotadacao_moedas_app/main.dart';
import 'package:flutter/material.dart';

import '../view_base_selection/view_base_selection.dart';

class EmptyPresenter {
  void goToBaseCurrency() {
    final indicator = BaseIndicator();
    final presenter = BasePresenter(indicator);

    Navigator.of(navigatorKey.currentContext!).push(MaterialPageRoute(
        builder: (context) => BaseSelectionView(
              presenter: presenter,
            )));
  }
}
