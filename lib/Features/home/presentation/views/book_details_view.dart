
import 'package:ebook/Features/home/data/models/book_model/book_model.dart';
import 'package:ebook/Features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';


class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key,l});

  // final BookModel bookModel;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BookDetailsViewBody(
          // bookModel: widget.bookModel,
        ),
      ),
    );
  }
}
