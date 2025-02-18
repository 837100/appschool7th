import 'dart:convert';

import 'package:flutter/material.dart';

class DataItem {
  final String title;
  DataItem({required this.title});

  factory DataItem.fromJson(Map<String, dynamic> json) {
    // 키밸류의 타이틀만 가져와서 객체를 생성
    return DataItem(title: json['title']);
  }
}

class DataSeries {
  final List<DataItem> dataModel;

  DataSeries({required this.dataModel});

  factory DataSeries.fromJson(Map<String, dynamic> json) {
    // assets의 example2 의 data as List로 List로 타입캐스팅
    var list = json['data'] as List;
    List<DataItem> dataList =
        // map 하나하나 돌면서 뒤의 함수 실행. map은 Iterable데이터로 묶어짐. 반복문으로 수행될수 있도록 컬렉션으로 되어 있는데 tolist로 list로 변환.
        list.map((dataModel) => DataItem.fromJson(dataModel)).toList();
    return DataSeries(dataModel: dataList);
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // late Future<DataSeries> dataSeries;
  DataSeries? dataSeries;

  @override
  void initState() {
    super.initState();
    // dataSeries = fetchData();
    fetchData().then((value) {
      setState(() {
        dataSeries = value;
      });
    });
  }

  Future<DataSeries> fetchData() async {
    // 파일을 가져오는 것이 컴퓨터 입장에서 오래걸리는 작업이므로 await
    String jsonString = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/example2.json');
    DataSeries dataSeries = DataSeries.fromJson(jsonDecode(jsonString));
    return dataSeries;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '파일 데이터를 JSON으로 가져오기',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('파일 데이터를 JSON으로 가져오기')),
        // body: FutureBuilder<DataSeries>(
        //   future: dataSeries,
        //   builder: (context, snapshot) {
        //     if (!snapshot.hasData) {
        //       return const Center(child: CircularProgressIndicator());
        //     }
        //     final data = snapshot.data!;
        //     return ListView.builder(
        //       itemCount: data.dataModel.length,
        //       itemBuilder: (context, index) {
        //         return ListTile(title: Text(data.dataModel[index].title));
        //       },
        body: ListView.builder(
          itemCount: dataSeries?.dataModel.length ?? 0,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(dataSeries?.dataModel[index].title ?? ''),

              // }),
            );
          },
        ),
      ),
    );
  }
}
