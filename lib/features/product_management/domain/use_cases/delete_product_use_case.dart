
import '../repositories/product_repository_interface.dart';

class DeleteProductUseCase {
  final IProductRepository repository;

  DeleteProductUseCase(this.repository);

  Future<bool> call(String productId) async {
    return await repository.deleteProductIfNotInInvoice(productId);
  }
}
