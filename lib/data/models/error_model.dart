import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ErrorModel {
  final String? errorField;
  final String? errorMessage;
  final String errorCode;

  ErrorModel({this.errorField, this.errorMessage, this.errorCode = ''});

  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);
}

ErrorModel _$ErrorModelFromJson(Map<String, dynamic> json) => ErrorModel(
      errorField: json['errorField'] as String?,
      errorMessage: json['errorMessage'] as String?,
      errorCode: json['errorCode'] as String? ?? '',
    );

Map<String, dynamic> _$ErrorModelToJson(ErrorModel instance) =>
    <String, dynamic>{
      'errorField': instance.errorField,
      'errorMessage': instance.errorMessage,
      'errorCode': instance.errorCode,
    };
