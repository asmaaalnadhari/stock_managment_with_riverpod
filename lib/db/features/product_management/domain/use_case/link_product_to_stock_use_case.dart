
import '../repositories/product_repository_interface.dart';

class LinkProductToStockUseCase {
  final IProductRepository repository;

  LinkProductToStockUseCase(this.repository);

  Future<void> call(String productId, String stockId, int quantity) async {
    await repository.linkProductToStock(productId, stockId, quantity);
  }
}
