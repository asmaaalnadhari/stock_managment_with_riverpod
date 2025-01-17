import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final Function(int) onTap;
  final int currentIndex;

  const CustomBottomBar({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(0, -2), // Shadow above the bar
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
          type: BottomNavigationBarType.fixed,
          elevation: 0, // Elevation set to 0 to rely on container's shadow
            unselectedItemColor: Theme.of(context).colorScheme.primary,
         selectedItemColor : Theme.of(context).colorScheme.primaryContainer,
          onTap: onTap,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.home,
                size: 28.0,
              ),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.cube_box,
                size: 28.0,
              ),
              label: 'الأصناف',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.doc_text_fill,
                size: 28.0,
              ),
              label: 'الفواتير',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.store,
                size: 28.0,
              ),
              label: 'المخازن',
            ),
          ],
        ),
      ),
    );
  }
}
