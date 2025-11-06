import 'package:bookly_app/constens.dart';
import 'package:flutter/material.dart';

class CoverBooks extends StatelessWidget {
  const CoverBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          image: const DecorationImage(
            image: AssetImage(testCoveBook),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
