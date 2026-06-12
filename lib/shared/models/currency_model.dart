import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_model.freezed.dart';
part 'currency_model.g.dart';

@freezed
class CurrencyModel with _$CurrencyModel {
  const factory CurrencyModel({
    required int id,
    required String code,
    required String name,
    required String symbol,
    required double exchangeRate,
    DateTime? lastUpdated,
  }) = _CurrencyModel;

  factory CurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyModelFromJson(json);
}
