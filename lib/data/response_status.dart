
import 'models/error_model.dart';

abstract class ResponseStatus<T>{}

class ResponseSuccess<T> extends ResponseStatus<T>{

  final T data;

  ResponseSuccess(this.data);
}

class ResponseError<T> extends ResponseStatus<T>{

  final String message;
  final ErrorType type;
  final int? code;
  List<ErrorModel>? errorObject = [];

  ResponseError({this.errorObject, this.message = '', this.type = ErrorType.unknownError, this.code});
}

enum ErrorType {
  unknownError, serverError, internetError, domainError
}

class ResponseLoading<T> extends ResponseStatus<T>{}

class ResponseNone<T> extends ResponseStatus<T>{}