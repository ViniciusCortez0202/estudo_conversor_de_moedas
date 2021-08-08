import 'package:conversor_de_moedas/app/components/convert_box.dart';
import 'package:conversor_de_moedas/app/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();

  final TextEditingController fromText = TextEditingController();

  late HomeController homeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 20),
            child: Column(
              children: [
                Image.network(
                  "https://e7.pngegg.com/pngimages/781/728/png-clipart-finance-currency-converter-bank-money-bank-orange-payment.png",
                  scale: 4,
                ),
                SizedBox(
                  height: 40,
                ),
                ConvertBox(
                  controller: fromText,
                  items: homeController.currencies,
                  onChanged: (model) {
                    setState(() {
                      homeController.fromCurrency = model!;
                    });
                  },
                  dropValue: homeController.fromCurrency,
                ),
                SizedBox(
                  height: 20,
                ),
                ConvertBox(
                  controller: toText,
                  items: homeController.currencies,
                  onChanged: (model) {
                    setState(() {
                      homeController.toCurrency = model!;
                    });
                  },
                  dropValue: homeController.toCurrency,
                ),
                Container(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    homeController.convert();
                  },
                  child: Text("CONVERTER"),
                  style: ElevatedButton.styleFrom(primary: Colors.amber[300]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
