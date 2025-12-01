import '../utils/styles.dart';
import 'package:flutter/material.dart';

class NoResultSearch extends StatelessWidget {
  const NoResultSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("No Result Please Search", style: Styles.textStyle30),
        SizedBox(height: 20),
        Icon(Icons.search, size: 90),
      ],
    );
  }
}
