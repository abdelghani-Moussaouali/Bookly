import 'package:ebook/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'best_seller_list_view.dart';

import 'custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: CustomAppBar()),
              // FeaturedBooksListView(),
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
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(right: 5, left: 16),
            child: BestSellerListView(),
          ),
        ),
      ],
    );
  }
}

//  Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
//           child: GestureDetector(
//             onTap: () {
//               // ignore: prefer_const_constructors
//               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                   content: const Text(
//                 'wefwefwef',
//                 style: TextStyle(color: Colors.red),
//               )));
//             },
//             child: const CircleAvatar(
//               backgroundColor: Colors.green,
//               radius: 28,
//               child: Icon(Icons.add),
//             ),
//           ),
//         ),
