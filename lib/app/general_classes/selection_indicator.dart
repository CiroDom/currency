import 'package:flutter/cupertino.dart';

abstract class SelectionIndicator {
  List<int> get getSelecteds;
  void select(int index);
  void unselect(int index);
}
