import 'package:dartz/dartz.dart';
import 'package:ebook/Features/home/data/models/books_model/ebook_model/ebook_model.dart';

import 'package:ebook/core/errors/failure.dart';

abstract class SearchRepos {
  Future <Either<Failure,List<EBooksModel>>> fetchSearchData({required String title});
}