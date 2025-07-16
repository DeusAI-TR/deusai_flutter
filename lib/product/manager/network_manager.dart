import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import '../../core/models/simple_result.dart';
import '../constants/product_constants.dart';
import '../models/network/converter.dart';

enum RequestType { get, post, put, delete, patch }

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance!;
  }

  NetworkManager._init();

  final Dio _dio = Dio(BaseOptions(baseUrl: ProductConstants.instance.apiUrl, contentType: 'application/json'));

  Future<SimpleResult> request<T>(
    RequestType requestType,
    String path, {
    dynamic data,
    dynamic model,
    Map<String, dynamic>? queryParameters,
    bool isBaseResponse = true,
    isFile = false,
  }) async {
    var time = DateTime.now();
    data ??= {};
    try {
      Object? body = data is Map || data is FormData ? data : data.toJson();

      var response = await _dio.request(
        path,
        data: requestType == RequestType.get ? null : body,
        queryParameters: queryParameters,
        options: Options(contentType: isFile ? 'multipart/form-data' : 'application/json', method: requestType.name),
      );

      if (kDebugMode) {
        print('$path -> ${(DateTime.now().difference(time)).inMilliseconds} ms');
      }
      if (response.statusCode == 200) {
        if (isBaseResponse) {
          return _simpleResultConverter<T>(response.data);
        } else {
          return SimpleResult.fromJson(response.data);
        }
      } else {
        return _showError<T>(
          '$path ${requestType.name}',
          'Status Code: ${response.statusCode} | Status Message: ${response.statusMessage}',
          response.data,
          time,
        );
      }
    } on DioException catch (dioError) {
      return _showError<T>(
        '$path ${requestType.name}',
        'Error: ${dioError.error} | Status Message: ${dioError.message}',
        dioError.response!.data,
        time,
      );
    } catch (error) {
      return _showError(
        '$path ${requestType.name}',
        error,
        null,
        time,
      );
    }
  }

  SimpleResult<T> _showError<T>(String errorPoint, dynamic error, dynamic responseData, DateTime time) {
    String? message = 'Sunucu ile ilgili bir hata oluştu. Lütfen daha sonra tekrar deneyiniz';
    if (responseData != null && responseData is Map && responseData.containsKey('errorMessage')) {
      message = responseData['errorMessage'];
    }
    log('$errorPoint FAILED | Status Code: $error');
    print('$errorPoint -> ${(DateTime.now().difference(time)).inMilliseconds} ms');
    return SimpleResult(isSuccess: false, errorMessage: message);
  }

  SimpleResult _simpleResultConverter<T>(dynamic data) {
    final baseResponse = SimpleResult.fromJson(data);
    if (baseResponse.isSuccess) {
      if (baseResponse.data != null) {
        if (baseResponse.data is List) {
          var list = <T>[];
          for (var element in (baseResponse.data as List)) {
            list.add((T as Converter).fromJson(element));
          }
          return SimpleResult<List<T>>(isSuccess: true, data: list);
        } else {
          return SimpleResult<T>(isSuccess: true, data: (T as Converter).fromJson(baseResponse.data));
        }
      } else {
        return SimpleResult(isSuccess: false);
      }
    } else {
      return SimpleResult(isSuccess: false);
    }
  }
}
