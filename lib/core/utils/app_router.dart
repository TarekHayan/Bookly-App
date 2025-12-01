import 'service_loactor.dart';
import '../../futures/home/data/Models/book_model/book_model.dart';
import '../../futures/home/data/Repos/home_page_repo_impel.dart';
import '../../futures/home/presentaion/logic/fetch_similar_books_cubit/fetch_similar_books_cubit.dart';
import '../../futures/home/presentaion/ui/views/book_deatils_page.dart';
import '../../futures/home/presentaion/ui/views/home_page.dart';
import '../../futures/search/presentaion/ui/views/search_view.dart';
import '../../futures/splash_screen/persentaion/ui/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String homePage = '/HomePage';
  static const String bookDeatailsPage = '/bookDeatailsPage';
  static const String searchView = '/searchView';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),

      GoRoute(
        path: homePage,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: searchView,
        builder: (BuildContext context, GoRouterState state) {
          return const SearchView();
        },
      ),
      GoRoute(
        path: bookDeatailsPage,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) =>
                FetchSimilarBooksCubit(getIt.get<HomePageRepoImpel>()),
            child: BookDeatilsPage(bookModel: state.extra as BookModel),
          );
        },
      ),
    ],
  );
}
