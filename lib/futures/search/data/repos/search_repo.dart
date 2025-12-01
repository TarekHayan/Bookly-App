import '../../../../core/Errors/fauliar_error.dart';
import '../../../home/data/Models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<FauliarError, List<BookModel>>> fetchSearchBooks({
    required String search,
  });
}
