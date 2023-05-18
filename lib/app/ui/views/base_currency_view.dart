import 'package:cotadacao_moedas_app/app/core/enums/abbr_currency.dart';
import 'package:cotadacao_moedas_app/app/ui/components/buttons/currency_button.dart';
import 'package:cotadacao_moedas_app/app/ui/components/headers_and_cia/header_new_exchange.dart';
import 'package:cotadacao_moedas_app/app/ui/components/headers_and_cia/text_base.dart';
import 'package:cotadacao_moedas_app/app/ui/components/indicators/page_indicator.dart';
import 'package:flutter/material.dart';

import '../../../res/our_colors.dart';

class BaseCurrencyView extends StatefulWidget {
  const BaseCurrencyView({super.key});

  @override
  State<BaseCurrencyView> createState() => _BaseCurrencyViewState();
}

class _BaseCurrencyViewState extends State<BaseCurrencyView> {

  @override
  Widget build(BuildContext context) {
    const double paddHori = 16.0;

    void goBackToEmptyView() {
      Navigator.of(context).pop();
    }

    return Scaffold(
      backgroundColor: OurColors.body,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: OurColors.body,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: OurColors.primary,
          ),
          onPressed: goBackToEmptyView,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(paddHori),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderNewExchange(),
                const SizedBox(height: 20.0),
                const TextBase(),
                const SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: AbbrCurrency.values.length,
                    itemBuilder: (context, index) => CurrencyButton(
                      abbr: AbbrCurrency.values[index],
                      isResultThere: false,
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10.0),
                  ),
                ),
              ],
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageIndicator(isBaseCurrencyView: true)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
