class Person {
  String name;
  int age;

  Person(this.name, this.age);

  void introduce() {
    print('My name is $name. I am $age years old.');
  }

  // Getter
  String get getName => name;
  // Setter
  set personAge(int value) {
    if (value >= 0) {
      age = value;
    }
  }
}

void main() {
  var person = Person('John Doe', 30);
  print('Name: ${person.name}, Age: ${person.age}');

  person.introduce();
  print('Getter: ${person.getName}');

  person.personAge = 40;
  print('Setter: ${person.age}');
}
