import 'package:cotadacao_moedas_app/app/general_classes/repos/historic_repo.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../../res/our_colors.dart';
import '../../../res/our_strings.dart';
import '../../../res/our_styles.dart';
import '../../components/indicators/snake_progress_indic.dart';
import '../../components/tile/our_tile.dart';
import '../../general_classes/models/currency.dart';
import '../../general_classes/models/past_exchange.dart';

class HistoricPresenter {
  HistoricPresenter(
      {required this.base, required this.target, required this.repository});

  final Currency base;
  final Currency target;
  final HistoricRepo repository;

  void goBackToExchangeView() {
    Navigator.of(navigatorKey.currentContext!).pop();
  }

  Widget buildListViewOrNot() {
    return FutureBuilder(
      future: repository.getPastExchanges(base, target),
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
          final historicList = snapshot.data!;
          final List<Widget> listWidgets = [];
          for (PastExchange pastExchange in historicList) {
            final addedTile = OurTile(
              historic: true,
              mainText: 'DIA ${pastExchange.date.day}',
              index: 0,
              onTap: (int value) {},
              price: pastExchange.getPriceInDouble(),
              howExpansive: pastExchange.getHowExpansive(),
            );

            listWidgets.add(addedTile);
          }

          bool areTwoMonths = false;
          for (int i = 1; i < historicList.length; i++) {
            if (historicList[i - 1].date.day < historicList[i].date.day) {
              areTwoMonths = true;
              break;
            }
          }

          if (!areTwoMonths) {
            final year = historicList[0].date.year.toString();
            final monthInxex = historicList[0].date.month;
            final monthName = OurStrings.months[monthInxex];

            final monthHeader = Text(
              '$year $monthName',
              style: OurStyles.textEmptyViewAndHistoric,
            );

            listWidgets.insert(0, monthHeader);
          } else {
            final year = historicList[0].date.year.toString();
            final monthNameIndex = historicList[0].date.month;
            final monthName = OurStrings.months[monthNameIndex];
            final firstMonthHeader = Text(
              '$year $monthName',
              style: OurStyles.textEmptyViewAndHistoric,
            );
            listWidgets.insert(0, firstMonthHeader);

            final secondDate =
                historicList[0].date.subtract(const Duration(days: 15));
            final secondMonthNameIndex = secondDate.month;
            final secondMonthName = OurStrings.months[secondMonthNameIndex];
            final secondMonthHeader = Text(
              '${secondDate.year} $secondMonthName',
              style: OurStyles.textEmptyViewAndHistoric,
            );
            int secondMonthIndex = 0;
            for (int i = 1; i < historicList.length; i++) {
              if (historicList[i - 1].date.day < historicList[i].date.day) {
                secondMonthIndex = i + 1;
                break;
              }
            }
            listWidgets.insert(secondMonthIndex, secondMonthHeader);
          }

          return Expanded(
            child: ListView.separated(
              itemCount: listWidgets.length,
              itemBuilder: (context, index) {
                return listWidgets[index];
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
            ),
          );
        }
      },
    );
  }
}
