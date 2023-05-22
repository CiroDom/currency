import 'package:cotadacao_moedas_app/app/base_selection/base_presenter.dart';
import 'package:flutter/material.dart';

import '../../../res/our_colors.dart';
import '../../components/headers/header_new_exchange.dart';
import '../../components/indicators/page_indicator.dart';
import '../../components/texts/text_base.dart';

class BaseSelectionView extends StatefulWidget {
  const BaseSelectionView({
    super.key, required this.presenter,
  });

  final BasePresenter presenter;

  @override
  State<BaseSelectionView> createState() => _BaseSelectionViewState();
}

class _BaseSelectionViewState extends State<BaseSelectionView> {
  @override
  Widget build(BuildContext context) {
    const double paddHori = 16.0;

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
                const TextBase(),
                const SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: widget.presenter.listLenght,
                    itemBuilder: (context, index) =>
                        widget.presenter.getCurrencyTile(index),
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
