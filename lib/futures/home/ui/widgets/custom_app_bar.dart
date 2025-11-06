import 'package:bookly_app/constens.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(kIcon, height: 16, width: 75),
          IconButton(
            onPressed: () {},
            icon: const Icon(FontAwesome.magnifying_glass_solid, size: 24),
          ),
        ],
      ),
    );
  }
}
