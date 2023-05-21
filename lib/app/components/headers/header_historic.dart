import 'package:cotadacao_moedas_app/res/styles.dart';
import 'package:flutter/cupertino.dart';

import '../../../../res/strings.dart';

class HeaderHistoric extends StatelessWidget {
  const HeaderHistoric({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          Strings.historicExchangeHeader,
          style: Styles.header,
        ),
      ],
    );
  }
}