import 'package:flutter/cupertino.dart';

import '../../../../res/strings.dart';
import '../../../../res/styles.dart';

class TextExchange extends StatelessWidget {
  const TextExchange({super.key, required this.base, required this.target});

  final String base;
  final String target;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(style: Styles.textNextHeader,
            children: [
            const TextSpan(text: Strings.textHistoric),
            TextSpan(
              style: Styles.textNextHeaderBold,
              text: '$target',
            ),
            TextSpan(
              text: ' em '
            ),
            TextSpan(
              style: Styles.textNextHeaderBold,
              text: '$base',
            ),
          ]),
        ),
      ],
    );
  }
}
