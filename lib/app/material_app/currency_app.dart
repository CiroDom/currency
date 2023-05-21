import 'package:cotadacao_moedas_app/app/view_base_currency/base_currency_view.dart';
import 'package:cotadacao_moedas_app/app/view_empty/empty_view.dart';
import 'package:flutter/material.dart';

class CurrencyApp extends StatelessWidget {
  const CurrencyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BaseCurrencyView(),
    );
  }
}
