import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/Errors/fauliar_error.dart';
import '../../../../core/utils/api_services.dart';
import '../Models/book_model/book_model.dart';
import 'home_repo.dart';

class HomePageRepoImpel implements HomeRepo {
  final ApiServices apiServices;

  HomePageRepoImpel({required this.apiServices});
  @override
  Future<Either<FauliarError, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiServices.get(
        endPoint: 'volumes?q=subject:programming&orderBy=newest&maxResults=40',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
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
  Future<Either<FauliarError, List<BookModel>>> fetchFeatureBooks() async {
    try {
      var data = await apiServices.get(
        endPoint:
            'volumes?q=subject:computer science&orderBy=newest&maxResults=40',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
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
  Future<Either<FauliarError, List<BookModel>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      var data = await apiServices.get(
        endPoint: 'volumes?q=subject:$category&orderBy=relevance&maxResults=40',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
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
}
