
import '../repositories/product_repository_interface.dart';

class UpdateProductUseCase {
  final IProductRepository repository;

  UpdateProductUseCase(this.repository);

  Future<void> call(String productId, String name, double price) async {
    await repository.updateProduct(productId, name, price);
  }
}
