import 'package:dio/dio.dart';
import 'package:ebook/Features/home/data/repos/home_repo_impl.dart';
import 'package:ebook/Features/search/data/repos/search_repos_impl.dart';
import 'package:ebook/core/utils/api_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator(){
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<SearchReposImpl>(SearchReposImpl(getIt.get<ApiService>()));
}