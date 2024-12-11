import 'package:bloc/bloc.dart';
import 'package:ebook/Features/home/data/models/books_model/ebook_model/ebook_model.dart';

import 'package:ebook/Features/search/data/repos/search_repos_impl.dart';

import 'package:equatable/equatable.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchBookName, { this.searchReposImpl})
      : super(SearchBooksCubitInitial()); 

  final SearchReposImpl? searchReposImpl;
  String searchBookName;
  Future<void> fetchSearchBooks(String value) async {
    emit(SearchBooksCubitLoading());
    var result = await searchReposImpl!.fetchSearchData(title: searchBookName=searchBookName);
    result.fold((failure) {
      emit(SearchBooksCubitFailure(errMessage: failure.errMessage));
    }, (books) {
      emit(SearchBooksCubitSecess(books));
    });
  }
}
