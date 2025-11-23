import 'package:bookly_app/core/Errors/fauliar_error.dart';
import 'package:bookly_app/futures/home/logic/Models/book_model/ook_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<FauliarError, List<BookModel>>> fetchNewestBooks();
  Future<Either<FauliarError, List<BookModel>>> fetchFeatureBooks();
}
