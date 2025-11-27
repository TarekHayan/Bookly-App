import 'package:bookly_app/core/widgets/custom_action_button.dart';
import 'package:bookly_app/futures/home/data/Models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BoxActions extends StatelessWidget {
  const BoxActions({super.key, required this.bookModel});
  final BookModel bookModel;

  bool get canPreview {
    final link = bookModel.accessInfo?.webReaderLink;
    return link != null && link.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
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
            text: canPreview ? "Free preview" : "Not available",
            buttonColor: const Color(0xffEF8262),
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
        ),
      ],
    );
  }
}
