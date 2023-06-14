import '../enums/how_expansive.dart';
import 'currency.dart';

class Exchange {
  Exchange({
    required this.from,
    required this.to,
  });

  final Currency from;
  final Currency to;
  late double _ratio;

  double get price =>
      _ratio = (double.parse(to.price) / double.parse(from.price));

  HowExpansive get howExpansive {
    if (_ratio < 1) {
      return HowExpansive.notAtAll;
    }
    else if (_ratio >= 1 && _ratio < 5) {
      return HowExpansive.aLilBit;
    }

    return HowExpansive.tooExpansive;
  }
}
