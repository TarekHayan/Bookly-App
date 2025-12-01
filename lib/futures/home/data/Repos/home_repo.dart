import '../../../../core/Errors/fauliar_error.dart';
import '../Models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<FauliarError, List<BookModel>>> fetchNewestBooks();
  Future<Either<FauliarError, List<BookModel>>> fetchFeatureBooks();
  Future<Either<FauliarError, List<BookModel>>> fetchSimilarBooks({
    required String category,
  });
}
