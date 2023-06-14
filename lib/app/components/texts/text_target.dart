import 'package:flutter/cupertino.dart';

import '../../../res/our_strings.dart';
import '../../../res/our_styles.dart';

class TextTarget extends StatelessWidget {
  const TextTarget({super.key, required this.currencyName});

  final String currencyName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(style: OurStyles.textNextHeader, children: [
            const TextSpan(text: OurStrings.textTarget),
            TextSpan(
              style: OurStyles.textNextHeaderBold,
              text: '\n$currencyName',
            ),
          ]),
        ),
      ],
    );
  }
}
