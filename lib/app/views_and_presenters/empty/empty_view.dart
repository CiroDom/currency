import 'package:cotadacao_moedas_app/app/components/app_bars/title_app_bar.dart';
import 'package:cotadacao_moedas_app/res/our_colors.dart';
import 'package:cotadacao_moedas_app/res/our_styles.dart';
import 'package:cotadacao_moedas_app/res/our_values.dart';
import 'package:flutter/material.dart';

import '../../../res/our_strings.dart';
import '../../components/buttons/button_outlined.dart';
import 'empty_presenter.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key, required this.presenter});

  final EmptyPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OurColors.body,
      appBar: const TitleAppBar(emptyView: true),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                OurStrings.emptyViewText,
                textAlign: TextAlign.center,
                style: OurStyles.textEmptyViewAndHistoric,
              ),
              const SizedBox(
                height: OurValues.midDistance,
              ),
              ButtonOutlined(
                buttonFunction: () => presenter.goToBaseCurrency(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
