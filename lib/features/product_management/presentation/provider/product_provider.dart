import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_management_with_riverpod/features/product_management/presentation/provider/state/product_notifier.dart';
import '../../../../db/data_base_helper.dart';
import '../../data/local_services/product_repository_impl.dart';
import '../../domain/use_case/fetch_products_use_case.dart';
import '../../domain/use_case/fetch_products_by_stock_use_case.dart';
import '../../domain/use_case/add_product_use_case.dart';
import '../../domain/use_case/delete_product_use_case.dart';
import '../../domain/use_case/update_product_use_case.dart';

import '../provider/state/product_state.dart';

// Repository Provider
final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepository(DatabaseHelper.instance);
});

// Use Case Providers
final fetchProductsUseCaseProvider = Provider<FetchProductsUseCase>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return FetchProductsUseCase(repository);
});

final getProductsByStockUseCaseProvider = Provider<FetchProductsByStockUseCase>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return FetchProductsByStockUseCase(repository);
});

final addProductUseCaseProvider = Provider<AddProductUseCase>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return AddProductUseCase(repository);
});

final deleteProductUseCaseProvider = Provider<DeleteProductUseCase>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return DeleteProductUseCase(repository);
});

final updateProductUseCaseProvider = Provider<UpdateProductUseCase>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return UpdateProductUseCase(repository);
});

// ViewModel Provider
final productViewModelProvider = StateNotifierProvider<ProductViewModel, ProductState>((ref) {
  final fetchProductsUseCase = ref.watch(fetchProductsUseCaseProvider);
  final fetchProductsByStockUseCase = ref.watch(getProductsByStockUseCaseProvider);
  final addProductUseCase = ref.watch(addProductUseCaseProvider);
  final deleteProductUseCase = ref.watch(deleteProductUseCaseProvider);
  final updateProductUseCase = ref.watch(updateProductUseCaseProvider);

  return ProductViewModel(
    fetchProductsUseCase,
    fetchProductsByStockUseCase,
    addProductUseCase,
    deleteProductUseCase,
    updateProductUseCase,
  );
});
