// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttachmentModelImpl _$$AttachmentModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AttachmentModelImpl(
      id: (json['id'] as num).toInt(),
      transactionId: (json['transactionId'] as num).toInt(),
      filePath: json['filePath'] as String,
      fileName: json['fileName'] as String,
      mimeType: json['mimeType'] as String,
      fileSize: (json['fileSize'] as num).toInt(),
      type: json['type'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$AttachmentModelImplToJson(
        _$AttachmentModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'transactionId': instance.transactionId,
      'filePath': instance.filePath,
      'fileName': instance.fileName,
      'mimeType': instance.mimeType,
      'fileSize': instance.fileSize,
      'type': instance.type,
      'createdAt': instance.createdAt.toIso8601String(),
    };
