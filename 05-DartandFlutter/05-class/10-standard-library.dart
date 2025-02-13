import 'dart:math';

void main() {
  List<int> numbers = [1, 2, 3, 4, 5];
  print("Sum: ${numbers.reduce((value, element) => value + element)}");

  Map<String, String> capitals = {
    'USA' : 'Washington D.C.',
    'Korea' : 'Seoul',
    'Japan' : 'Tokyo'
  };

  print('Capital of USA: ${capitals['USA']}');

  DateTime now = DateTime.now();
  print('Now: $now');

  print('PI: ${pi}');
  print('Square root of 25: ${sqrt(25)}');
}
