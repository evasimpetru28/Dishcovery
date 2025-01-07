import 'package:dishcovery/data/response_status.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseBloc {
  late PublishSubject<ResponseError> errorModel = PublishSubject<ResponseError>();

  Stream<ResponseError> get error => errorModel.stream;

  @protected
  @required
  @mustCallSuper
  initSubjects() {
    errorModel = PublishSubject<ResponseError>();
  }

  @required
  @mustCallSuper
  dispose() {
    errorModel.close();
  }
}
