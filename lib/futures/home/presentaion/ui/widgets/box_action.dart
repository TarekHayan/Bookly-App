import 'package:bookly_app/core/widgets/custom_action_button.dart';
import 'package:flutter/material.dart';

class BoxActions extends StatelessWidget {
  const BoxActions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: CustomActionButton(
            text: 'Free',
            buttonColor: Colors.white,
            textColor: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
        ),
        Expanded(
          child: CustomActionButton(
            text: 'Free preview',
            buttonColor: Color(0xffEF8262),
            textColor: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
        ),
      ],
    );
  }
}
