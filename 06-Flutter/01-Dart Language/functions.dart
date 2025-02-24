int add(int a, int b) {
  return a + b;
}

void greet(String name, [String? title]) {
  if (title != null) {
    print('Hello, $title $name');
  } else {
    print('Hello, $name');
  }
}

// 이름이 있는 파라미터(매개변수)
// required는 필수 파라미터를 의미함.
void printPerson({required String name, int age = 0, String? occupation}) {
  print('Name: $name, Age: $age');
  if (occupation != null) {
    print('Occupation: $occupation');
  }
}

void main() {
  print('합계: ${add(10, 20)}');
  greet('John Doe');
  greet('John Doe', 'Mr.');
  printPerson(name: 'John Doe', age: 30);
  printPerson(name: 'John Doe', occupation: 'Software Engineer');
}
