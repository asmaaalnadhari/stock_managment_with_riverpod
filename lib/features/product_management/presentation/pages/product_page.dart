import 'package:flutter/material.dart';

import '../../../../shared/presentation/widgets/custom_tab_bar.dart';
import '../widgets/product_form.dart';
import '../widgets/product_list_page.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomTabComponent(
      tabTitles: const [
        'قائمة الأصناف',
        'إضافة صنف',
      ],
      tabPages:const [ProductListPage(),ProductForm(),],);
  }
}
