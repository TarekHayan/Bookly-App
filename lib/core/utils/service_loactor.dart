import 'api_services.dart';
import '../../futures/home/data/Repos/home_page_repo_impel.dart';
import '../../futures/search/data/repos/search_repo_impelment.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));
  getIt.registerSingleton<HomePageRepoImpel>(
    HomePageRepoImpel(apiServices: getIt.get<ApiServices>()),
  );
  getIt.registerSingleton<SearchRepoImpelment>(
    SearchRepoImpelment(apiServices: getIt.get<ApiServices>()),
  );
}
