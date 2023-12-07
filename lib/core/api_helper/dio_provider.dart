import 'dart:io';
import 'dart:convert' as convert;

import 'package:base_app/core/api_helper/api_consumer.dart';
import 'package:base_app/core/cache_helper/cache_helper.dart';
import 'package:base_app/core/extensions/get_sensitive_data_extension.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'exceptions/server_exceptions.dart';
import 'status_codes.dart';

class DioProvider extends ApiConsumer {
  final Dio client;
  final CacheHelper cacheHelper;

  DioProvider({required this.client, required this.cacheHelper}) {
    (client.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
        HttpClient()
          ..badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;

    client.options
      ..baseUrl = ''.getBaseUrl()
      ..responseType = ResponseType.json
      ..headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }
      ..validateStatus(200)
      ..connectTimeout = const Duration(milliseconds: 15000)
      ..receiveTimeout = const Duration(milliseconds: 30000)
      ..followRedirects = false;

    if (!kReleaseMode) {
      client.interceptors.add(PrettyDioLogger(
          responseBody: true, requestHeader: true, requestBody: true));
    }
  }
  @override
  Future get(String path,
      {Map<String, dynamic>? queryParameters, required bool sendToken}) async {
    await handleSendToken(sendToken);
    try {
      final response = await client.get(path, queryParameters: queryParameters);
      return _handleResposneAsJson(response);
    } on DioException catch (error) {
      return _handleDioError(error);
    }
  }

  @override
  Future post(String path, {required body, required bool sendToken}) async {
    await handleSendToken(
      sendToken,
    );

    try {
      final response = await client.post(path, data: convert.json.encode(body));

      return _handleResposneAsJson(response, retiveToken: !sendToken);
    } on DioException catch (error) {
      return _handleDioError(error);
    }
  }

  handleSendToken(bool sendToken) async {
    String token = '';

    if (sendToken) {
      if (token.length > 1) {
        if (client.options.headers.keys.contains("Auth")) {
          client.options.headers.update("Auth", (value) => token);
        } else {
          client.options.headers.addEntries({"Auth": token}.entries);
        }
      } else if (client.options.headers.keys.contains("Auth")) {
        client.options.headers.remove(
          "Auth",
        );
      }
    }
  }

  dynamic _handleDioError(DioException error) async {
    var log = {
      "status_code": error.response?.statusCode,
      "request_url": error.response?.realUri.toString(),
      "request_body": error.requestOptions.data,
      "request_response": error.response?.data,
    };
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw const FetchDataException('');
      case DioExceptionType.badCertificate:
        throw const UnauthorizedException('');
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case StatusCode.internalServerError:
            throw const InternalServerErrorException();

          case StatusCode.unauthorized:
            // TODO: implement logout
            // AppConstants.appNavigatorKey.currentContext
            //     ?.unAuthorizedAlerDialog();
            throw UnauthorizedException(
                error.response?.data?['Message'] ?? 'Unauthorized');
          case StatusCode.forbidden:
            throw UnauthorizedException(
                error.response?.data?['Message'] ?? 'Unauthorized');

          case StatusCode.notFound:
            throw const NotFoundException();
          default:
            throw const FormatDataException();
        }

      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        throw const NoInternetConnectionException();
      case DioExceptionType.cancel:
        throw const InternalServerErrorException();

      default:
        throw const FormatDataException();
    }
  }

  dynamic _handleResposneAsJson(Response<dynamic> response,
      {bool retiveToken = false}) {
    try {
      if (response.data.runtimeType != String) {
        return response.data;
      }
      return convert.json.decode(response.data);
    } on FormatException catch (_) {
      if (retiveToken) {
        return response.data.toString();
      } else {
        throw const FormatDataException();
      }
    }
  }
}
