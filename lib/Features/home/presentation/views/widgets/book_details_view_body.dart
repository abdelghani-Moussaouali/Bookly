import 'package:ebook/Features/home/data/models/books_model/ebook_model/ebook_model.dart';

import 'package:ebook/Features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'books_details_sectioni.dart';
import 'custom_book_details_app_bar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({
    super.key,
    required this.bookmodel,
  });
  final EBooksModel bookmodel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                BookDetailsSection(
                  bookmodel: bookmodel,
                ),
                const Expanded(
                    child: SizedBox(
                  height: 20,
                )),
                const SimilarBooksSection(),
                const Expanded(
                  child: SizedBox(
                    height: 20,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
