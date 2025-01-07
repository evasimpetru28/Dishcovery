import 'package:dio/dio.dart';

import '../data/models/error_model.dart';
import '../data/response_status.dart';

class ErrorUtils {
  ErrorUtils._internal();

  static final _instance = ErrorUtils._internal();

  factory ErrorUtils() => _instance;

  //todo test error
  ResponseError<T> wrapDioErrorIntoResponse<T>(DioException error) {
    if (error.type == DioExceptionType.badResponse) {
      final errorResponse = error.response;

      if (errorResponse == null ||
          errorResponse.statusCode == 500 ||
          errorResponse.statusCode == 503) {
        return ResponseError(type: ErrorType.serverError);
      }

      if (errorResponse.data.toString().isEmpty) {
        return ResponseError(code: errorResponse.statusCode, message: '');
      }

      List<ErrorModel> errorModelList = [];

      if (errorResponse.data is List<dynamic>) {
        final data = (errorResponse.data as List<dynamic>);
        errorModelList = data.map((e) => ErrorModel.fromJson(e)).toList();
      }
      if (errorResponse.data is Map<String, dynamic>) {
        errorModelList = [ErrorModel.fromJson(errorResponse.data)];
      }

      String errorMessage = 'An error has occurred';
      if (errorModelList.isNotEmpty && errorModelList[0].errorMessage != null) {
        errorMessage = errorModelList[0].errorMessage!;
      }

      return ResponseError(
          code: errorResponse.statusCode,
          message: errorMessage,
          errorObject: errorModelList);
    }
    return ResponseError(type: ErrorType.unknownError);
  }

}
