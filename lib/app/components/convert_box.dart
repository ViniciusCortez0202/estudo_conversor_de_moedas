// import 'package:conversor_de_moedas/app/controllers/home_controller.dart';
// import 'package:conversor_de_moedas/app/models/currency_model.dart';
// import 'package:flutter/material.dart';

// class ConvertBox extends StatelessWidget {

//   TextEditingController controller;
//   List<CurrencyModel> items;
//   CurrencyModel dropValue;
//   void Function(CurrencyModel?)? onChanged;


//   ConvertBox({required this.items, required this.dropValue, required this.onChanged, required this.controller});


//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Expanded(
//           flex: 1,
//           child: SizedBox(
//             height: 56,
//             child: DropdownButton<CurrencyModel>(
//               value: dropValue,
//               iconEnabledColor: Colors.amber,
//               isExpanded: true,
//               underline: Container(
//                 height: 1,
//                 color: Colors.amber,
//               ),
//               items: items
//                   .map<DropdownMenuItem<CurrencyModel>>(
//                       (e) => DropdownMenuItem(value: e, child: Text(e.name)))
//                   .toList(),
//               onChanged: onChanged,
//             ),
//           ),
//         ),
//         Container(
//           width: 20,
//         ),
//         Expanded(
//             flex: 2,
//             child: TextField(
//               controller: controller,
//               decoration: InputDecoration(
//                   enabledBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.amber)),
//                   focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.amber))),
//             ))
//       ],
//     );
//   }
// }
