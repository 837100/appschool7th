import 'dart:convert';

void main() {
  List<String> months = ['January', 'February', 'March'];

  months.add('April');
  months.forEach(print);
  print('');
  print(months[0]);
  print(months.length);

  List<int> numbers = [1, 2, 3, 4, 5];

  numbers.insert(2, 10);
  numbers.remove(4);
  numbers.removeAt(2);

  List<int> evenNumbers = numbers.where((number) => number % 2 == 0).toList();
  print(evenNumbers);

  List<int> sqaredNumbers = numbers.map((number) => number * number).toList();
  print(sqaredNumbers);

  Map<String, dynamic> filmStarWars = {
    'title': 'Star Wars',
    'year': 1997,
  };

  Map<String, dynamic> filmEmpire = {
    'title': 'The Empire Strikes Back',
    'year': 1980
  };

  Map<String, dynamic> filmJedi = {
    'title': 'The Return of Jedi',
    'year': 1983,
  };

  List listFlims = [filmStarWars, filmEmpire, filmJedi];
  List<Map<String, dynamic>> movies = [filmEmpire, filmJedi];
  Map<String, dynamic> currentFilm = listFlims[0];

  var currentFilmTitle = currentFilm['title'];
  print(currentFilmTitle);

  Map<int, String> monthsMap = {
    1: 'January',
    2: 'February',
    3: 'March',
  };

  monthsMap[4] = 'April';
  monthsMap.forEach((key, value) {
    print('$key: $value');
  });

  print(monthsMap[1]);

  Map<String, int> scores = {
    'Alice': 90,
    'Bob': 80,
    'Charlie': 95,
  };

  print(scores.containsKey('Alice'));

  print(scores.containsValue(80));

  scores.remove('Bob');
  print(scores);

  Map<String, int> updatedScores =
      scores.map((key, value) => MapEntry(key, value + 5));

  print(updatedScores);
  print('');
  Map<String, dynamic> data = {'name': 'John', 'age': 30, 'city': 'Seoul'};

  if (data.containsKey('name')) {
    print('Name: ${data['city']}');
  }

  if (data.containsValue(30)) {
    print('Name: ${data['age']}');
  }

  Map<String, dynamic> user = {
    'id': 1,
    'info': {
      'name': 'Alice',
      'contacts': [
        {'type': 'email', 'value': 'alice@email.com'},
        {'type': 'phone', 'value': '123-456-7890'}
      ]
    }
  };

  String userJson = jsonEncode(user);
  print(userJson);
  print('');

  Map<String, dynamic> parsed = jsonDecode(userJson);
  print(parsed['info']['contacts'][0]['value']);
}
