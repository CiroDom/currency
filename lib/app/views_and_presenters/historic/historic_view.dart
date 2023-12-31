import 'package:cotadacao_moedas_app/app/components/app_bars/no_title_app_bar.dart';
import 'package:cotadacao_moedas_app/app/components/headers/header_historic.dart';
import 'package:cotadacao_moedas_app/app/components/texts/text_historic.dart';
import 'package:cotadacao_moedas_app/app/views_and_presenters/historic/historic_presenter.dart';
import 'package:cotadacao_moedas_app/res/our_colors.dart';
import 'package:cotadacao_moedas_app/res/our_values.dart';
import 'package:flutter/material.dart';

class HistoricView extends StatelessWidget {
  const HistoricView({super.key, required this.presenter});

  final HistoricPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OurColors.body,
      appBar: NoTitleAppBar(buttonFunction: presenter.goBackToExchangeView),
      body: Padding(
        padding: const EdgeInsets.all(OurValues.padd),
        child: Column(
          children: [
            const HeaderHistoric(),
            const SizedBox(
              height: OurValues.bigDistance,
            ),
            TextHistoric(
                base: presenter.base.abbr.name,
                target: presenter.target.abbr.name),
            const SizedBox(
              height: OurValues.hugeDistance,
            ),
            presenter.buildListViewOrNot(),
          ],
        ),
      ),
    );
  }
}
