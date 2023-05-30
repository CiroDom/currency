import 'package:cotadacao_moedas_app/app/general_classes/selection_indicator.dart';
import 'package:cotadacao_moedas_app/res/our_colors.dart';
import 'package:flutter/material.dart';

import '../../../res/decorartions.dart';
import '../../../res/styles.dart';

class OurTile extends StatefulWidget {
  const OurTile({
    super.key,
    required this.historic,
    required this.mainText,
    required this.index,
    this.presenter,
    required this.onTap,
    this.nextStep,
    this.price,
  });

  final bool historic;
  final String mainText;
  final int index;
  final SelectionIndicator? presenter;
  final double? price;
  final void Function(int) onTap;
  final void Function()? nextStep;

  @override
  State<OurTile> createState() => _OurTileState();
}

class _OurTileState extends State<OurTile> {
    
  @override
  Widget build(BuildContext context) {
    final priceColor;
1
    bool isSelected = widget.presenter != null &&
        widget.presenter!.getSelecteds.contains(widget.index);

    return SizedBox(
      height: 72,
      child: GestureDetector(
        onTap: widget.historic
            ? null
            : () {
                widget.onTap(widget.index);
                print('Tile ${widget.index}: $isSelected');
              },
        onDoubleTap: widget.nextStep,
        child: AnimatedContainer(
          decoration: isSelected
              ? Decorations.selectedCurrencyTile
              : Decorations.unselectedCurrencyTile,
          duration: const Duration(milliseconds: 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 18,
                      ),
                      widget.historic
                          ? const Icon(
                              Icons.calendar_month_rounded,
                              color: OurColors.text1,
                            )
                          : Icon(
                              Icons.attach_money,
                              color:
                                  isSelected ? OurColors.primary : OurColors.text1,
                            ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        widget.mainText,
                        style: isSelected
                            ? Styles.currencyBtnSelected
                            : Styles.currencyBtnUnselected,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          widget.price != null
                              ? Text(
                                  widget.price!.toString(),
                                  style: TextStyle(
                                    color: 
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
