void main() {
  bool isFootball = true;

  if (isFootball) {
    print('Go football');
  } else {
    print('Go Sports!!!!');
  }

  bool isTrue = true;

  while (isTrue) {
    print('Hello');
    isTrue = false;
  }

  do {
    print('Hello2');
  } while (isTrue);

  int myValue = 2;

  switch (myValue) {
    case 1:
      print('monday');
    case 2:
      print('Tuesday');
    default:
      print('Error');
  }

  const slash = '/';
  const star = '*';
  const plus = '+';
  const minus = '-';

  String charCode = '1';

  switch (charCode) {
    case slash || star || plus || minus:
      print('Mathematical operator');
    default:
      print('Unknown');
  }

  int numValue = 5;

  switch (numValue) {
    case >= 0 && <= 9:
      print('Single digit number');
    default:
      print('Unknown');
  }

  String smallSwitchReturn(int intValue) {
    return switch (intValue) {
      1 => "value is 1",
      2 => "Value is 2",
      _ => "another value"
    };
  }

  print(smallSwitchReturn(1));

  int maxIterations = 5;
  for (var i = 0; i < maxIterations; i++) {
    print('Iteration: $i');
  }

  daysOfWeek.forEach((day) {
    print(day);
  });

  daysOfWeek.forEach(print);

  print(Day.values);
  print('${Day.values[0]}');
  print(Day.values.byName('mon'));

  // Error handling
  String name = 'Dart';

  try {
    print('Name: $name');
    print(name.indexOf(name[0], name.length - (name.length+2)));
  } on RangeError catch (exception) {
    print('On Exception: $exception');
  } finally {
    print('Mission completed!');
  }

} // end of main

enum Day { sun, mon, tues }

List daysOfWeek = [
  'Sunday',
  'Monday',
  'TuesDay',
  'ThursDay',
  'FriDay',
  'SaturDay',
];
