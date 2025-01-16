class ProductsTable {
  static const String tableName = "products";
  static const String colId = "id";
  static const String colName = "name";
  static const String colPrice = "price";

  static const String createTable = '''
    CREATE TABLE $tableName (
      $colId INTEGER PRIMARY KEY AUTOINCREMENT,
      $colName TEXT NOT NULL,
      $colPrice REAL NOT NULL
    )
  ''';
}
