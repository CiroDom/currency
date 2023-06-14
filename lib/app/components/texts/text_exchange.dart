import 'package:flutter/cupertino.dart';

import '../../../res/our_strings.dart';
import '../../../res/our_styles.dart';

class TextExchange extends StatelessWidget {
  const TextExchange({super.key, required this.base});

  final String base;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(style: OurStyles.textNextHeader, children: [
            const TextSpan(text: OurStrings.textExchange),
            TextSpan(
              style: OurStyles.textNextHeaderBold,
              text: '$base',
            ),
          ]),
        ),
      ],
    );
  }
}
