
class CurrencyModel {
  late String currencyFrom;
  late String currencyTo;
  late double from;
  late double to;

  CurrencyModel(this.currencyFrom, this.currencyTo);

  static List<CurrencyModel> getCurrencies() {
    return <CurrencyModel>[
      CurrencyModel('BRL', ""),
      CurrencyModel('USD', ""),
      //CurrencyModel('EUR', ""),
    ];
  }
}
