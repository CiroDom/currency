import 'package:flutter/cupertino.dart';

import '../../../../res/strings.dart';
import '../../../../res/styles.dart';

class TextTarget extends StatelessWidget {
  const TextTarget({super.key, required this.base});

  final int base;

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
                text: Strings.textTarget
              ),
              TextSpan(
                style: Styles.textNextHeaderBold,
                text: '\n${Strings.currencies[base]}',
              ),
            ]
          ),
        ),
      ],
    );
  }
}
