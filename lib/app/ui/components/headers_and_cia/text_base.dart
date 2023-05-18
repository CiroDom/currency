import 'package:flutter/cupertino.dart';

import '../../../../res/strings.dart';
import '../../../../res/styles.dart';

class TextBase extends StatelessWidget {
  const TextBase({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          Strings.textBase,
          style: Styles.textNextHeader,
        ),
      ],
    );
  }
}