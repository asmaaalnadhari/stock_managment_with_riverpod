import 'package:stock_management_with_riverpod/configs/app_configs.dart';

class ProductStockAvailability {
  final String productId;
  final String productName;
  final String stockId;
  final String stockName;
  final int quantity;

  ProductStockAvailability({
    required this.productId,
    required this.productName,
    required this.stockId,
    required this.stockName,
    required this.quantity,
  });

  // Factory constructor to create an instance from a Map
  factory ProductStockAvailability.fromMap(Map<String, dynamic> map) {
    final quantity = map['quantity'] as int? ?? 0;

    return ProductStockAvailability(
      productId: map['product_id'].toString(),
      productName: map['product_name'],
      stockId: map['stock_id'].toString(),
      stockName: map['stock_name'],
      quantity: quantity,
    );
  }

  // Get the availability status based on the quantity
  String getAvailabilityStatus() {
    switch (quantity) {
      case 0:
        return 'غير متوفر'; // Out of Stock
      default:
        return (quantity < AppConfigs.lowStockThreshold)
            ? 'كمية قليلة' // Low Stock
            : 'متوفر';     // In Stock
    }
  }

}
