void main() async {
  getCurrentDateTime();
  print('');
  var hourDifference = -7;
  getCurrentDateTimeWithDiffrence(hourDifference);

  printGreetingNamed();
  printGreetingNamed(clientId: 001);
  printGreetingNamed(personName: 'Mary', clientId: 2123);

  DateTime timeNow = getTimeDifference(0);
  DateTime timeDifference = getTimeDifference(-7);

  print('Current time: $timeNow');
  print('Time with Difference: $timeDifference');

// 익명 함수

  int value = 5;

  int ex1Squared(num1) => num1 * num1;
  int ex1Cubed(num1) => num1 * num1 * num1;

// 중괄호 일반 함수
  int ex2Squared(num2) {
    return num2 * num2;
  }

  int ex2Cubed(num2) {
    return num2 * num2 * num2;
  }
  print('EX1-Squared: ${ex1Squared(value)}');
  print('EX1-Cubed: ${ex1Cubed(value)}');

  print('EX2-Squared: ${ex2Squared(value)}');
  print('Ex-Cubed: ${ex2Cubed(value)}');

int myDelay = 5;

print('Hello');

var customDelay = await _customDelay(myDelay);
var customText = myDelay == customDelay ? 'Success' : 'Failed';

print('Its $value $customText');

}



Future<int> _customDelay(int delay) async {
  try {
    await Future.delayed(Duration(seconds: delay));
    return delay;

  } catch (e) {
    print(e);
    return -1;
  }
}


DateTime getTimeDifference(int hourDifference) {
  DateTime timeNow = DateTime.now();
  DateTime timeDifference = timeNow.add(Duration(hours: hourDifference));

  return timeDifference;
}

void printGreetingNamed({String personName = 'Stranger', int clientId = 9999}) {
  if (personName.contains('Stranger')) {
    print('Employee: $clientId, Stranger danger!');
  } else {
    print('Employee: $clientId, Hello $personName');
  }
}

void getCurrentDateTime() {
  var currentTime = DateTime.now();
  print('Current time: $currentTime');
}

void getCurrentDateTimeWithDiffrence(int hourDifference) {
  var timeNow = DateTime.now();
  var timeDifference = timeNow.add(Duration(hours: hourDifference));

  print('Current time: $timeNow');
  print('Time with deeference: $timeDifference');
}
