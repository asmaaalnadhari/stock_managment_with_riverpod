import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final bool isOutlined;
  final bool isRequest;

  const CustomButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
    this.isOutlined = false,
    this.isRequest = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isOutlined ? Colors.transparent : backgroundColor,
        foregroundColor: textColor,
        side: isOutlined
            ? BorderSide(color: backgroundColor, width: 2.0)
            : BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: isOutlined ? 0 : 2,
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Visibility(
          visible: !isRequest,
          replacement: const CupertinoActivityIndicator(
            color: Colors.white,
            radius: 10,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isOutlined ? backgroundColor : textColor,
            ),
          ),
        ),
      ),
    );
  }
}
