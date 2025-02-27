import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    // 상태가 변경되었음을 알리기 위해 등록된 모든 리스너(콜백 함수)를 호출함.
    notifyListeners();
  }

  void decrement() {
    if (_counter > 0) {
      _counter--;
    }
    notifyListeners();
  }
}
