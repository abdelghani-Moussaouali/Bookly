
import 'package:ebook/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import 'custom_book_item.dart';
class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
              height: MediaQuery.of(context).size.height * .3,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(
                            AppRouter.kBookDetailsView,
                          
                          );
                        },
                        child: const CustomBookImage(
                          imageUrl: AssetsData.testImage,
                        ),
                      ),
                    );
                  }),
            ),
    );
        } 
    
  }

