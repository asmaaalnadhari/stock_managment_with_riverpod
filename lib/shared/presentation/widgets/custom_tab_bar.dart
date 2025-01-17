import 'package:flutter/material.dart';

class CustomTabComponent extends StatelessWidget {
  final List<String> tabTitles;
  final List<Widget> tabPages;

  const CustomTabComponent({
    super.key,
    required this.tabTitles,
    required this.tabPages,
  })  : assert(tabTitles.length == tabPages.length,
  'The number of tabs must match the number of pages');

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return DefaultTabController(
      length: tabTitles.length,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: primaryColor,
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            tabs: tabTitles.map((title) => _buildTab(title, primaryColor)).toList(),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: TabBarView(children: tabPages),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, Color primaryColor) {
    return Tab(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: primaryColor),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(title),
        ),
      ),
    );
  }
}
