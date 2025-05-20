import 'package:movieflix/core/errors/app_error.dart';

class Response<T> {
  final T? success;
  final AppError? error;

  Response({this.success, this.error});

  bool get hasError => error != null;
}
