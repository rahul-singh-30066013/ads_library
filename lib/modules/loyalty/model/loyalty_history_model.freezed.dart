// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loyalty_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoyaltyHistoryModel _$LoyaltyHistoryModelFromJson(Map<String, dynamic> json) {
  return _LoyaltyHistoryModel.fromJson(json);
}

/// @nodoc
mixin _$LoyaltyHistoryModel {
  @JsonKey(name: 'data')
  List<LoyaltyHistoryData> get loyaltyHistoryData =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoyaltyHistoryModelCopyWith<LoyaltyHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyHistoryModelCopyWith<$Res> {
  factory $LoyaltyHistoryModelCopyWith(
          LoyaltyHistoryModel value, $Res Function(LoyaltyHistoryModel) then) =
      _$LoyaltyHistoryModelCopyWithImpl<$Res, LoyaltyHistoryModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'data') List<LoyaltyHistoryData> loyaltyHistoryData});
}

/// @nodoc
class _$LoyaltyHistoryModelCopyWithImpl<$Res, $Val extends LoyaltyHistoryModel>
    implements $LoyaltyHistoryModelCopyWith<$Res> {
  _$LoyaltyHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loyaltyHistoryData = null,
  }) {
    return _then(_value.copyWith(
      loyaltyHistoryData: null == loyaltyHistoryData
          ? _value.loyaltyHistoryData
          : loyaltyHistoryData // ignore: cast_nullable_to_non_nullable
              as List<LoyaltyHistoryData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoyaltyHistoryModelCopyWith<$Res>
    implements $LoyaltyHistoryModelCopyWith<$Res> {
  factory _$$_LoyaltyHistoryModelCopyWith(_$_LoyaltyHistoryModel value,
          $Res Function(_$_LoyaltyHistoryModel) then) =
      __$$_LoyaltyHistoryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'data') List<LoyaltyHistoryData> loyaltyHistoryData});
}

/// @nodoc
class __$$_LoyaltyHistoryModelCopyWithImpl<$Res>
    extends _$LoyaltyHistoryModelCopyWithImpl<$Res, _$_LoyaltyHistoryModel>
    implements _$$_LoyaltyHistoryModelCopyWith<$Res> {
  __$$_LoyaltyHistoryModelCopyWithImpl(_$_LoyaltyHistoryModel _value,
      $Res Function(_$_LoyaltyHistoryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loyaltyHistoryData = null,
  }) {
    return _then(_$_LoyaltyHistoryModel(
      loyaltyHistoryData: null == loyaltyHistoryData
          ? _value.loyaltyHistoryData
          : loyaltyHistoryData // ignore: cast_nullable_to_non_nullable
              as List<LoyaltyHistoryData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoyaltyHistoryModel implements _LoyaltyHistoryModel {
  const _$_LoyaltyHistoryModel(
      {@JsonKey(name: 'data') this.loyaltyHistoryData = const []});

  factory _$_LoyaltyHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_LoyaltyHistoryModelFromJson(json);

  @override
  @JsonKey(name: 'data')
  final List<LoyaltyHistoryData> loyaltyHistoryData;

  @override
  String toString() {
    return 'LoyaltyHistoryModel(loyaltyHistoryData: $loyaltyHistoryData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoyaltyHistoryModel &&
            const DeepCollectionEquality()
                .equals(other.loyaltyHistoryData, loyaltyHistoryData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(loyaltyHistoryData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoyaltyHistoryModelCopyWith<_$_LoyaltyHistoryModel> get copyWith =>
      __$$_LoyaltyHistoryModelCopyWithImpl<_$_LoyaltyHistoryModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoyaltyHistoryModelToJson(
      this,
    );
  }
}

abstract class _LoyaltyHistoryModel implements LoyaltyHistoryModel {
  const factory _LoyaltyHistoryModel(
          {@JsonKey(name: 'data')
              final List<LoyaltyHistoryData> loyaltyHistoryData}) =
      _$_LoyaltyHistoryModel;

  factory _LoyaltyHistoryModel.fromJson(Map<String, dynamic> json) =
      _$_LoyaltyHistoryModel.fromJson;

  @override
  @JsonKey(name: 'data')
  List<LoyaltyHistoryData> get loyaltyHistoryData;
  @override
  @JsonKey(ignore: true)
  _$$_LoyaltyHistoryModelCopyWith<_$_LoyaltyHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

LoyaltyHistoryData _$LoyaltyHistoryDataFromJson(Map<String, dynamic> json) {
  return _LoyaltyHistoryData.fromJson(json);
}

/// @nodoc
mixin _$LoyaltyHistoryData {
// @Default(0) int txnId,
// @Default(0) int txnMerchantNo,
// @Default('') String txnDate,
// @Default('') String title,
// @Default('') String txnLoyaltyInfo,
// @Default('') String txnExternalRef,
// @Default('') String txnCrDbInd,
// @Default('') String txnBusinessSubType,
// @Default('') String txnBrandName,
// @Default('') String completionDate,
// @Default(0) int txnRewardQty,
// @Default(0) double txnAmount,
// @Default([]) List<dynamic> txnDetails,
  String get transactionReferenceId => throw _privateConstructorUsedError;
  String get orderReferenceId => throw _privateConstructorUsedError;
  String get partnerTransactionReferenceId =>
      throw _privateConstructorUsedError;
  String get merchantId => throw _privateConstructorUsedError;
  String get transactionDate => throw _privateConstructorUsedError;
  String get transactionType => throw _privateConstructorUsedError;
  int get loyaltyPoints => throw _privateConstructorUsedError;
  String get completionDate => throw _privateConstructorUsedError;
  String get business => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get businessSubType => throw _privateConstructorUsedError;
  List<String> get orderReferences => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoyaltyHistoryDataCopyWith<LoyaltyHistoryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyHistoryDataCopyWith<$Res> {
  factory $LoyaltyHistoryDataCopyWith(
          LoyaltyHistoryData value, $Res Function(LoyaltyHistoryData) then) =
      _$LoyaltyHistoryDataCopyWithImpl<$Res, LoyaltyHistoryData>;
  @useResult
  $Res call(
      {String transactionReferenceId,
      String orderReferenceId,
      String partnerTransactionReferenceId,
      String merchantId,
      String transactionDate,
      String transactionType,
      int loyaltyPoints,
      String completionDate,
      String business,
      String title,
      String businessSubType,
      List<String> orderReferences});
}

/// @nodoc
class _$LoyaltyHistoryDataCopyWithImpl<$Res, $Val extends LoyaltyHistoryData>
    implements $LoyaltyHistoryDataCopyWith<$Res> {
  _$LoyaltyHistoryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionReferenceId = null,
    Object? orderReferenceId = null,
    Object? partnerTransactionReferenceId = null,
    Object? merchantId = null,
    Object? transactionDate = null,
    Object? transactionType = null,
    Object? loyaltyPoints = null,
    Object? completionDate = null,
    Object? business = null,
    Object? title = null,
    Object? businessSubType = null,
    Object? orderReferences = null,
  }) {
    return _then(_value.copyWith(
      transactionReferenceId: null == transactionReferenceId
          ? _value.transactionReferenceId
          : transactionReferenceId // ignore: cast_nullable_to_non_nullable
              as String,
      orderReferenceId: null == orderReferenceId
          ? _value.orderReferenceId
          : orderReferenceId // ignore: cast_nullable_to_non_nullable
              as String,
      partnerTransactionReferenceId: null == partnerTransactionReferenceId
          ? _value.partnerTransactionReferenceId
          : partnerTransactionReferenceId // ignore: cast_nullable_to_non_nullable
              as String,
      merchantId: null == merchantId
          ? _value.merchantId
          : merchantId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as String,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String,
      loyaltyPoints: null == loyaltyPoints
          ? _value.loyaltyPoints
          : loyaltyPoints // ignore: cast_nullable_to_non_nullable
              as int,
      completionDate: null == completionDate
          ? _value.completionDate
          : completionDate // ignore: cast_nullable_to_non_nullable
              as String,
      business: null == business
          ? _value.business
          : business // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      businessSubType: null == businessSubType
          ? _value.businessSubType
          : businessSubType // ignore: cast_nullable_to_non_nullable
              as String,
      orderReferences: null == orderReferences
          ? _value.orderReferences
          : orderReferences // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoyaltyHistoryDataCopyWith<$Res>
    implements $LoyaltyHistoryDataCopyWith<$Res> {
  factory _$$_LoyaltyHistoryDataCopyWith(_$_LoyaltyHistoryData value,
          $Res Function(_$_LoyaltyHistoryData) then) =
      __$$_LoyaltyHistoryDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String transactionReferenceId,
      String orderReferenceId,
      String partnerTransactionReferenceId,
      String merchantId,
      String transactionDate,
      String transactionType,
      int loyaltyPoints,
      String completionDate,
      String business,
      String title,
      String businessSubType,
      List<String> orderReferences});
}

/// @nodoc
class __$$_LoyaltyHistoryDataCopyWithImpl<$Res>
    extends _$LoyaltyHistoryDataCopyWithImpl<$Res, _$_LoyaltyHistoryData>
    implements _$$_LoyaltyHistoryDataCopyWith<$Res> {
  __$$_LoyaltyHistoryDataCopyWithImpl(
      _$_LoyaltyHistoryData _value, $Res Function(_$_LoyaltyHistoryData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionReferenceId = null,
    Object? orderReferenceId = null,
    Object? partnerTransactionReferenceId = null,
    Object? merchantId = null,
    Object? transactionDate = null,
    Object? transactionType = null,
    Object? loyaltyPoints = null,
    Object? completionDate = null,
    Object? business = null,
    Object? title = null,
    Object? businessSubType = null,
    Object? orderReferences = null,
  }) {
    return _then(_$_LoyaltyHistoryData(
      transactionReferenceId: null == transactionReferenceId
          ? _value.transactionReferenceId
          : transactionReferenceId // ignore: cast_nullable_to_non_nullable
              as String,
      orderReferenceId: null == orderReferenceId
          ? _value.orderReferenceId
          : orderReferenceId // ignore: cast_nullable_to_non_nullable
              as String,
      partnerTransactionReferenceId: null == partnerTransactionReferenceId
          ? _value.partnerTransactionReferenceId
          : partnerTransactionReferenceId // ignore: cast_nullable_to_non_nullable
              as String,
      merchantId: null == merchantId
          ? _value.merchantId
          : merchantId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as String,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String,
      loyaltyPoints: null == loyaltyPoints
          ? _value.loyaltyPoints
          : loyaltyPoints // ignore: cast_nullable_to_non_nullable
              as int,
      completionDate: null == completionDate
          ? _value.completionDate
          : completionDate // ignore: cast_nullable_to_non_nullable
              as String,
      business: null == business
          ? _value.business
          : business // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      businessSubType: null == businessSubType
          ? _value.businessSubType
          : businessSubType // ignore: cast_nullable_to_non_nullable
              as String,
      orderReferences: null == orderReferences
          ? _value.orderReferences
          : orderReferences // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoyaltyHistoryData implements _LoyaltyHistoryData {
  const _$_LoyaltyHistoryData(
      {this.transactionReferenceId = '',
      this.orderReferenceId = '',
      this.partnerTransactionReferenceId = '',
      this.merchantId = '',
      this.transactionDate = '',
      this.transactionType = '',
      this.loyaltyPoints = 0,
      this.completionDate = '',
      this.business = '',
      this.title = '',
      this.businessSubType = '',
      this.orderReferences = const []});

  factory _$_LoyaltyHistoryData.fromJson(Map<String, dynamic> json) =>
      _$$_LoyaltyHistoryDataFromJson(json);

// @Default(0) int txnId,
// @Default(0) int txnMerchantNo,
// @Default('') String txnDate,
// @Default('') String title,
// @Default('') String txnLoyaltyInfo,
// @Default('') String txnExternalRef,
// @Default('') String txnCrDbInd,
// @Default('') String txnBusinessSubType,
// @Default('') String txnBrandName,
// @Default('') String completionDate,
// @Default(0) int txnRewardQty,
// @Default(0) double txnAmount,
// @Default([]) List<dynamic> txnDetails,
  @override
  @JsonKey()
  final String transactionReferenceId;
  @override
  @JsonKey()
  final String orderReferenceId;
  @override
  @JsonKey()
  final String partnerTransactionReferenceId;
  @override
  @JsonKey()
  final String merchantId;
  @override
  @JsonKey()
  final String transactionDate;
  @override
  @JsonKey()
  final String transactionType;
  @override
  @JsonKey()
  final int loyaltyPoints;
  @override
  @JsonKey()
  final String completionDate;
  @override
  @JsonKey()
  final String business;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String businessSubType;
  @override
  @JsonKey()
  final List<String> orderReferences;

  @override
  String toString() {
    return 'LoyaltyHistoryData(transactionReferenceId: $transactionReferenceId, orderReferenceId: $orderReferenceId, partnerTransactionReferenceId: $partnerTransactionReferenceId, merchantId: $merchantId, transactionDate: $transactionDate, transactionType: $transactionType, loyaltyPoints: $loyaltyPoints, completionDate: $completionDate, business: $business, title: $title, businessSubType: $businessSubType, orderReferences: $orderReferences)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoyaltyHistoryData &&
            (identical(other.transactionReferenceId, transactionReferenceId) ||
                other.transactionReferenceId == transactionReferenceId) &&
            (identical(other.orderReferenceId, orderReferenceId) ||
                other.orderReferenceId == orderReferenceId) &&
            (identical(other.partnerTransactionReferenceId,
                    partnerTransactionReferenceId) ||
                other.partnerTransactionReferenceId ==
                    partnerTransactionReferenceId) &&
            (identical(other.merchantId, merchantId) ||
                other.merchantId == merchantId) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.loyaltyPoints, loyaltyPoints) ||
                other.loyaltyPoints == loyaltyPoints) &&
            (identical(other.completionDate, completionDate) ||
                other.completionDate == completionDate) &&
            (identical(other.business, business) ||
                other.business == business) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.businessSubType, businessSubType) ||
                other.businessSubType == businessSubType) &&
            const DeepCollectionEquality()
                .equals(other.orderReferences, orderReferences));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      transactionReferenceId,
      orderReferenceId,
      partnerTransactionReferenceId,
      merchantId,
      transactionDate,
      transactionType,
      loyaltyPoints,
      completionDate,
      business,
      title,
      businessSubType,
      const DeepCollectionEquality().hash(orderReferences));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoyaltyHistoryDataCopyWith<_$_LoyaltyHistoryData> get copyWith =>
      __$$_LoyaltyHistoryDataCopyWithImpl<_$_LoyaltyHistoryData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoyaltyHistoryDataToJson(
      this,
    );
  }
}

abstract class _LoyaltyHistoryData implements LoyaltyHistoryData {
  const factory _LoyaltyHistoryData(
      {final String transactionReferenceId,
      final String orderReferenceId,
      final String partnerTransactionReferenceId,
      final String merchantId,
      final String transactionDate,
      final String transactionType,
      final int loyaltyPoints,
      final String completionDate,
      final String business,
      final String title,
      final String businessSubType,
      final List<String> orderReferences}) = _$_LoyaltyHistoryData;

  factory _LoyaltyHistoryData.fromJson(Map<String, dynamic> json) =
      _$_LoyaltyHistoryData.fromJson;

  @override // @Default(0) int txnId,
// @Default(0) int txnMerchantNo,
// @Default('') String txnDate,
// @Default('') String title,
// @Default('') String txnLoyaltyInfo,
// @Default('') String txnExternalRef,
// @Default('') String txnCrDbInd,
// @Default('') String txnBusinessSubType,
// @Default('') String txnBrandName,
// @Default('') String completionDate,
// @Default(0) int txnRewardQty,
// @Default(0) double txnAmount,
// @Default([]) List<dynamic> txnDetails,
  String get transactionReferenceId;
  @override
  String get orderReferenceId;
  @override
  String get partnerTransactionReferenceId;
  @override
  String get merchantId;
  @override
  String get transactionDate;
  @override
  String get transactionType;
  @override
  int get loyaltyPoints;
  @override
  String get completionDate;
  @override
  String get business;
  @override
  String get title;
  @override
  String get businessSubType;
  @override
  List<String> get orderReferences;
  @override
  @JsonKey(ignore: true)
  _$$_LoyaltyHistoryDataCopyWith<_$_LoyaltyHistoryData> get copyWith =>
      throw _privateConstructorUsedError;
}
