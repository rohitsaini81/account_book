import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_model.freezed.dart';
part 'account_model.g.dart';

@freezed
class AccountModel with _$AccountModel {
  const factory AccountModel({
    required int id,
    required String name,
    required String type, // cash, bank, wallet, credit_card, savings, custom
    required double balance,
    required double openingBalance,
    required String color,
    required String icon,
    required String currency,
    String? note,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _AccountModel;

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);
}

enum AccountType {
  cash('cash'),
  bank('bank'),
  wallet('wallet'),
  creditCard('credit_card'),
  savings('savings'),
  custom('custom');

  final String value;

  const AccountType(this.value);

  static AccountType fromString(String value) {
    return AccountType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => AccountType.custom,
    );
  }
}
