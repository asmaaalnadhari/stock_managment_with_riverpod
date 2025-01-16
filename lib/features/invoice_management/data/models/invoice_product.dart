class InvoiceProduct {
  final String id;
  final String invoiceId;
  final String productId;
  final String stockId;
  final int quantity;
  final double price;

  InvoiceProduct({
    required this.id,
    required this.invoiceId,
    required this.productId,
    required this.stockId,
    required this.quantity,
    required this.price,
  });

  factory InvoiceProduct.fromMap(Map<String, dynamic> map) {
    return InvoiceProduct(
      id: map['id'].toString(),
      invoiceId: map['invoice_id'].toString(),
      productId: map['product_id'].toString(),
      stockId: map['stock_id'].toString(),
      quantity: map['quantity'] as int,
      price: map['price'] as double,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'invoice_id': invoiceId,
      'product_id': productId,
      'stock_id': stockId,
      'quantity': quantity,
      'price': price,
    };
  }
}
