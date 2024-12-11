import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ebook/Features/home/data/models/books_model/ebook_model/ebook_model.dart';

import 'package:ebook/Features/search/data/repos/search_repos.dart';
import 'package:ebook/core/errors/failure.dart';
import 'package:ebook/core/utils/api_service.dart';

class SearchReposImpl extends SearchRepos {
  ApiService apiService;

  SearchReposImpl(this.apiService);
  @override
  Future<Either<Failure, List<EBooksModel>>> fetchSearchData(
      {required String title}) async {
    try {
      Map<String, dynamic> data =
          await ApiService(Dio()).get(endPint: ''); //endPint: 'q=intitle:$title'

      print('title: $title');
      List<EBooksModel> books = [];
      int i = 0;
      for (var book in data['items']) {
        books.add(EBooksModel.fromJson(book));

       
        i++;
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
