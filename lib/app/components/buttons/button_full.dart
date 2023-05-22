import 'package:cotadacao_moedas_app/res/strings.dart';
import 'package:cotadacao_moedas_app/res/styles.dart';
import 'package:flutter/material.dart';

class ButtonFull extends StatelessWidget {
  const ButtonFull(
      {super.key, required this.buttonFunction, required this.isOn});

  final bool isOn;
  final VoidCallback buttonFunction;

  @override
  Widget build(BuildContext context) {
    const double paddBottom = 16.0;

    return Padding(
      padding: const EdgeInsets.only(bottom: paddBottom),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 220,
            height: 48,
            child: ElevatedButton(
              style: isOn ? Styles.buttonFullOn : Styles.buttonFullOff,
              onPressed: buttonFunction,
              child: const Text(
                Strings.btnConc,
                style: Styles.textButtonOutlined,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
