import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../logic/fetch_search_books_cubit/fetch_search_books_cubit.dart';

class CustoumTextField extends StatefulWidget {
  const CustoumTextField({super.key});

  @override
  State<CustoumTextField> createState() => _CustoumTextFieldState();
}

class _CustoumTextFieldState extends State<CustoumTextField> {
  final textController = TextEditingController();
  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) {
        BlocProvider.of<FetchSearchBooksCubit>(
          context,
        ).fetchSearchBooks(search: value);
      },
      controller: textController,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: "Search for books",
        suffixIcon: IconButton(
          onPressed: () {
            BlocProvider.of<FetchSearchBooksCubit>(
              context,
            ).fetchSearchBooks(search: textController.text.trim());
          },
          icon: const Opacity(
            opacity: 0.7,
            child: Icon(FontAwesomeIcons.magnifyingGlass, size: 22),
          ),
        ),
      ),
    );
  }
}
