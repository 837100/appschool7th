import 'dart:async';

import 'async_await.dart';

void main() {
  // try {
  //   int result = 10 ~/ 0;
  //   print('결과: $result');
  // } catch (e) {
  //   print('에러 발생 $e');
  // }

  // try {
  //   int result = 10 ~/ 0;
  //   print('결과: $result');
  // } catch (e) {
  //   print('에러 발생 $e');
  // } finally {
  //   print('작업 완료');
  // }

  // // 여러 종류의 에러가 발생할 수 있는 코드
  // try {
  //   dynamic value = '123';
  //   // dynamic value = 'abc';
  //   int number = int.parse(value);
  //   List<int> list = [1, 2, 3];
  //   print(list[number]);
  // } on FormatException catch (e) {
  //   print('FormatException 처리 : $e');
  // } on RangeError catch (e) {
  //   print('RangeError 처리 : $e');
  // } on TypeError catch (e) {
  //   print('TypeError 처리 : $e');
  // } catch (e) {
  //   print('그 외 다른 에러 처리 $e');
  // }

  // // catch 블록에서 조건문 사용 (덜 인반적, 복잡한 경우에 유용)
  // try {
  //   dynamic value = "abc";
  //   int number = int.parse(value);
  //   print(number);
  //   List<int> list = [1, 2, 3];
  //   print(list[number]);
  // } catch (e) {
  //   if (e is FormatException) {
  //     print("FormatException (조건문) : $e");
  //   } else if (e is RangeError) {
  //     print("RangeError (조건문) : $e");
  //   } else if (e is TypeError) {
  //     print("TypeError (조건문) : $e");
  //   } else {
  //     print('그 외 다른 에러 (조건문)');
  //   }
  // }

  Future<int> future1 = Future.delayed(
    Duration(seconds: 1),
    () => int.parse('abc'),
  );
  print('future2 실행 시작');
  Future<int> future2 = Future.delayed(Duration(seconds: 2), () => 10);

  Future<int> future3 = Future.delayed(
    Duration(seconds: 1),
    () => [1, 2, 3][5],
  );

  Future.wait([
        future1.catchError((e) {
          print('future1 에러: $e');
          return -1;
        }),
        future2.catchError((e) {
          print('future2 에러: $e');
          return -2;
        }),
        future3.catchError((e) {
          print('future3 에러: $e');
          return -3;
        }),
      ])
      .then((results) {
        print('Future.wait 결과:$results');
      })
      .catchError((e) {
        print('Future.wait 자체 에러: $e');
      });

  processData()
      .then((value) => print('processData 완료'))
      .catchError((e) => print('processData에서 전역 에러: $e'));
}

Future<void> processData() async {
  try {
    String data = await fetchData();
    int number = int.parse(data);
    print(number);
  } on TimeoutException catch (e) {
    print('TimeoutException: $e');
  } on FormatException catch (e) {
    print('FormatException: $e');
  } catch (e) {
    print('알 수 없는 에러: $e');
    rethrow;
  } finally {
    print('finally 블록 실행 (항상 실행됨)');
  }
}

Future<String> fetchData() async {
  // Future.delayed(Duration(seconds: 2)).timeout(Duration(microseconds: 500));

  return Future.delayed(Duration(seconds: 2), () => '123');
  // return Future.delayed(Duration(seconds: 2), () => 'abc');
}
