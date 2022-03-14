import 'package:conversor_de_moedas/app/models/currency_model.dart';
import 'package:conversor_de_moedas/app/repositries/currency_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  final repository = CurrencyRepository(Dio());

  group("Testes de retorno de codigo HTTP", (){
    test("Deve retornar statusCode 200", () async {
      var currency = CurrencyModel("BRL", "USD");
      currency.from = 5;
      final code = await repository.fetchCurrencies(currency);
      expect(code, equals(200));
    });  

    test("Deve retornar statusCode 404", (){
      var currency = CurrencyModel("BRL", "DRF");
      currency.from = 5;
     
      expect(() async{
        await repository.fetchCurrencies(currency);
      }, throwsA(404));
    });
  });

  test("Testa se a variavel To nao ficou null e seu tipo", () async {
    var currency = CurrencyModel("BRL", "USD");
    currency.from = 5;
    final code = await repository.fetchCurrencies(currency);

    expect(currency.to, allOf([isNotNull, isA<double>()]));
  });

}