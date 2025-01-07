import 'package:dio/dio.dart';

import '../data/models/log_models.dart';
import '../data/response_status.dart';
import 'constants.dart';
import 'device_utils.dart';

class LogUtils {
  LogUtils._internal();

  static final _instance = LogUtils._internal();

  factory LogUtils() => _instance;

  LogModel convertDioExceptionToLog(
      DioException error, ResponseError responseError) {
    return LogModel(DeviceUtils.deviceInfoModel, error.response.toString(),
        _convertDioExceptionToString(error));
  }

  LogModel convertErrorToLog(Error error) {
    return LogModel(DeviceUtils.deviceInfoModel, Constants.errorOccurred,
        _convertErrorToString(error));
  }

  LogModel convertErrorMessageToLog(String error, String message) {
    return LogModel(DeviceUtils.deviceInfoModel, message, error);
  }

  String _convertDioExceptionToString(DioException error) {
    return 'Message: ${error.message}, '
        '\n Stacktrace: ${error.stackTrace.toString()}';
  }

  String _convertErrorToString(Error error) {
    return 'An error has occurred. '
        '\n Stacktrace: ${error.stackTrace.toString()}';
  }
}
