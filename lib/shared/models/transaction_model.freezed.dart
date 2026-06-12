// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) {
  return _TransactionModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionModel {
  int get id => throw _privateConstructorUsedError;
  String get type =>
      throw _privateConstructorUsedError; // income, expense, transfer
  double get amount => throw _privateConstructorUsedError;
  int get fromAccountId => throw _privateConstructorUsedError;
  int? get toAccountId => throw _privateConstructorUsedError;
  int? get categoryId => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  bool get isRecurring => throw _privateConstructorUsedError;
  String? get recurrenceRule => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionModelCopyWith<TransactionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionModelCopyWith<$Res> {
  factory $TransactionModelCopyWith(
          TransactionModel value, $Res Function(TransactionModel) then) =
      _$TransactionModelCopyWithImpl<$Res, TransactionModel>;
  @useResult
  $Res call(
      {int id,
      String type,
      double amount,
      int fromAccountId,
      int? toAccountId,
      int? categoryId,
      String? description,
      String? note,
      DateTime date,
      List<String>? tags,
      bool isRecurring,
      String? recurrenceRule,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$TransactionModelCopyWithImpl<$Res, $Val extends TransactionModel>
    implements $TransactionModelCopyWith<$Res> {
  _$TransactionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? amount = null,
    Object? fromAccountId = null,
    Object? toAccountId = freezed,
    Object? categoryId = freezed,
    Object? description = freezed,
    Object? note = freezed,
    Object? date = null,
    Object? tags = freezed,
    Object? isRecurring = null,
    Object? recurrenceRule = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      fromAccountId: null == fromAccountId
          ? _value.fromAccountId
          : fromAccountId // ignore: cast_nullable_to_non_nullable
              as int,
      toAccountId: freezed == toAccountId
          ? _value.toAccountId
          : toAccountId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isRecurring: null == isRecurring
          ? _value.isRecurring
          : isRecurring // ignore: cast_nullable_to_non_nullable
              as bool,
      recurrenceRule: freezed == recurrenceRule
          ? _value.recurrenceRule
          : recurrenceRule // ignore: cast_nullable_to_non_nullable
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
abstract class _$$TransactionModelImplCopyWith<$Res>
    implements $TransactionModelCopyWith<$Res> {
  factory _$$TransactionModelImplCopyWith(_$TransactionModelImpl value,
          $Res Function(_$TransactionModelImpl) then) =
      __$$TransactionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String type,
      double amount,
      int fromAccountId,
      int? toAccountId,
      int? categoryId,
      String? description,
      String? note,
      DateTime date,
      List<String>? tags,
      bool isRecurring,
      String? recurrenceRule,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$TransactionModelImplCopyWithImpl<$Res>
    extends _$TransactionModelCopyWithImpl<$Res, _$TransactionModelImpl>
    implements _$$TransactionModelImplCopyWith<$Res> {
  __$$TransactionModelImplCopyWithImpl(_$TransactionModelImpl _value,
      $Res Function(_$TransactionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? amount = null,
    Object? fromAccountId = null,
    Object? toAccountId = freezed,
    Object? categoryId = freezed,
    Object? description = freezed,
    Object? note = freezed,
    Object? date = null,
    Object? tags = freezed,
    Object? isRecurring = null,
    Object? recurrenceRule = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$TransactionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      fromAccountId: null == fromAccountId
          ? _value.fromAccountId
          : fromAccountId // ignore: cast_nullable_to_non_nullable
              as int,
      toAccountId: freezed == toAccountId
          ? _value.toAccountId
          : toAccountId // ignore: cast_nullable_to_non_nullable
              as int?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isRecurring: null == isRecurring
          ? _value.isRecurring
          : isRecurring // ignore: cast_nullable_to_non_nullable
              as bool,
      recurrenceRule: freezed == recurrenceRule
          ? _value.recurrenceRule
          : recurrenceRule // ignore: cast_nullable_to_non_nullable
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
class _$TransactionModelImpl implements _TransactionModel {
  const _$TransactionModelImpl(
      {required this.id,
      required this.type,
      required this.amount,
      required this.fromAccountId,
      this.toAccountId,
      this.categoryId,
      this.description,
      this.note,
      required this.date,
      final List<String>? tags,
      required this.isRecurring,
      this.recurrenceRule,
      required this.createdAt,
      required this.updatedAt})
      : _tags = tags;

  factory _$TransactionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionModelImplFromJson(json);

  @override
  final int id;
  @override
  final String type;
// income, expense, transfer
  @override
  final double amount;
  @override
  final int fromAccountId;
  @override
  final int? toAccountId;
  @override
  final int? categoryId;
  @override
  final String? description;
  @override
  final String? note;
  @override
  final DateTime date;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool isRecurring;
  @override
  final String? recurrenceRule;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'TransactionModel(id: $id, type: $type, amount: $amount, fromAccountId: $fromAccountId, toAccountId: $toAccountId, categoryId: $categoryId, description: $description, note: $note, date: $date, tags: $tags, isRecurring: $isRecurring, recurrenceRule: $recurrenceRule, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.fromAccountId, fromAccountId) ||
                other.fromAccountId == fromAccountId) &&
            (identical(other.toAccountId, toAccountId) ||
                other.toAccountId == toAccountId) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.isRecurring, isRecurring) ||
                other.isRecurring == isRecurring) &&
            (identical(other.recurrenceRule, recurrenceRule) ||
                other.recurrenceRule == recurrenceRule) &&
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
      type,
      amount,
      fromAccountId,
      toAccountId,
      categoryId,
      description,
      note,
      date,
      const DeepCollectionEquality().hash(_tags),
      isRecurring,
      recurrenceRule,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionModelImplCopyWith<_$TransactionModelImpl> get copyWith =>
      __$$TransactionModelImplCopyWithImpl<_$TransactionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionModelImplToJson(
      this,
    );
  }
}

abstract class _TransactionModel implements TransactionModel {
  const factory _TransactionModel(
      {required final int id,
      required final String type,
      required final double amount,
      required final int fromAccountId,
      final int? toAccountId,
      final int? categoryId,
      final String? description,
      final String? note,
      required final DateTime date,
      final List<String>? tags,
      required final bool isRecurring,
      final String? recurrenceRule,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$TransactionModelImpl;

  factory _TransactionModel.fromJson(Map<String, dynamic> json) =
      _$TransactionModelImpl.fromJson;

  @override
  int get id;
  @override
  String get type;
  @override // income, expense, transfer
  double get amount;
  @override
  int get fromAccountId;
  @override
  int? get toAccountId;
  @override
  int? get categoryId;
  @override
  String? get description;
  @override
  String? get note;
  @override
  DateTime get date;
  @override
  List<String>? get tags;
  @override
  bool get isRecurring;
  @override
  String? get recurrenceRule;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$TransactionModelImplCopyWith<_$TransactionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
