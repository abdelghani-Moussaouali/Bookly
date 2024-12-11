
import 'package:ebook/Features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:ebook/Features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key, });
  // final Item bookmodel;

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    BlocProvider.of<SearchBooksCubit>(context).fetchSearchBooks('');

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SearchViewBody(),
      ),
    );
  }
}
