import 'package:bloc/bloc.dart';
import 'package:ebook/Features/home/data/models/books_model/ebook_model/ebook_model.dart';

import 'package:ebook/Features/home/data/repos/home_repo.dart';

import 'package:equatable/equatable.dart';

part 'similar_book_state.dart';

class SimilarBookCubit extends Cubit<SimilarBookState> {
  SimilarBookCubit({ required this.homeRepo}) : super(SimilarBookInitial());
 final HomeRepo homeRepo;
 
  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBookLoading());

    var result = await homeRepo.fetchDetailBooks(categorie: '');
    result.fold((failure) {
      emit(SimilarBookFailure(errMessage: failure.errMessage,));
    }, (books) {
      emit(SimilarBookSucess(books: books));
    });
  }
}
