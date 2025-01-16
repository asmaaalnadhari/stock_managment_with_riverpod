class ProductStockTable {
  static const String tableName = "product_stock";
  static const String colId = "id";
  static const String colProductId = "product_id";
  static const String colStockId = "stock_id";
  static const String colQuantity = "quantity";

  static const String createTable = '''
    CREATE TABLE $tableName (
      $colId INTEGER PRIMARY KEY AUTOINCREMENT,
      $colProductId INTEGER NOT NULL,
      $colStockId INTEGER NOT NULL,
      $colQuantity INTEGER NOT NULL,
      FOREIGN KEY ($colProductId) REFERENCES products(id),
      FOREIGN KEY ($colStockId) REFERENCES stocks(id)
    )
  ''';
}
