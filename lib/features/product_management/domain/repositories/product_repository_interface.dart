import '../../data/models/product.dart';

abstract class IProductRepository {
  Future<int> addProduct(String name, double price);
  Future<void> linkProductToStock(String productId, String stockId, int quantity);
  Future<List<Product>> getAllProducts();
  Future<List<Product>> getProductsByStock(String stockId);
  Future<bool> deleteProductIfNotInInvoice(String productId);
  Future<void> updateProduct(String productId, String name, double price);

}
