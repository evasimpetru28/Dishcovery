import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LogModel {
  final DeviceInfoModel info;
  final String message;
  final String error;
  final String feature;

  LogModel(
    this.info,
    this.message,
    this.error, {
    this.feature = 'ROOMIO_MOBILE',
  });

  factory LogModel.fromJson(Map<String, dynamic> json) =>
      _$LogModelFromJson(json);

  Map<String, dynamic> toJson() => _$LogModelToJson(this);
}

LogModel _$LogModelFromJson(Map<String, dynamic> json) => LogModel(
      DeviceInfoModel.fromJson(json['info'] as Map<String, dynamic>),
      json['message'] as String,
      json['error'] as String,
      feature: json['feature'] as String? ?? 'ROOMIO_MOBILE',
    );

Map<String, dynamic> _$LogModelToJson(LogModel instance) => <String, dynamic>{
      'info': instance.info,
      'message': instance.message,
      'error': instance.error,
      'feature': instance.feature,
    };

@JsonSerializable()
class DeviceInfoModel {
  final String uuid;
  final String model;
  final String os;
  final String appVersion;

  DeviceInfoModel(
    this.uuid,
    this.model,
    this.os,
    this.appVersion,
  );

  factory DeviceInfoModel.fromJson(Map<String, dynamic> json) =>
      _$DeviceInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceInfoModelToJson(this);
}

DeviceInfoModel _$DeviceInfoModelFromJson(Map<String, dynamic> json) =>
    DeviceInfoModel(
      json['uuid'] as String,
      json['model'] as String,
      json['os'] as String,
      json['appVersion'] as String,
    );

Map<String, dynamic> _$DeviceInfoModelToJson(DeviceInfoModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'model': instance.model,
      'os': instance.os,
      'appVersion': instance.appVersion,
    };
