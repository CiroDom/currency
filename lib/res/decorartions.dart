import 'package:cotadacao_moedas_app/res/our_colors.dart';
import 'package:flutter/material.dart';

class Decorations {
  static final selectedCurrencyTile = BoxDecoration(
    border: Border.all(
      color: OurColors.primary,
      width: 1,
    ),
    color: OurColors.backgroundAndText2,
  );

  static const unselectedCurrencyTile = BoxDecoration(
    color: OurColors.backgroundAndText2,
  );
}
