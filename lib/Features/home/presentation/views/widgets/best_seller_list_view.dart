import 'package:ebook/Features/home/presentation/manager/newst_book_cubit/newst_book_cubit.dart';
import 'package:ebook/Features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:ebook/core/widgets/custom_error_message.dart';
import 'package:ebook/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewstBookCubit, NewstBookState>(
      builder: (BuildContext context, state) {
       print(state);
        if (state is NewstBookSucess) {

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 10),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: BookListViewItem(
                  booksModel: state.books[index],
                ),
              );
            },
          );
        } else if (state is NewstBookFailure) {
          return CustomErrormessage(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
