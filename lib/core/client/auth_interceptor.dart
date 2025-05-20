import 'package:dio/dio.dart';
import 'package:movieflix/core/config/app_config.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      'Authorization': 'Bearer ${AppConfig.instance.token}',
    });
    options.queryParameters.addAll({'language': 'pt-BR'});
    super.onRequest(options, handler);
  }
}
