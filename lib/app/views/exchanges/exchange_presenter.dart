import 'package:cotadacao_moedas_app/app/components/indicators/snake_progress_indic.dart';
import 'package:cotadacao_moedas_app/app/general_classes/currency.dart';
import 'package:cotadacao_moedas_app/app/general_classes/enums/abbr_currency.dart';
import 'package:cotadacao_moedas_app/app/general_classes/exchange.dart';
import 'package:cotadacao_moedas_app/app/general_classes/repos/currency_repo.dart';
import 'package:cotadacao_moedas_app/res/our_colors.dart';
import 'package:flutter/material.dart';

import '../../../res/strings.dart';
import '../../../res/styles.dart';
import '../../components/tile/our_tile.dart';

class ExchangePresenter {
  ExchangePresenter({
    required this.baseIndex,
    required this.selectedsCurrencies,
    required this.repository,
  });

  final int baseIndex;
  final List<int> selectedsCurrencies;
  final CurrencyRepo repository;

  void goToHistoric() {}

  String getBaseName() => AbbrCurrency.values[baseIndex].name;

  Future<Currency> getBaseCurrency() async {
    final baseAbbr = AbbrCurrency.values[baseIndex];
    final baseCurrency = await repository.getCurrency(baseAbbr);

    return baseCurrency;
  }

  Future<List<Currency>> getSelectedsList() async {
    final List<Currency> targets = [];

    for (int i in selectedsCurrencies) {
      final targetAbbr = AbbrCurrency.values[i];
      final targetCurrency = await repository.getCurrency(targetAbbr);
      targets.add(targetCurrency);
    }

    return targets;
  }

  Future<List<Exchange>> getExchanges() async {
    final List<Exchange> exchanges = [];
    final base = await getBaseCurrency();
    final targetsList = await getSelectedsList();

    for (Currency target in targetsList) {
      final exchange = Exchange(from: base, to: target);
      exchanges.add(exchange);
    }

    return exchanges;
  }

  Widget buildOurTileOrNot(int index) {
    return FutureBuilder<List<Exchange>>(
      future: getExchanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            color: OurColors.body,
            child: const Center(
              child: SnakeProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return const Text(
            Strings.error,
            style: Styles.textNextHeaderBold,
          );
        } else {
          final exchangesList = snapshot.data!;
          final exchange = exchangesList[index];

          return OurTile(
            historic: false,
            mainText: exchange.to.abbr.name,
            index: index,
            onTap: (index) => goToHistoric(),
            onDoubleTap: () {},
            price: exchange.price,
          );
        }
      },
    );
  }
}



  // Future<OurTile> buildOurTile(int index) async {
  //   final exchangesList = await getExchanges();
  //   final exchange = exchangesList[index];

  //   return OurTile(
  //     historic: false,
  //     mainText: exchange.to.abbr.name,
  //     index: index,
  //     onTap: (index) => goToHistoric(),
  //     onDoubleTap: () {},
  //     price: exchange.price,
  //   );
  // }