import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: Theme.of(context).colorScheme.primary,
    title: Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        color: Colors.white
      ),
    ),
    centerTitle: true,
  );
}

// Usage:
AppBar productAppBar(BuildContext context) => buildAppBar(context, 'إدارة الأصناف');
AppBar stockAppBar(BuildContext context) => buildAppBar(context, 'إدارة المخازن');
AppBar invoiceAppBar(BuildContext context) => buildAppBar(context, 'إدارة الفواتير');
AppBar maniAppBar(BuildContext context) => buildAppBar(context, 'الصفحة الرئيسية');
