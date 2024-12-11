import 'package:ebook/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:ebook/Features/search/presentation/views/widgets/custom_form_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CircleAvatar(
        radius: 30,
        child: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.grey[400],
                  content: Container(
                      height: 150,
                      child: const Column(
                        children: [
                          CustomFormTextField(
                              icon: CupertinoIcons.text_aligncenter,
                              text: 'title')
                        ],
                      ))));
            }),
      ),
      body: const HomeViewBody(),
    );
  }
}
