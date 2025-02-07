import 'package:dio/dio.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:home4u/core/utils/app_constants.dart';
import 'package:home4u/features/auth/login/data/data_sources/login_remote_data_source.dart';
import 'package:home4u/features/auth/login/data/repos/login_repo.dart';
import 'package:home4u/features/auth/login/logic/login_cubit.dart';
import 'package:home4u/features/auth/sign_up/data/data_source/common_local_data_source.dart';
import 'package:home4u/features/auth/sign_up/data/data_source/sign_up_remote_data_source.dart';
import 'package:home4u/features/auth/sign_up/data/repos/freelancer_sign_up_repository.dart';
import 'package:home4u/features/auth/sign_up/data/repos/sign_up_repository.dart';
import 'package:home4u/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:home4u/features/auth/sign_up/logic/technical_worker/technical_worker_cubit.dart';
import 'package:home4u/features/auth/verification/data/data_source/verification_remote_data_source.dart';
import 'package:home4u/features/profile/data/data_sources/certifications_remote_data_source.dart';
import 'package:home4u/features/profile/data/data_sources/profile_local_data_source.dart';
import 'package:home4u/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:home4u/features/profile/data/data_sources/projects_remote_data_source.dart';
import 'package:home4u/features/profile/data/data_sources/services_remote_data_source.dart';
import 'package:home4u/features/profile/data/models/projects/get_projects_response_model.dart';
import 'package:home4u/features/profile/data/repos/certifications_repo.dart';
import 'package:home4u/features/profile/data/repos/projects_repo.dart';
import 'package:home4u/features/profile/data/repos/services_repository.dart';
import 'package:home4u/features/profile/logic/certifications/certifications_cubit.dart';
import 'package:home4u/features/profile/logic/project/project_cubit.dart';
import 'package:home4u/features/profile/data/models/profile/profile_response_model.dart';

import '../../features/auth/forget_password/data/data_source/forget_password_data_source.dart';
import '../../features/auth/forget_password/data/repos/forget_password_repo.dart';
import '../../features/auth/forget_password/logic/forget_password_cubit.dart';
import '../../features/auth/new_password/data/data_source/new_password_remote_data_source.dart';
import '../../features/auth/new_password/data/repos/new_password_repo.dart';
import '../../features/auth/new_password/logic/new_password_cubit.dart';
import '../../features/auth/sign_up/data/data_source/freelancer_sign_up/freelancer_sign_up_remote_data_source.dart';
import '../../features/auth/sign_up/logic/engineer/engineer_cubit.dart';
import '../../features/auth/verification/data/repos/verification_repo.dart';
import '../../features/auth/verification/logic/verification_cubit.dart';
import '../../features/profile/data/data_sources/projects_local_data_source.dart';
import '../../features/profile/data/repos/profile_repo.dart';
import '../../features/profile/logic/profile/profile_cubit.dart';
import '../../features/profile/logic/services/services_cubit.dart';
import '../localization/app_localization_cubit.dart';
import '../networking/dio_factory.dart';

final sl = GetIt.instance;

Future<void> setupGetIt() async {
  await Hive.initFlutter();
  Dio dio = DioFactory.getDio();
  //login
  sl.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSource(dio));
  sl.registerLazySingleton<LoginRepo>(() => LoginRepo(sl()));
  sl.registerFactory<LoginCubit>(() => LoginCubit(sl()));

  //signUp
  sl.registerLazySingleton<SignUpRemoteDataSource>(
      () => SignUpRemoteDataSource(dio));
  sl.registerLazySingleton<CommonLocalDataSource>(
      () => CommonLocalDataSourceImpl());
  sl.registerLazySingleton<SignUpRepository>(() {
    return SignUpRepositoryImpl(remoteDataSource: sl(), localDataSource: sl());
  });
  sl.registerFactory<SignUpCubit>(() => SignUpCubit(sl()));

  //forgetPassword
  sl.registerLazySingleton<ForgetPasswordDataSource>(
      () => ForgetPasswordDataSource(dio));
  sl.registerLazySingleton<ForgetPasswordRepo>(() => ForgetPasswordRepo(sl()));
  sl.registerFactory<ForgetPasswordCubit>(() => ForgetPasswordCubit(sl()));

  //verification
  sl.registerLazySingleton<VerificationRemoteDataSource>(
      () => VerificationRemoteDataSource(dio));
  sl.registerLazySingleton<VerificationRepo>(() => VerificationRepo(sl()));
  sl.registerFactory<VerificationCubit>(() => VerificationCubit(sl()));

  //newPassword
  sl.registerLazySingleton<NewPasswordRemoteDataSource>(
      () => NewPasswordRemoteDataSource(dio));
  sl.registerLazySingleton<NewPasswordRepo>(() => NewPasswordRepo(sl()));
  sl.registerFactory<NewPasswordCubit>(() => NewPasswordCubit(sl()));

  ///Engineer
  sl.registerLazySingleton<FreelancerSignUpRemoteDataSource>(
      () => FreelancerSignUpRemoteDataSource(dio));
  sl.registerLazySingleton<FreelancerSignUpRepository>(
      () => FreelancerSignUpRepositoryImpl(remoteDataSource: sl()));
  sl.registerFactory<EngineerCubit>(() => EngineerCubit(sl()));
  sl.registerFactory<TechnicalWorkerCubit>(() => TechnicalWorkerCubit(sl()));

//projects
  sl.registerLazySingleton<Box<GetProjectsResponseModel>>(
    () => Hive.box<GetProjectsResponseModel>(kProjectsBox),
  );
  sl.registerLazySingleton<ProjectsRemoteDataSource>(
      () => ProjectsRemoteDataSource(dio));
  sl.registerLazySingleton<ProjectsLocalDataSource>(
    () => ProjectsLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<ProjectsRepo>(() => ProjectsRepoImpl(
        sl(),
        sl(),
      ));
  sl.registerFactory<ProjectCubit>(() => ProjectCubit(sl()));

  ///App Localization
  sl.registerLazySingleton<FlutterLocalization>(
    () => FlutterLocalization.instance,
  );
  sl.registerLazySingleton<AppLocalizationCubit>(
    () => AppLocalizationCubit(
      sl<FlutterLocalization>(),
    ),
  );

  // certifications
  sl.registerLazySingleton<CertificationsRemoteDataSource>(
      () => CertificationsRemoteDataSource(dio));
  sl.registerLazySingleton<CertificationsRepo>(
      () => CertificationsRepoImpl(sl()));
  sl.registerFactory<CertificationsCubit>(() => CertificationsCubit(sl()));

  // Register Profile Box with GetIt
  sl.registerLazySingleton<Box<ProfileResponseModel>>(
      () => Hive.box<ProfileResponseModel>(kProfileBox));
//profile
  sl.registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSource(dio));
  sl.registerLazySingleton<ProfileLocalDataSource>(
      () => ProfileLocalDataSourceImpl());
  sl.registerLazySingleton<ProfileRepo>(() => ProfileRepoImp(sl(), sl()));
  sl.registerFactory<ProfileCubit>(() => ProfileCubit(sl(), sl()));

  ///Services
  sl.registerLazySingleton<ServicesRemoteDataSource>(
    () => ServicesRemoteDataSource(dio),
  );
  sl.registerLazySingleton<ServicesRepository>(
    () => ServicesRepositoryImpl(sl()),
  );
  sl.registerFactory<ServicesCubit>(() => ServicesCubit(sl()));
}
