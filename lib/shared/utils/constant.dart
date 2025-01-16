class Constants {
  // Table names
  static const String productsTable = 'products';
  static const String productStockTable = 'product_stock';
  static const String stocksTable = 'stocks';
  static const String invoiceProductsTable = 'invoice_products';
  static const String invoicesTable = 'invoices';
  static const String invoiceTypesTable = 'invoice_types';

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

  // Columns for invoices table
  static const String colInvoiceId = 'id';
  static const String colInvoiceTypeId = 'type_id';
  static const String colInvoiceDate = 'date';

  // Columns for invoice_types table
  static const String colInvoiceTypeIdPrimary = 'id';
  static const String colInvoiceTypeName = 'name';

  // Columns for invoice_products table
  static const String colInvoiceProductId = 'id';
  static const String colInvoiceProductInvoiceId = 'invoice_id';
  static const String colInvoiceProductProductId = 'product_id';
  static const String colInvoiceProductStockId = 'stock_id';
  static const String colInvoiceProductQuantity = 'quantity';
  static const String colInvoiceProductPrice = 'price';
}
