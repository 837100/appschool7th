import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyWidget());
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final StreamController<String> _streamController = StreamController<String>();

  @override
  void initState() {
    // 스트림은 틀면 계속 나온다고 보면됨.
    super.initState();
    debugPrint('initState');
    _startStream();
  }

  void _startStream() {
    debugPrint('_startStream');
    int count = 0;
    Timer.periodic(Duration(seconds: 2), (timer) {
      count++;
      _streamController.add('데이터 $count');
      if (count == 10) {
        timer.cancel();
        _streamController.close();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StreamBuilder 예제')),
      body: StreamBuilder<String>(
        // streamController의 출수구라고 보면됨
        stream: _streamController.stream,
        builder: (context, snapshot) {
          return Center(child: Text('StreamBuilder 예제: ${snapshot.data}'));
        },
      ),
    );
  }
}
