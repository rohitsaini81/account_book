import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required int id,
    required String name,
    required String type, // income, expense
    required String icon,
    required String color,
    int? parentId,
    String? note,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

enum CategoryType {
  income('income'),
  expense('expense');

  final String value;

  const CategoryType(this.value);

  static CategoryType fromString(String value) {
    return CategoryType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => CategoryType.expense,
    );
  }
}
