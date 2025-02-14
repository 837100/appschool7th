import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceDemo extends StatefulWidget {
  const SharedPreferenceDemo({super.key});

  @override
  State<SharedPreferenceDemo> createState() => _SharedPreferenceDemoState();
}

class _SharedPreferenceDemoState extends State<SharedPreferenceDemo> {
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  void _loadUsername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _controller.text = prefs.getString('username') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Shared Preference Demo')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Enter your username',
                ),
                controller: _controller,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString('username', _controller.text);
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ));
  }
}
