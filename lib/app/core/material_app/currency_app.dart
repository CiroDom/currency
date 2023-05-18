import 'package:cotadacao_moedas_app/app/ui/views/empty_view.dart';
import 'package:flutter/material.dart';

class CurrencyApp extends StatelessWidget {
  const CurrencyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const EmptyView(),
    );
  }
}
