
class ApiConstants {
  static const String apiBaseUrl = "http://149.102.135.15:5000";
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
  static const String getAllCertificationsEp = "/api/v1/certificate/user-certificates";
  static const String addCertificationsEp = "/api/v1/certificate";
  static const String updateCertificationsEp = "/api/v1/certificate";
  static const String deleteCertificationsEp = "/api/v1/certificate/{certificationId}";
  static const String getCertificationByIdEp = "/api/v1/certificate/{certificationId}";




  static const String getEngineerByTokenEp = "/api/v1/engineers/user";

  //images
  static const String getImageBaseUrl = "https://dynamic-mouse-needlessly.ngrok-free.app/api/v1/file/download?fileName=";
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