import 'package:cotadacao_moedas_app/res/our_colors.dart';
import 'package:flutter/material.dart';

import '../../../res/decorartions.dart';
import '../../../res/styles.dart';

class CurrencyTile extends StatefulWidget {
  const CurrencyTile({
    super.key,
    required this.historic,
    required this.mainText,
    required this.index,
    required this.onTap,
    this.onDoubleTap,
    this.price,
  });

  final bool historic;
  final String mainText;
  final int index;
  final String? price;
  final void Function(int) onTap;
  final void Function()? onDoubleTap;

  @override
  State<CurrencyTile> createState() => _CurrencyTileState();
}

class _CurrencyTileState extends State<CurrencyTile> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = false;

    return SizedBox(
      height: 72,
      child: GestureDetector(
        onTap: widget.historic
            ? null
            : () {
                widget.onTap(widget.index);
                print('Tile ${widget.index}: $isSelected');
              },
        onDoubleTap: widget.onDoubleTap,
        child: AnimatedContainer(
          decoration: isSelected
              ? Decorations.selectedCurrencyTile
              : Decorations.unselectedCurrencyTile,
          duration: const Duration(milliseconds: 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                  widget.price != null
                      ? Text(
                          widget.price.toString(),
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
