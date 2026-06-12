import 'package:freezed_annotation/freezed_annotation.dart';

part 'attachment_model.freezed.dart';
part 'attachment_model.g.dart';

@freezed
class AttachmentModel with _$AttachmentModel {
  const factory AttachmentModel({
    required int id,
    required int transactionId,
    required String filePath,
    required String fileName,
    required String mimeType,
    required int fileSize,
    required String type, // image, document
    required DateTime createdAt,
  }) = _AttachmentModel;

  factory AttachmentModel.fromJson(Map<String, dynamic> json) =>
      _$AttachmentModelFromJson(json);
}

enum AttachmentType {
  image('image'),
  document('document');

  final String value;

  const AttachmentType(this.value);

  static AttachmentType fromString(String value) {
    return AttachmentType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => AttachmentType.image,
    );
  }
}
