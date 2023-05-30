import 'package:cotadacao_moedas_app/app/components/buttons/button_full.dart';
import 'package:cotadacao_moedas_app/app/components/texts/text_target.dart';
import 'package:cotadacao_moedas_app/app/views/target_selection/target_presenter.dart';
import 'package:flutter/material.dart';

import '../../../res/our_colors.dart';
import '../../components/headers/header_new_exchange.dart';
import '../../components/indicators/page_indicator.dart';

class TargetView extends StatefulWidget {
  const TargetView({
    super.key,
    required this.presenter,
  });

  final TargetPresenter presenter;

  @override
  State<TargetView> createState() => _TargetViewState();
}

class _TargetViewState extends State<TargetView> {
  @override
  Widget build(BuildContext context) {
    const double paddHori = 16.0;

    initState() {
      widget.presenter.addListener(() {
        setState(() {});
      });
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
          onPressed: () => widget.presenter.goBackToEmptyView(context),
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
                TextTarget(currencyName: widget.presenter.getbaseText()),
                const SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: widget.presenter.listLenght,
                    itemBuilder: (context, index) =>
                        widget.presenter.buildOurTile(index),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10.0),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PageIndicator(isBaseCurrencyView: false),
                ButtonFull(
                    buttonFunction: widget.presenter.goToExchangeView,
                    isOn: false)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
