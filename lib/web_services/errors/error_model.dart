import 'package:helper/web_services/api/end_points.dart';

class ErrorModel {
  final int status;
  final String errorMessege;
  ErrorModel({required this.errorMessege, required this.status});
  factory ErrorModel.formJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
        status: jsonData[ApiKeys.status],
        errorMessege: jsonData[ApiKeys.errorMessage]);
  }
}
