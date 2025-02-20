// material.dart 패키지를 가져옴.
import 'package:flutter/material.dart';

// runApp() 메서드는 화면의 앱 내부에 배치한 위젯을 표시함.
void main() {
  runApp(const MyApp());
}

// 플러터에는 두 가지 유형의 쥐엣이 있음 stateless와 stateful.
// stateless 위젯은 상태가 없는 위젯이며, 한 번 생성되면 변경되지 않음.
// stateful 위젯은 상태가 있는 위젯이며, 사용자와 상호작용하거나 데이터가 변경될 때마다 다시 그려짐.
// StatelessWidget 클래스를 상속받아 MyApp 클래스를 정의함.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  // 위젯 트리에 위젯을 삽입할 때, 플러터 프레임워크에 의해 자동으로 호출됨.
  Widget build(BuildContext context) {
    // 콘텐츠가 화면 중앙에 위치하는 위치 위젯.
    return MaterialApp(
      title: "Hello World Travel Title",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello World Travel App'),
          backgroundColor: Colors.deepPurple,
        ),
        body: Builder(
          builder:
              (context) => Center(
                child: Column(
                  children: [
                    Text(
                      'Hello World Travle ',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800],
                      ),
                    ),
                    Text(
                      'Discover the World',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                    Image.network(
                      'https://picsum.photos/200/300',
                      height: 350,
                      // errorBuilder: (
                      //   BuildContext context,
                      //   Object exception,
                      //   StackTrace? stackTrace,
                      // ) {
                      //   return Text('이미지를 불러올 수 없습니다.');
                      // },
                    ),
                    ElevatedButton(
                      child: Text('Contact Us'),
                      onPressed: () => contactUs(context),
                    ),
                  ],
                ),
              ),
        ),
      ),
    );
  }

  void contactUs(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Contact Us'),
          content: Text('Mail us at hello@world.com'),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}
