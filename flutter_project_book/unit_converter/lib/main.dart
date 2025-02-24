// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   var fruits = ['apple', 'banana', 'cherry', 'date', 'elderberry'];
//   double _numberFrom = 0;

//   @override
//   void initState() {
//     _numberFrom = 0;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Measures Converter',
//       home: Scaffold(
//         appBar: AppBar(title: Text('Measures Converter')),
//         DropdownButton<String>(
//           items: fruits.map((String value) {
//             return DropDownMenuItem<String>(
//               value: value,
//               child: Text(value),);
//   })
//           ),
//   );
//         body: Center(
//           child: Column(
//             children: [
//               TextField(
//                 onChanged: (text) {
//                   var rv = double.tryParse(text);
//                   if (rv != null) {
//                     setState(() {
//                       _numberFrom = rv;
//                     });
//                   }
//                 },
//               ),
//               Text((_numberFrom == null) ? '' : _numberFrom.toString()),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
