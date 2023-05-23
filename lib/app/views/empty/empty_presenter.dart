import 'package:cotadacao_moedas_app/main.dart';
import 'package:flutter/material.dart';

import '../base_selection/base_presenter.dart';
import '../base_selection/base_view.dart';

class EmptyPresenter {
  void goToBaseCurrency() {
    final presenter = BasePresenter();

    Navigator.of(navigatorKey.currentContext!).push(MaterialPageRoute(
        builder: (context) => BaseView(
              presenter: presenter,
            )));
  }
}
