

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

import '../../utils/error_utils.dart';
import '../../utils/log_utils.dart';
import '../../utils/service_locator.dart';
import '../models/log_models.dart';
import '../network/api_service.dart';
import '../response_status.dart';

class BaseRepository {
  final apiService = serviceLocator<ApiService>();

  final internetError = PublishSubject<ResponseError>();
  Stream<ResponseError> get internetErrorStream => internetError.stream;

  final authorisationError = PublishSubject<dynamic>();
  Stream<dynamic> get authorisationErrorStream => authorisationError.stream;

  ResponseStatus<T> getResponseError<T>(DioException error, { bool shouldSendLog = true}) {
    if(error.response?.statusCode == 401){
      authorisationError.sink.add(null);
      return ResponseLoading();
    }

    if(error.response?.statusCode == 500 || error.response?.statusCode == 503){
      internetError.sink.add(ResponseError(type: ErrorType.serverError));
      return ResponseLoading();
    }

    if(error.type == DioExceptionType.connectionTimeout
        || error.error is SocketException){
      internetError.sink.add(ResponseError(type: ErrorType.internetError));
      return ResponseLoading();
    }

    ResponseError<T> responseError = ErrorUtils().wrapDioErrorIntoResponse(error);
    if(shouldSendLog){
      sendLog(LogUtils().convertDioExceptionToLog(error, responseError));
    }

    return responseError;
  }

  void sendLog(LogModel log) {

    try{
      if(log.message.isNotEmpty){
        // apiService.sendLog(log);
      }
    } on DioException catch (error) {
      Logger().e(error);
    } on Error catch (error) {
      Logger().e(error);
    }
  }
}