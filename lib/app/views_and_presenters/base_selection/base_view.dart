import 'package:cotadacao_moedas_app/app/components/app_bars/no_title_app_bar.dart';
import 'package:cotadacao_moedas_app/res/our_values.dart';
import 'package:flutter/material.dart';

import '../../../res/our_colors.dart';
import '../../components/headers/header_new_exchange.dart';
import '../../components/indicators/page_indicator.dart';
import '../../components/texts/text_base.dart';
import 'base_presenter.dart';

class BaseView extends StatefulWidget {
  const BaseView({
    super.key,
    required this.presenter,
  });

  final BasePresenter presenter;

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  @override
  void initState() {
    super.initState();
    widget.presenter.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.presenter.removeListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OurColors.body,
      appBar: NoTitleAppBar(
          buttonFunction: () => widget.presenter.goBackToEmptyView(context)),
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
                Expanded(
                  child: ListView.separated(
                    itemCount: widget.presenter.listLenght,
                    itemBuilder: (context, index) =>
                        widget.presenter.buildOurTile(index, widget.presenter),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: OurValues.smallDistance),
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
