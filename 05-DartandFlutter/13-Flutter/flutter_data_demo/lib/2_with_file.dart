import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<String>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = _loadMonths();
  }

  Future<List<String>> _loadMonths() async {
    String jsonString = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/example.txt');
    return jsonString.split(',');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '파일로 데이터 가져오기',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('파일로 데이터 가져오기')),
        body: Center(
          child: FutureBuilder<List<String>>(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text(snapshot.data![index]));
                  },
                );
              } else {
                return Text('No data found');
              }
            },
          ),
        ),
      ),
    );
  }
}
