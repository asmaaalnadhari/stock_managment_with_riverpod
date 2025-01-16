

import '../../../data/models/product.dart';

class ProductState {
  final List<Product> products;
  final bool isLoading;

  ProductState({
    this.products = const [],
    this.isLoading = false,
  });

  // Create a copy of the state with updated values
  ProductState copyWith({
    List<Product>? products,
    bool? isLoading,
  }) {
    return ProductState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
