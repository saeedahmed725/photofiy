import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:photofiy/core/constants/app_apis.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio({String? baseUrl}) {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioHeaders(baseUrl);
      addDioInterceptor();
      return dio!;
    } else {
      if (baseUrl != null) addDioHeaders(baseUrl);
      return dio!;
    }
  }

  static void addDioHeaders(String? baseUrl) async {
    dio?.options.baseUrl = baseUrl ?? AppApis.baseUrl;
    dio?.options.headers = {'Accept': 'application/json'};
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
