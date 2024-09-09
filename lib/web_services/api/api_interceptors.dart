import 'package:helper/cache/cache_helper.dart';
import 'package:dio/dio.dart';
import 'package:helper/web_services/api/end_points.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKeys.token] =
        CacheHelper().getData(key: ApiKeys.token) != null
            ? 'FOODAPI ${CacheHelper().getData(key: ApiKeys.token)}'
            : null;
    super.onRequest(options, handler);
  }
}
