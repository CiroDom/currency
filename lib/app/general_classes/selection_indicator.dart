import 'package:flutter/cupertino.dart';

abstract class SelectionIndicator implements ChangeNotifier {
  List<int> get getSelecteds;
  void select(int index);
  void unselect(int index);

  @override
  void addListener(VoidCallback listener);

  @override
  void removeListener(VoidCallback listener);
}
