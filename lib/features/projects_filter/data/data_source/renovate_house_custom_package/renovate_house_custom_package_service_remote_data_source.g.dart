// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renovate_house_custom_package_service_remote_data_source.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations

class _RenovateHouseCustomPackageServiceRemoteDataSource
    implements RenovateHouseCustomPackageServiceRemoteDataSource {
  _RenovateHouseCustomPackageServiceRemoteDataSource(
    this._dio, {
    this.baseUrl,
    this.errorLogger,
  }) {
    baseUrl ??= 'https://home4u.gosoftcloud.com';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<RenovateHouseCustomPackageRequestResponseModel>
      getAskRenovateHouseCustomPackageRequests(String askId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'askId': askId};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<RenovateHouseCustomPackageRequestResponseModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/v1/request-select-custom-package/my-asks',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late RenovateHouseCustomPackageRequestResponseModel _value;
    try {
      _value = RenovateHouseCustomPackageRequestResponseModel.fromJson(
          _result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<RenovateHouseCustomPackageSingleRequestResponseModel>
      requestAskRenovateHouseCustomPackage(
          AddRenovateHouseCustomPackageRequestBody
              askRenovateHouseCustomPackageRequestBody) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(askRenovateHouseCustomPackageRequestBody.toJson());
    final _options =
        _setStreamType<RenovateHouseCustomPackageSingleRequestResponseModel>(
            Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
                .compose(
                  _dio.options,
                  '/api/v1/request-select-custom-package',
                  queryParameters: queryParameters,
                  data: _data,
                )
                .copyWith(
                    baseUrl: _combineBaseUrls(
                  _dio.options.baseUrl,
                  baseUrl,
                )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late RenovateHouseCustomPackageSingleRequestResponseModel _value;
    try {
      _value = RenovateHouseCustomPackageSingleRequestResponseModel.fromJson(
          _result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<RenovateHouseCustomPackageAsksResponseModel>
      getRenovateHouseCustomPackageAsks(String askId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'askId': askId};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<RenovateHouseCustomPackageAsksResponseModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/v1/select-custom-package/my-select-package',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late RenovateHouseCustomPackageAsksResponseModel _value;
    try {
      _value =
          RenovateHouseCustomPackageAsksResponseModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  @override
  Future<RenovateHouseFixedPackageDetailsResponseModel>
      renovateHouseFixedPackageDetails(String packageId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<RenovateHouseFixedPackageDetailsResponseModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/v1/custom-package/${packageId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            )));
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late RenovateHouseFixedPackageDetailsResponseModel _value;
    try {
      _value =
          RenovateHouseFixedPackageDetailsResponseModel.fromJson(_result.data!);
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
