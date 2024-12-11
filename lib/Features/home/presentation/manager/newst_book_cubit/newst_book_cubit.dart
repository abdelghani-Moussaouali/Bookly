import 'package:bloc/bloc.dart';
import 'package:ebook/Features/home/data/models/books_model/ebook_model/ebook_model.dart';

import 'package:ebook/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newst_book_state.dart';

class NewstBookCubit extends Cubit<NewstBookState> {
  NewstBookCubit(this.homeRepo) : super(NewstBookInitial());

  final HomeRepo homeRepo;

  Future<void> fetchNewstBooks() async {
    emit(NewstBookLoading());
    var result = await homeRepo.fetchBestSellerBooks();
    result.fold((failure) {
      emit(NewstBookFailure(failure.errMessage));
    }, (books) {
      emit(NewstBookSucess(books));
    });
  }
}
