import 'package:cotadacao_moedas_app/app/components/indicators/snake_progress_indic.dart';
import 'package:cotadacao_moedas_app/app/general_classes/enums/abbr_currency.dart';
import 'package:cotadacao_moedas_app/app/general_classes/repos/currency_repo.dart';
import 'package:cotadacao_moedas_app/app/general_classes/repos/historic_repo.dart';
import 'package:cotadacao_moedas_app/app/views_and_presenters/historic/historic_view.dart';
import 'package:cotadacao_moedas_app/res/our_colors.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../../res/our_strings.dart';
import '../../../res/our_styles.dart';
import '../../components/tile/our_tile.dart';
import '../../general_classes/models/currency.dart';
import '../../general_classes/models/exchange.dart';
import '../historic/historic_presenter.dart';

class ExchangesPresenter {
  ExchangesPresenter({
    required this.baseIndex,
    required this.targetsIndexes,
    required this.repository,
  });

  final int baseIndex;
  final List<int> targetsIndexes;
  final CurrencyRepo repository;

  void goBackToEmptyView() {
    Navigator.of(navigatorKey.currentContext!)
        .popUntil((route) => route.isFirst);
  }

  void goToHistoric(HistoricPresenter presenter) {
    Navigator.of(navigatorKey.currentContext!).push(MaterialPageRoute(
      builder: (context) => HistoricView(presenter: presenter),
    ));
  }

  String getBaseName() => AbbrCurrency.values[baseIndex].name;

  Future<Currency> getBaseCurrency() async {
    final baseAbbr = AbbrCurrency.values[baseIndex];
    final baseCurrency = await repository.getCurrency(baseAbbr);
    return baseCurrency;
  }

  Future<List<Currency>> getSelectedsList() async {
    final List<Currency> targets = [];

    for (int i in targetsIndexes) {
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
          return Text(
            '${OurStrings.error}: ${snapshot.error}',
            style: OurStyles.textNextHeaderBold,
          );
        } else {
          final exchangesList = snapshot.data!;
          final exchange = exchangesList[index];

          return OurTile(
            historic: false,
            mainText: exchange.to.abbr.name,
            index: index,
            onTap: (index) => {},
            nextStep: () {
              final repo = HistoricRepo();
              final presenter = HistoricPresenter(
                base: exchange.from,
                target: exchange.to,
                repository: repo,
              );

              goToHistoric(presenter);
            },
            price: exchange.price,
            howExpansive: exchange.howExpansive,
          );
        }
      },
    );
  }
}