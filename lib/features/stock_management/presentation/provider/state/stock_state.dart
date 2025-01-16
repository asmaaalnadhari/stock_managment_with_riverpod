import '../../../data/models/product_stock_availability.dart';
import '../../../data/models/stock.dart';


class StockState {
  final List<Stock> stocks; // List of stocks
  final List<ProductStockAvailability> productStockAvailability; // List of product-stock availability
  final bool isLoading; // Loading status

  StockState({
    this.stocks = const [],
    this.productStockAvailability = const [],
    this.isLoading = false,
  });

  StockState copyWith({
    List<Stock>? stocks,
    List<ProductStockAvailability>? productStockAvailability,
    bool? isLoading,
  }) {
    return StockState(
      stocks: stocks ?? this.stocks,
      productStockAvailability: productStockAvailability ?? this.productStockAvailability,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
