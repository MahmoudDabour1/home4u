import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:home4u/features/auth/login/data/data_sources/login_remote_data_source.dart';
import 'package:home4u/features/auth/login/data/repos/login_repo.dart';
import 'package:home4u/features/auth/login/logic/login_cubit.dart';
import 'package:home4u/features/auth/sign_up/data/data_source/sign_up_remote_data_source.dart';
import 'package:home4u/features/auth/sign_up/data/repos/sign_up_repository.dart';
import 'package:home4u/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:home4u/features/auth/verification/data/data_source/verification_remote_data_source.dart';

import '../../features/auth/forget_password/data/data_source/forget_password_data_source.dart';
import '../../features/auth/forget_password/data/repos/forget_password_repo.dart';
import '../../features/auth/forget_password/logic/forget_password_cubit.dart';
import '../../features/auth/new_password/data/data_source/new_password_remote_data_source.dart';
import '../../features/auth/new_password/data/repos/new_password_repo.dart';
import '../../features/auth/new_password/logic/new_password_cubit.dart';
import '../../features/auth/verification/data/repos/verification_repo.dart';
import '../../features/auth/verification/logic/verification_cubit.dart';
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

  //forgetPassword
  sl.registerLazySingleton<ForgetPasswordDataSource>(
      () => ForgetPasswordDataSource(dio));
  sl.registerLazySingleton<ForgetPasswordRepo>(() => ForgetPasswordRepo(sl()));
  sl.registerFactory<ForgetPasswordCubit>(() => ForgetPasswordCubit(sl()));

  //verification
  sl.registerLazySingleton<VerificationRemoteDataSource>(()=> VerificationRemoteDataSource(dio));
  sl.registerLazySingleton<VerificationRepo>(()=> VerificationRepo(sl()));
  sl.registerFactory<VerificationCubit>(()=> VerificationCubit(sl()));


  //newPassword
  sl.registerLazySingleton<NewPasswordRemoteDataSource>(() => NewPasswordRemoteDataSource(dio));
  sl.registerLazySingleton<NewPasswordRepo>(() => NewPasswordRepo(sl()));
  sl.registerFactory<NewPasswordCubit>(() => NewPasswordCubit(sl()));

}
