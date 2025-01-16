import '../../data/models/stock.dart';
import '../repositories/stock_repository_interface.dart';

class FetchStocksUseCase {
  final IStockRepository repository;

  FetchStocksUseCase(this.repository);

  Future<List<Stock>> call() async {
    return await repository.fetchStocks();
  }
}
