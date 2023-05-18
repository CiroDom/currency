import 'package:cotadacao_moedas_app/app/core/enums/abbr_currency.dart';
import 'package:cotadacao_moedas_app/res/our_colors.dart';
import 'package:flutter/material.dart';

import '../../../../res/decorartions.dart';
import '../../../../res/strings.dart';
import '../../../../res/styles.dart';

class CurrencyButton extends StatefulWidget {
  const CurrencyButton(
      {super.key,
      required this.abbr,
      required this.isResultThere,
      this.price,});

  final AbbrCurrency abbr;
  final bool isResultThere;
  final String? price;

  @override
  State<CurrencyButton> createState() => _CurrencyButtonState();
}

class _CurrencyButtonState extends State<CurrencyButton> {
  void goToNextStep() {}

  @override
  Widget build(BuildContext context) {
    bool isSelected = false;

    void select() {
      isSelected = true;
    }

    String naming() {
      if (widget.abbr == AbbrCurrency.aud) return Strings.aud;
      if (widget.abbr == AbbrCurrency.brl) return Strings.brl;
      if (widget.abbr == AbbrCurrency.eur) return Strings.eur;
      if (widget.abbr == AbbrCurrency.gpb) return Strings.gpb;
      return Strings.usd;
    }

    return SizedBox(
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
                    naming(),
                    style: isSelected
                        ? Styles.currencyBtnSelected
                        : Styles.currencyBtnUnselected,
                  ),
                  widget.isResultThere
                      ? Text(
                          widget.price!,
                        )
                      : const SizedBox()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
