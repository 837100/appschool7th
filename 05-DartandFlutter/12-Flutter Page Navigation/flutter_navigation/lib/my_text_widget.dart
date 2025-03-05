import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  final String title;
  final String name;

  const MyTextWidget({super.key, required this.title, required this.name});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('$title, $name'));
  }
}
