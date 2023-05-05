import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AppNetworkClient {
  static final _logNetworking = PrettyDioLogger();

  // Global options
  static final _cacheOption = CacheOptions(
    store: MemCacheStore(),
    policy: CachePolicy.refreshForceCache,
    maxStale: const Duration(days: 1),
    priority: CachePriority.normal,
    cipher: null,
    keyBuilder: CacheOptions.defaultCacheKeyBuilder,
    allowPostMethod: false,
  );

  // Add cache interceptor with global/default options
  // final cookieJar = CookieJar();
  static Dio _dio = Dio()
    // ..options.connectTimeout = 1000
    ..interceptors.add(DioCacheInterceptor(options: _cacheOption))
    ..interceptors.add(_logNetworking);

  AppNetworkClient._();

  static final AppNetworkClient _instance = AppNetworkClient._();

  factory AppNetworkClient() {
    return _instance;
  }

  static Future<Response> get(
      {Map<String, dynamic>? data,
      String? url,
      Map<String, dynamic>? customHeader,
      required String path,
      String? version}) async {
    try {
      final res = await _dio.get(path,
          queryParameters: data,
          options: Options(
              headers: customHeader != null
                  ? {
                      "X-API-Key":
                          "QEslZDYi4HfW9rTMyW1ULXZELJcxtTntPqk7FbHVkEQKLf9Pqs7kUjKDCKlC9zsNTsNeN8SGQOnbPKFLRF8LTN53zX04qdBIjQCCceE2gYfReFfdG5ZwMKNsrs02daII",
                      ...customHeader
                    }
                  : {
                      "X-API-Key":
                          "QEslZDYi4HfW9rTMyW1ULXZELJcxtTntPqk7FbHVkEQKLf9Pqs7kUjKDCKlC9zsNTsNeN8SGQOnbPKFLRF8LTN53zX04qdBIjQCCceE2gYfReFfdG5ZwMKNsrs02daII"
                    }));
      debugPrint("CALLING GET " + res.requestOptions.path);
      debugPrint("Query GET " + res.requestOptions.queryParameters.toString());
      debugPrint("Response HEADERS " + res.headers.toString());
      debugPrint(
          "Error Request HEADERS" + res.requestOptions.headers.toString());

      // debugPrint("Data Response " + res.data.toString());

      return res;
    } on DioError catch (e) {
      _errorCatch(e);
      rethrow;
    } catch (e) {
      throw "Something Went Wrong";
    }
  }

  static Future<Response> post({
    Map<String, dynamic>? data,
    String? url,
    Map<String, dynamic>? customHeader,
    required String path,
    FormData? form,
    String? version,
    // jsonMap for sending raw json to server
    Map<String, dynamic>? jsonMap,
    //void showUploadProgress(int send, int total)?,
  }) async {
    try {
      final res = await _dio.post(path,
          data: form ?? jsonMap ?? FormData.fromMap(data!),
          options: Options(headers: customHeader));

      debugPrint("CALLING POST " + res.requestOptions.path);
      debugPrint("Query POST " + res.requestOptions.queryParameters.toString());
      debugPrint("Response HEADERS " + res.headers.toString());
      debugPrint(
          "Error Request HEADERS" + res.requestOptions.headers.toString());
      return res;

      //onSendProgress: showUploadProgress);`

    } on DioError catch (e) {
      // WARNING!!!
      // Dont handle error here ,
      // Handle in repo/controller
      // It  will impact everyone else
      _errorCatch(e);
      rethrow;
    } catch (e) {
      print("ini error $e");
      throw "Something Went Wrong";
    }
  }

  static _errorCatch(DioError e) {
    if (e.response != null) {
      debugPrint("Error CALLING " + e.requestOptions.path);
      debugPrint(
          "Error Query POST " + e.requestOptions.queryParameters.toString());
      debugPrint("Error Status Code " + e.response!.statusCode.toString());
      debugPrint("Error Response " + e.response!.data.toString());
      debugPrint("Error Response HEADERS" + e.response!.headers.toString());
      debugPrint("Error Request HEADERS" + e.requestOptions.headers.toString());
    } else {
      // Something happened in setting up or sending the requestOptions that triggered an Error
      debugPrint("CALLING " + e.requestOptions.toString());
    }
  }
}
