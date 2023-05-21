import 'package:flutter/cupertino.dart';

import '../../../../res/strings.dart';
import '../../../../res/styles.dart';

class TextExchange extends StatelessWidget {
  const TextExchange({super.key, required this.base});

  final String base;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            style: Styles.textNextHeader,
            children: [
              const TextSpan(
                text: Strings.textExchange
              ),
              TextSpan(
                style: Styles.textNextHeaderBold,
                text: '\n$base',
              ),
            ]
          ),
        ),
      ],
    );
  }
}
