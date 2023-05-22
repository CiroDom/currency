import 'package:cotadacao_moedas_app/app/empty/empty_presenter.dart';
import 'package:cotadacao_moedas_app/app/empty/empty_view.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class CurrencyApp extends StatelessWidget {
  const CurrencyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: EmptyView(presenter: EmptyPresenter()),
    );
  }
}
