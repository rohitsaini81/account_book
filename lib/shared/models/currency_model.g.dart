// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrencyModelImpl _$$CurrencyModelImplFromJson(Map<String, dynamic> json) =>
    _$CurrencyModelImpl(
      id: (json['id'] as num).toInt(),
      code: json['code'] as String,
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      exchangeRate: (json['exchangeRate'] as num).toDouble(),
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$$CurrencyModelImplToJson(_$CurrencyModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'symbol': instance.symbol,
      'exchangeRate': instance.exchangeRate,
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
    };
