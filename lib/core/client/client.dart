import 'package:dio/io.dart';
import 'package:movieflix/core/client/auth_interceptor.dart';
import 'package:movieflix/core/config/app_config.dart';

class Client extends DioForNative {
  Client() {
    options.baseUrl = AppConfig.instance.baseUrl;
    interceptors.add(AuthInterceptor());
  }
}
