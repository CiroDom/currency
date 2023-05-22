import 'package:cotadacao_moedas_app/app/view_base_selection/base_presenter.dart';
import 'package:flutter/material.dart';

import '../view_base_selection/view_base_selection.dart';

class EmptyPresenter {
  void goToBaseCurrency(BuildContext context, BasePresenter presenter) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => BaseSelectionView(presenter: presenter,)));
  }
}
