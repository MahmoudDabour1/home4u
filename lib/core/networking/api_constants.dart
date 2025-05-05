class ApiConstants {
  static const String apiBaseUrl = "https://home4u.gosoftcloud.com";
  static const String imageBaseUrl = "https://149.102.135.15:5001/";
  static const String loginEndPoint = "/api/v1/auth/login";
  static const String userTypesEp = "/api/v1/user-types";
  static const String signUpEp = "/api/v1/auth/register";
  static const String forgetPasswordEp = "/api/v1/auth/send-otp";
  static const String verificationEP = "/api/v1/auth/activate-the-account";
  static const String newPasswordEP = "/api/v1/auth/reset-password";
  static const String governoratesEp = "/api/v1/governorates";
  static const String getProjectsEp = "/api/v1/project/user-projects";

  ///Freelancer
  static const String engineerTypesEp = "/api/v1/engineer-types";
  static const String technicalWorkerTypesEp = "/api/v1/technical-worker-types";
  static const String engineeringOfficeFieldsEp =
      "/api/v1/engineering-office-field";

  ///Project
  static const String projectAddEp = "/api/v1/project";

  ///Certifications
  static const String getAllCertificationsEp =
      "/api/v1/certificate/user-certificates";
  static const String addCertificationsEp = "/api/v1/certificate";
  static const String updateCertificationsEp = "/api/v1/certificate";
  static const String deleteCertificationsEp =
      "/api/v1/certificate/{certificationId}";
  static const String getCertificationByIdEp =
      "/api/v1/certificate/{certificationId}";

  ///Services
  static const String engineerServicesEp = "/api/v1/engineer-services/service";
  static const String updateEngineerServices =
      "/api/v1/engineer-services/service/update";
  static const String technicalWorkerServicesEp =
      "/api/v1/technical-worker-services/service";
  static const String engineeringOfficeServicesEp =
      "/api/v1/engineering-office-department/department";
  static const String updateTechnicalWorkerServices =
      "/api/v1/technical-worker-services/service/update";
  static const String updateEngineeringOfficeServices =
      "/api/v1/engineering-office-department/department/update";

  ///profile
  static const String getEngineerByTokenEp = "/api/v1/engineers/user";
  static const String getTechnicalWorkerByTokenEp =
      "/api/v1/technical-workers/user";
  static const String updateEngineerProfileEP = "/api/v1/engineers";
  static const String updateTechnicalWorkerProfileEP =
      "/api/v1/technical-workers";
  static const String uploadProfileImageEP = "/api/v1/users/personal_photo";
  static const String getEngineeringOfficeByTokenEp =
      "/api/v1/engineering-office/user";
  static const String updateEngineeringOfficeProfileEP =
      "/api/v1/engineering-office";

  ///exhibitions
  static const String businessConfigEP = "/api/v1/business-config";
  static const String productsFilterEP = "/api/v1/products/filter";
  static const String deleteProductEP = "/api/v1/products/{productId}";
  static const String addProductEp = "/api/v1/products";
  static const String addAllProductImagesEp = "/api/v1/product-images/all";

  ///RenovateYourHouse
  static const String renovateYourHouseEp = "/api/v1/home-renovate";
  static const String renovateYourHouseCustomFilterEp =
      "/api/v1/select-custom-package/filter";
  static const String renovateYourHouseFixedPackagesFilterEp =
      "/api/v1/home-renovate/filter";
  static const String renovateYourHouseChooseFixedPackageEp =
      "/api/v1/select-custom-package";
  static const String renovateYourHouseLookUpsEp = "/api/v1/home-renovate/lkps";
  static const String renovateYourHouseFixedPackagesEp =
      "/api/v1/custom-package";///RequestDesign
  static const String requestDesignEp = "/api/v1/request-design";
  static const String requestDesignFilterEp = "/api/v1/request-design/filter";

  ///Product
  static const String getProductDetailsEP = "/api/v1/products/{productId}";
  static const String updateProductEP = "/api/v1/products";

  // upload Image = {{prod_url}}/api/v1/file?pathId=BUSINESS_PRODUCTS&id=4

  ///images
  static String getImageBaseUrl(String path) => "$apiBaseUrl/$path";

  ///ask engineer
  static const String askEngineerIkpEp = "/api/v1/ask-engineer/lkps";
  static const String askEngineerEp = "/api/v1/ask-engineer";
  static const String addAllAskEngineerImagesEp =
      "/api/v1/ask-engineer-photos/all";

  ///ask worker
  static const String askWorkerIkpEp = "/api/v1/ask-worker/lkps";
  static const String askWorkerEp = "/api/v1/ask-worker";
  static const String addAllAskWorkerImagesEp = "/api/v1/ask-worker-photos/all";


  ///cart process
 static const String shopNowEp = "/api/v1/products/shop-now";
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
