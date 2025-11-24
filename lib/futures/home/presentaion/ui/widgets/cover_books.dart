import 'package:bookly_app/constens.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CoverBooks extends StatelessWidget {
  const CoverBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: GestureDetector(
        onTap: () => context.push(AppRouter.bookDeatailsPage),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            image: const DecorationImage(
              image: AssetImage(ktestCoveBook),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
