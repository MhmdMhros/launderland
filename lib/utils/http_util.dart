import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:launder_land/utils/constants.dart';
import 'package:launder_land/utils/nav_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpUtil {
  late Dio dio;

  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() {
    return _instance;
  }
  final navigatorKey = NavKey.navKey;

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      headers: {},
      responseType: ResponseType.json,
    );
    dio = Dio(options);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          Map<String, dynamic> authorization = await getAuthorizationHeader();
          options.headers.addAll(authorization);
          return handler.next(options);
        },
        onError: (DioException e, handler) async {
          handler.resolve(e.response ??
              Response(requestOptions: e.requestOptions, statusCode: 500, statusMessage: 'Unknown error'));
        },
      ),
    );
  }

  Future<Map<String, dynamic>> getAuthorizationHeader({bool isRefresh = false}) async {
    var headers = <String, dynamic>{};
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    if (token != null && token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }

  Future<Response<dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ??
        Options(
          headers: {'X-Localization': navigatorKey.currentContext!.locale.languageCode},
        );

    var response = await dio.get(
      path,
      queryParameters: queryParameters,
      options: requestOptions,
    );
    return response;
  }

  Future<Response<dynamic>> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();

    var response = await dio.delete(
      path,
      queryParameters: queryParameters,
      options: requestOptions,
    );
    return response;
  }

  Future<Response<dynamic>> post(
    String path, {
    Object? data,
    bool isRefresh = false,
  }) async {
    Options requestOptions = Options(contentType: 'application/json');
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = await getAuthorizationHeader(isRefresh: isRefresh);
    requestOptions.headers!.addAll(authorization);
    var response = await dio.post(
      path,
      data: data,
      options: requestOptions,
    );

    return response;
  }

  Future<Response<dynamic>> put(
    String path, {
    Object? data,
    bool isRefresh = false,
  }) async {
    Options requestOptions = Options(contentType: 'application/json');
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = await getAuthorizationHeader(isRefresh: isRefresh);
    requestOptions.headers!.addAll(authorization);
    var response = await dio.put(
      path,
      data: data,
      options: requestOptions,
    );

    return response;
  }

  Future<Response<dynamic>> patch(
    String path, {
    Object? data,
  }) async {
    Options requestOptions = Options(contentType: 'application/json');
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = await getAuthorizationHeader();
    requestOptions.headers!.addAll(authorization);
    var response = await dio.patch(
      path,
      data: data,
      options: requestOptions,
    );

    return response;
  }
}

class ErrorEntity implements Exception {
  int code = -1;
  String message = "";

  ErrorEntity({required this.code, required this.message});

  @override
  String toString() {
    if (message == "") return "Exception";

    return "Exception code $code, $message";
  }
}

ErrorEntity createErrorEntity(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return ErrorEntity(code: -1, message: "Connection timed out");

    case DioExceptionType.sendTimeout:
      return ErrorEntity(code: -1, message: "Send timed out");

    case DioExceptionType.receiveTimeout:
      return ErrorEntity(code: -1, message: "Receive timed out");

    case DioExceptionType.badCertificate:
      return ErrorEntity(code: -1, message: "Bad SSL certificates");

    case DioExceptionType.badResponse:
      switch (error.response!.statusCode) {
        case 400:
          return ErrorEntity(code: 400, message: "Bad request");
        case 402:
          return ErrorEntity(code: 402, message: "Payment required");
        case 422:
          return ErrorEntity(code: 422, message: "Validation error");
        case 401:
          return ErrorEntity(code: 401, message: "Permission denied");
        case 500:
          return ErrorEntity(code: 500, message: "Server internal error");
      }
      return ErrorEntity(code: error.response!.statusCode!, message: "Server bad response");

    case DioExceptionType.cancel:
      return ErrorEntity(code: -1, message: "Server canceled it");

    case DioExceptionType.connectionError:
      return ErrorEntity(code: -1, message: "Connection error");

    case DioExceptionType.unknown:
      return ErrorEntity(code: -1, message: "Unknown error");
  }
}

void onError(ErrorEntity eInfo) {
  if (kDebugMode) {
    print('error.code -> ${eInfo.code}, error.message -> ${eInfo.message}');
  }
}
