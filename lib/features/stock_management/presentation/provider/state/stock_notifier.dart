
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_management_with_riverpod/features/stock_management/presentation/provider/state/stock_state.dart';

import '../../../domain/use_cases/add_stock_use_case.dart';
import '../../../domain/use_cases/delete_stock_use_case.dart';
import '../../../domain/use_cases/fetch_product_stock_availability_use_case.dart';
import '../../../domain/use_cases/fetch_stocks_use_case.dart';
import '../../../domain/use_cases/update_stock_use_case.dart';

class StockViewModel extends StateNotifier<StockState> {
  final FetchStocksUseCase _fetchStocksUseCase;
  final AddStockUseCase _addStockUseCase;
  final UpdateStockUseCase _updateStockUseCase;
  final DeleteStockUseCase _deleteStockUseCase;
  final FetchProductStockAvailabilityUseCase _fetchProductStockAvailabilityUseCase;

  StockViewModel(
      this._fetchStocksUseCase,
      this._addStockUseCase,
      this._updateStockUseCase,
      this._deleteStockUseCase,
      this._fetchProductStockAvailabilityUseCase,
      ) : super(StockState());

  Future<void> fetchStocks() async {
    state = state.copyWith(isLoading: true);
    try {
      final stocks = await _fetchStocksUseCase();
      state = state.copyWith(stocks: stocks, isLoading: false);
    } catch (error) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  Future<void> addStock(String name) async {
    state = state.copyWith(isLoading: true);
    try {
      await _addStockUseCase(name);
      await fetchStocks();
    } catch (error) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  Future<void> updateStock(String stockId, String name) async {
    state = state.copyWith(isLoading: true);
    try {
      await _updateStockUseCase(stockId, name);
      await fetchStocks();
    } catch (error) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  Future<void> deleteStock(String stockId) async {
    state = state.copyWith(isLoading: true);
    try {
      final success = await _deleteStockUseCase(stockId);
      if (success) {
        await fetchStocks();
      } else {
        throw Exception('لايمكن حذف هذا المخزن لإرتباطة بإحدى الأصناف.');
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  // Fetch product-stock availability
  Future<void> fetchProductStockAvailability() async {
    state = state.copyWith(isLoading: true);
    try {
      final productStockAvailability = await _fetchProductStockAvailabilityUseCase();
      state = state.copyWith(
        productStockAvailability: productStockAvailability,
        isLoading: false,
      );
    } catch (error) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }
}