import '../../data/models/product_stock_availability.dart';
import '../../data/models/stock.dart';

abstract class IStockRepository {
  Future<int> addStock(String name);
  Future<void> updateStock(String stockId, String name);
  Future<List<Stock>> fetchStocks();
  Future<bool> deleteStockIfEmpty(String stockId);
  Future<List<ProductStockAvailability>> fetchProductStockAvailability();
}
