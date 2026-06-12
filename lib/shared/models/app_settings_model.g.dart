// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppSettingsModelImpl _$$AppSettingsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AppSettingsModelImpl(
      key: json['key'] as String,
      value: json['value'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$AppSettingsModelImplToJson(
        _$AppSettingsModelImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
