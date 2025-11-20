import 'package:bookly_app/futures/home/ui/widgets/book_details_body.dart';
import 'package:flutter/material.dart';

class BookDeatilsPage extends StatelessWidget {
  const BookDeatilsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: BookDetailsBody()));
  }
}
