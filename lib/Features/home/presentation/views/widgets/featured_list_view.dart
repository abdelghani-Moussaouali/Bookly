import 'package:ebook/Features/home/presentation/manager/featured_book_cubit/featured_book_cubit.dart';
import 'package:ebook/constants.dart';
import 'package:ebook/core/widgets/custom_error_message.dart';
import 'package:ebook/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import 'custom_book_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBookCubit, FeaturedBookState>(
      builder: (context, state) {
     
        if (state is FeaturedBookSucess) {
          
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .3,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.books.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.kBookDetailsView,
                              extra: state.books[index]);
                        },
                        child: CustomBookImage(
                          imageUrl: state.books[index].imageLink
                             
                        ),
                      ),
                    );
                  }),
            ),
          );
        } else if (state is FeaturedBookFailure) {
          return CustomErrormessage(
            errMessage: state.errMessage,
          );
        }
        return const CustomLoadingIndicator();
      },
    );
  }
}
