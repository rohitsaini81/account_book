import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings_model.freezed.dart';
part 'app_settings_model.g.dart';

@freezed
class AppSettingsModel with _$AppSettingsModel {
  const factory AppSettingsModel({
    required String key,
    required String value,
    required DateTime updatedAt,
  }) = _AppSettingsModel;

  factory AppSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsModelFromJson(json);
}

class AppSettingKeys {
  static const String currencyCode = 'currencyCode';
  static const String themeMode = 'themeMode'; // light, dark, system
  static const String language = 'language';
  static const String dateFormat = 'dateFormat';
  static const String numberFormat = 'numberFormat';
  static const String biometricEnabled = 'biometricEnabled';
  static const String pinEnabled = 'pinEnabled';
  static const String autoLockDuration = 'autoLockDuration'; // seconds
  static const String lastBackupDate = 'lastBackupDate';
  static const String appLockedUntil = 'appLockedUntil';
}
