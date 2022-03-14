
import 'package:conversor_de_moedas/app/models/currency_model.dart';

class CurrencyRepository{

  final dio;
  final String url = "https://economia.awesomeapi.com.br/json/daily/";
  CurrencyRepository(this.dio);

  Future<int> fetchCurrencies(CurrencyModel model) async{
    final response;
    try {
      print(model.currencyFrom);
      response = await dio.get(url + model.currencyFrom + "-" + model.currencyTo);
      final values = response.data as List;
      model.to = double.parse(values[0]["ask"]);
    } catch (e) {
      throw (404);
    }      

    return response.statusCode;
  }

}