import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../routing/router_observer.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeout = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeout
        ..options.receiveTimeout = timeout;
      addDioHeaders();
      addDioInterceptors();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHeaders() async {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJIb21lNFUiLCJzdWIiOiI2MCIsImlhdCI6MTczNDIxMTQ2MCwiZXhwIjoxNzM0ODE2MjYwfQ.qGw8SxFgjV5dCLan79QwLkLm7APK1nu7N12VsMCqYwk',
      'Accept-Language': 'en',
      'Content-Type': 'multipart/form-data',
    };
  }

  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers = {
      'Authorization': 'Bearer $token',
    };
  }

  static void updateLanguageHeader(String languageCode) {
    dio?.options.headers['Accept-Language'] = languageCode;
  }

  static void addDioInterceptors() {
    dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          logger.d('Token: ${options.headers['Authorization']}');
          return handler.next(options);
        },
      ),
    );
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
