import 'package:flutter/cupertino.dart';

import '../../../../res/strings.dart';
import '../../../../res/styles.dart';

class HeaderNewExchange extends StatelessWidget {
  const HeaderNewExchange({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          Strings.newExchangeHeader,
          style: Styles.header,
        ),
      ],
    );
  }
}
