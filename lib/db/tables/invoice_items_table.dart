class InvoiceItemsTable {
  static const String tableName = "invoice_items";
  static const String colId = "id";
  static const String colInvoiceId = "invoice_id";
  static const String colProductId = "product_id";
  static const String colQuantity = "quantity";

  static const String createTable = '''
    CREATE TABLE $tableName (
      $colId INTEGER PRIMARY KEY AUTOINCREMENT,
      $colInvoiceId INTEGER NOT NULL,
      $colProductId INTEGER NOT NULL,
      $colQuantity INTEGER NOT NULL,
      FOREIGN KEY ($colInvoiceId) REFERENCES invoices(id),
      FOREIGN KEY ($colProductId) REFERENCES products(id)
    )
  ''';
}
