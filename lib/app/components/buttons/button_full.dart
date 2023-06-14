import 'package:cotadacao_moedas_app/res/our_strings.dart';
import 'package:cotadacao_moedas_app/res/our_styles.dart';
import 'package:cotadacao_moedas_app/res/our_values.dart';
import 'package:flutter/material.dart';

class ButtonFull extends StatelessWidget {
  const ButtonFull(
      {super.key, required this.buttonFunction, required this.isOn});

  final bool isOn;
  final VoidCallback buttonFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: OurValues.padd),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 220,
            height: 48,
            child: ElevatedButton(
              style: isOn ? OurStyles.buttonFullOn : OurStyles.buttonFullOff,
              onPressed: isOn ? buttonFunction : null,
              child: Text(
                OurStrings.btnConc,
                style: isOn
                    ? OurStyles.textButtonFullOn
                    : OurStyles.textButtonFullOff,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
