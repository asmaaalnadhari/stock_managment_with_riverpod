import '../repositories/stock_repository_interface.dart';

class DeleteStockUseCase {
  final IStockRepository repository;

  DeleteStockUseCase(this.repository);

  Future<bool> call(String stockId) async {
    return await repository.deleteStockIfEmpty(stockId);
  }
}
