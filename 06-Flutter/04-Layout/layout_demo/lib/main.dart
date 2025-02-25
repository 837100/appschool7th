import 'package:flutter/material.dart';
import 'package:layout_demo/grid_screen.dart';
import 'package:layout_demo/list_screen.dart';

void main() {
  runApp(GridScreen());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('반응형 UI 예제')),
        body: Column(
          children: [
            LayoutBuilder(
              builder: (context, BoxConstraints constraints) {
                double fontSize = constraints.maxWidth > 600 ? 32 : 24;
                debugPrint('화면 너비: ${constraints.maxWidth.toStringAsFixed(2)}');
                debugPrint(
                  '화면 높이: ${constraints.maxHeight.toStringAsFixed(2)}',
                );
                debugPrint('텍스트 크기: $fontSize');

                return Center(
                  child: Text('반응형 텍스트', style: TextStyle(fontSize: fontSize)),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(0),
                    color: Colors.red,
                    child: Text('위젯 1'),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(0),
                    color: Colors.green,
                    child: Text('위젯 2'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
