class InvoicesTable {

  static const String tableName = "invoices";
  static const String colId = "id";
  static const String colDate = "date";
  static const String colTypeId = "type_id";

  static const String createTable = '''
    CREATE TABLE $tableName (
      $colId INTEGER PRIMARY KEY AUTOINCREMENT,
      $colDate TEXT NOT NULL,
      $colTypeId INTEGER NOT NULL,
      FOREIGN KEY ($colTypeId) REFERENCES invoice_types(id)
    )
  ''';
}
