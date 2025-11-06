import 'package:bookly_app/constens.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(kIcon, height: 16, width: 75),
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.magnifyingGlass, size: 24),
            ),
          ],
        ),
      ),
    );
  }
}
