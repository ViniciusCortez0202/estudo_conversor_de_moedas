import 'package:conversor_de_moedas/app/controllers/home_controller.dart';
import 'package:conversor_de_moedas/app/models/currency_model.dart';
import 'package:conversor_de_moedas/app/repositries/currency_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class CurrencyModelMock extends Mock implements CurrencyModel {}

main() {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  final model = CurrencyModelMock();

  final homeController = HomeController(
      toText: toText,
      fromText: fromText,
      repository: CurrencyRepository(Dio()));

  group("Testando converssao de fato", () {
    setUp(() {
      when(() => model.to).thenReturn(0.5);
      when(() => model.currencyFrom).thenReturn("BRL");
      when(() => model.currencyTo).thenReturn("USD");

      fromText.text = "20";

      when(() => model.from)
          .thenReturn(homeController.parseToDouble(fromText.text));
    });

    test("Deve retornar 'Unkonwn'", () async {
      when(() => model.currencyTo).thenReturn("DFD");

      homeController.currency = model;
      await homeController.convert();

      expect(toText.text, equals("Unknown"));
    });

    test("Convertendo valores", () async {
      homeController.currency = model;
      await homeController.convert();

      expect(toText.text, equals("10.00"));
    });
  });

  group("Testando converssao de string para double formatada: ", () {
    test("Formatando virgula", () {
      final response = homeController.parseToDouble("3,5");
      expect(response, allOf([isA<double>(), equals(3.5)]));
    });

    test("Deve retornar 1.0 quando passar NaN", () {
      final response = homeController.parseToDouble("a");
      expect(response, allOf([isA<double>(), equals(1.0)]));
    });

    test("Converssao normal", () {
      final response = homeController.parseToDouble("55.54");
      expect(response, allOf([isA<double>(), equals(55.54)]));
    });
  });
}
