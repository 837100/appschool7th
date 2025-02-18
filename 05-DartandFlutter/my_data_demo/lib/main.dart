// import 'dart:convert';

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late Future<List<String>> futureData;

//   @override
//   void initState() {
//     super.initState();
//     futureData = _loadMonths();
//   }

//   Future<List<String>> _loadMonths() async {
//     debugPrint('debug.month');
//     String jsonString = await DefaultAssetBundle.of(
//       context,
//     ).loadString('assets/example.json');
//     debugPrint('jsonString: $jsonString');
//     return jsonDecode(jsonString).values.cast<String>().toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: Scaffold(
//         appBar: AppBar(title: const Text('My Data App')),
//         body: FutureBuilder<List<String>>(
//           future: futureData,
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) {
//               // 미래 데이터에 대해 값이 없는 경우 (1: 값이 안 넘어온 경우, 2: 로딩 중, 3: 에러)
//               return const Center(child: CircularProgressIndicator());
//             }
//             final data = snapshot.data!;
//             return ListView.builder(
//               itemCount: data.length,
//               itemBuilder: (context, index) {
//                 return ListTile(title: Text(data[index]));
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
// 파일로만 데이터를 가져오는 방법
// import '1_basic.dart';

// 파일과 함께 데이터를 가져오는 방법
// import '2_with_file.dart';
// 파일과 JSON을 사용하여 데이터를 가져오는 방법
import '3_with_file_and_json.dart';

void main() {
  runApp(MyApp());
}
