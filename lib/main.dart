import 'package:ebook/Features/home/data/repos/home_repo_impl.dart';
import 'package:ebook/Features/home/presentation/manager/featured_book_cubit/featured_book_cubit.dart';
import 'package:ebook/Features/home/presentation/manager/newst_book_cubit/newst_book_cubit.dart';
import 'package:ebook/constants.dart';
import 'package:ebook/core/utils/app_router.dart';
import 'package:ebook/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  setupServiceLocator();
  /// init the hive
  await Hive.initFlutter();
  /// open the box
  var cartBox = Hive.openBox('CartBox');
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override 
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBookCubit(getIt.get<HomeRepoImpl>())..fetchFuturedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewstBookCubit(getIt.get<HomeRepoImpl>())..fetchNewstBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
        ),
      ),
    );
  }
}
