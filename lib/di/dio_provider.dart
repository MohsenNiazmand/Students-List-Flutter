import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class DioProvider {
  @singleton
  Dio dio() {
    Dio dio = Dio(
      BaseOptions(
          baseUrl: 'http://expertdevelopers.ir/api/v1/',
          connectTimeout: 25000,
          receiveTimeout: 25000,
          sendTimeout: 25000
      ),
    );
    return dio;
  }

}