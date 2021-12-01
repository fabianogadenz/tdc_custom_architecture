abstract class HttpAdapter {
  Future<T?> get<T>(
    String path, {
    Map<String, dynamic>? params,
    bool hasCache = false,
  });
  Future<T?> post<T>(
    String path, {
    dynamic data,
    bool hasCache = false,
  });
  Future<T?> put<T>(
    String path, {
    dynamic data,
    bool hasCache = false,
  });
  Future<T?> patch<T>(
    String path, {
    dynamic data,
    bool hasCache = false,
  });
  Future<T?> formData<T>(
    String path, {
    dynamic data,
    bool hasCache = false,
  });
  setAccessToken(String accessToken);
}
