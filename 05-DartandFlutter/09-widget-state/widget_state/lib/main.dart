import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Flutter의 Material 디자인 라이브러리를 가져옵니다.
import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  runApp(const MyApp()); // Flutter 애플리케이션을 시작합니다. MyApp 위젯을 루트로 사용합니다.
}

class PlatformCheck extends StatelessWidget {
  const PlatformCheck({Key? key}) : super(key: key);

  bool get isWeb => kIsWeb;
  bool get isMobileDevice => Platform.isAndroid || Platform.isIOS;
  bool get isDesktop =>
      Platform.isMacOS || Platform.isWindows || Platform.isLinux;
  bool get isMobileDeviceOrWeb => isMobileDevice || isWeb;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return const Text('Running on the web!');
    } else if (Platform.isAndroid) {
      return const Text('Running on Android!');
    } else if (Platform.isIOS) {
      return const Text('Running on IOS!');
    }
  }
}

class MyApp extends StatelessWidget {
  // MyApp 클래스는 StatelessWidget을 상속받습니다.
  const MyApp({super.key}); // 생성자입니다. super.key를 통해 부모 클래스의 생성자를 호출합니다.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // MaterialApp 위젯을 반환합니다.
      title: 'Google Fonts Demo',
      debugShowCheckedModeBanner: false, // 애플리케이션의 제목입니다.

      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            bodyLarge:
                GoogleFonts.aBeeZee(fontSize: 30, color: Colors.deepOrange),
            bodyMedium:
                GoogleFonts.aBeeZee(fontSize: 30, color: Colors.grey[700]),
          )),
      // 홈 페이지를 설정합니다.
      // 타이틀 파라미터 전달.
      home: const MyHomePage(
          title: 'Flutter Demo Home Page'), // 애플리케이션의 홈 화면을 설정합니다.
    );
  }
}

class MyHomePage extends StatefulWidget {
  // MyHomePage 클래스는 StatefulWidget을 상속받습니다.
  const MyHomePage(
      {super.key, required this.title}); // 생성자입니다. title을 필수 매개변수로 받습니다.

  final String title; // title 변수를 선언합니다.

  @override
  State<MyHomePage> createState() =>
      _MyHomePageState(); // _MyHomePageState 객체를 생성합니다.
}

class _MyHomePageState extends State<MyHomePage> {
  // _MyHomePageState 클래스는 State<MyHomePage>를 상속받습니다.

  @override
  Widget build(BuildContext context) {
    // build 메서드를 정의합니다.
    return Scaffold(
      backgroundColor: Colors.grey,
      body: _buildContainer(context),
    );
  }

  Widget _buildContainer(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (kDebugMode) {
        debugPrint('constraints.maxWidth:${constraints.maxWidth}');
      }
      if (constraints.maxWidth > 600) {
        return _buildWideContainers();
      } else {
        return _buildNarrowContainers();
      }
    });
  }

  Widget _buildWideContainers() {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.red,
            child: Center(
              child: Text(
                'Red',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.green,
            child: Center(
              child: Text(
                'Green',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.blue,
            child: Center(
              child: Text(
                'Blue',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNarrowContainers() {
    return Column(
      children: [
        Container(
          color: Colors.orange,
          height: 100,
          child: Center(
            child: Text(
              'orange',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        Container(
          color: Colors.lightGreen,
          height: 100,
          child: Center(
            child: Text(
              'lightGreen',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        Container(
          color: Colors.lightBlue,
          height: 100,
          child: Center(
            child: Text(
              'lightBlue',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
      ],
    );
  }
}
