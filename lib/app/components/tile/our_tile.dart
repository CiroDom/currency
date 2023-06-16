import 'package:cotadacao_moedas_app/app/components/tile/exchange_main_info.dart';
import 'package:cotadacao_moedas_app/app/components/tile/historic_main_info.dart';
import 'package:cotadacao_moedas_app/app/general_classes/enums/how_expansive.dart';
import 'package:cotadacao_moedas_app/app/general_classes/abstract_classes/selection_indicator.dart';
import 'package:cotadacao_moedas_app/res/our_values.dart';
import 'package:flutter/material.dart';

import '../../../res/our_decorartions.dart';

class OurTile extends StatefulWidget {
  const OurTile(
      {super.key,
      required this.historic,
      required this.mainText,
      this.index,
      this.presenter,
      this.onClick,
      this.secondOnClick,
      this.price,
      this.howExpansive});

  final bool historic;
  final String mainText;
  final int? index;
  final SelectionIndicator? presenter;
  final double? price;
  final HowExpansive? howExpansive;
  final void Function(int)? onClick;
  final void Function()? secondOnClick;

  @override
  State<OurTile> createState() => _OurTileState();
}

class _OurTileState extends State<OurTile> {
  @override
  Widget build(BuildContext context) {
    Color priceColor;

    Color getPriceColor() {
      if (widget.howExpansive == HowExpansive.notAtAll) {
        priceColor = Colors.green;

        return priceColor;
      } else if (widget.howExpansive == HowExpansive.aLilBit) {
        priceColor = Colors.yellow;

        return priceColor;
      }
      priceColor = Colors.red;

      return priceColor;
    }

    bool isSelected = widget.presenter != null &&
        widget.presenter!.getSelecteds.contains(widget.index);

    return SizedBox(
      height: 72,
      child: GestureDetector(
        onTap: widget.historic == true && widget.onClick != null
            ? null
            : isSelected
                ? widget.secondOnClick
                : () => widget.onClick!(widget.index!),
        child: Container(
          decoration: isSelected
              ? OurDecorations.selectedCurrencyTile
              : OurDecorations.unselectedCurrencyTile,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: OurValues.bigDistance,
                  ),
                  Expanded(
                    child: widget.historic
                        ? HistoricMainInfo(mainText: widget.mainText)
                        : SelectionMainInfo(
                            mainText: widget.mainText, isSelected: isSelected),
                  ),
                  Expanded(
                    child: widget.price != null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                widget.price!.toStringAsFixed(3),
                                style: TextStyle(
                                  color: getPriceColor(),
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                width: OurValues.bigDistance,
                              )
                            ],
                          )
                        : const SizedBox(),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
