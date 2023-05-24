import 'package:cotadacao_moedas_app/app/components/texts/text_exchange.dart';
import 'package:cotadacao_moedas_app/app/views/exchanges/exchange_presenter.dart';
import 'package:cotadacao_moedas_app/res/our_colors.dart';
import 'package:flutter/material.dart';

class ExchangeView extends StatelessWidget {
  const ExchangeView({super.key, required this.presenter});

  final ExchangePresenter presenter;

  @override
  Widget build(BuildContext context) {
    const double paddHori = 16.0;

    return Scaffold(
      backgroundColor: OurColors.body,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: OurColors.body,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(paddHori),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextExchange(base: presenter.getBaseName()),
            const SizedBox(height: 20.0),
            Expanded(
              child: ListView.separated(
                itemCount: presenter.selectedsCurrencies.length,
                itemBuilder: (context, index) =>
                    presenter.buildOurTileOrNot(index),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
