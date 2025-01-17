import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stock_management_with_riverpod/shared/presentation/widgets/custom_button.dart';
import 'package:stock_management_with_riverpod/shared/presentation/widgets/loading.dart';
import '../provider/product_provider.dart';

class ProductListPage extends ConsumerWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productViewModelProvider);

    return  Padding(
      padding: EdgeInsets.all(10.0.r),
      child: productState.isLoading
          ? const Center(child: Loading())
          : ListView.builder(
        itemCount: productState.products.length,
        itemBuilder: (context, index) {
          final product = productState.products[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 4.0.w),
            elevation: 4,
            child: ListTile(
              title: Text(
                product.name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              subtitle: Text('السعر: ${product.price.toStringAsFixed(2)}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {

                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }


}
