import '../repositories/stock_repository_interface.dart';

class AddStockUseCase {
  final IStockRepository repository;

  AddStockUseCase(this.repository);

  Future<int> call(String name) async {
    return await repository.addStock(name);
  }
}
