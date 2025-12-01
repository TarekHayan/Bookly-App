import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/Errors/fauliar_error.dart';
import '../../../../core/utils/api_services.dart';
import '../../../home/data/Models/book_model/book_model.dart';
import 'search_repo.dart';

class SearchRepoImpelment implements SearchRepo {
  final ApiServices apiServices;

  SearchRepoImpelment({required this.apiServices});
  @override
  Future<Either<FauliarError, List<BookModel>>> fetchSearchBooks({
    required String search,
  }) async {
    try {
      var data = await apiServices.get(
        endPoint: 'volumes?q=$search&orderBy=relevance&maxResults=40',
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
