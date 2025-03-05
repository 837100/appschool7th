import 'package:flutter/material.dart';
import 'package:flutter_navigation/my_bottom_navigation_widget.dart';

import 'my_home_page.dart';
import 'my_list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

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
  @override
  Widget build(BuildContext context) {
    const title = 'Flutter code Sample for Navigator';
    return MaterialApp(
      title: title,
      home: MyBottomNavigationWidget(),
      // initialRoute: '/signup',
      // routes: <String, WidgetBuilder>{
      //   '/': (BuildContext context) => const MyHomePage(title: title),
      //   // '/signup': (BuildContext context) => const SignUpPage(),
      // },
    );
  }
}
