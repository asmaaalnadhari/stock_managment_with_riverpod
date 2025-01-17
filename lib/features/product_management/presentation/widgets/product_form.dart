import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stock_management_with_riverpod/shared/presentation/widgets/custom_button.dart';
import 'package:stock_management_with_riverpod/shared/utils/validation.dart';
import '../../../../shared/presentation/widgets/text_input_field.dart';


class ProductForm extends ConsumerStatefulWidget {
  const ProductForm({super.key});

  @override
  ConsumerState<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends ConsumerState<ProductForm> {
  late TextEditingController _nameController;
  late TextEditingController _priceController;

  @override
  void initState() {
    super.initState();
    // Initialize controllers
    _nameController = TextEditingController();
    _priceController = TextEditingController();
  }

  @override
  void dispose() {
    // Dispose controllers
    _nameController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form submitted successfully!')),
      );

      // Interact with Riverpod providers using ref
      log('Product Name: ${_nameController.text}');
      log('Product Price: ${_priceController.text}');
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.all(10.0.r),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  child: CustomTextInputField(
                    controller: _nameController,
                    hintText: 'اسم الصنف',
                    requiresValidation: true,
                    fillColor: Theme.of(context).colorScheme.secondaryContainer,
                    inputType: TextInputType.text,
                    inputFormatters: FormValidator.arabicNameFormatter,
                    validator: FormValidator.validateArabicName,
                  ),
                ),
                const SizedBox(width: 10),
                // Product Price Field
                Flexible(
                  child: CustomTextInputField(
                    controller: _priceController,
                    hintText: 'سعر الصنف',
                    requiresValidation: true,
                    fillColor: Theme.of(context).colorScheme.secondaryContainer,
                    inputType: TextInputType.number,
                    inputFormatters: FormValidator.priceFormatter,
                    validator: FormValidator.validatePrice,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            // Submit Button
            Row(
              children: [
                CustomButton(

                    text: 'حفظ',
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    textColor: Colors.white,
                    onPressed: (){}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}





