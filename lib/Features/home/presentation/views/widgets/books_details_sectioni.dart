import 'package:ebook/Features/home/data/models/books_model/ebook_model/ebook_model.dart';

import 'package:ebook/constants.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_item.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({
    super.key,
    required this.bookmodel,
  });

  final EBooksModel bookmodel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * .2,
          ),
          child: CustomBookImage(
              imageUrl: bookmodel.imageLink),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          bookmodel.title,
          style: Styles.textStyle30.copyWith(
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 12,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            bookmodel.title,
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        const BookRating(
          rating: 0,
          count:  0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 20,
        ),
        BooksAction(
          bookmodel: bookmodel,
        ),
      ],
    );
  }

  
}
