import 'package:bookly_app/futures/home/ui/views/book_deatils_page.dart';
import 'package:bookly_app/futures/home/ui/views/home_page.dart';
import 'package:bookly_app/futures/search/ui/views/search_view.dart';
import 'package:bookly_app/futures/splash_screen/ui/views/splash_screen.dart';
import 'package:flutter/material.dart';
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
        routes: <RouteBase>[
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
              return const BookDeatilsPage();
            },
          ),
        ],
      ),
    ],
  );
}
