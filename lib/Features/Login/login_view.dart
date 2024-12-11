import 'package:ebook/Features/search/presentation/views/widgets/custom_form_text_field.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeLoginBody(),
    );
  }
}

class HomeLoginBody extends StatelessWidget {
  const HomeLoginBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomFormTextField(icon: CupertinoIcons.person, text: 'user')
        ],
      ),
    );
  }
}
