part of 'newst_book_cubit.dart';

sealed class NewstBookState extends Equatable {
  const NewstBookState();

  @override
  List<Object> get props => [];
}

final class NewstBookInitial extends NewstBookState {}

final class NewstBookSucess extends NewstBookState {
  // final List<Item> books;
  final List<EBooksModel> books;

  const NewstBookSucess(this.books);
}

final class NewstBookFailure extends NewstBookState {
  final String errMessage;

  const NewstBookFailure(this.errMessage);
}

final class NewstBookLoading extends NewstBookState {}
