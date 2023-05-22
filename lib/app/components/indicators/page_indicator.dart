import 'package:cotadacao_moedas_app/res/our_colors.dart';
import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({super.key, required this.isBaseCurrencyView});

  final bool isBaseCurrencyView;

  @override
  Widget build(BuildContext context) {
    const double side = 20.0;
    const double spaceBetween = 5.0;
    const double paddBottom = 30.0;

    return Padding(
      padding: const EdgeInsets.only(bottom: paddBottom),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: side,
            height: side,
            child: Container(
              color: isBaseCurrencyView
                  ? OurColors.primary
                  : OurColors.backgroundAndText2,
            ),
          ),
          const SizedBox(
            width: spaceBetween,
          ),
          SizedBox(
            width: side,
            height: side,
            child: Container(
              color: isBaseCurrencyView
                  ? OurColors.backgroundAndText2
                  : OurColors.primary,
            ),
          )
        ],
      ),
    );
  }
}
