enum AbbrCurrency {
  brl(abbr: 'BRL', name: 'real'),
  usd(abbr: 'USD', name: 'dólar americano'),
  gpb(abbr: 'GPB', name: 'libra esterlina'),
  aud(abbr: 'AUD', name: 'dólar australiano'),
  eur(abbr: 'EUR', name: 'euro');

  const AbbrCurrency({required this.abbr, required this.name});

  final String name;
  final String abbr;
}
