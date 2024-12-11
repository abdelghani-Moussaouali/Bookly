

import 'package:ebook/Features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:ebook/Features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:ebook/core/widgets/custom_error_message.dart';
import 'package:ebook/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key,});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
        builder: (context, state) {
         
      if (state is SearchBooksCubitSecess) {
        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: state.books.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: BookListViewItem(
                booksModel: state.books[index],
              ),
            );
          },
        );
      }else if (state is SearchBooksCubitFailure) {
        return CustomErrormessage(errMessage: state.errMessage);
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
