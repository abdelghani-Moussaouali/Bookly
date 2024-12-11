import 'package:ebook/Features/home/presentation/manager/featured_book_cubit/featured_book_cubit.dart';
import 'package:ebook/Features/home/presentation/manager/newst_book_cubit/newst_book_cubit.dart';
import 'package:ebook/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:ebook/core/widgets/custom_error_message.dart';
import 'package:ebook/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';

class SimilarBooksSection  extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewstBookCubit, NewstBookState>(
      builder: (context, state) {
        if (state is NewstBookSucess) {
         
          return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'You can also like',
              style: Styles.textStyle14.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
             SimilarBooksListview(books:state.books ,),
          ], 
        );
        }
        else if (state is NewstBookFailure) {
          
          return CustomErrormessage(errMessage: state.errMessage);
        }
        else  {
          return const CustomLoadingIndicator();
        }

      },
    );
  }
}
