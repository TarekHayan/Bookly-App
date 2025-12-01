import '../utils/styles.dart';
import 'package:flutter/material.dart';

class CustomActionButton extends StatelessWidget {
  const CustomActionButton({
    super.key,
    required this.text,
    required this.buttonColor,
    required this.textColor,
    this.borderRadius,
    this.onPressed,
  });
  final String text;
  final Color buttonColor;
  final Color textColor;
  final BorderRadiusGeometry? borderRadius;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(16),
          ),
        ),
        child: Text(text, style: Styles.textStyle16.copyWith(color: textColor)),
      ),
    );
  }
}
