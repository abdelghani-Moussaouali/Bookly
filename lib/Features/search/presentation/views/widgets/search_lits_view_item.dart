import 'package:ebook/Features/home/data/models/books_model/ebook_model/ebook_model.dart';

import 'package:ebook/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:ebook/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:ebook/constants.dart';
import 'package:ebook/core/utils/app_router.dart';
import 'package:ebook/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchListViewItem extends StatelessWidget {
  const SearchListViewItem({
    super.key, required this.booksModel,
  });
  final EBooksModel booksModel;

  @override
  Widget build(BuildContext context) {
   
    return GestureDetector( 
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.kBookDetailsView,
          extra: booksModel
        );
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
             CustomBookImage(
              imageUrl:
                  booksModel.imageLink??kBookDefaultImage,
                  
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      booksModel.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kGtSectraFine,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                   Text(
                    booksModel.title,
                    style: Styles.textStyle14,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                 
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                       BookRating(
                        rating:0,
                        count: 0,
                      ),
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
