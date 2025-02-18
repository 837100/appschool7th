import 'package:flutter/material.dart';

class MyData {
  final List<String> items = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  MyData();
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final MyData data = MyData();

  @override
  Widget build(BuildContext context) {
    const title = '파일 없이 데이터 가져오기';
    List items = data.items;

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(title: const Text(title)),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(items[index]));
          },
        ),
      ),
    );
  }
}
