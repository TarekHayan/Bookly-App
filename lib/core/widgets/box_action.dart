import '../utils/open_book.dart';
import 'custom_action_button.dart';
import '../../futures/home/data/Models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BoxActions extends StatelessWidget {
  const BoxActions({super.key, required this.bookModel});
  final BookModel bookModel;

  // دالة للحصول على رابط المعاينة بطريقة آمنة
  String? get previewLink {
    final link = bookModel.volumeInfo?.previewLink!;
    if (link != null && link.isNotEmpty) {
      return link;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomActionButton(
            text: previewLink != null ? "Free preview" : "Not available",
            onPressed: () {
              openBook(context, previewLink);
            },
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
