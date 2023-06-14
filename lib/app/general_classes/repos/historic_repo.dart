import 'package:dio/dio.dart';

import '../models/currency.dart';
import '../models/past_exchange.dart';


class HistoricRepo {
  final _dio = Dio(
      BaseOptions(baseUrl: 'https://economia.awesomeapi.com.br/json/daily'));

  Future<List<PastExchange>> getPastExchanges(
      Currency base, Currency target) async {
    final abbrBase = base.abbr.toString().split('.').last.toUpperCase();
    final abbrTarget = target.abbr.toString().split('.').last.toUpperCase();

    final response = await _dio.get('/$abbrTarget-$abbrBase/15');
    final responseList = response.data;

    final List<PastExchange> listPastExchanges = [];
    for (int i = 0; i < 15; i++) {
      final pastExchangeJSON = responseList[i];

      if (i == 0) {
        final dateString = pastExchangeJSON["create_date"];
        final date = DateTime.parse(dateString);
        final price = pastExchangeJSON["bid"];

        listPastExchanges.add(PastExchange(date: date, price: price));
      } else {
        final date = listPastExchanges[0].date.subtract(Duration(days: i));
        final price = pastExchangeJSON["bid"];

        listPastExchanges.add(PastExchange(date: date, price: price));
      }
    }

    return listPastExchanges;
  }
}
