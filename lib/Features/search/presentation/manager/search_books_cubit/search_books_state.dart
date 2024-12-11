part of 'search_books_cubit.dart';

sealed class SearchBooksState extends Equatable {
  const SearchBooksState();

  @override
  List<Object> get props => [];
}

final class SearchBooksCubitInitial extends SearchBooksState {}

final class SearchBooksCubitSecess extends SearchBooksState {
  SearchBooksCubitSecess(this.books);
  // List<Item> books;
  List<EBooksModel> books;
}
final class SearchBooksCubitLoading extends SearchBooksState {}


final class SearchBooksCubitFailure extends SearchBooksState {
  final String errMessage;

  const SearchBooksCubitFailure({required this.errMessage});
}
