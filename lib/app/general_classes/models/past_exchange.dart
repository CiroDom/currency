import 'package:cotadacao_moedas_app/app/general_classes/enums/how_expansive.dart';

class PastExchange {
  final DateTime date;
  final String price;

  PastExchange({required this.date, required this.price});

  double getPriceInDouble() => double.parse(price);

  HowExpansive getHowExpansive() {
    final priceInDouble = getPriceInDouble();

    if (priceInDouble < 1) {
      return HowExpansive.notAtAll;
    } else if (priceInDouble >= 1 && priceInDouble < 5) {
      return HowExpansive.aLilBit;
    }

    return HowExpansive.tooExpansive;
  }
}
