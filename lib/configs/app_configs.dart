class AppConfigs {

  AppConfigs._();
  // Database configurations
  static const String dbName = "stock_management.db";
  static const int dbVersion = 1;

  // Table names
  static const String tableProducts = "products";
  static const String tableStocks = "stocks";
  static const String tableInvoices = "invoices";
  static const String tableInvoiceItems = "invoice_items";
  static const String tableInvoiceTypes = "invoice_types";

  // Column names for the 'products' table
  static const String colProductId = "id";
  static const String colProductName = "name";
  static const String colProductPrice = "price";

  // Column names for the 'stocks' table
  static const String colStockId = "id";
  static const String colStockProductId = "product_id";
  static const String colStockQuantity = "quantity";

  // Column names for the 'invoices' table
  static const String colInvoiceId = "id";
  static const String colInvoiceDate = "date";
  static const String colInvoicesTypeId = "type_id"; // Renamed to avoid conflict

  // Column names for the 'invoice_items' table
  static const String colInvoiceItemId = "id";
  static const String colInvoiceItemInvoiceId = "invoice_id";
  static const String colInvoiceItemProductId = "product_id";
  static const String colInvoiceItemQuantity = "quantity";
  static const String colInvoiceItemPrice = "price";

  // Column names for the 'invoice_types' table
  static const String colInvoiceTypesId = "id"; // Renamed to avoid conflict
  static const String colInvoiceTypeName = "name";

  // Other configurations
  static const int lowStockThreshold = 10; // Threshold for "Low Stock" alert
}
