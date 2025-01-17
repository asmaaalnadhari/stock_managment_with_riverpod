import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomTextInputField extends StatefulWidget {
   CustomTextInputField({
    super.key,
    this.hintText,
    this.helperText,
    this.inputType,
    this.inputAction,
    this.controller,
    this.isEnabled = true,
    this.isArabic = false,
    this.autoFocus = false,
    this.focusNode,
    this.inputFormatters,
    this.maxLength = 100,
    this.obscureText = false,
    this.isPassword = false,
    this.requiresValidation = false,
    this.validator,
    this.icon,
    this.prefixIcon,
    this.onTap,
    this.fillColor = Colors.white,
    this.labelColor = Colors.black,
    this.hoverColor = Colors.grey,
    this.nextFocusNode,
    this.onSubmitted,
    this.onChanged,
    this.readOnly = false,
    this.onComplete,
    this.initialValue,
  });

  final String? hintText;
  final String? helperText;
  final String? initialValue;
  final Color fillColor;
  final Color labelColor;
  final Color hoverColor;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? inputAction;
  final bool isEnabled;
  final bool autoFocus;
  bool obscureText;
  final bool isPassword;
  final bool readOnly;

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final int? maxLength;
  final bool requiresValidation;
  final bool? isArabic;
  final Widget? icon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final VoidCallback? onSubmitted;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String?>? onComplete;

  @override
  State<CustomTextInputField> createState() => _CustomTextInputFieldState();
}

class _CustomTextInputFieldState extends State<CustomTextInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      controller: widget.controller,
      keyboardType: widget.inputType,
      inputFormatters: widget.inputFormatters,
      initialValue: widget.initialValue,
      textInputAction: widget.inputAction,
      enabled: widget.isEnabled,
      autofocus: widget.autoFocus,
      focusNode: widget.focusNode,
      obscureText: widget.obscureText,
      maxLength: widget.maxLength,
      onTap: _handleTap,
      onFieldSubmitted: (_) => widget.onSubmitted?.call(),
      onChanged: widget.onChanged,
      onSaved: widget.onComplete,
      validator: widget.requiresValidation
          ? widget.validator
          : (value) => value == null || value.isEmpty ? 'الحقل مطلوب' : null,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: widget.labelColor,
        overflow: TextOverflow.ellipsis,
      ),
      decoration: _buildInputDecoration(context),
    );
  }

  void _handleTap() {
    if (!widget.isEnabled) {
      widget.onTap?.call();
    }
    if (widget.isArabic == true) {
      widget.controller?.selection = TextSelection.fromPosition(
        TextPosition(offset: widget.controller!.text.length),
      );
    }
  }

  InputDecoration _buildInputDecoration(BuildContext context) {
    return InputDecoration(
      labelText: widget.hintText,
      helperText: widget.helperText,
      helperMaxLines: 1,
      fillColor: widget.fillColor,
      filled: true,
      alignLabelWithHint: true,
      counterText: '',
      hoverColor: widget.hoverColor,
      prefixIcon: widget.prefixIcon,
      suffixIcon: widget.isPassword
          ? GestureDetector(
        onTap: _toggleObscureText,
        child: Icon(
          widget.obscureText
              ? CupertinoIcons.eye_solid
              : CupertinoIcons.eye_slash_fill,
        ),
      )
          : widget.icon,
      labelStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: widget.labelColor,
      ),
      hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: widget.labelColor,
      ),
      helperStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
        color: Colors.deepOrange,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.teal, width: 0.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: widget.fillColor, width: 0.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.grey.shade700, width: 0.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.red, width: 0.5),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    );
  }

  void _toggleObscureText() {
    setState(() {
      widget.obscureText = !widget.obscureText;
    });
  }
}
