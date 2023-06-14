import 'package:flutter/material.dart';

import '../../../res/our_colors.dart';
import '../../../res/our_styles.dart';

class HistoricMainInfo extends StatelessWidget {
  const HistoricMainInfo({super.key, required this.mainText});

  final String mainText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(
          Icons.calendar_month_rounded,
          color: OurColors.text1,
        ),
        const SizedBox(
          width: 20,
        ),
        Text(mainText, style: OurStyles.currencyBtnUnselected),
      ],
    );
  }
}
