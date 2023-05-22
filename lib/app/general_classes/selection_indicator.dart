import 'package:flutter/material.dart';

abstract class SelectionIndicator extends ChangeNotifier {
  List<int> get getSelecteds;
  void select(int index);
  void unselect(int index);
}
