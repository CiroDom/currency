enum AbbrCurrency {
  brl(name: 'real'),
  usd(name: 'dólar americano'),
  gbp(name: 'libra esterlina'),
  aud(name: 'dólar australiano'),
  eur (name: 'euro');

  const AbbrCurrency({required this.name});

  final String name;
}
