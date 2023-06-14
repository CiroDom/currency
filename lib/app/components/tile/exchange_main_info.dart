import 'package:flutter/material.dart';

import '../../../res/our_colors.dart';
import '../../../res/our_styles.dart';

class SelectionMainInfo extends StatelessWidget {
  const SelectionMainInfo({super.key, this.isSelected, required this.mainText});

  final String mainText;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.attach_money,
          color: isSelected == true ? OurColors.primary : OurColors.text1,
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          mainText,
          style: isSelected == true
              ? OurStyles.currencyBtnSelected
              : OurStyles.currencyBtnUnselected,
        ),
      ],
    );
  }
}
