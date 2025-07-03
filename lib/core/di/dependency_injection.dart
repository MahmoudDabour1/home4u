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
import 'package:home4u/features/auth/sign_up/logic/engineering_office/engineering_office_cubit.dart';
import 'package:home4u/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:home4u/features/auth/sign_up/logic/technical_worker/technical_worker_cubit.dart';
import 'package:home4u/features/auth/verification/data/data_source/verification_remote_data_source.dart';
import 'package:home4u/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:home4u/features/exhibition/data/data_sources/business_add_product_remote_data_source.dart';
import 'package:home4u/features/exhibition/logic/business_add_product_cubit.dart';
import 'package:home4u/features/furnish_your_home/data/data_source/furnish_your_home_remote_data_source.dart';
import 'package:home4u/features/furnish_your_home/data/repos/furnish_your_home_repo.dart';
import 'package:home4u/features/furnish_your_home/logic/furnish_your_home_cubit.dart';
import 'package:home4u/features/kitchen_and_dressing/data/data_source/kitchen_and_dressing_remote_data_source.dart';
import 'package:home4u/features/kitchen_and_dressing/data/repos/kitchen_and_dressing_repo.dart';
import 'package:home4u/features/kitchen_and_dressing/logic/kitchen_and_dressing_cubit.dart';
import 'package:home4u/features/orders/data/data_source/orders_remote_data_source.dart';
import 'package:home4u/features/products/data/data_source/products_remote_data_source.dart';
import 'package:home4u/features/products/data/repos/products_repo.dart';
import 'package:home4u/features/products/logic/products_cubit.dart';
import 'package:home4u/features/profile/data/data_sources/certifications_remote_data_source.dart';
import 'package:home4u/features/profile/data/data_sources/profile_local_data_source.dart';
import 'package:home4u/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:home4u/features/profile/data/data_sources/projects_remote_data_source.dart';
import 'package:home4u/features/profile/data/data_sources/services_remote_data_source.dart';
import 'package:home4u/features/profile/data/models/profile/engineer_profile_response_model.dart';
import 'package:home4u/features/profile/data/models/profile/technical_worker_profile_response_model.dart';
import 'package:home4u/features/profile/data/models/projects/get_projects_response_model.dart';
import 'package:home4u/features/profile/data/repos/certifications_repo.dart';
import 'package:home4u/features/profile/data/repos/projects_repo.dart';
import 'package:home4u/features/profile/data/repos/services_repository.dart';
import 'package:home4u/features/profile/logic/certifications/certifications_cubit.dart';
import 'package:home4u/features/profile/logic/project/project_cubit.dart';
import 'package:home4u/features/projects_filter/data/data_source/projects_filter/projects_filter_remote_data_source.dart';
import 'package:home4u/features/projects_filter/data/repository/projects_filter_repository.dart';
import 'package:home4u/features/rating/data/data_source/product_rating_remote_data_source.dart';
import 'package:home4u/features/rating/data/repository/product_rating_repository.dart';
import 'package:home4u/features/user/renovate_your_house/logic/renovate_your_house_cubit.dart';

import '../../features/ask_engineer/data/data_source/ask_engineer_remote_data_source.dart';
import '../../features/ask_engineer/data/repos/ask_engineer_repo.dart';
import '../../features/ask_engineer/logic/ask_engineer_cubit.dart';
import '../../features/ask_technical_worker/data/data_source/ask_technical_remote_data_source.dart';
import '../../features/ask_technical_worker/data/repos/ask_technical_repo.dart';
import '../../features/ask_technical_worker/logic/ask_technical_cubit.dart';
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
import '../../features/cart/data/repository/cart_repository.dart';
import '../../features/cart/logic/cart_cubit.dart';
import '../../features/exhibition/data/repository/business_add_product_repository.dart';
import '../../features/orders/data/repository/orders_repository.dart';
import '../../features/orders/logic/orders_cubit.dart';
import '../../features/products/data/data_source/products_local_data_source.dart';
import '../../features/products/data/repos/business_config_repo.dart';
import '../../features/profile/data/data_sources/projects_local_data_source.dart';
import '../../features/profile/data/repos/profile_repo.dart';
import '../../features/profile/logic/profile/profile_cubit.dart';
import '../../features/profile/logic/services/services_cubit.dart';
import '../../features/projects_filter/logic/projects_filter/projects_filter_cubit.dart';
import '../../features/rating/logic/product_rating/product_rating_cubit.dart';
import '../../features/user/renovate_your_house/data/data_source/renovate_your_house_local_data_source.dart';
import '../../features/user/renovate_your_house/data/data_source/renovate_your_house_remote_data_source.dart';
import '../../features/user/renovate_your_house/data/repository/renovate_your_house_repository.dart';
import '../../features/user/request_design/data/data_source/request_design_remote_data_source.dart';
import '../../features/user/request_design/data/repository/request_design_repository.dart';
import '../../features/user/request_design/logic/request_design_cubit.dart';
import '../localization/app_localization_cubit.dart';
import '../networking/dio_factory.dart';

final sl = GetIt.instance;

Future<void> setupGetIt() async {
  await Hive.initFlutter();
  Dio dio = DioFactory.getDio();
  //login
  sl.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSource(dio));
  sl.registerLazySingleton<LoginRepo>(
      () => LoginRepoImpl(loginRemoteDataSource: sl()));
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
  sl.registerFactory<EngineeringOfficeCubit>(
      () => EngineeringOfficeCubit(sl()));

  ///projects
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

  ///profile
  sl.registerLazySingleton<Box<EngineerProfileResponseModel>>(
      () => Hive.box<EngineerProfileResponseModel>(kEngineerProfileBox));

  sl.registerLazySingleton<Box<TechnicalWorkerResponseModel>>(
    () => Hive.box<TechnicalWorkerResponseModel>(kTechnicalWorkerProfileBox),
  );
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

  ///Exhibitions
  // business config
  sl.registerLazySingleton<ProductsRemoteDataSource>(
      () => ProductsRemoteDataSource(dio));
  sl.registerLazySingleton<BusinessConfigRepo>(
    () => BusinessConfigRepoImpl(remoteDataSource: sl(), localDatasource: sl()),
  );
  sl.registerLazySingleton<ProductsLocalDatasource>(
      () => ProductsLocalDatasourceImpl());
  sl.registerLazySingleton<ProductsRepo>(() => ProductsRepoImpl(
      productsRemoteDataSource: sl(), productsLocalDataSource: sl()));
  sl.registerFactory<ProductsCubit>(() => ProductsCubit(sl(), sl(), sl()));

  //Business Add Product
  sl.registerLazySingleton<BusinessAddProductRemoteDataSource>(
      () => BusinessAddProductRemoteDataSource(dio));
  sl.registerLazySingleton<BusinessAddProductRepository>(
      () => BusinessAddProductRepositoryImpl(sl()));
  sl.registerFactory<BusinessAddProductCubit>(
      () => BusinessAddProductCubit(sl()));

  //ask Engineer
  sl.registerLazySingleton<AskEngineerRemoteDataSource>(
      () => AskEngineerRemoteDataSource(dio));
  sl.registerLazySingleton<AskEngineerRepo>(() => AskEngineerRepoImpl(sl()));
  sl.registerFactory<AskEngineerCubit>(() => AskEngineerCubit(sl()));

  ///Renovate Your House
  sl.registerLazySingleton<RenovateYourHouseRemoteDataSource>(
      () => RenovateYourHouseRemoteDataSource(dio));
  sl.registerLazySingleton<RenovateYourHouseLocalDataSource>(
      () => RenovateYourHouseLocalDataSourceImpl());
  sl.registerLazySingleton<RenovateYourHouseRepository>(
    () => RenovateYourHouseRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
    ),
  );
  sl.registerFactory<RenovateYourHouseCubit>(
    () => RenovateYourHouseCubit(sl()),
  );

  ///Request Design
  sl.registerLazySingleton<RequestDesignRemoteDataSource>(
      () => RequestDesignRemoteDataSource(dio));

  sl.registerLazySingleton<RequestDesignRepository>(
    () => RequestDesignRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  sl.registerFactory<RequestDesignCubit>(() => RequestDesignCubit(sl()));

  ///Ask Technical
  sl.registerLazySingleton<AskTechnicalRemoteDataSource>(
      () => AskTechnicalRemoteDataSource(dio));
  sl.registerLazySingleton<AskTechnicalRepo>(() => AskTechnicalRepoImpl(sl()));
  sl.registerFactory<AskTechnicalCubit>(() => AskTechnicalCubit(sl()));

  ///Shop Now
  sl.registerLazySingleton<CartRemoteDataSource>(
      () => CartRemoteDataSource(dio));

  sl.registerLazySingleton<CartRepository>(
      () => CartRepositoryImpl(cartRemoteDataSource: sl()));

  sl.registerFactory<CartCubit>(() => CartCubit(sl()));

  ///orders
  sl.registerLazySingleton<OrdersRemoteDataSource>(
      () => OrdersRemoteDataSource(dio));

  sl.registerLazySingleton<OrdersRepository>(
      () => OrdersRepositoryImpl(ordersRemoteDataSource: sl()));

  sl.registerFactory<OrdersCubit>(() => OrdersCubit(sl()));

  ///furnish your home
  sl.registerLazySingleton<FurnishYourHomeRemoteDataSource>(
      () => FurnishYourHomeRemoteDataSource(dio));

  sl.registerLazySingleton<FurnishYourHomeRepo>(
      () => FurnishYourHomeRepoImpl(sl()));

  sl.registerFactory<FurnishYourHomeCubit>(() => FurnishYourHomeCubit(sl()));

  ///Kitchen and dressing
  sl.registerLazySingleton<KitchenAndDressingRemoteDataSource>(
      () => KitchenAndDressingRemoteDataSource(dio));

  sl.registerLazySingleton<KitchenAndDressingRepo>(
      () => KitchenAndDressingRepoImpl(sl()));

  sl.registerFactory<KitchenAndDressingCubit>(
      () => KitchenAndDressingCubit(sl()));

  ///Product Rating
  sl.registerLazySingleton<ProductRatingRemoteDataSource>(
      () => ProductRatingRemoteDataSource(dio));

  sl.registerLazySingleton<ProductRatingRepository>(
      () => ProductRatingRepositoryImpl(sl()));

  sl.registerFactory<ProductRatingCubit>(() => ProductRatingCubit(sl()));

  ///Projects-Filter
  sl.registerLazySingleton<ProjectsFilterRemoteDataSource>(
    () => ProjectsFilterRemoteDataSource(dio),
  );

  sl.registerLazySingleton<ProjectsFilterRepository>(
      () => ProjectsFilterRepositoryImpl(sl()));

  sl.registerFactory<ProjectsFilterCubit>(() => ProjectsFilterCubit(sl()));
}
