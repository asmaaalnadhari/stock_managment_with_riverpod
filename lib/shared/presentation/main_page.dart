import 'package:flutter/material.dart';
import 'package:stock_management_with_riverpod/shared/presentation/widgets/app_bars.dart';
import 'package:stock_management_with_riverpod/shared/presentation/widgets/custom_bottom_bar.dart';

import '../../features/product_management/presentation/pages/product_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Track the current page index
  int _currentPageIndex = 0;

  // Define pages and their corresponding app bars
  final List<Widget> _pages = [
    const Placeholder(),
    const ProductPage(),
    const Placeholder(),
    const Placeholder(),
  ];

  final List<Widget Function(BuildContext)> _appBars = [
    maniAppBar,
    productAppBar,
    invoiceAppBar,
    stockAppBar,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBars[_currentPageIndex](context) as PreferredSizeWidget,
      body: _pages[_currentPageIndex], // Render the selected page
      bottomNavigationBar: CustomBottomBar(
        currentIndex: _currentPageIndex,
        onTap: (index) {
          setState(() {
            _currentPageIndex = index; // Switch page
          });
        },
      ),
    );
  }
}
