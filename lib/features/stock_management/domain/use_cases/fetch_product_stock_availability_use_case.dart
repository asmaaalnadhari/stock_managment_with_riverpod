import '../../data/models/product_stock_availability.dart';
import '../repositories/stock_repository_interface.dart';

class FetchProductStockAvailabilityUseCase {
  final IStockRepository repository;

  FetchProductStockAvailabilityUseCase(this.repository);

  Future<List<ProductStockAvailability>> call() async {
    return await repository.fetchProductStockAvailability();
  }
}
