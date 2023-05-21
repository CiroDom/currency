import 'package:dio/dio.dart';

import '../currency.dart';
import '../enums/abbr_currency.dart';

class CurrencyRepo {
  final _dio = Dio(
    BaseOptions(baseUrl: 'https://economia.awesomeapi.com.br/last'),
  );

  Future<double> getPrice(AbbrCurrency abbr) async {
    final abbrCapsLock = abbr.toString().toUpperCase();

    final response = await _dio.get('/$abbrCapsLock-BRL');
    final price = response.data['bid'];

    return price;
  }

  Future<Currency> getCurrency(AbbrCurrency abbr) async {
    final price = await getPrice(abbr);

    return Currency(abbr, price);
  }
}
