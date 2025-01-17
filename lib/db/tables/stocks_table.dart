class StocksTable {
  static const String tableName = "stocks";
  static const String colId = "id";
  static const String colName= "name";

  static const String createTable = '''
    CREATE TABLE $tableName (
      $colId INTEGER PRIMARY KEY AUTOINCREMENT,
      $colName TEXT NOT NULL
    )
  ''';
}
