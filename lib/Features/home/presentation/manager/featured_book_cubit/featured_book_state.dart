part of 'featured_book_cubit.dart';

sealed class FeaturedBookState extends Equatable {
  const FeaturedBookState();

  @override
  List<Object> get props => [];
}

final class FeaturedBookInitial extends FeaturedBookState {}
final class FeaturedBookLoading extends FeaturedBookState {}
final class FeaturedBookFailure extends FeaturedBookState {
  final String errMessage;

  const FeaturedBookFailure(this.errMessage);
}
final class FeaturedBookSucess extends FeaturedBookState {
  final List<EBooksModel> books;

  const FeaturedBookSucess(this.books);
}
