import 'package:flutter/material.dart';

import '../../main.dart';
import '../views_and_presenters/empty/empty_presenter.dart';
import '../views_and_presenters/empty/empty_view.dart';

class CurrencyApp extends StatelessWidget {
  const CurrencyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: EmptyView(controller: EmptyPresenter()),
    );
  }
}
