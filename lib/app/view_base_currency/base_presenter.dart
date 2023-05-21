import 'package:cotadacao_moedas_app/app/components/tile/currency_tile.dart';
import 'package:cotadacao_moedas_app/app/general_classes/enums/abbr_currency.dart';
import 'package:cotadacao_moedas_app/app/view_base_currency/base_indicator.dart';

import '../../res/strings.dart';

class BasePresenter {
  final BaseIndicator baseIndicator = BaseIndicator();
  final int listLenght = AbbrCurrency.values.length;

  void goToTargetView() {}

  CurrencyTile getCurrencyTile(int index) {
    return CurrencyTile(
        historic: false,
        mainText: Strings.currencies[index],
        index: index,
        selectionIndicator: baseIndicator,
        onTap: (index) => baseIndicator.select(index),
        onDoubleTap: goToTargetView);
  }
}
