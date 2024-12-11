import 'package:ebook/Features/home/data/models/books_model/ebook_model/ebook_model.dart';
import 'package:ebook/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:ebook/core/utils/app_router.dart';
import 'package:ebook/core/widgets/custom_like_button.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';


import '../../../../../constants.dart';

import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({
    super.key,
    required this.booksModel,
  });
  final EBooksModel booksModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kBookDetailsView, extra: booksModel);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookImage(
              // imageUrl: booksModel.volumeInfo.imageLinks?.smallThumbnail ??
              //     kBookDefaultImage,
              imageUrl: booksModel.imageLink,
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    // crossAxisAlignment:CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .5,
                        child: Text(
                          // booksModel.volumeInfo.title!,
                          booksModel.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.textStyle20.copyWith(
                            fontFamily: kGtSectraFine,
                          ),
                        ),
                      ),
                      const CustomLikeButton()
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  // Text(
                  //   booksModel.volumeInfo.authors?[0] ?? 'unknown auther',
                  //   style: Styles.textStyle14,
                  //   maxLines: 1,
                  //   overflow: TextOverflow.ellipsis,
                  // ),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      // BookRating(
                      //   rating: booksModel.volumeInfo.averageRating ?? 0,
                      //   count: booksModel.volumeInfo.ratingsCount ?? 0,
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
