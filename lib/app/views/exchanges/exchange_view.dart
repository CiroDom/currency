import 'package:cotadacao_moedas_app/app/views/exchanges/exchange_presenter.dart';
import 'package:cotadacao_moedas_app/res/our_colors.dart';
import 'package:flutter/material.dart';

class ExchangeView extends StatelessWidget {
  const ExchangeView({super.key, required this.presenter});

  final ExchangePresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: OurColors.backgroundAndText2,
    );
  }
}
