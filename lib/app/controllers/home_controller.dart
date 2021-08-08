import 'package:conversor_de_moedas/app/models/currency_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController{

  final TextEditingController toText;
  final TextEditingController fromText;

  late List<CurrencyModel> currencies;
  late CurrencyModel toCurrency;
  late CurrencyModel fromCurrency;

  HomeController({required this.toText, required this.fromText}){
    currencies = CurrencyModel.getCurrencies();
    fromCurrency = currencies[0];
    toCurrency = currencies[1];
  }

  void convert(){
    String text = fromText.text;
    double value = double.tryParse(text.replaceAll(",", ".")) ?? 1.0;
    double converted = 0;

    if(toCurrency.name == "Real"){
      converted = value * fromCurrency.real;
    } else if(toCurrency.name == "Dolar"){
      converted = value * fromCurrency.dolar;
    } else if(toCurrency.name == "Euro"){
      converted = value * fromCurrency.euro;
    } else if(toCurrency.name == "Bitcoin"){
      converted = value * fromCurrency.bitcoin;
    }

    toText.text = converted.toStringAsFixed(2);

  }
}