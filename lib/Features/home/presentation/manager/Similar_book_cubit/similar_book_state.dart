part of 'similar_book_cubit.dart';

sealed class SimilarBookState extends Equatable {
  const SimilarBookState();

  @override
  List<Object> get props => [];
}

final class SimilarBookInitial extends SimilarBookState {}
final class SimilarBookSucess extends SimilarBookState {
  final List<EBooksModel> books;

  const SimilarBookSucess({required this.books});
}
final class SimilarBookFailure extends SimilarBookState {
  final String errMessage;

  const SimilarBookFailure({required this.errMessage});
}
final class SimilarBookLoading extends SimilarBookState {}
