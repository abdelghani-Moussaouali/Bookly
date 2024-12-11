import 'package:ebook/Features/Login/login_view.dart';
import 'package:ebook/Features/Splash/presentation/views/splash_view.dart';
import 'package:ebook/Features/home/data/models/books_model/ebook_model/ebook_model.dart';
import 'package:ebook/Features/home/data/repos/home_repo_impl.dart';
import 'package:ebook/Features/home/presentation/manager/Similar_book_cubit/similar_book_cubit.dart';
import 'package:ebook/Features/home/presentation/views/book_details_view.dart';
import 'package:ebook/Features/home/presentation/views/home_view.dart';
import 'package:ebook/Features/search/data/repos/search_repos_impl.dart';
import 'package:ebook/Features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:ebook/Features/search/presentation/views/search_view.dart';
import 'package:ebook/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';
  static const kLoginView = '/loginview';
  late final EBooksModel bookModel;
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
          path: kSearchView,
          builder: (context, state) {
            return BlocProvider(
              create: (context) => SearchBooksCubit(
                  searchReposImpl: getIt.get<SearchReposImpl>(), ''),
              child: SearchView(),
            );
          }),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              SimilarBookCubit(homeRepo: getIt.get<HomeRepoImpl>()),
          child: BookDetailsView(
            bookModel: state.extra as EBooksModel,
          ),
        ),
      ),
    ],
  );
}
