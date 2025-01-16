
import '../repositories/product_repository_interface.dart';

class AddProductUseCase {
  final IProductRepository repository;

  AddProductUseCase(this.repository);

  Future<int> call(String name, double price, String stockId, int quantity) async {
    // Add product
    final productId = await repository.addProduct(name, price);

    // Link product to stock
    await repository.linkProductToStock(productId.toString(), stockId, quantity);

    return productId; // Return the created product ID
  }
}
