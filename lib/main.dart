import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constens.dart';
import 'core/utils/app_router.dart';
import 'core/utils/service_loactor.dart';
import 'futures/home/data/Repos/home_page_repo_impel.dart';
import 'futures/home/presentaion/logic/fetch_featured_books_cubit/fetch_featured_books_cubit.dart';
import 'futures/home/presentaion/logic/fetch_newest_books_cubit/fetch_newest_books_cubit.dart';

void main() {
  setupLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FetchFeaturedBooksCubit(getIt.get<HomePageRepoImpel>())
                ..fetchFuturedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              FetchNewestBooksCubit(getIt.get<HomePageRepoImpel>())
                ..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kPcolor),
      ),
    );
  }
}
