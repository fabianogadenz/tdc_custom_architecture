import 'package:custom_architecture/core/models/error_message_model.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

import 'http_adapter.dart';

class HttpAdapterDio implements HttpAdapter {
  final Dio dio;

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
    dio.interceptors.add(
      authInterceptor(accessToken),
    );
  }

  HttpAdapterDio(this.dio) {
    String baseUrl = '';

    dio.interceptors.addAll([
      DioCacheManager(
        CacheConfig(
          baseUrl: baseUrl,
        ),
      ).interceptor,
    ]);

    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = 40000;
    dio.options.receiveTimeout = 40000;
  }

  @override
  Future<T?> get<T>(
    String path, {
    Map<String, dynamic>? params,
    bool hasCache = false,
  }) async {
    try {
      final response = await dio.get<T>(
        path,
        queryParameters: params,
        options: hasCache ? buildCacheOptions(const Duration(days: 7)) : null,
      );

      return response.data;
    } on DioError catch (e) {
      throw ErrorMessageModel(e.message);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<T?> post<T>(
    String path, {
    dynamic data,
    bool hasCache = false,
  }) async {
    try {
      final response = await dio.post<T>(
        path,
        data: data,
        options: hasCache ? buildCacheOptions(const Duration(days: 7)) : null,
      );

      return response.data;
    } on DioError catch (e) {
      throw ErrorMessageModel(e.message);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<T?> put<T>(
    String path, {
    dynamic data,
    bool hasCache = false,
  }) async {
    try {
      final response = await dio.put<T>(
        path,
        data: data,
        options: hasCache ? buildCacheOptions(const Duration(days: 7)) : null,
      );

      return response.data;
    } on DioError catch (e) {
      throw ErrorMessageModel(e.message);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<T?> patch<T>(
    String path, {
    dynamic data,
    bool hasCache = false,
  }) async {
    try {
      final response = await dio.patch<T>(
        path,
        data: data,
        options: hasCache ? buildCacheOptions(const Duration(days: 7)) : null,
      );

      return response.data;
    } on DioError catch (e) {
      throw ErrorMessageModel(e.message);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<T?> formData<T>(String path, {data, bool hasCache = false}) async {
    try {
      final response = await dio.post<T>(
        path,
        data: data,
        options: Options(
          contentType: 'multipart/form-data;',
          headers: {
            'Content-Type': 'multipart/form-data;',
          },
        ),
      );

      return response.data;
    } on DioError catch (e) {
      throw ErrorMessageModel(e.message);
    } catch (e) {
      rethrow;
    }
  }
}
