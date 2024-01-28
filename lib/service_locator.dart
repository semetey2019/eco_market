import 'package:dio/dio.dart';
import 'package:eco_market/features/card/data/repositories/repository.dart';
import 'package:eco_market/features/main/presentation/cubit/main_screen_cubit.dart';
import 'package:get_it/get_it.dart';

import 'features/card/data/datasources/cart_remote_data_source.dart';
import 'features/card/domain/repositories/cart_repository.dart';
import 'features/card/presentation/cubit/cart_screen_cubit.dart';
import 'features/main/data/datasources/main_remote_data_sources.dart';
import 'features/main/data/repositories/main_repo_impl.dart';
import 'features/main/domain/repositories/main_repositories.dart';
import 'features/main/presentation/cubit/connection_cubit.dart';
import 'features/search/data/datasources/search_remote_data_sourse.dart';
import 'features/search/data/repositories/search_repo_impl.dart';
import 'features/search/domain/repositories/search_repositories.dart';
import 'features/search/presentation/cubit/search_screen_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => MainScreenCubit(sl()));

  sl.registerLazySingleton<MainRepoistory>(() => MainRepoImpl(sl()));
  sl.registerLazySingleton<MainRemoteDataSource>(
      () => MainRemoteDataSourceImpl(sl()));

  sl.registerFactory(() => SearchScreenCubit(sl()));

  sl.registerLazySingleton<SearchRepository>(() => SearchRepoImple(sl()));
  sl.registerLazySingleton<SearchRemoteDataSourse>(
      () => SearchRemoteDataSourseImple(sl()));

  sl.registerFactory(() => CartScreenCubit(sl()));
  sl.registerLazySingleton<CartRepository>(() => CartRepoImple(sl()));
  sl.registerLazySingleton<CartRemoteDataSourse>(
      () => CartRemoteDataSourseImple(sl()));
  sl.registerFactory(() => ConnectionCubit());

  sl.registerLazySingleton(() => Dio());
}
