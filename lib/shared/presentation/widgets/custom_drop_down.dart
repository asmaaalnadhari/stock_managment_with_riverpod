import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../data/modles/base_entity.dart';

class CustomDropDown<T extends BaseEntity> extends StatelessWidget {
  final String hintText;
  final List<T> options;
  final bool isDarkTheme;
  final bool isDisabled;
  final Widget? leadingIcon;
  final T? selectedValue;
  final void Function(T?)? onValueChanged;
  final double? width;
  final TextEditingController? searchController;
  final Function(T?)? onSelection;
  final bool allowClear;
  final Widget? additionalButton;

  const CustomDropDown({
    super.key,
    required this.hintText,
    required this.options,
    required this.isDarkTheme,
    this.isDisabled = false,
    this.onSelection,
    this.searchController,
    this.allowClear = true,
    this.additionalButton,
    this.onValueChanged,
    this.width,
    this.leadingIcon,
    required this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    final validatedValue = _validateSelectedValue();

    if (isDisabled) {
      return _buildDisabledDropdown(context, validatedValue);
    }

    return _buildEnabledDropdown(context, validatedValue);
  }

  Widget _buildDisabledDropdown(BuildContext context, T? validatedValue) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.5,
          color: Colors.grey.shade700,
        ),
        borderRadius: BorderRadius.circular(10),
        color: isDarkTheme ? Colors.black54 : const Color(0xFFf2f2f2),
      ),
      child: Row(
        children: [
          if (leadingIcon != null) leadingIcon!,
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              validatedValue?.title ?? hintText,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                overflow: TextOverflow.ellipsis,
                color: Colors.black87,
              ),
              maxLines: 1,
            ),
          ),
          const SizedBox(width: 5),
          const Icon(CupertinoIcons.arrow_down_circle),
        ],
      ),
    );
  }

  Widget _buildEnabledDropdown(BuildContext context, T? validatedValue) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.5,
          color: Colors.grey.shade700,
        ),
        borderRadius: BorderRadius.circular(10),
        color: isDarkTheme ? Colors.black54 : const Color(0xFFf2f2f2),
      ),
      child: DropdownButtonFormField2<T>(
        value: validatedValue,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          overflow: TextOverflow.ellipsis,
        ),
        dropdownSearchData: _buildSearchData(context),
        iconStyleData: _buildIconStyle(),
        decoration: _buildInputDecoration(context),
        hint: Text(
          hintText,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            overflow: TextOverflow.ellipsis,
          ),
        ),
        items: _buildDropdownItems(),
        validator: (value) => value == null ? 'الحقل مطلوب' : null,
        onChanged: onSelection,
        onSaved: onSelection,
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.only(right: 8),
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }

  T? _validateSelectedValue() {
    return options.contains(selectedValue) ? selectedValue : null;
  }

  List<DropdownMenuItem<T>> _buildDropdownItems() {
    return options.map((item) {
      return DropdownMenuItem<T>(
        value: item,
        child: Text(item.title ?? ""),
      );
    }).toList();
  }

  DropdownSearchData<T> _buildSearchData(BuildContext context) {
    final controller = searchController ?? TextEditingController();
    return DropdownSearchData(
      searchController: controller,
      searchInnerWidgetHeight: 45,
      searchInnerWidget: _buildSearchWidget(context, controller),
      searchMatchFn: (item, searchValue) {
        return item.value?.title?.toLowerCase().contains(searchValue.toLowerCase()) ?? false;
      },
    );
  }

  Widget _buildSearchWidget(BuildContext context, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: CupertinoSearchTextField(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 12,
              ),
              placeholderStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 12,
              ),
              autofocus: true,
              suffixMode: OverlayVisibilityMode.editing,
              controller: controller,
              placeholder: 'بحث..',
            ),
          ),
          if (allowClear && selectedValue != null)
            IconButton(
              onPressed: () => onValueChanged?.call(null),
              icon: const Icon(CupertinoIcons.delete, color: Colors.red),
            ),
        ],
      ),
    );
  }

  InputDecoration _buildInputDecoration(BuildContext context) {
    return InputDecoration(
      prefixIcon: leadingIcon,
      prefixIconConstraints: const BoxConstraints(
        minWidth: 30,
        minHeight: 30,
      ),
      enabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
    );
  }

  IconStyleData _buildIconStyle() {
    return IconStyleData(
      openMenuIcon: Row(
        children: [
          if (additionalButton != null) ...[
            const SizedBox(width: 5),
            additionalButton!,
          ],
          const SizedBox(width: 5),
          const Icon(CupertinoIcons.arrow_up_circle),
          const SizedBox(width: 5),
        ],
      ),
      icon: Row(
        children: [
          if (additionalButton != null) ...[
            const SizedBox(width: 5),
            additionalButton!,
          ],
          const SizedBox(width: 5),
          const Icon(CupertinoIcons.arrow_down_circle),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
