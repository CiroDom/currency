import 'package:cotadacao_moedas_app/app/core/enums/how_expansive.dart';
import 'package:cotadacao_moedas_app/app/core/models/currency.dart';

class Exchange {
  Exchange({
    required this.from,
    required this.to,
  });

  final Currency from;
  final Currency to;
  late double _ratio;
  
  double get price => _ratio = (to.price / from.price);

  HowExpansive get howExpansive {
    if (_ratio < 1) {
      return HowExpansive.notAtAll;
    }
    if (_ratio >= 1 && _ratio < 5) {
      return HowExpansive.aLilBit;
    }
      
    return HowExpansive.tooExpansive;
  }
}
