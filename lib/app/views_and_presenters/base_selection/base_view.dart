import 'package:cotadacao_moedas_app/app/components/app_bars/no_title_app_bar.dart';
import 'package:cotadacao_moedas_app/res/our_values.dart';
import 'package:flutter/material.dart';

import '../../../res/our_colors.dart';
import '../../components/headers/header_new_exchange.dart';
import '../../components/indicators/page_indicator.dart';
import '../../components/texts/text_base.dart';
import 'base_presenter.dart';

class BaseView extends StatelessWidget {
  const BaseView({
    super.key,
    required this.presenter,
  });

  final BasePresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OurColors.body,
      appBar: NoTitleAppBar(
          buttonFunction: () => presenter.goBackToEmptyView(context)),
      body: Padding(
        padding: const EdgeInsets.all(OurValues.padd),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderNewExchange(),
                const SizedBox(height: OurValues.bigDistance),
                const TextBase(),
                const SizedBox(
                  height: OurValues.bigDistance,
                ),
                AnimatedBuilder(
                  animation: presenter,
                  builder: (context, child) {
                    return Expanded(
                      child: ListView.separated(
                        itemCount: presenter.listLenght,
                        itemBuilder: (context, index) =>
                            presenter.buildOurTile(index, presenter),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: OurValues.smallDistance),
                      ),
                    );
                  }
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
