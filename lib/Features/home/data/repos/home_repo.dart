import 'package:dartz/dartz.dart';
import 'package:ebook/Features/home/data/models/books_model/ebook_model/ebook_model.dart';

import 'package:ebook/core/errors/Failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<EBooksModel>>> fetchBestSellerBooks();
  Future<Either<Failure, List<EBooksModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<EBooksModel>>> fetchDetailBooks({required String categorie});
}
