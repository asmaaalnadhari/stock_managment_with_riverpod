import '../repositories/stock_repository_interface.dart';

class UpdateStockUseCase {
  final IStockRepository repository;

  UpdateStockUseCase(this.repository);

  Future<void> call(String stockId, String name) async {
        await repository.updateStock(stockId, name);
  }
}
