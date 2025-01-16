
import '../../data/models/product.dart';
import '../repositories/product_repository_interface.dart';

class FetchProductsByStockUseCase {
  final IProductRepository repository;

  FetchProductsByStockUseCase(this.repository);

  Future<List<Product>> call(String stockId) async {
    return await repository.getProductsByStock(stockId);
  }
}
