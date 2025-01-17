import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormValidator {
  /// Validates that the input is a non-empty Arabic name.
  static String? validateArabicName(String? input) {
    input = input?.trim();
    if (_isEmpty(input)) {
      _vibrate();
      return 'الحقل مطلوب';
    } else if (RegExp(r'[0-9]').hasMatch(input!)) {
      _vibrate();
      return 'يجب أن يحتوي على حروف فقط';
    }
    else if (!RegExp(r'^[ء-ي ]+$').hasMatch(input)) {
      _vibrate();
      return 'يجب أن يحتوي على اسم باللغة العربية فقط';
    }
    return null;
  }

  /// Validates that the input is a valid price.
  static String? validatePrice(String? input, {bool allowZero = false}) {
    if (_isEmpty(input)) {
      _vibrate();
      return 'الحقل مطلوب';
    }

    final cleanedInput = input!.replaceAll(',', '');
    final price = double.tryParse(cleanedInput);

    if (price == null) {
      _vibrate();
      return 'يجب أن يكون الرقم صالحاً';
    } else if (!allowZero && price <= 0) {
      _vibrate();
      return 'لا يجب أن يكون صفرًا أو أقل';
    }
    return null;
  }

  /// Ensures the field is not empty.
  static String? validateNotEmpty(String? input) {
    if (_isEmpty(input)) {
      _vibrate();
      return 'الحقل مطلوب';
    }
    return null;
  }

  /// Input formatter for Arabic names.
  static List<TextInputFormatter> get arabicNameFormatter => [
    FilteringTextInputFormatter.allow(RegExp(r'[ء-ي ]')),
    FilteringTextInputFormatter.deny(RegExp(r'[0-9a-zA-Z~!@#%^&*()_+=\\-{};:<>?|/.,\\\\]')),
  ];

  /// Input formatter for prices.
  static List<TextInputFormatter> get priceFormatter => [
    FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
  ];

  /// Private helper to check if a string is null or empty.
  static bool _isEmpty(String? input) => input == null || input.isEmpty;

  /// Private helper to trigger vibration for invalid inputs.
  static void _vibrate() => HapticFeedback.vibrate();
}
