import 'package:cotadacao_moedas_app/res/our_styles.dart';
import 'package:flutter/cupertino.dart';

import '../../../res/our_strings.dart';

class HeaderHistoric extends StatelessWidget {
  const HeaderHistoric({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          OurStrings.historicExchangeHeader,
          style: OurStyles.header,
        ),
      ],
    );
  }
}
