import 'package:flutter/cupertino.dart';

import '../../../res/our_strings.dart';
import '../../../res/our_styles.dart';

class HeaderNewExchange extends StatelessWidget {
  const HeaderNewExchange({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          OurStrings.newExchangeHeader,
          style: OurStyles.header,
        ),
      ],
    );
  }
}
