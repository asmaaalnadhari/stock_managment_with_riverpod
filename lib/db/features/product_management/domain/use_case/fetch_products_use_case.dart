
import '../../data/models/product.dart';
import '../repositories/product_repository_interface.dart';

class FetchProductsUseCase {
  final IProductRepository repository;

  FetchProductsUseCase(this.repository);

  Future<List<Product>> call() async {
    return await repository.getAllProducts();
  }
}
