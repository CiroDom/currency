import 'dart:ffi';

import 'package:dio/dio.dart';

import '../currency.dart';
import '../enums/abbr_currency.dart';

class CurrencyRepo {
  final _dio = Dio(
    BaseOptions(baseUrl: 'https://economia.awesomeapi.com.br'),
  );

  Future<String> getPrice(AbbrCurrency abbr) async {
    final abbrCapsLock = abbr.toString().split('.').last.toUpperCase();

    if (abbr == AbbrCurrency.brl) {
      final String price = '1.000';

      return price;
    }

    else {
      final response = await _dio.get('/json/last/$abbrCapsLock-BRL/');
      final responseObj = response.data[abbrCapsLock + 'BRL'];
      final price = responseObj['bid'];

      return price;
    }
  }

  Future<Currency> getCurrency(AbbrCurrency abbr) async {
    final price = await getPrice(abbr);

    return Currency(abbr, price);
  }
}
