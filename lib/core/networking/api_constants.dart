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
  static const String renovateYourHouseChooseFixedPackageEp =
      "/api/v1/select-custom-package";
  static const String renovateYourHouseLookUpsEp = "/api/v1/home-renovate/lkps";
  static const String renovateYourHouseFixedPackagesEp =
      "/api/v1/custom-package";

  ///RequestDesign
  static const String requestDesignEp = "/api/v1/request-design";

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
  static const String ordersEp = "/api/v1/orders";

  ///orders
  static const String getOrdersEp = "/api/v1/orders/user/{userId}";
  static const String getOrderDetailsEp = "/api/v1/orders/{orderId}";
  static const String cancelOrderEp = "/api/v1/orders/cancel/{orderId}";
  static const String sendFurnishYourHomeEp =
      "/api/v1/home-furnishing-requests";

  /// rating
  static const String insertProductRateEp = "/api/v1/product-ratings";
  static const String getProductRateEp = "/api/v1/product-ratings/{productId}";
  static const String getRateReviewEp = "/api/v1/product-ratings/filter";

  static const String findRateByIdEp = "/api/v1/product-ratings/{rateId}";
  static const String findProductRateByProductIdAndUserIdEp =
      "/api/v1/product-ratings/product/{productId}/user/{userId}";

  ///Projects Filter
  static const String renovateHouseFilterEp = "/api/v1/home-renovate/filter";
  static const String renovateHouseFixedPackageFilterEp =
      "/api/v1/select-custom-package/filter";
  static const String requestDesignFilterEp = "/api/v1/request-design/filter";
  static const String askTechnicalWorkerFilterEp = "/api/v1/ask-worker/filter";
  static const String askEngineerFilterEp = "/api/v1/ask-engineer/filter";

  ///Projects Details
  static const String askTechnicalServiceDetailsEp =
      "/api/v1/ask-worker/{askId}";
  static const String askEngineerServiceDetailsEp =
      "/api/v1/ask-engineer/{askId}";
  static const String renovateHouseDetailsEp =
      "/api/v1/home-renovate/{renovateId}";
  static const String requestDesignDetailsEp =
      "/api/v1/request-design/{requestId}";
  static const String renovateHouseFixedPackageDetailsEp =
      "/api/v1/custom-package/{packageId}";
  static const String furnishYourHomeDetailsEp =
      "/api/v1/home-furnishing-requests/{furnishId}";

  ///My-Asks
  static const String technicalAsksEp = "/api/v1/ask-worker/my-asks";
  static const String engineerAsksEp = "/api/v1/ask-engineer/my-asks";
  static const String requestDesignAsksEp =
      "/api/v1/request-design/my-request-design";
  static const String renovateHouseAsksEp =
      "/api/v1/home-renovate/my-home-renovate";
  static const String renovateHouseFixedPackageAsksEp =
      "/api/v1/select-custom-package/my-select-package";

  ///Request Asks
  ///Request
  static const String requestAskEngineerEp = "/api/v1/request-ask-engineer";
  static const String requestAskWorkerEp = "/api/v1/request-ask-worker";
  static const String requestRenovateHouseEp = "/api/v1/request-home-renovate";
  static const String requestRenovateHouseCustomPackageEp =
      "/api/v1/request-select-custom-package";
  static const String requestRequestDesignEp = "/api/v1/request-request-design";

  ///Get Request Asks By Id
  static const String requestAskEngineerByIdEp =
      "/api/v1/request-ask-engineer/my-asks";
  static const String requestAskWorkerByIdEp =
      '/api/v1/request-ask-worker/my-asks';
  static const String requestRequestDesignByIdEp =
      '/api/v1/request-request-design/my-asks';

  static const String requestRenovateHouseCustomPackageByIdEp =
      '/api/v1/request-select-custom-package/my-asks';

  static const String requestRenovateHouseByIdEp =
      '/api/v1/request-home-renovate/my-asks';
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
