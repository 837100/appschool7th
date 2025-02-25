import 'package:flutter/material.dart';

class GridScreen extends StatelessWidget {
  GridScreen({super.key});

  final List<String> items = List.generate(100, (index) => 'Item ${index + 1}');
  // statefulwidget일 경우에서는 소멸자 구현해주어야 함.
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('GridView 예제')),
        body: RawScrollbar(
          // body: Scrollbar(
          controller: _scrollController,
          thumbVisibility: true,
          thumbColor: Colors.grey,
          // trackVisibility: true,
          minThumbLength: 500,
          thickness: 8.0, // 스크롤바의 굵기 설정
          radius: Radius.circular(30.0), // 스크롤바의 모서리 반경 설정

          child: Padding(
            padding: const EdgeInsets.only(right: 1.0),
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              controller: _scrollController,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                var item = items[index];
                return Container(
                  color: Colors.blue[100 * ((index % 9) + 1)],
                  child: Center(child: Text(item)),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
