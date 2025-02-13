class DatabaseConnection {
  static DatabaseConnection? _instance;
  final String _connectionString;

  DatabaseConnection._internal(this._connectionString) {
    print('Connection String: $_connectionString');
  }

  factory DatabaseConnection(String connectionString) {
    // instance가 null일 때만 생성
    _instance ??= DatabaseConnection._internal(connectionString);
    return _instance!;
  }

  void connect() {
    print('Connected to database with connection string: $_connectionString');
  }

  void disconnect() {
    print('Disconnected from database');
  }

  void query(String query) {
    print('Excuting query: $query');
  }
}

void main() {
  var connection1 = DatabaseConnection('my-database');
  connection1.connect();
  connection1.query('SELECT * FROM table1');
  connection1.disconnect();

  var connection2 = DatabaseConnection('my-database2');
  connection1.connect();
  connection1.query('SELECT * FROM table2');
  connection1.disconnect();

  var connection3 = DatabaseConnection('my-database3');
  connection1.connect();
  connection1.query('SELECT * FROM table3');
  connection1.disconnect();
}
