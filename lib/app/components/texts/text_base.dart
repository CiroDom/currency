import 'package:flutter/cupertino.dart';

import '../../../res/our_strings.dart';
import '../../../res/our_styles.dart';

class TextBase extends StatelessWidget {
  const TextBase({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          OurStrings.textBase,
          style: OurStyles.textNextHeader,
        ),
      ],
    );
  }
}
