import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_management_with_riverpod/features/stock_management/presentation/provider/state/stock_notifier.dart';
import '../../../../db/data_base_helper.dart';
import '../../data/local_services/stock_repository_impl.dart';
import '../../domain/use_cases/add_stock_use_case.dart';
import '../../domain/use_cases/delete_stock_use_case.dart';
import '../../domain/use_cases/fetch_product_stock_availability_use_case.dart';
import '../../domain/use_cases/fetch_stocks_use_case.dart';
import '../../domain/use_cases/update_stock_use_case.dart';

import '../provider/state/stock_state.dart';

// Repository Provider
final stockRepositoryProvider = Provider<StockRepository>((ref) {
  return StockRepository(DatabaseHelper.instance);
});

// Use Case Providers
final addStockUseCaseProvider = Provider<AddStockUseCase>((ref) {
  final repository = ref.watch(stockRepositoryProvider);
  return AddStockUseCase(repository);
});

final updateStockUseCaseProvider = Provider<UpdateStockUseCase>((ref) {
  final repository = ref.watch(stockRepositoryProvider);
  return UpdateStockUseCase(repository);
});

final fetchStocksUseCaseProvider = Provider<FetchStocksUseCase>((ref) {
  final repository = ref.watch(stockRepositoryProvider);
  return FetchStocksUseCase(repository);
});

final deleteStockUseCaseProvider = Provider<DeleteStockUseCase>((ref) {
  final repository = ref.watch(stockRepositoryProvider);
  return DeleteStockUseCase(repository);
});

final fetchProductStockAvailabilityUseCaseProvider = Provider<FetchProductStockAvailabilityUseCase>((ref) {
  final repository = ref.watch(stockRepositoryProvider);
  return FetchProductStockAvailabilityUseCase(repository);
});

// ViewModel Provider
final stockViewModelProvider = StateNotifierProvider<StockViewModel, StockState>((ref) {
  final fetchStocksUseCase = ref.watch(fetchStocksUseCaseProvider);
  final addStockUseCase = ref.watch(addStockUseCaseProvider);
  final updateStockUseCase = ref.watch(updateStockUseCaseProvider);
  final deleteStockUseCase = ref.watch(deleteStockUseCaseProvider);
  final fetchProductStockAvailabilityUseCase = ref.watch(fetchProductStockAvailabilityUseCaseProvider);

  return StockViewModel(
    fetchStocksUseCase,
    addStockUseCase,
    updateStockUseCase,
    deleteStockUseCase,
    fetchProductStockAvailabilityUseCase,
  );
});
