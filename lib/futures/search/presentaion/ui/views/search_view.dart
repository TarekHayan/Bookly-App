import '../../../../../core/utils/service_loactor.dart';
import '../../../data/repos/search_repo_impelment.dart';
import '../../logic/fetch_search_books_cubit/fetch_search_books_cubit.dart';
import '../widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => FetchSearchBooksCubit(
            searchRepo: getIt.get<SearchRepoImpelment>(),
          ),
          child: const SearchViewBody(),
        ),
      ),
    );
  }
}
