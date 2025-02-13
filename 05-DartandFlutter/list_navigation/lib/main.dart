import 'package:flutter/material.dart';
// import 'package:list_navigation/my_grid_view.dart';
// import 'my_list_view.dart';
import 'text_field_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyListView(),
      // home: const MyGridView(),
      home: const TextFieldDemo(),
    );
  }
}
