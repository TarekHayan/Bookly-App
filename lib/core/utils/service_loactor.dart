import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/futures/home/data/Repos/home_page_repo_impel.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));
  getIt.registerSingleton<HomePageRepoImpel>(
    HomePageRepoImpel(apiServices: getIt.get<ApiServices>()),
  );
}
