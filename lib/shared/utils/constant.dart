class Constants {
  // Table names
  static const String productsTable = 'products';
  static const String productStockTable = 'product_stock';
  static const String stocksTable = 'stocks';
  static const String invoiceProductsTable = 'invoice_products';

  // Column names for products
  static const String colProductId = 'id';
  static const String colProductName = 'name';
  static const String colProductPrice = 'price';

  // Column names for product_stock
  static const String colProductStockId = 'id';
  static const String colProductStockProductId = 'product_id';
  static const String colProductStockStockId = 'stock_id';
  static const String colProductStockQuantity = 'quantity';

  // Column names for stocks
  static const String colStockId = 'id';
  static const String colStockName = 'name';
}
