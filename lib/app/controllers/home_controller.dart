import 'package:conversor_de_moedas/app/models/currency_model.dart';
import 'package:conversor_de_moedas/app/repositries/currency_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class HomeController{

  final TextEditingController toText;
  final TextEditingController fromText;

  //late List<CurrencyModel> currencies;
  late List<CurrencyModel> currencies;
  late CurrencyModel currency;
  late CurrencyRepository repository;

  HomeController({required this.toText, required this.fromText, required this.repository}){
    this.currencies = CurrencyModel.getCurrencies();
    currency = CurrencyModel("BRL", "USD");
    // currencies = CurrencyModel.getCurrencies();
    // fromCurrency = currencies[0];
    // toCurrency = currencies[1];
  }

  Future convert() async{
    String text = fromText.text;
    currency.from = double.tryParse(text.replaceAll(",", ".")) ?? 1.0;
    double value = 0.0;

    try {
      await repository.fetchCurrencies(currency);
      value = currency.from * currency.to;
    } catch (e) {
      toText.text = "Unknown";
      return;
    }

    toText.text = value.toStringAsFixed(2);
  }

  double parseToDouble(String value){
    return double.tryParse(value.replaceAll(",", ".")) ?? 1.0;
  }
}