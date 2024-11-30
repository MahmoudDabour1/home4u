import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:home4u/features/auth/login/data/data_sources/login_remote_data_source.dart';
import 'package:home4u/features/auth/login/data/repos/login_repo.dart';
import 'package:home4u/features/auth/login/logic/login_cubit.dart';
import 'package:home4u/features/auth/sign_up/data/data_source/sign_up_remote_data_source.dart';
import 'package:home4u/features/auth/sign_up/data/repos/sign_up_repository.dart';
import 'package:home4u/features/auth/sign_up/logic/sign_up_cubit.dart';

import '../networking/dio_factory.dart';

final sl = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();

  //login
  sl.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSource(dio));
  sl.registerLazySingleton<LoginRepo>(() => LoginRepo(sl()));
  sl.registerFactory<LoginCubit>(() => LoginCubit(sl()));

  //signUp
  sl.registerLazySingleton<SignUpRemoteDataSource>(
      () => SignUpRemoteDataSource(dio));
  sl.registerLazySingleton<SignUpRepository>(() {
    return SignUpRepositoryImpl(remoteDataSource: sl());
  });
  sl.registerFactory<SignUpCubit>(() => SignUpCubit(sl()));
}
