import 'package:bookly_app/core/Errors/fauliar_error.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/futures/home/logic/Models/book_model/ook_model.dart';
import 'package:bookly_app/futures/home/logic/Repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomePageRepoImpel implements HomeRepo {
  final ApiServices apiServices;

  HomePageRepoImpel({required this.apiServices});
  @override
  Future<Either<FauliarError, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiServices.get(
        endPoint:
            'volumes?q=programming&filter=free-ebooks&orderBy=newest&maxResults=40',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(item);
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceError.fromDioError(e));
      } else {
        return left(ServiceError(errorMsg: e.toString()));
      }
    }
  }

  @override
  Future<Either<FauliarError, List<BookModel>>> fetchFeatureBooks() {
    throw UnimplementedError();
  }
}
