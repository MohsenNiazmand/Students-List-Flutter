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
    )
      // ..interceptors.add(  LogInterceptor(responseBody: true, request: true, requestBody: true,error: true,requestHeader: true))
    ;
    return dio;
  }

}