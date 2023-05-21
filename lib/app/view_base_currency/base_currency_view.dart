import 'package:cotadacao_moedas_app/app/view_base_currency/base_presenter.dart';
import 'package:flutter/material.dart';

import '../../res/our_colors.dart';
import '../components/headers/header_new_exchange.dart';
import '../components/indicators/page_indicator.dart';
import '../components/texts/text_base.dart';

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

    final basePresenter = BasePresenter();

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
                    itemCount: basePresenter.listLenght,
                    itemBuilder: (context, index) => basePresenter.getCurrencyTile(index),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10.0),
                  ),
                ),
              ],
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [PageIndicator(isBaseCurrencyView: true)],
            ),
          ],
        ),
      ),
    );
  }
}
