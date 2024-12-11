import 'package:bloc/bloc.dart';
import 'package:ebook/Features/home/data/models/books_model/ebook_model/ebook_model.dart';

import 'package:ebook/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_book_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FeaturedBookCubit(this.homeRepo) : super(FeaturedBookInitial());

  final HomeRepo homeRepo;
  Future<void> fetchFuturedBooks() async {
    emit(FeaturedBookLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((failure) {
      emit(FeaturedBookFailure(failure.errMessage));
    }, (books) {
      emit(FeaturedBookSucess(books));
    });
  }
}
