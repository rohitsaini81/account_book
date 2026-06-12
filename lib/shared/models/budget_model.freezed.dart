// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BudgetModel _$BudgetModelFromJson(Map<String, dynamic> json) {
  return _BudgetModel.fromJson(json);
}

/// @nodoc
mixin _$BudgetModel {
  int get id => throw _privateConstructorUsedError;
  int? get categoryId => throw _privateConstructorUsedError;
  int? get accountId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get period => throw _privateConstructorUsedError; // monthly, yearly
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  String? get alert => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BudgetModelCopyWith<BudgetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetModelCopyWith<$Res> {
  factory $BudgetModelCopyWith(
          BudgetModel value, $Res Function(BudgetModel) then) =
      _$BudgetModelCopyWithImpl<$Res, BudgetModel>;
  @useResult
  $Res call(
      {int id,
      int? categoryId,
      int? accountId,
      double amount,
      String period,
      DateTime startDate,
      DateTime? endDate,
      bool isActive,
      String? alert,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$BudgetModelCopyWithImpl<$Res, $Val extends BudgetModel>
    implements $BudgetModelCopyWith<$Res> {
  _$BudgetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryId = freezed,
    Object? accountId = freezed,
    Object? amount = null,
    Object? period = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? isActive = null,
    Object? alert = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      alert: freezed == alert
          ? _value.alert
          : alert // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BudgetModelImplCopyWith<$Res>
    implements $BudgetModelCopyWith<$Res> {
  factory _$$BudgetModelImplCopyWith(
          _$BudgetModelImpl value, $Res Function(_$BudgetModelImpl) then) =
      __$$BudgetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int? categoryId,
      int? accountId,
      double amount,
      String period,
      DateTime startDate,
      DateTime? endDate,
      bool isActive,
      String? alert,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$BudgetModelImplCopyWithImpl<$Res>
    extends _$BudgetModelCopyWithImpl<$Res, _$BudgetModelImpl>
    implements _$$BudgetModelImplCopyWith<$Res> {
  __$$BudgetModelImplCopyWithImpl(
      _$BudgetModelImpl _value, $Res Function(_$BudgetModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryId = freezed,
    Object? accountId = freezed,
    Object? amount = null,
    Object? period = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? isActive = null,
    Object? alert = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$BudgetModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      alert: freezed == alert
          ? _value.alert
          : alert // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BudgetModelImpl implements _BudgetModel {
  const _$BudgetModelImpl(
      {required this.id,
      this.categoryId,
      this.accountId,
      required this.amount,
      required this.period,
      required this.startDate,
      this.endDate,
      required this.isActive,
      this.alert,
      required this.createdAt,
      required this.updatedAt});

  factory _$BudgetModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BudgetModelImplFromJson(json);

  @override
  final int id;
  @override
  final int? categoryId;
  @override
  final int? accountId;
  @override
  final double amount;
  @override
  final String period;
// monthly, yearly
  @override
  final DateTime startDate;
  @override
  final DateTime? endDate;
  @override
  final bool isActive;
  @override
  final String? alert;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'BudgetModel(id: $id, categoryId: $categoryId, accountId: $accountId, amount: $amount, period: $period, startDate: $startDate, endDate: $endDate, isActive: $isActive, alert: $alert, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.alert, alert) || other.alert == alert) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      categoryId,
      accountId,
      amount,
      period,
      startDate,
      endDate,
      isActive,
      alert,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetModelImplCopyWith<_$BudgetModelImpl> get copyWith =>
      __$$BudgetModelImplCopyWithImpl<_$BudgetModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BudgetModelImplToJson(
      this,
    );
  }
}

abstract class _BudgetModel implements BudgetModel {
  const factory _BudgetModel(
      {required final int id,
      final int? categoryId,
      final int? accountId,
      required final double amount,
      required final String period,
      required final DateTime startDate,
      final DateTime? endDate,
      required final bool isActive,
      final String? alert,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$BudgetModelImpl;

  factory _BudgetModel.fromJson(Map<String, dynamic> json) =
      _$BudgetModelImpl.fromJson;

  @override
  int get id;
  @override
  int? get categoryId;
  @override
  int? get accountId;
  @override
  double get amount;
  @override
  String get period;
  @override // monthly, yearly
  DateTime get startDate;
  @override
  DateTime? get endDate;
  @override
  bool get isActive;
  @override
  String? get alert;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$BudgetModelImplCopyWith<_$BudgetModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
