import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
      appBar: AppBar(title: Text('Google Fonts 데모')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('헬로 월드!', style: TextStyle(fontSize: 24)),
            Text('헬로 월드!', 
              style: GoogleFonts.nanumPenScript(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: Colors.blue
              )
            ),
          ]
        ))
      )
    );

  }
}
