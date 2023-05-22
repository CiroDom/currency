import 'package:cotadacao_moedas_app/app/general_classes/currency.dart';
import 'package:cotadacao_moedas_app/app/general_classes/enums/abbr_currency.dart';
import 'package:cotadacao_moedas_app/app/general_classes/exchange.dart';
import 'package:cotadacao_moedas_app/app/general_classes/repos/currency_repo.dart';

class ExchangePresenter {
  ExchangePresenter({
    required this.baseIndex,
    required this.selectedsCurrencies,
    required this.repository,
  });

  final int baseIndex;
  final List<int> selectedsCurrencies;
  final CurrencyRepo repository;

  late Currency baseCurrency;
  late List<Currency> targetsList;
  late List<Exchange> exchangesList;

  void getBaseCurrency() async {
    final baseAbbr = AbbrCurrency.values[baseIndex];
    baseCurrency = await repository.getCurrency(baseAbbr);
  }

  void getSelectedsList() async {
    for (int i in selectedsCurrencies) {
      final targetAbbr = AbbrCurrency.values[i];
      final targetCurrency = await repository.getCurrency(targetAbbr);
      targetsList.add(targetCurrency);
    }
  }

  void getExchanges() {
    for (int i = 0; i < targetsList.length; i++) {
      final base = baseCurrency;
      final target = targetsList[i];

      final exchange = Exchange(from: base, to: target);
      exchangesList.add(exchange);
    }
  }
}
