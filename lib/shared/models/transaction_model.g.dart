// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionModelImpl _$$TransactionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionModelImpl(
      id: (json['id'] as num).toInt(),
      type: json['type'] as String,
      amount: (json['amount'] as num).toDouble(),
      fromAccountId: (json['fromAccountId'] as num).toInt(),
      toAccountId: (json['toAccountId'] as num?)?.toInt(),
      categoryId: (json['categoryId'] as num?)?.toInt(),
      description: json['description'] as String?,
      note: json['note'] as String?,
      date: DateTime.parse(json['date'] as String),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      isRecurring: json['isRecurring'] as bool,
      recurrenceRule: json['recurrenceRule'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$TransactionModelImplToJson(
        _$TransactionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'amount': instance.amount,
      'fromAccountId': instance.fromAccountId,
      'toAccountId': instance.toAccountId,
      'categoryId': instance.categoryId,
      'description': instance.description,
      'note': instance.note,
      'date': instance.date.toIso8601String(),
      'tags': instance.tags,
      'isRecurring': instance.isRecurring,
      'recurrenceRule': instance.recurrenceRule,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
