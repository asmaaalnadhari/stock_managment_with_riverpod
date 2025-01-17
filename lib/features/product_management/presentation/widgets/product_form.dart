import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stock_management_with_riverpod/shared/presentation/widgets/custom_button.dart';
import 'package:stock_management_with_riverpod/shared/presentation/widgets/custom_drop_down.dart';
import 'package:stock_management_with_riverpod/shared/utils/validation.dart';
import '../../../../shared/presentation/widgets/text_input_field.dart';
import '../../../stock_management/data/models/stock.dart';
import '../../../stock_management/presentation/provider/state/stock_state.dart';
import '../../../stock_management/presentation/provider/stock_providers.dart';
import '../provider/product_provider.dart';


class ProductForm extends ConsumerStatefulWidget {
  const ProductForm({super.key});

  @override
  ConsumerState<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends ConsumerState<ProductForm> {
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  late TextEditingController _initialQuantityController;

  List<Stock> stocks = [];
  Stock? selectedStock;

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController();
    _priceController = TextEditingController();
    _initialQuantityController = TextEditingController();

    selectedStock = null;

    // Fetch stocks after the widget is built
    Future.microtask(() {
      ref.read(stockViewModelProvider.notifier).fetchStocks();
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _initialQuantityController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    final productName = _nameController.text;
    final productPrice = double.tryParse(_priceController.text);
    final initialQuantity = int.tryParse(_initialQuantityController.text);

    if (selectedStock == null || productPrice == null || initialQuantity == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى اختيار مخزن صالح وإدخال سعر وكمية إفتتاحية صحيحة.')),
      );
      return;
    }

    try {
      // Call addProduct method from ProductViewModel
      await ref.read(productViewModelProvider.notifier).addProduct(
        productName,
        productPrice,
        selectedStock!.id,
        initialQuantity,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تمت إضافة الصنف بنجاح!')),
      );

      // Clear form fields
      _nameController.clear();
      _priceController.clear();
      _initialQuantityController.clear();
      setState(() {
        selectedStock = null;
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('فشل في إضافة الصنف: $error')),
      );
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ref.listen<StockState>(stockViewModelProvider, (previous, next) {
      setState(() {
        stocks = next.stocks;
        if (stocks.isNotEmpty && selectedStock == null) {
          selectedStock = stocks.first;
        }
      });
    });

    return Padding(
      padding: EdgeInsets.all(10.0.r),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDropDown(
                hintText: 'المخزن',
                options: stocks,
                onSelection: (newStock) {
                  setState(() {
                    selectedStock = newStock;
                  });
                },
                selectedValue: selectedStock,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Flexible(
                    child: CustomTextInputField(
                      controller: _nameController,
                      hintText: 'اسم الصنف',
                      requiresValidation: true,
                      fillColor: Theme.of(context).colorScheme.secondaryContainer,
                      inputType: TextInputType.text,
                      // inputFormatters: FormValidator.arabicNameFormatter,
                      // validator: FormValidator.validateArabicName,
                    ),
                  ),
                  const SizedBox(width: 10),
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
              const SizedBox(height: 10),
              CustomTextInputField(
                controller: _initialQuantityController,
                hintText: 'الكمية الإقتتاحية',
                requiresValidation: true,
                fillColor: Theme.of(context).colorScheme.secondaryContainer,
                inputType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال الكمية الإقتتاحية';
                  }
                  if (int.tryParse(value) == null) {
                    return 'يرجى إدخال رقم صحيح';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  CustomButton(
                    text: 'حفظ',
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    textColor: Colors.white,
                    onPressed: _submitForm,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}




