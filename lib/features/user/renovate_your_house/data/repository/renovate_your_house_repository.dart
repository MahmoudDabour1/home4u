import 'package:home4u/core/networking/api_result.dart';
import 'package:home4u/features/user/renovate_your_house/data/models/renovate_your_house_fixed_packages_model.dart';
import 'package:home4u/features/user/renovate_your_house/data/models/renovate_your_house_look_ups_model.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../data_source/renovate_your_house_local_data_source.dart';
import '../data_source/renovate_your_house_remote_data_source.dart';
import '../models/add_renovate_house_custom_package_body.dart';
import '../models/renovate_your_house_choose_fixed_package_body.dart';
import '../models/renovate_your_house_response_model.dart';

abstract class RenovateYourHouseRepository {
  Future<ApiResult<RenovateYourHouseLookUpsModel>>
      getRenovateYourHouseLookUps();

  Future<ApiResult<RenovateYourHouseFixedPackagesModel>>
      getRenovateYourHouseFixedPackages();

  Future<ApiResult<RenovateYourHouseResponseModel>>
      addCustomPackageRenovateYourHouse(
    AddRenovateHouseCustomPackageBody addRenovateHouseCustomPackageBody,
  );

  Future<ApiResult<RenovateYourHouseResponseModel>>
      chooseFixedPackageRenovateYourHouse(
    RenovateYourHouseChooseFixedPackageBody
        renovateYourHouseChooseFixedPackageBody,
  );
}

class RenovateYourHouseRepositoryImpl implements RenovateYourHouseRepository {
  final RenovateYourHouseRemoteDataSource remoteDataSource;
  final RenovateYourHouseLocalDataSource localDataSource;

  RenovateYourHouseRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<ApiResult<RenovateYourHouseLookUpsModel>>
      getRenovateYourHouseLookUps() async {
    try {
      final remoteData = await remoteDataSource.getRenovateYourHouseLookUps();
      // await localDataSource.saveRenovateYourHouseLookUps(remoteData);
      return ApiResult.success(remoteData);
    } catch (e) {
      // final localData = await localDataSource.getRenovateYourHouseLookUps();
      // if (localData != null) {
      //   return ApiResult.success(localData);
      // } else {
        return ApiResult.failure(ApiErrorHandler.handle(e));
      // }
    }
  }

  @override
  Future<ApiResult<RenovateYourHouseFixedPackagesModel>>
      getRenovateYourHouseFixedPackages() async {
    try {
      final remoteData =
          await remoteDataSource.getRenovateYourHouseFixedPackages();
      // await localDataSource.saveRenovateYourHouseFixedPackages(remoteData);
      return ApiResult.success(remoteData);
    } catch (e) {
      // final localData =
      //     await localDataSource.getRenovateYourHouseFixedPackages();
      // if (localData != null) {
      //   return ApiResult.success(localData);
      // } else {
        return ApiResult.failure(ApiErrorHandler.handle(e));
      // }
    }
  }

  @override
  Future<ApiResult<RenovateYourHouseResponseModel>>
      addCustomPackageRenovateYourHouse(
    AddRenovateHouseCustomPackageBody addRenovateHouseCustomPackageBody,
  ) async {
    try {
      final remoteData = await remoteDataSource
          .addCustomPackageRenovateYourHouse(addRenovateHouseCustomPackageBody);
      return ApiResult.success(remoteData);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult<RenovateYourHouseResponseModel>>
      chooseFixedPackageRenovateYourHouse(
    RenovateYourHouseChooseFixedPackageBody
        renovateYourHouseChooseFixedPackageBody,
  ) async {
    try {
      final remoteData =
          await remoteDataSource.chooseFixedPackageRenovateYourHouse(
              renovateYourHouseChooseFixedPackageBody);
      return ApiResult.success(remoteData);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
