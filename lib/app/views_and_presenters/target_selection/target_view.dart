import 'package:cotadacao_moedas_app/app/components/buttons/button_full.dart';
import 'package:cotadacao_moedas_app/app/components/texts/text_target.dart';
import 'package:cotadacao_moedas_app/app/views_and_presenters/target_selection/target_presenter.dart';
import 'package:flutter/material.dart';

import '../../../res/our_colors.dart';
import '../../../res/our_values.dart';
import '../../components/headers/header_new_exchange.dart';
import '../../components/indicators/page_indicator.dart';

class TargetView extends StatelessWidget {
  const TargetView({
    super.key,
    required this.presenter,
  });

  final TargetPresenter presenter;

  @override
  Widget build(BuildContext context) {
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
          onPressed: () => presenter.goBackToEmptyView(context),
        ),
      ),
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
                TextTarget(currencyName: presenter.getbaseText()),
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
                            presenter.buildOurTile(index, presenter, context),
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
              children: [
                PageIndicator(isBaseCurrencyView: false),
              ],
            ),
            AnimatedBuilder(
              animation: presenter,
              builder: (context, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ButtonFull(
                            buttonFunction: presenter.goToExchangeView,
                            isOn: presenter.getSelecteds.isNotEmpty),
                  ],
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
