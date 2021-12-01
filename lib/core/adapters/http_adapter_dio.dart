import 'package:custom_architecture/core/controllers/app_controller.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:get/get.dart';

import 'http_adapter.dart';

class HttpAdapterDio implements HttpAdapter {
  late final Dio _dio;
  AppController app = Get.find();

  InterceptorsWrapper authInterceptor(String accessToken) {
    return InterceptorsWrapper(
      onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) async {
        options.headers['Authorization'] = 'Bearer $accessToken';
        handler.next(options);
      },
    );
  }

  @override
  setAccessToken(String accessToken) {
    _dio.interceptors.add(
      authInterceptor(accessToken),
    );
  }

  HttpAdapterDio() {
    _dio = Dio();
    String baseUrl = 'http://18.190.91.110:5000/';

    if (app.token.isNotEmpty) {
      _dio.options.headers['Authorization'] = 'Bearer ${app.token}';
    }
    _dio.interceptors.add(
      DioCacheManager(
        CacheConfig(
          baseUrl: baseUrl,
        ),
      ).interceptor,
    );

    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = 40000;
    _dio.options.receiveTimeout = 40000;
  }

  @override
  Future<T?> get<T>(
    String path, {
    Map<String, dynamic>? params,
    bool hasCache = false,
  }) async {
    try {
      final response = await _dio.get<T>(
        path,
        queryParameters: params,
        options: hasCache ? buildCacheOptions(Duration(days: 7)) : null,
      );

      return response.data;
    } on DioError catch (e) {
      print(e);
      app.setError(e.response?.data['message'] ?? e.message);
    } catch (e) {
      rethrow;
    }
    return null;
  }

  @override
  Future<T?> post<T>(
    String path, {
    dynamic data,
    bool hasCache = false,
  }) async {
    try {
      final response = await _dio.post<T>(
        path,
        data: data,
        options: hasCache ? buildCacheOptions(Duration(days: 7)) : null,
      );

      return response.data;
    } on DioError catch (e) {
      print(e);
      app.setError(e.response?.data['message'] ?? e.message);
    } catch (e) {
      rethrow;
    }
    return null;
  }

  @override
  Future<T?> put<T>(
    String path, {
    dynamic data,
    bool hasCache = false,
  }) async {
    try {
      final response = await _dio.put<T>(
        path,
        data: data,
        options: hasCache ? buildCacheOptions(const Duration(days: 7)) : null,
      );

      return response.data;
    } on DioError catch (e) {
      app.setError(e.response?.data['message'] ?? e.message);
    } catch (e) {
      rethrow;
    }

    return null;
  }

  @override
  Future<T?> patch<T>(
    String path, {
    dynamic data,
    bool hasCache = false,
  }) async {
    try {
      final response = await _dio.patch<T>(
        path,
        data: data,
        options: hasCache ? buildCacheOptions(Duration(days: 7)) : null,
      );

      return response.data;
    } on DioError catch (e) {
      app.setIsLoading(false);
      app.setError(e.response?.data['message'] ?? e.message);
    } catch (e) {
      rethrow;
    }

    return null;
  }

  @override
  Future<T?> formData<T>(String path, {data, bool hasCache = false}) async {
    try {
      final response = await _dio.post<T>(
        path,
        data: data,
        options: Options(
          contentType: 'multipart/form-data;',
          headers: {
            'Authorization': 'Bearer ${app.token}',
            'Content-Type': 'multipart/form-data;',
          },
        ),
      );

      return response.data;
    } on DioError catch (e) {
      print(e);
      app.setError(e.response?.data['message'] ?? e.message);
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
