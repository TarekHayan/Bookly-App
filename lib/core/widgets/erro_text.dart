import 'package:flutter/material.dart';

class ErrorTextWidget extends StatelessWidget {
  final String message;

  const ErrorTextWidget(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: const TextStyle(
        color: Colors.red,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.center,
    );
  }
}
