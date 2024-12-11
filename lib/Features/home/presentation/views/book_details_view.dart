import 'package:ebook/Features/home/data/models/books_model/ebook_model/ebook_model.dart';

import 'package:ebook/Features/home/presentation/manager/Similar_book_cubit/similar_book_cubit.dart';
import 'package:ebook/Features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({
    super.key, required this.bookModel,
  });
  final EBooksModel bookModel;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
  BlocProvider.of<SimilarBookCubit>(context).fetchSimilarBooks(category: '');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: BookDetailsViewBody(bookmodel:widget.bookModel,),
      ),
    );
  }
}
