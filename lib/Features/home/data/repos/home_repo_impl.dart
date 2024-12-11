import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ebook/Features/home/data/models/books_model/ebook_model/ebook_model.dart';


import 'package:ebook/Features/home/data/repos/home_repo.dart';
import 'package:ebook/core/errors/Failure.dart';
import 'package:ebook/core/utils/api_service.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<EBooksModel>>> fetchBestSellerBooks() async {
    try {
      var data = await apiService.get(endPint: ''
          
          );
         
      List<EBooksModel> books = [];
      for (var item in data) { //['items']
        books.add(EBooksModel.fromJson(item));
      }
     
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
  


  @override
  Future<Either<Failure, List<EBooksModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(endPint: ''
          // endPint: 'q=subject:programming&filtering=free-ebooks'
          );
      List<EBooksModel> books = [];
      for (var item in data['items']) {
        books.add(EBooksModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<EBooksModel>>> fetchDetailBooks({ String? categorie}) async{
      try {
      var data = await apiService.get(endPint: ''
          // endPint: 'q=subject:programming&filtering=free-ebooks'
          );
          
      List<EBooksModel> books = [];
      for (var item in data['items']) {
        books.add(EBooksModel.fromJson(item));
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
