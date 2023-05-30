import '../general_classes/enums/abbr_currency.dart';

class Currency {
  Currency(
    this.abbr,
    this.price,
  );

  final AbbrCurrency abbr;
  final String price;
}
