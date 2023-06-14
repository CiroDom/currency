import 'package:cotadacao_moedas_app/app/components/app_bars/title_app_bar.dart';
import 'package:cotadacao_moedas_app/app/components/texts/text_exchange.dart';
import 'package:cotadacao_moedas_app/app/views_and_presenters/exchanges/exchanges_presenter.dart';
import 'package:cotadacao_moedas_app/res/our_colors.dart';
import 'package:cotadacao_moedas_app/res/our_values.dart';
import 'package:flutter/material.dart';

class ExchangeView extends StatelessWidget {
  const ExchangeView({super.key, required this.presenter});

  final ExchangesPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OurColors.body,
      appBar: TitleAppBar(
          emptyView: false, buttonFunction: presenter.goBackToEmptyView),
      body: Padding(
        padding: const EdgeInsets.all(OurValues.padd),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextExchange(base: presenter.getBaseName()),
            const SizedBox(height: OurValues.bigDistance),
            Expanded(
              child: ListView.separated(
                itemCount: presenter.targetsIndexes.length,
                itemBuilder: (context, index) =>
                    presenter.buildOurTileOrNot(index),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: OurValues.smallDistance),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
