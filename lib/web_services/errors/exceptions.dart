import 'package:dio/dio.dart';
import 'package:helper/web_services/errors/error_model.dart';

class ServerExceptions implements Exception {
  final ErrorModel errorModel;

  ServerExceptions({required this.errorModel});
}

void handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerExceptions(errorModel: ErrorModel.formJson(e.response!.data));
    case DioExceptionType.sendTimeout:
      throw ServerExceptions(errorModel: ErrorModel.formJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw ServerExceptions(errorModel: ErrorModel.formJson(e.response!.data));
    case DioExceptionType.badCertificate:
      throw ServerExceptions(errorModel: ErrorModel.formJson(e.response!.data));
    case DioExceptionType.cancel:
      throw ServerExceptions(errorModel: ErrorModel.formJson(e.response!.data));
    case DioExceptionType.connectionError:
      throw ServerExceptions(errorModel: ErrorModel.formJson(e.response!.data));
    case DioExceptionType.unknown:
      throw ServerExceptions(errorModel: ErrorModel.formJson(e.response!.data));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: //bad request
          throw ServerExceptions(
              errorModel: ErrorModel.formJson(e.response!.data));
        case 401: //unauthorized
          throw ServerExceptions(
              errorModel: ErrorModel.formJson(e.response!.data));
        case 403: //forbidden
          throw ServerExceptions(
              errorModel: ErrorModel.formJson(e.response!.data));
        case 404: //not found
          throw ServerExceptions(
              errorModel: ErrorModel.formJson(e.response!.data));
        case 409: //cofficient
          throw ServerExceptions(
              errorModel: ErrorModel.formJson(e.response!.data));
        case 422: //unprocessble entity
          throw ServerExceptions(
              errorModel: ErrorModel.formJson(e.response!.data));
        case 504: //server exception
      }
  }
}
