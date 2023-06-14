import 'package:flutter/cupertino.dart';

import '../../../res/our_strings.dart';
import '../../../res/our_styles.dart';

class TextHistoric extends StatelessWidget {
  const TextHistoric({super.key, required this.base, required this.target});

  final String base;
  final String target;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(style: OurStyles.textNextHeader, children: [
            const TextSpan(text: OurStrings.textHistoricPt1of2),
            TextSpan(
              style: OurStyles.textNextHeaderBold,
              text: '$target',
            ),
            TextSpan(text: ' em '),
            TextSpan(
              style: OurStyles.textNextHeaderBold,
              text: '$base',
            ),
            TextSpan(
              text: OurStrings.textHistoricPt2of2
            ),
          ]),
        ),
      ],
    );
  }
}
