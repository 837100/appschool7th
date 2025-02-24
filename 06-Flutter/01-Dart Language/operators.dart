void main() {
  int a = 10;
  int b = 5;

  // 산술 연산의 기본 에제
  print('덧셈: ${a + b}');
  print('뺄셈: ${a - b}');
  print('곱셉: ${a * b}');
  print('나눗셈: ${a / b}');
  print('나머지: ${a % b}');

  // 비교 연산자
  print('크다: a > b ${a > b}');
  print('작다: a < b ${a < b}');
  print('크거다 같다: a >= b ${a >= b}');
  print('작거나 같다: a <= b ${a <= b}');
  print('같다: a == b ${a == b}');
  print('다르다: a != b ${a != b}');

  // 논리 연산자
  bool x = true;
  bool y = false;
  print('AND: x && y ${x && y}');
  print('OR: x || y ${x || y}');
  print('NOT: !x ${!(x || y)} == ${!x && !y}');
  print('NOT: !y ${!(x && y)} == ${!x || !y}');

  // Null 병합 연산자 (??)
  String? nullableName;
  print('기본값 ${nullableName ?? '이름 없음'}');

  // 캐스케이드 연산자 (..)
  List<String> fruits = [];
  fruits
    ..add('apple')
    ..add('banana')
    ..add('orange');

  var person =
      Person()
        ..name = 'John Doe'
        ..age = 30
        ..height = 1.80
        ..isMarried = false;
  person.printInfo();
}

class Person {
  String name = '';
  int age = 0;
  double height = 0;
  bool isMarried = false;

  void printInfo() {
    print('Name: $name, Age: $age, Height: $height, Married: $isMarried');
  }
}
