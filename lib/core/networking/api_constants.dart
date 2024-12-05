
class ApiConstants {
  static const String apiBaseUrl = "https://dynamic-mouse-needlessly.ngrok-free.app";
  static const String loginEndPoint = "/api/v1/auth/login";
  static const String userTypesEp = "/api/v1/user-types";
  static const String signUpEp = "/api/v1/auth/register";
  static const String forgetPasswordEp = "/api/v1/auth/send-otp";
  static const String verificationEP = "/api/v1/auth/activate-the-account";
  static const String newPasswordEP = "/api/v1/auth/reset-password";
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