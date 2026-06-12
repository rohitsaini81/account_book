import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    required int id,
    required String type, // income, expense, transfer
    required double amount,
    required int fromAccountId,
    int? toAccountId,
    int? categoryId,
    String? description,
    String? note,
    required DateTime date,
    List<String>? tags,
    required bool isRecurring,
    String? recurrenceRule,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
}

enum TransactionType {
  income('income'),
  expense('expense'),
  transfer('transfer');

  final String value;

  const TransactionType(this.value);

  static TransactionType fromString(String value) {
    return TransactionType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => TransactionType.expense,
    );
  }
}
