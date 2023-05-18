import 'package:cotadacao_moedas_app/app/core/enums/abbr_currency.dart';

class Currency {
  Currency(this.abbr, this.price);

  final AbbrCurrency abbr;
  final double price;
}
