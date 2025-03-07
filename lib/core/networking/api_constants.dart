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
  static const String engineerServicesEp =
      "/api/v1/engineer-services/service";
  static const String updateEngineerServices =
      "/api/v1/engineer-services/service/update";
  static const String technicalWorkerServicesEp =
      "/api/v1/technical-worker-services/service";
  static const String updateTechnicalWorkerServices =
      "/api/v1/technical-worker-services/service/update";


  ///profile
  static const String getEngineerByTokenEp = "/api/v1/engineers/user";
  static const String getTechnicalWorkerByTokenEp = "/api/v1/technical-workers/user";
  static const String updateEngineerProfileEP = "/api/v1/engineers";
  static const String updateTechnicalWorkerProfileEP = "/api/v1/technical-workers";
  static const String uploadProfileImageEP = "/api/v1/users/personal_photo";


  ///exhibitions
  static const String businessConfigEP = "/api/v1/business-config";
  static const String productsFilterEP = "/api/v1/products/filter";
  static const String deleteProductEP = "/api/v1/products/{productId}";


  ///images
  static String getImageBaseUrl(String path) =>
      "$apiBaseUrl/$path";
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
