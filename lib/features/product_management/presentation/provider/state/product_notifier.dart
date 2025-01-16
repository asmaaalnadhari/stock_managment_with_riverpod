import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stock_management_with_riverpod/features/product_management/presentation/provider/state/product_state.dart';

import '../../../domain/use_case/add_product_use_case.dart';
import '../../../domain/use_case/delete_product_use_case.dart';
import '../../../domain/use_case/fetch_products_by_stock_use_case.dart';
import '../../../domain/use_case/fetch_products_use_case.dart';
import '../../../domain/use_case/update_product_use_case.dart';


class ProductViewModel extends StateNotifier<ProductState> {
  final FetchProductsUseCase _fetchProductsUseCase;
  final FetchProductsByStockUseCase _fetchProductsByStockUseCase;
  final AddProductUseCase _addProductUseCase;
  final DeleteProductUseCase _deleteProductUseCase;
  final UpdateProductUseCase _updateProductUseCase;

  ProductViewModel(
      this._fetchProductsUseCase,
      this._fetchProductsByStockUseCase,
      this._addProductUseCase,
      this._deleteProductUseCase,
      this._updateProductUseCase,
      ) : super(ProductState());

  // Fetch all products
  Future<void> fetchAllProducts() async {
    state = state.copyWith(isLoading: true);
    try {
      final products = await _fetchProductsUseCase();
      state = state.copyWith(products: products, isLoading: false);
    } catch (error) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  // Fetch products by stock ID
  Future<void> fetchProductsByStock(String stockId) async {
    state = state.copyWith(isLoading: true);
    try {
      final products = await _fetchProductsByStockUseCase(stockId);
      state = state.copyWith(products: products, isLoading: false);
    } catch (error) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  // Add a new product
  Future<void> addProduct(String name, double price, String stockId, int quantity) async {
    state = state.copyWith(isLoading: true);
    try {
      await _addProductUseCase(name, price, stockId, quantity);
      // Refresh the products list
      await fetchAllProducts();
    } catch (error) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  // Delete a product
  Future<void> deleteProduct(String productId, String stockId) async {
    state = state.copyWith(isLoading: true);
    try {
      final success = await _deleteProductUseCase(productId);
      if (success) {
        // Refresh the products list
        await fetchAllProducts();
      } else {
        state = state.copyWith(isLoading: false);
        throw Exception('لايمكن حذف هذا الصنف لإرتباطة بإحدى الفواتير.');
      }
    } catch (error) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }

  // Update a product
  Future<void> updateProduct(String productId, String name, double price) async {
    state = state.copyWith(isLoading: true);
    try {
      await _updateProductUseCase(productId, name, price);
      // Refresh the products list
      await fetchAllProducts();
    } catch (error) {
      state = state.copyWith(isLoading: false);
      rethrow;
    }
  }
}
