import 'package:cotadacao_moedas_app/app/view_base_currency/base_currency_view.dart';
import 'package:cotadacao_moedas_app/res/our_colors.dart';
import 'package:cotadacao_moedas_app/res/styles.dart';
import 'package:flutter/material.dart';

import '../../res/strings.dart';
import '../components/buttons/button_outlined.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    void goToBaseCurrencyView() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => BaseCurrencyView()));
    }

    return Scaffold(
      backgroundColor: OurColors.body,
      appBar: AppBar(
        backgroundColor: OurColors.body,
        elevation: 0.0,
        title: const Text(
          Strings.appBarTitle,
          style: Styles.titleAppBar,
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                Strings.emptyViewText,
                textAlign: TextAlign.center,
                style: Styles.textEmptyView,
              ),
              const SizedBox(
                height: 12,
              ),
              ButtonOutlined(
                buttonFunction: goToBaseCurrencyView,
              )
            ],
          ),
        ],
      ),
    );
  }
}
