import 'package:cotadacao_moedas_app/res/our_strings.dart';
import 'package:cotadacao_moedas_app/res/our_styles.dart';
import 'package:flutter/material.dart';

class ButtonOutlined extends StatelessWidget {
  const ButtonOutlined({super.key, required this.buttonFunction});

  final VoidCallback buttonFunction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 48,
      child: OutlinedButton(
        style: OurStyles.buttonOutlined,
        onPressed: buttonFunction,
        child: const Text(
          OurStrings.btnBegin,
          style: OurStyles.textButtonOutlined,
        ),
      ),
    );
  }
}
