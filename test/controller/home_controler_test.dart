import 'package:conversor_de_moedas/app/controllers/home_controller.dart';
import 'package:conversor_de_moedas/app/models/currency_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

main() {

  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();

  HomeController homeController = HomeController(toText: toText, fromText: fromText);

  test("Converter de real para dolar", (){

    fromText.text = "2.0";
    homeController.convert();
    expect(toText.text, "0.36"); 

  });
  test("Converter de real para dolar com virgula", (){
    
    fromText.text = "2,0";
    homeController.convert();
    expect(toText.text, "0.36"); 

  });
  test("Converter de dolar para real", (){

    fromText.text = "1.0";
    homeController.fromCurrency = CurrencyModel.getCurrencies()[1];
    homeController.toCurrency = CurrencyModel.getCurrencies()[0];
    homeController.convert();
    expect(toText.text, "5.63"); 

  });
  
}