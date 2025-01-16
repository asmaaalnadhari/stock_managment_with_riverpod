class StocksTable {
  static const String tableName = "stocks";
  static const String colId = "id";
  static const String colLocation = "location";

  static const String createTable = '''
    CREATE TABLE $tableName (
      $colId INTEGER PRIMARY KEY AUTOINCREMENT,
      $colLocation TEXT NOT NULL
    )
  ''';
}
