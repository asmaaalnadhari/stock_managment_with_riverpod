import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stock_management_with_riverpod/shared/theme/app_theme.dart';
import 'package:stock_management_with_riverpod/shared/theme/text_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Set the base design size
      minTextAdapt: true, // Ensures text scales properly
      splitScreenMode: true, // Handles split-screen scenarios
      builder: (context, child) {
        return MaterialApp(
          theme: _getTheme(context),
          home: child,
          localizationsDelegates: _localizationsDelegates,
          locale: const Locale('ar', 'AR'),
          supportedLocales: _supportedLocales,
          debugShowCheckedModeBanner: false,
        );
      },
      child: const SizedBox(), // Replace with your initial screen or widget
    );
  }

  // Extracted theme logic for reusability and single responsibility
  ThemeData _getTheme(BuildContext context) {
    final isLightTheme = View.of(context).platformDispatcher.platformBrightness == Brightness.light;
    final textTheme = createTextTheme(context, "Cairo", "Cairo");
    final theme = MaterialTheme(textTheme);
    return isLightTheme ? theme.light() : theme.dark();
  }

  // Centralized localization delegates for easier updates
  static const _localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  // Centralized supported locales for scalability
  static const _supportedLocales = [
    Locale('ar', 'AR'),
    Locale('en', 'US'),
  ];
}
