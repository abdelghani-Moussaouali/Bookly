
import 'package:ebook/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'best_seller_list_view.dart';

import 'custom_app_bar.dart';
import 'featured_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics:  BouncingScrollPhysics(
        
      ),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: CustomAppBar()),
              FeaturedBooksListView(),
             
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Newset Books',
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
         SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: BestSellerListView(),
          ),
        ),
      ],
    );
  }
}
