import 'package:cotadacao_moedas_app/res/our_colors.dart';
import 'package:flutter/material.dart';

import '../../../../res/decorartions.dart';
import '../../../../res/styles.dart';


class CurrencyButton extends StatefulWidget {
  const CurrencyButton(
      {super.key,
      required this.name,
      required this.isResultThere,
      required this.price});

  final String name;
  final bool isResultThere;
  final String price;

  @override
  State<CurrencyButton> createState() => _CurrencyButtonState();
}

class _CurrencyButtonState extends State<CurrencyButton> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = false;

    void select() {
      isSelected = true;
    }

    void goToNextStep() {

    }

    return SizedBox(
      width: 328,
      height: 72,
      child: GestureDetector(
        onTap: widget.isResultThere ? null : select,
        onDoubleTap: widget.isResultThere ? null : goToNextStep,
        child: Container(
          color: OurColors.backgroundAndText2,
          decoration: isSelected ? Decorations.ourOutlinedBorder : null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 18,
                  ),
                  Icon(
                    Icons.attach_money,
                    color: isSelected ? OurColors.primary : OurColors.text1,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    widget.name,
                    style: isSelected ? Styles.currencyBtnSelected : Styles.currencyBtnUnselected,
                  ),
                  widget.isResultThere
                      ? Text(
                          widget.price,
                        )
                      : SizedBox()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
