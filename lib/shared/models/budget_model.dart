import 'package:freezed_annotation/freezed_annotation.dart';

part 'budget_model.freezed.dart';
part 'budget_model.g.dart';

@freezed
class BudgetModel with _$BudgetModel {
  const factory BudgetModel({
    required int id,
    int? categoryId,
    int? accountId,
    required double amount,
    required String period, // monthly, yearly
    required DateTime startDate,
    DateTime? endDate,
    required bool isActive,
    String? alert,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _BudgetModel;

  factory BudgetModel.fromJson(Map<String, dynamic> json) =>
      _$BudgetModelFromJson(json);
}

enum BudgetPeriod {
  monthly('monthly'),
  yearly('yearly');

  final String value;

  const BudgetPeriod(this.value);

  static BudgetPeriod fromString(String value) {
    return BudgetPeriod.values.firstWhere(
      (period) => period.value == value,
      orElse: () => BudgetPeriod.monthly,
    );
  }
}
