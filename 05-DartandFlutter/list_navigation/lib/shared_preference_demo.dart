import 'package:flutter/material.dart';

class SharedPreferenceDemo extends StatelessWidget {
  SharedPreferenceDemo({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Shared Preference Demo')),
        body: Center(
            child: TextField(
          decoration: const InputDecoration(
            labelText: 'Enter your username',
          ),
          controller: _controller,
        )));
  }
}
