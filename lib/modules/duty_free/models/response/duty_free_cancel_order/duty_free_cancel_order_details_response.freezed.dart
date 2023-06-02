// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'duty_free_cancel_order_details_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DutyFreeCancelOrderDetailsResponse _$DutyFreeCancelOrderDetailsResponseFromJson(
    Map<String, dynamic> json) {
  return _DutyFreeCancelOrderDetailsResponse.fromJson(json);
}

/// @nodoc
mixin _$DutyFreeCancelOrderDetailsResponse {
  String? get id => throw _privateConstructorUsedError;
  String? get orderReferenceId => throw _privateConstructorUsedError;
  String? get orderId => throw _privateConstructorUsedError;
  String? get transactionReferenceId => throw _privateConstructorUsedError;
  List<String>? get allTransactionReferenceIds =>
      throw _privateConstructorUsedError;
  String? get processedAs => throw _privateConstructorUsedError;
  String? get customerId => throw _privateConstructorUsedError;
  String? get businessType => throw _privateConstructorUsedError;
  String? get businessSubType => throw _privateConstructorUsedError;
  num? get grossAmount => throw _privateConstructorUsedError;
  num? get totalAmount => throw _privateConstructorUsedError;
  List<TransactionHistory>? get transactionHistory =>
      throw _privateConstructorUsedError;
  List<dynamic>? get couponDetail => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  Charges? get charges => throw _privateConstructorUsedError;
  dynamic get cancelType => throw _privateConstructorUsedError;
  OrderDetail? get orderDetail => throw _privateConstructorUsedError;
  List<DutyFreeStatusHistoryDetailsResponse> get statusHistory =>
      throw _privateConstructorUsedError;
  DateTime? get createdOn => throw _privateConstructorUsedError;
  Earning? get earning => throw _privateConstructorUsedError;
  bool get isFullfilled => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DutyFreeCancelOrderDetailsResponseCopyWith<
          DutyFreeCancelOrderDetailsResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DutyFreeCancelOrderDetailsResponseCopyWith<$Res> {
  factory $DutyFreeCancelOrderDetailsResponseCopyWith(
          DutyFreeCancelOrderDetailsResponse value,
          $Res Function(DutyFreeCancelOrderDetailsResponse) then) =
      _$DutyFreeCancelOrderDetailsResponseCopyWithImpl<$Res,
          DutyFreeCancelOrderDetailsResponse>;
  @useResult
  $Res call(
      {String? id,
      String? orderReferenceId,
      String? orderId,
      String? transactionReferenceId,
      List<String>? allTransactionReferenceIds,
      String? processedAs,
      String? customerId,
      String? businessType,
      String? businessSubType,
      num? grossAmount,
      num? totalAmount,
      List<TransactionHistory>? transactionHistory,
      List<dynamic>? couponDetail,
      String? status,
      Charges? charges,
      dynamic cancelType,
      OrderDetail? orderDetail,
      List<DutyFreeStatusHistoryDetailsResponse> statusHistory,
      DateTime? createdOn,
      Earning? earning,
      bool isFullfilled});

  $ChargesCopyWith<$Res>? get charges;
  $OrderDetailCopyWith<$Res>? get orderDetail;
  $EarningCopyWith<$Res>? get earning;
}

/// @nodoc
class _$DutyFreeCancelOrderDetailsResponseCopyWithImpl<$Res,
        $Val extends DutyFreeCancelOrderDetailsResponse>
    implements $DutyFreeCancelOrderDetailsResponseCopyWith<$Res> {
  _$DutyFreeCancelOrderDetailsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? orderReferenceId = freezed,
    Object? orderId = freezed,
    Object? transactionReferenceId = freezed,
    Object? allTransactionReferenceIds = freezed,
    Object? processedAs = freezed,
    Object? customerId = freezed,
    Object? businessType = freezed,
    Object? businessSubType = freezed,
    Object? grossAmount = freezed,
    Object? totalAmount = freezed,
    Object? transactionHistory = freezed,
    Object? couponDetail = freezed,
    Object? status = freezed,
    Object? charges = freezed,
    Object? cancelType = freezed,
    Object? orderDetail = freezed,
    Object? statusHistory = null,
    Object? createdOn = freezed,
    Object? earning = freezed,
    Object? isFullfilled = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      orderReferenceId: freezed == orderReferenceId
          ? _value.orderReferenceId
          : orderReferenceId // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionReferenceId: freezed == transactionReferenceId
          ? _value.transactionReferenceId
          : transactionReferenceId // ignore: cast_nullable_to_non_nullable
              as String?,
      allTransactionReferenceIds: freezed == allTransactionReferenceIds
          ? _value.allTransactionReferenceIds
          : allTransactionReferenceIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      processedAs: freezed == processedAs
          ? _value.processedAs
          : processedAs // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      businessType: freezed == businessType
          ? _value.businessType
          : businessType // ignore: cast_nullable_to_non_nullable
              as String?,
      businessSubType: freezed == businessSubType
          ? _value.businessSubType
          : businessSubType // ignore: cast_nullable_to_non_nullable
              as String?,
      grossAmount: freezed == grossAmount
          ? _value.grossAmount
          : grossAmount // ignore: cast_nullable_to_non_nullable
              as num?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as num?,
      transactionHistory: freezed == transactionHistory
          ? _value.transactionHistory
          : transactionHistory // ignore: cast_nullable_to_non_nullable
              as List<TransactionHistory>?,
      couponDetail: freezed == couponDetail
          ? _value.couponDetail
          : couponDetail // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      charges: freezed == charges
          ? _value.charges
          : charges // ignore: cast_nullable_to_non_nullable
              as Charges?,
      cancelType: freezed == cancelType
          ? _value.cancelType
          : cancelType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderDetail: freezed == orderDetail
          ? _value.orderDetail
          : orderDetail // ignore: cast_nullable_to_non_nullable
              as OrderDetail?,
      statusHistory: null == statusHistory
          ? _value.statusHistory
          : statusHistory // ignore: cast_nullable_to_non_nullable
              as List<DutyFreeStatusHistoryDetailsResponse>,
      createdOn: freezed == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      earning: freezed == earning
          ? _value.earning
          : earning // ignore: cast_nullable_to_non_nullable
              as Earning?,
      isFullfilled: null == isFullfilled
          ? _value.isFullfilled
          : isFullfilled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChargesCopyWith<$Res>? get charges {
    if (_value.charges == null) {
      return null;
    }

    return $ChargesCopyWith<$Res>(_value.charges!, (value) {
      return _then(_value.copyWith(charges: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderDetailCopyWith<$Res>? get orderDetail {
    if (_value.orderDetail == null) {
      return null;
    }

    return $OrderDetailCopyWith<$Res>(_value.orderDetail!, (value) {
      return _then(_value.copyWith(orderDetail: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EarningCopyWith<$Res>? get earning {
    if (_value.earning == null) {
      return null;
    }

    return $EarningCopyWith<$Res>(_value.earning!, (value) {
      return _then(_value.copyWith(earning: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DutyFreeCancelOrderDetailsResponseCopyWith<$Res>
    implements $DutyFreeCancelOrderDetailsResponseCopyWith<$Res> {
  factory _$$_DutyFreeCancelOrderDetailsResponseCopyWith(
          _$_DutyFreeCancelOrderDetailsResponse value,
          $Res Function(_$_DutyFreeCancelOrderDetailsResponse) then) =
      __$$_DutyFreeCancelOrderDetailsResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? orderReferenceId,
      String? orderId,
      String? transactionReferenceId,
      List<String>? allTransactionReferenceIds,
      String? processedAs,
      String? customerId,
      String? businessType,
      String? businessSubType,
      num? grossAmount,
      num? totalAmount,
      List<TransactionHistory>? transactionHistory,
      List<dynamic>? couponDetail,
      String? status,
      Charges? charges,
      dynamic cancelType,
      OrderDetail? orderDetail,
      List<DutyFreeStatusHistoryDetailsResponse> statusHistory,
      DateTime? createdOn,
      Earning? earning,
      bool isFullfilled});

  @override
  $ChargesCopyWith<$Res>? get charges;
  @override
  $OrderDetailCopyWith<$Res>? get orderDetail;
  @override
  $EarningCopyWith<$Res>? get earning;
}

/// @nodoc
class __$$_DutyFreeCancelOrderDetailsResponseCopyWithImpl<$Res>
    extends _$DutyFreeCancelOrderDetailsResponseCopyWithImpl<$Res,
        _$_DutyFreeCancelOrderDetailsResponse>
    implements _$$_DutyFreeCancelOrderDetailsResponseCopyWith<$Res> {
  __$$_DutyFreeCancelOrderDetailsResponseCopyWithImpl(
      _$_DutyFreeCancelOrderDetailsResponse _value,
      $Res Function(_$_DutyFreeCancelOrderDetailsResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? orderReferenceId = freezed,
    Object? orderId = freezed,
    Object? transactionReferenceId = freezed,
    Object? allTransactionReferenceIds = freezed,
    Object? processedAs = freezed,
    Object? customerId = freezed,
    Object? businessType = freezed,
    Object? businessSubType = freezed,
    Object? grossAmount = freezed,
    Object? totalAmount = freezed,
    Object? transactionHistory = freezed,
    Object? couponDetail = freezed,
    Object? status = freezed,
    Object? charges = freezed,
    Object? cancelType = freezed,
    Object? orderDetail = freezed,
    Object? statusHistory = null,
    Object? createdOn = freezed,
    Object? earning = freezed,
    Object? isFullfilled = null,
  }) {
    return _then(_$_DutyFreeCancelOrderDetailsResponse(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      orderReferenceId: freezed == orderReferenceId
          ? _value.orderReferenceId
          : orderReferenceId // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionReferenceId: freezed == transactionReferenceId
          ? _value.transactionReferenceId
          : transactionReferenceId // ignore: cast_nullable_to_non_nullable
              as String?,
      allTransactionReferenceIds: freezed == allTransactionReferenceIds
          ? _value.allTransactionReferenceIds
          : allTransactionReferenceIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      processedAs: freezed == processedAs
          ? _value.processedAs
          : processedAs // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      businessType: freezed == businessType
          ? _value.businessType
          : businessType // ignore: cast_nullable_to_non_nullable
              as String?,
      businessSubType: freezed == businessSubType
          ? _value.businessSubType
          : businessSubType // ignore: cast_nullable_to_non_nullable
              as String?,
      grossAmount: freezed == grossAmount
          ? _value.grossAmount
          : grossAmount // ignore: cast_nullable_to_non_nullable
              as num?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as num?,
      transactionHistory: freezed == transactionHistory
          ? _value.transactionHistory
          : transactionHistory // ignore: cast_nullable_to_non_nullable
              as List<TransactionHistory>?,
      couponDetail: freezed == couponDetail
          ? _value.couponDetail
          : couponDetail // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      charges: freezed == charges
          ? _value.charges
          : charges // ignore: cast_nullable_to_non_nullable
              as Charges?,
      cancelType: freezed == cancelType
          ? _value.cancelType
          : cancelType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orderDetail: freezed == orderDetail
          ? _value.orderDetail
          : orderDetail // ignore: cast_nullable_to_non_nullable
              as OrderDetail?,
      statusHistory: null == statusHistory
          ? _value.statusHistory
          : statusHistory // ignore: cast_nullable_to_non_nullable
              as List<DutyFreeStatusHistoryDetailsResponse>,
      createdOn: freezed == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      earning: freezed == earning
          ? _value.earning
          : earning // ignore: cast_nullable_to_non_nullable
              as Earning?,
      isFullfilled: null == isFullfilled
          ? _value.isFullfilled
          : isFullfilled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DutyFreeCancelOrderDetailsResponse
    implements _DutyFreeCancelOrderDetailsResponse {
  const _$_DutyFreeCancelOrderDetailsResponse(
      {this.id,
      this.orderReferenceId,
      this.orderId,
      this.transactionReferenceId,
      this.allTransactionReferenceIds,
      this.processedAs,
      this.customerId,
      this.businessType,
      this.businessSubType,
      this.grossAmount,
      this.totalAmount,
      this.transactionHistory,
      this.couponDetail,
      this.status,
      this.charges,
      this.cancelType,
      this.orderDetail,
      this.statusHistory = const [],
      this.createdOn,
      this.earning,
      this.isFullfilled = false});

  factory _$_DutyFreeCancelOrderDetailsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$$_DutyFreeCancelOrderDetailsResponseFromJson(json);

  @override
  final String? id;
  @override
  final String? orderReferenceId;
  @override
  final String? orderId;
  @override
  final String? transactionReferenceId;
  @override
  final List<String>? allTransactionReferenceIds;
  @override
  final String? processedAs;
  @override
  final String? customerId;
  @override
  final String? businessType;
  @override
  final String? businessSubType;
  @override
  final num? grossAmount;
  @override
  final num? totalAmount;
  @override
  final List<TransactionHistory>? transactionHistory;
  @override
  final List<dynamic>? couponDetail;
  @override
  final String? status;
  @override
  final Charges? charges;
  @override
  final dynamic cancelType;
  @override
  final OrderDetail? orderDetail;
  @override
  @JsonKey()
  final List<DutyFreeStatusHistoryDetailsResponse> statusHistory;
  @override
  final DateTime? createdOn;
  @override
  final Earning? earning;
  @override
  @JsonKey()
  final bool isFullfilled;

  @override
  String toString() {
    return 'DutyFreeCancelOrderDetailsResponse(id: $id, orderReferenceId: $orderReferenceId, orderId: $orderId, transactionReferenceId: $transactionReferenceId, allTransactionReferenceIds: $allTransactionReferenceIds, processedAs: $processedAs, customerId: $customerId, businessType: $businessType, businessSubType: $businessSubType, grossAmount: $grossAmount, totalAmount: $totalAmount, transactionHistory: $transactionHistory, couponDetail: $couponDetail, status: $status, charges: $charges, cancelType: $cancelType, orderDetail: $orderDetail, statusHistory: $statusHistory, createdOn: $createdOn, earning: $earning, isFullfilled: $isFullfilled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DutyFreeCancelOrderDetailsResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderReferenceId, orderReferenceId) ||
                other.orderReferenceId == orderReferenceId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.transactionReferenceId, transactionReferenceId) ||
                other.transactionReferenceId == transactionReferenceId) &&
            const DeepCollectionEquality().equals(
                other.allTransactionReferenceIds, allTransactionReferenceIds) &&
            (identical(other.processedAs, processedAs) ||
                other.processedAs == processedAs) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.businessType, businessType) ||
                other.businessType == businessType) &&
            (identical(other.businessSubType, businessSubType) ||
                other.businessSubType == businessSubType) &&
            (identical(other.grossAmount, grossAmount) ||
                other.grossAmount == grossAmount) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            const DeepCollectionEquality()
                .equals(other.transactionHistory, transactionHistory) &&
            const DeepCollectionEquality()
                .equals(other.couponDetail, couponDetail) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.charges, charges) || other.charges == charges) &&
            const DeepCollectionEquality()
                .equals(other.cancelType, cancelType) &&
            (identical(other.orderDetail, orderDetail) ||
                other.orderDetail == orderDetail) &&
            const DeepCollectionEquality()
                .equals(other.statusHistory, statusHistory) &&
            (identical(other.createdOn, createdOn) ||
                other.createdOn == createdOn) &&
            (identical(other.earning, earning) || other.earning == earning) &&
            (identical(other.isFullfilled, isFullfilled) ||
                other.isFullfilled == isFullfilled));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        orderReferenceId,
        orderId,
        transactionReferenceId,
        const DeepCollectionEquality().hash(allTransactionReferenceIds),
        processedAs,
        customerId,
        businessType,
        businessSubType,
        grossAmount,
        totalAmount,
        const DeepCollectionEquality().hash(transactionHistory),
        const DeepCollectionEquality().hash(couponDetail),
        status,
        charges,
        const DeepCollectionEquality().hash(cancelType),
        orderDetail,
        const DeepCollectionEquality().hash(statusHistory),
        createdOn,
        earning,
        isFullfilled
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DutyFreeCancelOrderDetailsResponseCopyWith<
          _$_DutyFreeCancelOrderDetailsResponse>
      get copyWith => __$$_DutyFreeCancelOrderDetailsResponseCopyWithImpl<
          _$_DutyFreeCancelOrderDetailsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DutyFreeCancelOrderDetailsResponseToJson(
      this,
    );
  }
}

abstract class _DutyFreeCancelOrderDetailsResponse
    implements DutyFreeCancelOrderDetailsResponse {
  const factory _DutyFreeCancelOrderDetailsResponse(
      {final String? id,
      final String? orderReferenceId,
      final String? orderId,
      final String? transactionReferenceId,
      final List<String>? allTransactionReferenceIds,
      final String? processedAs,
      final String? customerId,
      final String? businessType,
      final String? businessSubType,
      final num? grossAmount,
      final num? totalAmount,
      final List<TransactionHistory>? transactionHistory,
      final List<dynamic>? couponDetail,
      final String? status,
      final Charges? charges,
      final dynamic cancelType,
      final OrderDetail? orderDetail,
      final List<DutyFreeStatusHistoryDetailsResponse> statusHistory,
      final DateTime? createdOn,
      final Earning? earning,
      final bool isFullfilled}) = _$_DutyFreeCancelOrderDetailsResponse;

  factory _DutyFreeCancelOrderDetailsResponse.fromJson(
          Map<String, dynamic> json) =
      _$_DutyFreeCancelOrderDetailsResponse.fromJson;

  @override
  String? get id;
  @override
  String? get orderReferenceId;
  @override
  String? get orderId;
  @override
  String? get transactionReferenceId;
  @override
  List<String>? get allTransactionReferenceIds;
  @override
  String? get processedAs;
  @override
  String? get customerId;
  @override
  String? get businessType;
  @override
  String? get businessSubType;
  @override
  num? get grossAmount;
  @override
  num? get totalAmount;
  @override
  List<TransactionHistory>? get transactionHistory;
  @override
  List<dynamic>? get couponDetail;
  @override
  String? get status;
  @override
  Charges? get charges;
  @override
  dynamic get cancelType;
  @override
  OrderDetail? get orderDetail;
  @override
  List<DutyFreeStatusHistoryDetailsResponse> get statusHistory;
  @override
  DateTime? get createdOn;
  @override
  Earning? get earning;
  @override
  bool get isFullfilled;
  @override
  @JsonKey(ignore: true)
  _$$_DutyFreeCancelOrderDetailsResponseCopyWith<
          _$_DutyFreeCancelOrderDetailsResponse>
      get copyWith => throw _privateConstructorUsedError;
}

Charges _$ChargesFromJson(Map<String, dynamic> json) {
  return _Charges.fromJson(json);
}

/// @nodoc
mixin _$Charges {
  dynamic get convenience => throw _privateConstructorUsedError;
  dynamic get cancellation => throw _privateConstructorUsedError;
  dynamic get gst => throw _privateConstructorUsedError;
  num? get totalTax => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChargesCopyWith<Charges> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChargesCopyWith<$Res> {
  factory $ChargesCopyWith(Charges value, $Res Function(Charges) then) =
      _$ChargesCopyWithImpl<$Res, Charges>;
  @useResult
  $Res call(
      {dynamic convenience, dynamic cancellation, dynamic gst, num? totalTax});
}

/// @nodoc
class _$ChargesCopyWithImpl<$Res, $Val extends Charges>
    implements $ChargesCopyWith<$Res> {
  _$ChargesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? convenience = freezed,
    Object? cancellation = freezed,
    Object? gst = freezed,
    Object? totalTax = freezed,
  }) {
    return _then(_value.copyWith(
      convenience: freezed == convenience
          ? _value.convenience
          : convenience // ignore: cast_nullable_to_non_nullable
              as dynamic,
      cancellation: freezed == cancellation
          ? _value.cancellation
          : cancellation // ignore: cast_nullable_to_non_nullable
              as dynamic,
      gst: freezed == gst
          ? _value.gst
          : gst // ignore: cast_nullable_to_non_nullable
              as dynamic,
      totalTax: freezed == totalTax
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as num?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChargesCopyWith<$Res> implements $ChargesCopyWith<$Res> {
  factory _$$_ChargesCopyWith(
          _$_Charges value, $Res Function(_$_Charges) then) =
      __$$_ChargesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic convenience, dynamic cancellation, dynamic gst, num? totalTax});
}

/// @nodoc
class __$$_ChargesCopyWithImpl<$Res>
    extends _$ChargesCopyWithImpl<$Res, _$_Charges>
    implements _$$_ChargesCopyWith<$Res> {
  __$$_ChargesCopyWithImpl(_$_Charges _value, $Res Function(_$_Charges) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? convenience = freezed,
    Object? cancellation = freezed,
    Object? gst = freezed,
    Object? totalTax = freezed,
  }) {
    return _then(_$_Charges(
      convenience: freezed == convenience
          ? _value.convenience
          : convenience // ignore: cast_nullable_to_non_nullable
              as dynamic,
      cancellation: freezed == cancellation
          ? _value.cancellation
          : cancellation // ignore: cast_nullable_to_non_nullable
              as dynamic,
      gst: freezed == gst
          ? _value.gst
          : gst // ignore: cast_nullable_to_non_nullable
              as dynamic,
      totalTax: freezed == totalTax
          ? _value.totalTax
          : totalTax // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Charges implements _Charges {
  const _$_Charges(
      {this.convenience, this.cancellation, this.gst, this.totalTax});

  factory _$_Charges.fromJson(Map<String, dynamic> json) =>
      _$$_ChargesFromJson(json);

  @override
  final dynamic convenience;
  @override
  final dynamic cancellation;
  @override
  final dynamic gst;
  @override
  final num? totalTax;

  @override
  String toString() {
    return 'Charges(convenience: $convenience, cancellation: $cancellation, gst: $gst, totalTax: $totalTax)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Charges &&
            const DeepCollectionEquality()
                .equals(other.convenience, convenience) &&
            const DeepCollectionEquality()
                .equals(other.cancellation, cancellation) &&
            const DeepCollectionEquality().equals(other.gst, gst) &&
            (identical(other.totalTax, totalTax) ||
                other.totalTax == totalTax));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(convenience),
      const DeepCollectionEquality().hash(cancellation),
      const DeepCollectionEquality().hash(gst),
      totalTax);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChargesCopyWith<_$_Charges> get copyWith =>
      __$$_ChargesCopyWithImpl<_$_Charges>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChargesToJson(
      this,
    );
  }
}

abstract class _Charges implements Charges {
  const factory _Charges(
      {final dynamic convenience,
      final dynamic cancellation,
      final dynamic gst,
      final num? totalTax}) = _$_Charges;

  factory _Charges.fromJson(Map<String, dynamic> json) = _$_Charges.fromJson;

  @override
  dynamic get convenience;
  @override
  dynamic get cancellation;
  @override
  dynamic get gst;
  @override
  num? get totalTax;
  @override
  @JsonKey(ignore: true)
  _$$_ChargesCopyWith<_$_Charges> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderDetail _$OrderDetailFromJson(Map<String, dynamic> json) {
  return _OrderDetail.fromJson(json);
}

/// @nodoc
mixin _$OrderDetail {
  String? get bookingId => throw _privateConstructorUsedError;
  String? get itineraryId => throw _privateConstructorUsedError;
  dynamic get history => throw _privateConstructorUsedError;
  dynamic get pickupDate => throw _privateConstructorUsedError;
  dynamic get flightbookingDetail => throw _privateConstructorUsedError;
  DutyfreeDetail? get dutyfreeDetail => throw _privateConstructorUsedError;
  dynamic get pranaamDetail => throw _privateConstructorUsedError;
  dynamic get cabDetail => throw _privateConstructorUsedError;
  dynamic get forexDetail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderDetailCopyWith<OrderDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailCopyWith<$Res> {
  factory $OrderDetailCopyWith(
          OrderDetail value, $Res Function(OrderDetail) then) =
      _$OrderDetailCopyWithImpl<$Res, OrderDetail>;
  @useResult
  $Res call(
      {String? bookingId,
      String? itineraryId,
      dynamic history,
      dynamic pickupDate,
      dynamic flightbookingDetail,
      DutyfreeDetail? dutyfreeDetail,
      dynamic pranaamDetail,
      dynamic cabDetail,
      dynamic forexDetail});

  $DutyfreeDetailCopyWith<$Res>? get dutyfreeDetail;
}

/// @nodoc
class _$OrderDetailCopyWithImpl<$Res, $Val extends OrderDetail>
    implements $OrderDetailCopyWith<$Res> {
  _$OrderDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = freezed,
    Object? itineraryId = freezed,
    Object? history = freezed,
    Object? pickupDate = freezed,
    Object? flightbookingDetail = freezed,
    Object? dutyfreeDetail = freezed,
    Object? pranaamDetail = freezed,
    Object? cabDetail = freezed,
    Object? forexDetail = freezed,
  }) {
    return _then(_value.copyWith(
      bookingId: freezed == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String?,
      itineraryId: freezed == itineraryId
          ? _value.itineraryId
          : itineraryId // ignore: cast_nullable_to_non_nullable
              as String?,
      history: freezed == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pickupDate: freezed == pickupDate
          ? _value.pickupDate
          : pickupDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      flightbookingDetail: freezed == flightbookingDetail
          ? _value.flightbookingDetail
          : flightbookingDetail // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dutyfreeDetail: freezed == dutyfreeDetail
          ? _value.dutyfreeDetail
          : dutyfreeDetail // ignore: cast_nullable_to_non_nullable
              as DutyfreeDetail?,
      pranaamDetail: freezed == pranaamDetail
          ? _value.pranaamDetail
          : pranaamDetail // ignore: cast_nullable_to_non_nullable
              as dynamic,
      cabDetail: freezed == cabDetail
          ? _value.cabDetail
          : cabDetail // ignore: cast_nullable_to_non_nullable
              as dynamic,
      forexDetail: freezed == forexDetail
          ? _value.forexDetail
          : forexDetail // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DutyfreeDetailCopyWith<$Res>? get dutyfreeDetail {
    if (_value.dutyfreeDetail == null) {
      return null;
    }

    return $DutyfreeDetailCopyWith<$Res>(_value.dutyfreeDetail!, (value) {
      return _then(_value.copyWith(dutyfreeDetail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrderDetailCopyWith<$Res>
    implements $OrderDetailCopyWith<$Res> {
  factory _$$_OrderDetailCopyWith(
          _$_OrderDetail value, $Res Function(_$_OrderDetail) then) =
      __$$_OrderDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? bookingId,
      String? itineraryId,
      dynamic history,
      dynamic pickupDate,
      dynamic flightbookingDetail,
      DutyfreeDetail? dutyfreeDetail,
      dynamic pranaamDetail,
      dynamic cabDetail,
      dynamic forexDetail});

  @override
  $DutyfreeDetailCopyWith<$Res>? get dutyfreeDetail;
}

/// @nodoc
class __$$_OrderDetailCopyWithImpl<$Res>
    extends _$OrderDetailCopyWithImpl<$Res, _$_OrderDetail>
    implements _$$_OrderDetailCopyWith<$Res> {
  __$$_OrderDetailCopyWithImpl(
      _$_OrderDetail _value, $Res Function(_$_OrderDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = freezed,
    Object? itineraryId = freezed,
    Object? history = freezed,
    Object? pickupDate = freezed,
    Object? flightbookingDetail = freezed,
    Object? dutyfreeDetail = freezed,
    Object? pranaamDetail = freezed,
    Object? cabDetail = freezed,
    Object? forexDetail = freezed,
  }) {
    return _then(_$_OrderDetail(
      bookingId: freezed == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String?,
      itineraryId: freezed == itineraryId
          ? _value.itineraryId
          : itineraryId // ignore: cast_nullable_to_non_nullable
              as String?,
      history: freezed == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pickupDate: freezed == pickupDate
          ? _value.pickupDate
          : pickupDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      flightbookingDetail: freezed == flightbookingDetail
          ? _value.flightbookingDetail
          : flightbookingDetail // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dutyfreeDetail: freezed == dutyfreeDetail
          ? _value.dutyfreeDetail
          : dutyfreeDetail // ignore: cast_nullable_to_non_nullable
              as DutyfreeDetail?,
      pranaamDetail: freezed == pranaamDetail
          ? _value.pranaamDetail
          : pranaamDetail // ignore: cast_nullable_to_non_nullable
              as dynamic,
      cabDetail: freezed == cabDetail
          ? _value.cabDetail
          : cabDetail // ignore: cast_nullable_to_non_nullable
              as dynamic,
      forexDetail: freezed == forexDetail
          ? _value.forexDetail
          : forexDetail // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderDetail implements _OrderDetail {
  const _$_OrderDetail(
      {this.bookingId,
      this.itineraryId,
      this.history,
      this.pickupDate,
      this.flightbookingDetail,
      this.dutyfreeDetail,
      this.pranaamDetail,
      this.cabDetail,
      this.forexDetail});

  factory _$_OrderDetail.fromJson(Map<String, dynamic> json) =>
      _$$_OrderDetailFromJson(json);

  @override
  final String? bookingId;
  @override
  final String? itineraryId;
  @override
  final dynamic history;
  @override
  final dynamic pickupDate;
  @override
  final dynamic flightbookingDetail;
  @override
  final DutyfreeDetail? dutyfreeDetail;
  @override
  final dynamic pranaamDetail;
  @override
  final dynamic cabDetail;
  @override
  final dynamic forexDetail;

  @override
  String toString() {
    return 'OrderDetail(bookingId: $bookingId, itineraryId: $itineraryId, history: $history, pickupDate: $pickupDate, flightbookingDetail: $flightbookingDetail, dutyfreeDetail: $dutyfreeDetail, pranaamDetail: $pranaamDetail, cabDetail: $cabDetail, forexDetail: $forexDetail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderDetail &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.itineraryId, itineraryId) ||
                other.itineraryId == itineraryId) &&
            const DeepCollectionEquality().equals(other.history, history) &&
            const DeepCollectionEquality()
                .equals(other.pickupDate, pickupDate) &&
            const DeepCollectionEquality()
                .equals(other.flightbookingDetail, flightbookingDetail) &&
            (identical(other.dutyfreeDetail, dutyfreeDetail) ||
                other.dutyfreeDetail == dutyfreeDetail) &&
            const DeepCollectionEquality()
                .equals(other.pranaamDetail, pranaamDetail) &&
            const DeepCollectionEquality().equals(other.cabDetail, cabDetail) &&
            const DeepCollectionEquality()
                .equals(other.forexDetail, forexDetail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      bookingId,
      itineraryId,
      const DeepCollectionEquality().hash(history),
      const DeepCollectionEquality().hash(pickupDate),
      const DeepCollectionEquality().hash(flightbookingDetail),
      dutyfreeDetail,
      const DeepCollectionEquality().hash(pranaamDetail),
      const DeepCollectionEquality().hash(cabDetail),
      const DeepCollectionEquality().hash(forexDetail));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderDetailCopyWith<_$_OrderDetail> get copyWith =>
      __$$_OrderDetailCopyWithImpl<_$_OrderDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderDetailToJson(
      this,
    );
  }
}

abstract class _OrderDetail implements OrderDetail {
  const factory _OrderDetail(
      {final String? bookingId,
      final String? itineraryId,
      final dynamic history,
      final dynamic pickupDate,
      final dynamic flightbookingDetail,
      final DutyfreeDetail? dutyfreeDetail,
      final dynamic pranaamDetail,
      final dynamic cabDetail,
      final dynamic forexDetail}) = _$_OrderDetail;

  factory _OrderDetail.fromJson(Map<String, dynamic> json) =
      _$_OrderDetail.fromJson;

  @override
  String? get bookingId;
  @override
  String? get itineraryId;
  @override
  dynamic get history;
  @override
  dynamic get pickupDate;
  @override
  dynamic get flightbookingDetail;
  @override
  DutyfreeDetail? get dutyfreeDetail;
  @override
  dynamic get pranaamDetail;
  @override
  dynamic get cabDetail;
  @override
  dynamic get forexDetail;
  @override
  @JsonKey(ignore: true)
  _$$_OrderDetailCopyWith<_$_OrderDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

DutyfreeDetail _$DutyfreeDetailFromJson(Map<String, dynamic> json) {
  return _DutyfreeDetail.fromJson(json);
}

/// @nodoc
mixin _$DutyfreeDetail {
  String? get id => throw _privateConstructorUsedError;
  String? get customerId => throw _privateConstructorUsedError;
  String? get airportCode => throw _privateConstructorUsedError;
  List<DutyFreeCancelOrderSKUDetails> get itemDetails =>
      throw _privateConstructorUsedError;
  List<PassengerDetailsResponse> get passengerDetail =>
      throw _privateConstructorUsedError;
  PromoCodeResponse get promoCoupon =>
      throw _privateConstructorUsedError; // List<PassengerDetail>? passengerDetail,
  DiscountPrice? get totalAmount => throw _privateConstructorUsedError;
  DiscountPrice? get finalAmount => throw _privateConstructorUsedError;
  PreOrderDiscount? get preOrderDiscount => throw _privateConstructorUsedError;
  DiscountPrice? get unitPriceResponse => throw _privateConstructorUsedError;
  DiscountPrice? get discountPrice => throw _privateConstructorUsedError;
  List<PreOrderDiscountBreakup>? get preOrderDiscountBreakup =>
      throw _privateConstructorUsedError;
  num? get loyaltyPotentialPoint => throw _privateConstructorUsedError;
  String? get collectionPoint => throw _privateConstructorUsedError;
  dynamic get store => throw _privateConstructorUsedError;
  bool? get isOrderPushed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DutyfreeDetailCopyWith<DutyfreeDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DutyfreeDetailCopyWith<$Res> {
  factory $DutyfreeDetailCopyWith(
          DutyfreeDetail value, $Res Function(DutyfreeDetail) then) =
      _$DutyfreeDetailCopyWithImpl<$Res, DutyfreeDetail>;
  @useResult
  $Res call(
      {String? id,
      String? customerId,
      String? airportCode,
      List<DutyFreeCancelOrderSKUDetails> itemDetails,
      List<PassengerDetailsResponse> passengerDetail,
      PromoCodeResponse promoCoupon,
      DiscountPrice? totalAmount,
      DiscountPrice? finalAmount,
      PreOrderDiscount? preOrderDiscount,
      DiscountPrice? unitPriceResponse,
      DiscountPrice? discountPrice,
      List<PreOrderDiscountBreakup>? preOrderDiscountBreakup,
      num? loyaltyPotentialPoint,
      String? collectionPoint,
      dynamic store,
      bool? isOrderPushed});

  $PromoCodeResponseCopyWith<$Res> get promoCoupon;
  $DiscountPriceCopyWith<$Res>? get totalAmount;
  $DiscountPriceCopyWith<$Res>? get finalAmount;
  $PreOrderDiscountCopyWith<$Res>? get preOrderDiscount;
  $DiscountPriceCopyWith<$Res>? get unitPriceResponse;
  $DiscountPriceCopyWith<$Res>? get discountPrice;
}

/// @nodoc
class _$DutyfreeDetailCopyWithImpl<$Res, $Val extends DutyfreeDetail>
    implements $DutyfreeDetailCopyWith<$Res> {
  _$DutyfreeDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? customerId = freezed,
    Object? airportCode = freezed,
    Object? itemDetails = null,
    Object? passengerDetail = null,
    Object? promoCoupon = null,
    Object? totalAmount = freezed,
    Object? finalAmount = freezed,
    Object? preOrderDiscount = freezed,
    Object? unitPriceResponse = freezed,
    Object? discountPrice = freezed,
    Object? preOrderDiscountBreakup = freezed,
    Object? loyaltyPotentialPoint = freezed,
    Object? collectionPoint = freezed,
    Object? store = freezed,
    Object? isOrderPushed = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      airportCode: freezed == airportCode
          ? _value.airportCode
          : airportCode // ignore: cast_nullable_to_non_nullable
              as String?,
      itemDetails: null == itemDetails
          ? _value.itemDetails
          : itemDetails // ignore: cast_nullable_to_non_nullable
              as List<DutyFreeCancelOrderSKUDetails>,
      passengerDetail: null == passengerDetail
          ? _value.passengerDetail
          : passengerDetail // ignore: cast_nullable_to_non_nullable
              as List<PassengerDetailsResponse>,
      promoCoupon: null == promoCoupon
          ? _value.promoCoupon
          : promoCoupon // ignore: cast_nullable_to_non_nullable
              as PromoCodeResponse,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as DiscountPrice?,
      finalAmount: freezed == finalAmount
          ? _value.finalAmount
          : finalAmount // ignore: cast_nullable_to_non_nullable
              as DiscountPrice?,
      preOrderDiscount: freezed == preOrderDiscount
          ? _value.preOrderDiscount
          : preOrderDiscount // ignore: cast_nullable_to_non_nullable
              as PreOrderDiscount?,
      unitPriceResponse: freezed == unitPriceResponse
          ? _value.unitPriceResponse
          : unitPriceResponse // ignore: cast_nullable_to_non_nullable
              as DiscountPrice?,
      discountPrice: freezed == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as DiscountPrice?,
      preOrderDiscountBreakup: freezed == preOrderDiscountBreakup
          ? _value.preOrderDiscountBreakup
          : preOrderDiscountBreakup // ignore: cast_nullable_to_non_nullable
              as List<PreOrderDiscountBreakup>?,
      loyaltyPotentialPoint: freezed == loyaltyPotentialPoint
          ? _value.loyaltyPotentialPoint
          : loyaltyPotentialPoint // ignore: cast_nullable_to_non_nullable
              as num?,
      collectionPoint: freezed == collectionPoint
          ? _value.collectionPoint
          : collectionPoint // ignore: cast_nullable_to_non_nullable
              as String?,
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isOrderPushed: freezed == isOrderPushed
          ? _value.isOrderPushed
          : isOrderPushed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PromoCodeResponseCopyWith<$Res> get promoCoupon {
    return $PromoCodeResponseCopyWith<$Res>(_value.promoCoupon, (value) {
      return _then(_value.copyWith(promoCoupon: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DiscountPriceCopyWith<$Res>? get totalAmount {
    if (_value.totalAmount == null) {
      return null;
    }

    return $DiscountPriceCopyWith<$Res>(_value.totalAmount!, (value) {
      return _then(_value.copyWith(totalAmount: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DiscountPriceCopyWith<$Res>? get finalAmount {
    if (_value.finalAmount == null) {
      return null;
    }

    return $DiscountPriceCopyWith<$Res>(_value.finalAmount!, (value) {
      return _then(_value.copyWith(finalAmount: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PreOrderDiscountCopyWith<$Res>? get preOrderDiscount {
    if (_value.preOrderDiscount == null) {
      return null;
    }

    return $PreOrderDiscountCopyWith<$Res>(_value.preOrderDiscount!, (value) {
      return _then(_value.copyWith(preOrderDiscount: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DiscountPriceCopyWith<$Res>? get unitPriceResponse {
    if (_value.unitPriceResponse == null) {
      return null;
    }

    return $DiscountPriceCopyWith<$Res>(_value.unitPriceResponse!, (value) {
      return _then(_value.copyWith(unitPriceResponse: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DiscountPriceCopyWith<$Res>? get discountPrice {
    if (_value.discountPrice == null) {
      return null;
    }

    return $DiscountPriceCopyWith<$Res>(_value.discountPrice!, (value) {
      return _then(_value.copyWith(discountPrice: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DutyfreeDetailCopyWith<$Res>
    implements $DutyfreeDetailCopyWith<$Res> {
  factory _$$_DutyfreeDetailCopyWith(
          _$_DutyfreeDetail value, $Res Function(_$_DutyfreeDetail) then) =
      __$$_DutyfreeDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? customerId,
      String? airportCode,
      List<DutyFreeCancelOrderSKUDetails> itemDetails,
      List<PassengerDetailsResponse> passengerDetail,
      PromoCodeResponse promoCoupon,
      DiscountPrice? totalAmount,
      DiscountPrice? finalAmount,
      PreOrderDiscount? preOrderDiscount,
      DiscountPrice? unitPriceResponse,
      DiscountPrice? discountPrice,
      List<PreOrderDiscountBreakup>? preOrderDiscountBreakup,
      num? loyaltyPotentialPoint,
      String? collectionPoint,
      dynamic store,
      bool? isOrderPushed});

  @override
  $PromoCodeResponseCopyWith<$Res> get promoCoupon;
  @override
  $DiscountPriceCopyWith<$Res>? get totalAmount;
  @override
  $DiscountPriceCopyWith<$Res>? get finalAmount;
  @override
  $PreOrderDiscountCopyWith<$Res>? get preOrderDiscount;
  @override
  $DiscountPriceCopyWith<$Res>? get unitPriceResponse;
  @override
  $DiscountPriceCopyWith<$Res>? get discountPrice;
}

/// @nodoc
class __$$_DutyfreeDetailCopyWithImpl<$Res>
    extends _$DutyfreeDetailCopyWithImpl<$Res, _$_DutyfreeDetail>
    implements _$$_DutyfreeDetailCopyWith<$Res> {
  __$$_DutyfreeDetailCopyWithImpl(
      _$_DutyfreeDetail _value, $Res Function(_$_DutyfreeDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? customerId = freezed,
    Object? airportCode = freezed,
    Object? itemDetails = null,
    Object? passengerDetail = null,
    Object? promoCoupon = null,
    Object? totalAmount = freezed,
    Object? finalAmount = freezed,
    Object? preOrderDiscount = freezed,
    Object? unitPriceResponse = freezed,
    Object? discountPrice = freezed,
    Object? preOrderDiscountBreakup = freezed,
    Object? loyaltyPotentialPoint = freezed,
    Object? collectionPoint = freezed,
    Object? store = freezed,
    Object? isOrderPushed = freezed,
  }) {
    return _then(_$_DutyfreeDetail(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      airportCode: freezed == airportCode
          ? _value.airportCode
          : airportCode // ignore: cast_nullable_to_non_nullable
              as String?,
      itemDetails: null == itemDetails
          ? _value.itemDetails
          : itemDetails // ignore: cast_nullable_to_non_nullable
              as List<DutyFreeCancelOrderSKUDetails>,
      passengerDetail: null == passengerDetail
          ? _value.passengerDetail
          : passengerDetail // ignore: cast_nullable_to_non_nullable
              as List<PassengerDetailsResponse>,
      promoCoupon: null == promoCoupon
          ? _value.promoCoupon
          : promoCoupon // ignore: cast_nullable_to_non_nullable
              as PromoCodeResponse,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as DiscountPrice?,
      finalAmount: freezed == finalAmount
          ? _value.finalAmount
          : finalAmount // ignore: cast_nullable_to_non_nullable
              as DiscountPrice?,
      preOrderDiscount: freezed == preOrderDiscount
          ? _value.preOrderDiscount
          : preOrderDiscount // ignore: cast_nullable_to_non_nullable
              as PreOrderDiscount?,
      unitPriceResponse: freezed == unitPriceResponse
          ? _value.unitPriceResponse
          : unitPriceResponse // ignore: cast_nullable_to_non_nullable
              as DiscountPrice?,
      discountPrice: freezed == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as DiscountPrice?,
      preOrderDiscountBreakup: freezed == preOrderDiscountBreakup
          ? _value.preOrderDiscountBreakup
          : preOrderDiscountBreakup // ignore: cast_nullable_to_non_nullable
              as List<PreOrderDiscountBreakup>?,
      loyaltyPotentialPoint: freezed == loyaltyPotentialPoint
          ? _value.loyaltyPotentialPoint
          : loyaltyPotentialPoint // ignore: cast_nullable_to_non_nullable
              as num?,
      collectionPoint: freezed == collectionPoint
          ? _value.collectionPoint
          : collectionPoint // ignore: cast_nullable_to_non_nullable
              as String?,
      store: freezed == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isOrderPushed: freezed == isOrderPushed
          ? _value.isOrderPushed
          : isOrderPushed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DutyfreeDetail implements _DutyfreeDetail {
  const _$_DutyfreeDetail(
      {this.id,
      this.customerId,
      this.airportCode,
      this.itemDetails = const [],
      this.passengerDetail = const [],
      this.promoCoupon = const PromoCodeResponse(),
      this.totalAmount,
      this.finalAmount,
      this.preOrderDiscount,
      this.unitPriceResponse,
      this.discountPrice,
      this.preOrderDiscountBreakup,
      this.loyaltyPotentialPoint,
      this.collectionPoint,
      this.store,
      this.isOrderPushed});

  factory _$_DutyfreeDetail.fromJson(Map<String, dynamic> json) =>
      _$$_DutyfreeDetailFromJson(json);

  @override
  final String? id;
  @override
  final String? customerId;
  @override
  final String? airportCode;
  @override
  @JsonKey()
  final List<DutyFreeCancelOrderSKUDetails> itemDetails;
  @override
  @JsonKey()
  final List<PassengerDetailsResponse> passengerDetail;
  @override
  @JsonKey()
  final PromoCodeResponse promoCoupon;
// List<PassengerDetail>? passengerDetail,
  @override
  final DiscountPrice? totalAmount;
  @override
  final DiscountPrice? finalAmount;
  @override
  final PreOrderDiscount? preOrderDiscount;
  @override
  final DiscountPrice? unitPriceResponse;
  @override
  final DiscountPrice? discountPrice;
  @override
  final List<PreOrderDiscountBreakup>? preOrderDiscountBreakup;
  @override
  final num? loyaltyPotentialPoint;
  @override
  final String? collectionPoint;
  @override
  final dynamic store;
  @override
  final bool? isOrderPushed;

  @override
  String toString() {
    return 'DutyfreeDetail(id: $id, customerId: $customerId, airportCode: $airportCode, itemDetails: $itemDetails, passengerDetail: $passengerDetail, promoCoupon: $promoCoupon, totalAmount: $totalAmount, finalAmount: $finalAmount, preOrderDiscount: $preOrderDiscount, unitPriceResponse: $unitPriceResponse, discountPrice: $discountPrice, preOrderDiscountBreakup: $preOrderDiscountBreakup, loyaltyPotentialPoint: $loyaltyPotentialPoint, collectionPoint: $collectionPoint, store: $store, isOrderPushed: $isOrderPushed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DutyfreeDetail &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.airportCode, airportCode) ||
                other.airportCode == airportCode) &&
            const DeepCollectionEquality()
                .equals(other.itemDetails, itemDetails) &&
            const DeepCollectionEquality()
                .equals(other.passengerDetail, passengerDetail) &&
            (identical(other.promoCoupon, promoCoupon) ||
                other.promoCoupon == promoCoupon) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.finalAmount, finalAmount) ||
                other.finalAmount == finalAmount) &&
            (identical(other.preOrderDiscount, preOrderDiscount) ||
                other.preOrderDiscount == preOrderDiscount) &&
            (identical(other.unitPriceResponse, unitPriceResponse) ||
                other.unitPriceResponse == unitPriceResponse) &&
            (identical(other.discountPrice, discountPrice) ||
                other.discountPrice == discountPrice) &&
            const DeepCollectionEquality().equals(
                other.preOrderDiscountBreakup, preOrderDiscountBreakup) &&
            (identical(other.loyaltyPotentialPoint, loyaltyPotentialPoint) ||
                other.loyaltyPotentialPoint == loyaltyPotentialPoint) &&
            (identical(other.collectionPoint, collectionPoint) ||
                other.collectionPoint == collectionPoint) &&
            const DeepCollectionEquality().equals(other.store, store) &&
            (identical(other.isOrderPushed, isOrderPushed) ||
                other.isOrderPushed == isOrderPushed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      customerId,
      airportCode,
      const DeepCollectionEquality().hash(itemDetails),
      const DeepCollectionEquality().hash(passengerDetail),
      promoCoupon,
      totalAmount,
      finalAmount,
      preOrderDiscount,
      unitPriceResponse,
      discountPrice,
      const DeepCollectionEquality().hash(preOrderDiscountBreakup),
      loyaltyPotentialPoint,
      collectionPoint,
      const DeepCollectionEquality().hash(store),
      isOrderPushed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DutyfreeDetailCopyWith<_$_DutyfreeDetail> get copyWith =>
      __$$_DutyfreeDetailCopyWithImpl<_$_DutyfreeDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DutyfreeDetailToJson(
      this,
    );
  }
}

abstract class _DutyfreeDetail implements DutyfreeDetail {
  const factory _DutyfreeDetail(
      {final String? id,
      final String? customerId,
      final String? airportCode,
      final List<DutyFreeCancelOrderSKUDetails> itemDetails,
      final List<PassengerDetailsResponse> passengerDetail,
      final PromoCodeResponse promoCoupon,
      final DiscountPrice? totalAmount,
      final DiscountPrice? finalAmount,
      final PreOrderDiscount? preOrderDiscount,
      final DiscountPrice? unitPriceResponse,
      final DiscountPrice? discountPrice,
      final List<PreOrderDiscountBreakup>? preOrderDiscountBreakup,
      final num? loyaltyPotentialPoint,
      final String? collectionPoint,
      final dynamic store,
      final bool? isOrderPushed}) = _$_DutyfreeDetail;

  factory _DutyfreeDetail.fromJson(Map<String, dynamic> json) =
      _$_DutyfreeDetail.fromJson;

  @override
  String? get id;
  @override
  String? get customerId;
  @override
  String? get airportCode;
  @override
  List<DutyFreeCancelOrderSKUDetails> get itemDetails;
  @override
  List<PassengerDetailsResponse> get passengerDetail;
  @override
  PromoCodeResponse get promoCoupon;
  @override // List<PassengerDetail>? passengerDetail,
  DiscountPrice? get totalAmount;
  @override
  DiscountPrice? get finalAmount;
  @override
  PreOrderDiscount? get preOrderDiscount;
  @override
  DiscountPrice? get unitPriceResponse;
  @override
  DiscountPrice? get discountPrice;
  @override
  List<PreOrderDiscountBreakup>? get preOrderDiscountBreakup;
  @override
  num? get loyaltyPotentialPoint;
  @override
  String? get collectionPoint;
  @override
  dynamic get store;
  @override
  bool? get isOrderPushed;
  @override
  @JsonKey(ignore: true)
  _$$_DutyfreeDetailCopyWith<_$_DutyfreeDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

PreOrderDiscount _$PreOrderDiscountFromJson(Map<String, dynamic> json) {
  return _PreOrderDiscount.fromJson(json);
}

/// @nodoc
mixin _$PreOrderDiscount {
  num? get amount => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  num? get percentageDiscount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PreOrderDiscountCopyWith<PreOrderDiscount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreOrderDiscountCopyWith<$Res> {
  factory $PreOrderDiscountCopyWith(
          PreOrderDiscount value, $Res Function(PreOrderDiscount) then) =
      _$PreOrderDiscountCopyWithImpl<$Res, PreOrderDiscount>;
  @useResult
  $Res call({num? amount, String? currency, num? percentageDiscount});
}

/// @nodoc
class _$PreOrderDiscountCopyWithImpl<$Res, $Val extends PreOrderDiscount>
    implements $PreOrderDiscountCopyWith<$Res> {
  _$PreOrderDiscountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? currency = freezed,
    Object? percentageDiscount = freezed,
  }) {
    return _then(_value.copyWith(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      percentageDiscount: freezed == percentageDiscount
          ? _value.percentageDiscount
          : percentageDiscount // ignore: cast_nullable_to_non_nullable
              as num?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PreOrderDiscountCopyWith<$Res>
    implements $PreOrderDiscountCopyWith<$Res> {
  factory _$$_PreOrderDiscountCopyWith(
          _$_PreOrderDiscount value, $Res Function(_$_PreOrderDiscount) then) =
      __$$_PreOrderDiscountCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({num? amount, String? currency, num? percentageDiscount});
}

/// @nodoc
class __$$_PreOrderDiscountCopyWithImpl<$Res>
    extends _$PreOrderDiscountCopyWithImpl<$Res, _$_PreOrderDiscount>
    implements _$$_PreOrderDiscountCopyWith<$Res> {
  __$$_PreOrderDiscountCopyWithImpl(
      _$_PreOrderDiscount _value, $Res Function(_$_PreOrderDiscount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? currency = freezed,
    Object? percentageDiscount = freezed,
  }) {
    return _then(_$_PreOrderDiscount(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      percentageDiscount: freezed == percentageDiscount
          ? _value.percentageDiscount
          : percentageDiscount // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PreOrderDiscount implements _PreOrderDiscount {
  const _$_PreOrderDiscount(
      {this.amount, this.currency, this.percentageDiscount});

  factory _$_PreOrderDiscount.fromJson(Map<String, dynamic> json) =>
      _$$_PreOrderDiscountFromJson(json);

  @override
  final num? amount;
  @override
  final String? currency;
  @override
  final num? percentageDiscount;

  @override
  String toString() {
    return 'PreOrderDiscount(amount: $amount, currency: $currency, percentageDiscount: $percentageDiscount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PreOrderDiscount &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.percentageDiscount, percentageDiscount) ||
                other.percentageDiscount == percentageDiscount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, amount, currency, percentageDiscount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PreOrderDiscountCopyWith<_$_PreOrderDiscount> get copyWith =>
      __$$_PreOrderDiscountCopyWithImpl<_$_PreOrderDiscount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PreOrderDiscountToJson(
      this,
    );
  }
}

abstract class _PreOrderDiscount implements PreOrderDiscount {
  const factory _PreOrderDiscount(
      {final num? amount,
      final String? currency,
      final num? percentageDiscount}) = _$_PreOrderDiscount;

  factory _PreOrderDiscount.fromJson(Map<String, dynamic> json) =
      _$_PreOrderDiscount.fromJson;

  @override
  num? get amount;
  @override
  String? get currency;
  @override
  num? get percentageDiscount;
  @override
  @JsonKey(ignore: true)
  _$$_PreOrderDiscountCopyWith<_$_PreOrderDiscount> get copyWith =>
      throw _privateConstructorUsedError;
}

DiscountPrice _$DiscountPriceFromJson(Map<String, dynamic> json) {
  return _DiscountPrice.fromJson(json);
}

/// @nodoc
mixin _$DiscountPrice {
  double? get amount => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiscountPriceCopyWith<DiscountPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscountPriceCopyWith<$Res> {
  factory $DiscountPriceCopyWith(
          DiscountPrice value, $Res Function(DiscountPrice) then) =
      _$DiscountPriceCopyWithImpl<$Res, DiscountPrice>;
  @useResult
  $Res call({double? amount, String? currency});
}

/// @nodoc
class _$DiscountPriceCopyWithImpl<$Res, $Val extends DiscountPrice>
    implements $DiscountPriceCopyWith<$Res> {
  _$DiscountPriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? currency = freezed,
  }) {
    return _then(_value.copyWith(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DiscountPriceCopyWith<$Res>
    implements $DiscountPriceCopyWith<$Res> {
  factory _$$_DiscountPriceCopyWith(
          _$_DiscountPrice value, $Res Function(_$_DiscountPrice) then) =
      __$$_DiscountPriceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? amount, String? currency});
}

/// @nodoc
class __$$_DiscountPriceCopyWithImpl<$Res>
    extends _$DiscountPriceCopyWithImpl<$Res, _$_DiscountPrice>
    implements _$$_DiscountPriceCopyWith<$Res> {
  __$$_DiscountPriceCopyWithImpl(
      _$_DiscountPrice _value, $Res Function(_$_DiscountPrice) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? currency = freezed,
  }) {
    return _then(_$_DiscountPrice(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DiscountPrice implements _DiscountPrice {
  const _$_DiscountPrice({this.amount, this.currency});

  factory _$_DiscountPrice.fromJson(Map<String, dynamic> json) =>
      _$$_DiscountPriceFromJson(json);

  @override
  final double? amount;
  @override
  final String? currency;

  @override
  String toString() {
    return 'DiscountPrice(amount: $amount, currency: $currency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiscountPrice &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount, currency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiscountPriceCopyWith<_$_DiscountPrice> get copyWith =>
      __$$_DiscountPriceCopyWithImpl<_$_DiscountPrice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiscountPriceToJson(
      this,
    );
  }
}

abstract class _DiscountPrice implements DiscountPrice {
  const factory _DiscountPrice({final double? amount, final String? currency}) =
      _$_DiscountPrice;

  factory _DiscountPrice.fromJson(Map<String, dynamic> json) =
      _$_DiscountPrice.fromJson;

  @override
  double? get amount;
  @override
  String? get currency;
  @override
  @JsonKey(ignore: true)
  _$$_DiscountPriceCopyWith<_$_DiscountPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

ItemDetail _$ItemDetailFromJson(Map<String, dynamic> json) {
  return _ItemDetail.fromJson(json);
}

/// @nodoc
mixin _$ItemDetail {
  String? get bookingId => throw _privateConstructorUsedError;
  String? get storeType => throw _privateConstructorUsedError;
  String? get materialName => throw _privateConstructorUsedError;
  String? get categoryName => throw _privateConstructorUsedError;
  String? get subCategoryName => throw _privateConstructorUsedError;
  String? get brandName => throw _privateConstructorUsedError;
  String? get skuCode => throw _privateConstructorUsedError;
  String? get skuName => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  num? get unitPrice => throw _privateConstructorUsedError;
  num? get totalPrice => throw _privateConstructorUsedError;
  num? get discountedPrice => throw _privateConstructorUsedError;
  String? get productImage => throw _privateConstructorUsedError;
  Promotion? get promotion => throw _privateConstructorUsedError;
  String? get skuSize => throw _privateConstructorUsedError;
  String? get skuUnit => throw _privateConstructorUsedError;
  dynamic get skuStatus => throw _privateConstructorUsedError;
  String? get storeCode => throw _privateConstructorUsedError;
  dynamic get loyaltyOffer => throw _privateConstructorUsedError;
  num? get finalUnitPrice => throw _privateConstructorUsedError;
  num? get totalDiscountedPrice => throw _privateConstructorUsedError;
  num? get totalUnitPrice => throw _privateConstructorUsedError;
  double? get preOrderDiscount => throw _privateConstructorUsedError;
  bool? get inStock => throw _privateConstructorUsedError;
  int? get overheadStock => throw _privateConstructorUsedError;
  int? get availableStock => throw _privateConstructorUsedError;
  dynamic get potentialPromoText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemDetailCopyWith<ItemDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemDetailCopyWith<$Res> {
  factory $ItemDetailCopyWith(
          ItemDetail value, $Res Function(ItemDetail) then) =
      _$ItemDetailCopyWithImpl<$Res, ItemDetail>;
  @useResult
  $Res call(
      {String? bookingId,
      String? storeType,
      String? materialName,
      String? categoryName,
      String? subCategoryName,
      String? brandName,
      String? skuCode,
      String? skuName,
      int? quantity,
      num? unitPrice,
      num? totalPrice,
      num? discountedPrice,
      String? productImage,
      Promotion? promotion,
      String? skuSize,
      String? skuUnit,
      dynamic skuStatus,
      String? storeCode,
      dynamic loyaltyOffer,
      num? finalUnitPrice,
      num? totalDiscountedPrice,
      num? totalUnitPrice,
      double? preOrderDiscount,
      bool? inStock,
      int? overheadStock,
      int? availableStock,
      dynamic potentialPromoText});

  $PromotionCopyWith<$Res>? get promotion;
}

/// @nodoc
class _$ItemDetailCopyWithImpl<$Res, $Val extends ItemDetail>
    implements $ItemDetailCopyWith<$Res> {
  _$ItemDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = freezed,
    Object? storeType = freezed,
    Object? materialName = freezed,
    Object? categoryName = freezed,
    Object? subCategoryName = freezed,
    Object? brandName = freezed,
    Object? skuCode = freezed,
    Object? skuName = freezed,
    Object? quantity = freezed,
    Object? unitPrice = freezed,
    Object? totalPrice = freezed,
    Object? discountedPrice = freezed,
    Object? productImage = freezed,
    Object? promotion = freezed,
    Object? skuSize = freezed,
    Object? skuUnit = freezed,
    Object? skuStatus = freezed,
    Object? storeCode = freezed,
    Object? loyaltyOffer = freezed,
    Object? finalUnitPrice = freezed,
    Object? totalDiscountedPrice = freezed,
    Object? totalUnitPrice = freezed,
    Object? preOrderDiscount = freezed,
    Object? inStock = freezed,
    Object? overheadStock = freezed,
    Object? availableStock = freezed,
    Object? potentialPromoText = freezed,
  }) {
    return _then(_value.copyWith(
      bookingId: freezed == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String?,
      storeType: freezed == storeType
          ? _value.storeType
          : storeType // ignore: cast_nullable_to_non_nullable
              as String?,
      materialName: freezed == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      subCategoryName: freezed == subCategoryName
          ? _value.subCategoryName
          : subCategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      brandName: freezed == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String?,
      skuCode: freezed == skuCode
          ? _value.skuCode
          : skuCode // ignore: cast_nullable_to_non_nullable
              as String?,
      skuName: freezed == skuName
          ? _value.skuName
          : skuName // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      unitPrice: freezed == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as num?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as num?,
      discountedPrice: freezed == discountedPrice
          ? _value.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as num?,
      productImage: freezed == productImage
          ? _value.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String?,
      promotion: freezed == promotion
          ? _value.promotion
          : promotion // ignore: cast_nullable_to_non_nullable
              as Promotion?,
      skuSize: freezed == skuSize
          ? _value.skuSize
          : skuSize // ignore: cast_nullable_to_non_nullable
              as String?,
      skuUnit: freezed == skuUnit
          ? _value.skuUnit
          : skuUnit // ignore: cast_nullable_to_non_nullable
              as String?,
      skuStatus: freezed == skuStatus
          ? _value.skuStatus
          : skuStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      storeCode: freezed == storeCode
          ? _value.storeCode
          : storeCode // ignore: cast_nullable_to_non_nullable
              as String?,
      loyaltyOffer: freezed == loyaltyOffer
          ? _value.loyaltyOffer
          : loyaltyOffer // ignore: cast_nullable_to_non_nullable
              as dynamic,
      finalUnitPrice: freezed == finalUnitPrice
          ? _value.finalUnitPrice
          : finalUnitPrice // ignore: cast_nullable_to_non_nullable
              as num?,
      totalDiscountedPrice: freezed == totalDiscountedPrice
          ? _value.totalDiscountedPrice
          : totalDiscountedPrice // ignore: cast_nullable_to_non_nullable
              as num?,
      totalUnitPrice: freezed == totalUnitPrice
          ? _value.totalUnitPrice
          : totalUnitPrice // ignore: cast_nullable_to_non_nullable
              as num?,
      preOrderDiscount: freezed == preOrderDiscount
          ? _value.preOrderDiscount
          : preOrderDiscount // ignore: cast_nullable_to_non_nullable
              as double?,
      inStock: freezed == inStock
          ? _value.inStock
          : inStock // ignore: cast_nullable_to_non_nullable
              as bool?,
      overheadStock: freezed == overheadStock
          ? _value.overheadStock
          : overheadStock // ignore: cast_nullable_to_non_nullable
              as int?,
      availableStock: freezed == availableStock
          ? _value.availableStock
          : availableStock // ignore: cast_nullable_to_non_nullable
              as int?,
      potentialPromoText: freezed == potentialPromoText
          ? _value.potentialPromoText
          : potentialPromoText // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PromotionCopyWith<$Res>? get promotion {
    if (_value.promotion == null) {
      return null;
    }

    return $PromotionCopyWith<$Res>(_value.promotion!, (value) {
      return _then(_value.copyWith(promotion: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ItemDetailCopyWith<$Res>
    implements $ItemDetailCopyWith<$Res> {
  factory _$$_ItemDetailCopyWith(
          _$_ItemDetail value, $Res Function(_$_ItemDetail) then) =
      __$$_ItemDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? bookingId,
      String? storeType,
      String? materialName,
      String? categoryName,
      String? subCategoryName,
      String? brandName,
      String? skuCode,
      String? skuName,
      int? quantity,
      num? unitPrice,
      num? totalPrice,
      num? discountedPrice,
      String? productImage,
      Promotion? promotion,
      String? skuSize,
      String? skuUnit,
      dynamic skuStatus,
      String? storeCode,
      dynamic loyaltyOffer,
      num? finalUnitPrice,
      num? totalDiscountedPrice,
      num? totalUnitPrice,
      double? preOrderDiscount,
      bool? inStock,
      int? overheadStock,
      int? availableStock,
      dynamic potentialPromoText});

  @override
  $PromotionCopyWith<$Res>? get promotion;
}

/// @nodoc
class __$$_ItemDetailCopyWithImpl<$Res>
    extends _$ItemDetailCopyWithImpl<$Res, _$_ItemDetail>
    implements _$$_ItemDetailCopyWith<$Res> {
  __$$_ItemDetailCopyWithImpl(
      _$_ItemDetail _value, $Res Function(_$_ItemDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = freezed,
    Object? storeType = freezed,
    Object? materialName = freezed,
    Object? categoryName = freezed,
    Object? subCategoryName = freezed,
    Object? brandName = freezed,
    Object? skuCode = freezed,
    Object? skuName = freezed,
    Object? quantity = freezed,
    Object? unitPrice = freezed,
    Object? totalPrice = freezed,
    Object? discountedPrice = freezed,
    Object? productImage = freezed,
    Object? promotion = freezed,
    Object? skuSize = freezed,
    Object? skuUnit = freezed,
    Object? skuStatus = freezed,
    Object? storeCode = freezed,
    Object? loyaltyOffer = freezed,
    Object? finalUnitPrice = freezed,
    Object? totalDiscountedPrice = freezed,
    Object? totalUnitPrice = freezed,
    Object? preOrderDiscount = freezed,
    Object? inStock = freezed,
    Object? overheadStock = freezed,
    Object? availableStock = freezed,
    Object? potentialPromoText = freezed,
  }) {
    return _then(_$_ItemDetail(
      bookingId: freezed == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String?,
      storeType: freezed == storeType
          ? _value.storeType
          : storeType // ignore: cast_nullable_to_non_nullable
              as String?,
      materialName: freezed == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryName: freezed == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      subCategoryName: freezed == subCategoryName
          ? _value.subCategoryName
          : subCategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      brandName: freezed == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String?,
      skuCode: freezed == skuCode
          ? _value.skuCode
          : skuCode // ignore: cast_nullable_to_non_nullable
              as String?,
      skuName: freezed == skuName
          ? _value.skuName
          : skuName // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      unitPrice: freezed == unitPrice
          ? _value.unitPrice
          : unitPrice // ignore: cast_nullable_to_non_nullable
              as num?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as num?,
      discountedPrice: freezed == discountedPrice
          ? _value.discountedPrice
          : discountedPrice // ignore: cast_nullable_to_non_nullable
              as num?,
      productImage: freezed == productImage
          ? _value.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as String?,
      promotion: freezed == promotion
          ? _value.promotion
          : promotion // ignore: cast_nullable_to_non_nullable
              as Promotion?,
      skuSize: freezed == skuSize
          ? _value.skuSize
          : skuSize // ignore: cast_nullable_to_non_nullable
              as String?,
      skuUnit: freezed == skuUnit
          ? _value.skuUnit
          : skuUnit // ignore: cast_nullable_to_non_nullable
              as String?,
      skuStatus: freezed == skuStatus
          ? _value.skuStatus
          : skuStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      storeCode: freezed == storeCode
          ? _value.storeCode
          : storeCode // ignore: cast_nullable_to_non_nullable
              as String?,
      loyaltyOffer: freezed == loyaltyOffer
          ? _value.loyaltyOffer
          : loyaltyOffer // ignore: cast_nullable_to_non_nullable
              as dynamic,
      finalUnitPrice: freezed == finalUnitPrice
          ? _value.finalUnitPrice
          : finalUnitPrice // ignore: cast_nullable_to_non_nullable
              as num?,
      totalDiscountedPrice: freezed == totalDiscountedPrice
          ? _value.totalDiscountedPrice
          : totalDiscountedPrice // ignore: cast_nullable_to_non_nullable
              as num?,
      totalUnitPrice: freezed == totalUnitPrice
          ? _value.totalUnitPrice
          : totalUnitPrice // ignore: cast_nullable_to_non_nullable
              as num?,
      preOrderDiscount: freezed == preOrderDiscount
          ? _value.preOrderDiscount
          : preOrderDiscount // ignore: cast_nullable_to_non_nullable
              as double?,
      inStock: freezed == inStock
          ? _value.inStock
          : inStock // ignore: cast_nullable_to_non_nullable
              as bool?,
      overheadStock: freezed == overheadStock
          ? _value.overheadStock
          : overheadStock // ignore: cast_nullable_to_non_nullable
              as int?,
      availableStock: freezed == availableStock
          ? _value.availableStock
          : availableStock // ignore: cast_nullable_to_non_nullable
              as int?,
      potentialPromoText: freezed == potentialPromoText
          ? _value.potentialPromoText
          : potentialPromoText // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ItemDetail implements _ItemDetail {
  const _$_ItemDetail(
      {this.bookingId,
      this.storeType,
      this.materialName,
      this.categoryName,
      this.subCategoryName,
      this.brandName,
      this.skuCode,
      this.skuName,
      this.quantity,
      this.unitPrice,
      this.totalPrice,
      this.discountedPrice,
      this.productImage,
      this.promotion,
      this.skuSize,
      this.skuUnit,
      this.skuStatus,
      this.storeCode,
      this.loyaltyOffer,
      this.finalUnitPrice,
      this.totalDiscountedPrice,
      this.totalUnitPrice,
      this.preOrderDiscount,
      this.inStock,
      this.overheadStock,
      this.availableStock,
      this.potentialPromoText});

  factory _$_ItemDetail.fromJson(Map<String, dynamic> json) =>
      _$$_ItemDetailFromJson(json);

  @override
  final String? bookingId;
  @override
  final String? storeType;
  @override
  final String? materialName;
  @override
  final String? categoryName;
  @override
  final String? subCategoryName;
  @override
  final String? brandName;
  @override
  final String? skuCode;
  @override
  final String? skuName;
  @override
  final int? quantity;
  @override
  final num? unitPrice;
  @override
  final num? totalPrice;
  @override
  final num? discountedPrice;
  @override
  final String? productImage;
  @override
  final Promotion? promotion;
  @override
  final String? skuSize;
  @override
  final String? skuUnit;
  @override
  final dynamic skuStatus;
  @override
  final String? storeCode;
  @override
  final dynamic loyaltyOffer;
  @override
  final num? finalUnitPrice;
  @override
  final num? totalDiscountedPrice;
  @override
  final num? totalUnitPrice;
  @override
  final double? preOrderDiscount;
  @override
  final bool? inStock;
  @override
  final int? overheadStock;
  @override
  final int? availableStock;
  @override
  final dynamic potentialPromoText;

  @override
  String toString() {
    return 'ItemDetail(bookingId: $bookingId, storeType: $storeType, materialName: $materialName, categoryName: $categoryName, subCategoryName: $subCategoryName, brandName: $brandName, skuCode: $skuCode, skuName: $skuName, quantity: $quantity, unitPrice: $unitPrice, totalPrice: $totalPrice, discountedPrice: $discountedPrice, productImage: $productImage, promotion: $promotion, skuSize: $skuSize, skuUnit: $skuUnit, skuStatus: $skuStatus, storeCode: $storeCode, loyaltyOffer: $loyaltyOffer, finalUnitPrice: $finalUnitPrice, totalDiscountedPrice: $totalDiscountedPrice, totalUnitPrice: $totalUnitPrice, preOrderDiscount: $preOrderDiscount, inStock: $inStock, overheadStock: $overheadStock, availableStock: $availableStock, potentialPromoText: $potentialPromoText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemDetail &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.storeType, storeType) ||
                other.storeType == storeType) &&
            (identical(other.materialName, materialName) ||
                other.materialName == materialName) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.subCategoryName, subCategoryName) ||
                other.subCategoryName == subCategoryName) &&
            (identical(other.brandName, brandName) ||
                other.brandName == brandName) &&
            (identical(other.skuCode, skuCode) || other.skuCode == skuCode) &&
            (identical(other.skuName, skuName) || other.skuName == skuName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitPrice, unitPrice) ||
                other.unitPrice == unitPrice) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.discountedPrice, discountedPrice) ||
                other.discountedPrice == discountedPrice) &&
            (identical(other.productImage, productImage) ||
                other.productImage == productImage) &&
            (identical(other.promotion, promotion) ||
                other.promotion == promotion) &&
            (identical(other.skuSize, skuSize) || other.skuSize == skuSize) &&
            (identical(other.skuUnit, skuUnit) || other.skuUnit == skuUnit) &&
            const DeepCollectionEquality().equals(other.skuStatus, skuStatus) &&
            (identical(other.storeCode, storeCode) ||
                other.storeCode == storeCode) &&
            const DeepCollectionEquality()
                .equals(other.loyaltyOffer, loyaltyOffer) &&
            (identical(other.finalUnitPrice, finalUnitPrice) ||
                other.finalUnitPrice == finalUnitPrice) &&
            (identical(other.totalDiscountedPrice, totalDiscountedPrice) ||
                other.totalDiscountedPrice == totalDiscountedPrice) &&
            (identical(other.totalUnitPrice, totalUnitPrice) ||
                other.totalUnitPrice == totalUnitPrice) &&
            (identical(other.preOrderDiscount, preOrderDiscount) ||
                other.preOrderDiscount == preOrderDiscount) &&
            (identical(other.inStock, inStock) || other.inStock == inStock) &&
            (identical(other.overheadStock, overheadStock) ||
                other.overheadStock == overheadStock) &&
            (identical(other.availableStock, availableStock) ||
                other.availableStock == availableStock) &&
            const DeepCollectionEquality()
                .equals(other.potentialPromoText, potentialPromoText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        bookingId,
        storeType,
        materialName,
        categoryName,
        subCategoryName,
        brandName,
        skuCode,
        skuName,
        quantity,
        unitPrice,
        totalPrice,
        discountedPrice,
        productImage,
        promotion,
        skuSize,
        skuUnit,
        const DeepCollectionEquality().hash(skuStatus),
        storeCode,
        const DeepCollectionEquality().hash(loyaltyOffer),
        finalUnitPrice,
        totalDiscountedPrice,
        totalUnitPrice,
        preOrderDiscount,
        inStock,
        overheadStock,
        availableStock,
        const DeepCollectionEquality().hash(potentialPromoText)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemDetailCopyWith<_$_ItemDetail> get copyWith =>
      __$$_ItemDetailCopyWithImpl<_$_ItemDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemDetailToJson(
      this,
    );
  }
}

abstract class _ItemDetail implements ItemDetail {
  const factory _ItemDetail(
      {final String? bookingId,
      final String? storeType,
      final String? materialName,
      final String? categoryName,
      final String? subCategoryName,
      final String? brandName,
      final String? skuCode,
      final String? skuName,
      final int? quantity,
      final num? unitPrice,
      final num? totalPrice,
      final num? discountedPrice,
      final String? productImage,
      final Promotion? promotion,
      final String? skuSize,
      final String? skuUnit,
      final dynamic skuStatus,
      final String? storeCode,
      final dynamic loyaltyOffer,
      final num? finalUnitPrice,
      final num? totalDiscountedPrice,
      final num? totalUnitPrice,
      final double? preOrderDiscount,
      final bool? inStock,
      final int? overheadStock,
      final int? availableStock,
      final dynamic potentialPromoText}) = _$_ItemDetail;

  factory _ItemDetail.fromJson(Map<String, dynamic> json) =
      _$_ItemDetail.fromJson;

  @override
  String? get bookingId;
  @override
  String? get storeType;
  @override
  String? get materialName;
  @override
  String? get categoryName;
  @override
  String? get subCategoryName;
  @override
  String? get brandName;
  @override
  String? get skuCode;
  @override
  String? get skuName;
  @override
  int? get quantity;
  @override
  num? get unitPrice;
  @override
  num? get totalPrice;
  @override
  num? get discountedPrice;
  @override
  String? get productImage;
  @override
  Promotion? get promotion;
  @override
  String? get skuSize;
  @override
  String? get skuUnit;
  @override
  dynamic get skuStatus;
  @override
  String? get storeCode;
  @override
  dynamic get loyaltyOffer;
  @override
  num? get finalUnitPrice;
  @override
  num? get totalDiscountedPrice;
  @override
  num? get totalUnitPrice;
  @override
  double? get preOrderDiscount;
  @override
  bool? get inStock;
  @override
  int? get overheadStock;
  @override
  int? get availableStock;
  @override
  dynamic get potentialPromoText;
  @override
  @JsonKey(ignore: true)
  _$$_ItemDetailCopyWith<_$_ItemDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

Promotion _$PromotionFromJson(Map<String, dynamic> json) {
  return _Promotion.fromJson(json);
}

/// @nodoc
mixin _$Promotion {
  int? get promotionType => throw _privateConstructorUsedError;
  int? get promotionQty => throw _privateConstructorUsedError;
  String? get promotionCode => throw _privateConstructorUsedError;
  num? get offer => throw _privateConstructorUsedError;
  dynamic get offerText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PromotionCopyWith<Promotion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromotionCopyWith<$Res> {
  factory $PromotionCopyWith(Promotion value, $Res Function(Promotion) then) =
      _$PromotionCopyWithImpl<$Res, Promotion>;
  @useResult
  $Res call(
      {int? promotionType,
      int? promotionQty,
      String? promotionCode,
      num? offer,
      dynamic offerText});
}

/// @nodoc
class _$PromotionCopyWithImpl<$Res, $Val extends Promotion>
    implements $PromotionCopyWith<$Res> {
  _$PromotionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promotionType = freezed,
    Object? promotionQty = freezed,
    Object? promotionCode = freezed,
    Object? offer = freezed,
    Object? offerText = freezed,
  }) {
    return _then(_value.copyWith(
      promotionType: freezed == promotionType
          ? _value.promotionType
          : promotionType // ignore: cast_nullable_to_non_nullable
              as int?,
      promotionQty: freezed == promotionQty
          ? _value.promotionQty
          : promotionQty // ignore: cast_nullable_to_non_nullable
              as int?,
      promotionCode: freezed == promotionCode
          ? _value.promotionCode
          : promotionCode // ignore: cast_nullable_to_non_nullable
              as String?,
      offer: freezed == offer
          ? _value.offer
          : offer // ignore: cast_nullable_to_non_nullable
              as num?,
      offerText: freezed == offerText
          ? _value.offerText
          : offerText // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PromotionCopyWith<$Res> implements $PromotionCopyWith<$Res> {
  factory _$$_PromotionCopyWith(
          _$_Promotion value, $Res Function(_$_Promotion) then) =
      __$$_PromotionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? promotionType,
      int? promotionQty,
      String? promotionCode,
      num? offer,
      dynamic offerText});
}

/// @nodoc
class __$$_PromotionCopyWithImpl<$Res>
    extends _$PromotionCopyWithImpl<$Res, _$_Promotion>
    implements _$$_PromotionCopyWith<$Res> {
  __$$_PromotionCopyWithImpl(
      _$_Promotion _value, $Res Function(_$_Promotion) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promotionType = freezed,
    Object? promotionQty = freezed,
    Object? promotionCode = freezed,
    Object? offer = freezed,
    Object? offerText = freezed,
  }) {
    return _then(_$_Promotion(
      promotionType: freezed == promotionType
          ? _value.promotionType
          : promotionType // ignore: cast_nullable_to_non_nullable
              as int?,
      promotionQty: freezed == promotionQty
          ? _value.promotionQty
          : promotionQty // ignore: cast_nullable_to_non_nullable
              as int?,
      promotionCode: freezed == promotionCode
          ? _value.promotionCode
          : promotionCode // ignore: cast_nullable_to_non_nullable
              as String?,
      offer: freezed == offer
          ? _value.offer
          : offer // ignore: cast_nullable_to_non_nullable
              as num?,
      offerText: freezed == offerText
          ? _value.offerText
          : offerText // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Promotion implements _Promotion {
  const _$_Promotion(
      {this.promotionType,
      this.promotionQty,
      this.promotionCode,
      this.offer,
      this.offerText});

  factory _$_Promotion.fromJson(Map<String, dynamic> json) =>
      _$$_PromotionFromJson(json);

  @override
  final int? promotionType;
  @override
  final int? promotionQty;
  @override
  final String? promotionCode;
  @override
  final num? offer;
  @override
  final dynamic offerText;

  @override
  String toString() {
    return 'Promotion(promotionType: $promotionType, promotionQty: $promotionQty, promotionCode: $promotionCode, offer: $offer, offerText: $offerText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Promotion &&
            (identical(other.promotionType, promotionType) ||
                other.promotionType == promotionType) &&
            (identical(other.promotionQty, promotionQty) ||
                other.promotionQty == promotionQty) &&
            (identical(other.promotionCode, promotionCode) ||
                other.promotionCode == promotionCode) &&
            (identical(other.offer, offer) || other.offer == offer) &&
            const DeepCollectionEquality().equals(other.offerText, offerText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, promotionType, promotionQty,
      promotionCode, offer, const DeepCollectionEquality().hash(offerText));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PromotionCopyWith<_$_Promotion> get copyWith =>
      __$$_PromotionCopyWithImpl<_$_Promotion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PromotionToJson(
      this,
    );
  }
}

abstract class _Promotion implements Promotion {
  const factory _Promotion(
      {final int? promotionType,
      final int? promotionQty,
      final String? promotionCode,
      final num? offer,
      final dynamic offerText}) = _$_Promotion;

  factory _Promotion.fromJson(Map<String, dynamic> json) =
      _$_Promotion.fromJson;

  @override
  int? get promotionType;
  @override
  int? get promotionQty;
  @override
  String? get promotionCode;
  @override
  num? get offer;
  @override
  dynamic get offerText;
  @override
  @JsonKey(ignore: true)
  _$$_PromotionCopyWith<_$_Promotion> get copyWith =>
      throw _privateConstructorUsedError;
}

PassengerDetail _$PassengerDetailFromJson(Map<String, dynamic> json) {
  return _PassengerDetail.fromJson(json);
}

/// @nodoc
mixin _$PassengerDetail {
  dynamic get customerId => throw _privateConstructorUsedError;
  String? get customerName => throw _privateConstructorUsedError;
  String? get passportNumber => throw _privateConstructorUsedError;
  String? get customerPassportExpiry => throw _privateConstructorUsedError;
  String? get flightNo => throw _privateConstructorUsedError;
  String? get flightTime => throw _privateConstructorUsedError;
  String? get pickupDate => throw _privateConstructorUsedError;
  String? get pickupTime => throw _privateConstructorUsedError;
  String? get mobile => throw _privateConstructorUsedError;
  String? get emailId => throw _privateConstructorUsedError;
  String? get countryCode => throw _privateConstructorUsedError;
  String? get countryName => throw _privateConstructorUsedError;
  String? get customerDob => throw _privateConstructorUsedError;
  String? get countryDialCode => throw _privateConstructorUsedError;
  bool? get isPassenger => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PassengerDetailCopyWith<PassengerDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PassengerDetailCopyWith<$Res> {
  factory $PassengerDetailCopyWith(
          PassengerDetail value, $Res Function(PassengerDetail) then) =
      _$PassengerDetailCopyWithImpl<$Res, PassengerDetail>;
  @useResult
  $Res call(
      {dynamic customerId,
      String? customerName,
      String? passportNumber,
      String? customerPassportExpiry,
      String? flightNo,
      String? flightTime,
      String? pickupDate,
      String? pickupTime,
      String? mobile,
      String? emailId,
      String? countryCode,
      String? countryName,
      String? customerDob,
      String? countryDialCode,
      bool? isPassenger});
}

/// @nodoc
class _$PassengerDetailCopyWithImpl<$Res, $Val extends PassengerDetail>
    implements $PassengerDetailCopyWith<$Res> {
  _$PassengerDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = freezed,
    Object? customerName = freezed,
    Object? passportNumber = freezed,
    Object? customerPassportExpiry = freezed,
    Object? flightNo = freezed,
    Object? flightTime = freezed,
    Object? pickupDate = freezed,
    Object? pickupTime = freezed,
    Object? mobile = freezed,
    Object? emailId = freezed,
    Object? countryCode = freezed,
    Object? countryName = freezed,
    Object? customerDob = freezed,
    Object? countryDialCode = freezed,
    Object? isPassenger = freezed,
  }) {
    return _then(_value.copyWith(
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      passportNumber: freezed == passportNumber
          ? _value.passportNumber
          : passportNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      customerPassportExpiry: freezed == customerPassportExpiry
          ? _value.customerPassportExpiry
          : customerPassportExpiry // ignore: cast_nullable_to_non_nullable
              as String?,
      flightNo: freezed == flightNo
          ? _value.flightNo
          : flightNo // ignore: cast_nullable_to_non_nullable
              as String?,
      flightTime: freezed == flightTime
          ? _value.flightTime
          : flightTime // ignore: cast_nullable_to_non_nullable
              as String?,
      pickupDate: freezed == pickupDate
          ? _value.pickupDate
          : pickupDate // ignore: cast_nullable_to_non_nullable
              as String?,
      pickupTime: freezed == pickupTime
          ? _value.pickupTime
          : pickupTime // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      emailId: freezed == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      countryName: freezed == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String?,
      customerDob: freezed == customerDob
          ? _value.customerDob
          : customerDob // ignore: cast_nullable_to_non_nullable
              as String?,
      countryDialCode: freezed == countryDialCode
          ? _value.countryDialCode
          : countryDialCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isPassenger: freezed == isPassenger
          ? _value.isPassenger
          : isPassenger // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PassengerDetailCopyWith<$Res>
    implements $PassengerDetailCopyWith<$Res> {
  factory _$$_PassengerDetailCopyWith(
          _$_PassengerDetail value, $Res Function(_$_PassengerDetail) then) =
      __$$_PassengerDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic customerId,
      String? customerName,
      String? passportNumber,
      String? customerPassportExpiry,
      String? flightNo,
      String? flightTime,
      String? pickupDate,
      String? pickupTime,
      String? mobile,
      String? emailId,
      String? countryCode,
      String? countryName,
      String? customerDob,
      String? countryDialCode,
      bool? isPassenger});
}

/// @nodoc
class __$$_PassengerDetailCopyWithImpl<$Res>
    extends _$PassengerDetailCopyWithImpl<$Res, _$_PassengerDetail>
    implements _$$_PassengerDetailCopyWith<$Res> {
  __$$_PassengerDetailCopyWithImpl(
      _$_PassengerDetail _value, $Res Function(_$_PassengerDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = freezed,
    Object? customerName = freezed,
    Object? passportNumber = freezed,
    Object? customerPassportExpiry = freezed,
    Object? flightNo = freezed,
    Object? flightTime = freezed,
    Object? pickupDate = freezed,
    Object? pickupTime = freezed,
    Object? mobile = freezed,
    Object? emailId = freezed,
    Object? countryCode = freezed,
    Object? countryName = freezed,
    Object? customerDob = freezed,
    Object? countryDialCode = freezed,
    Object? isPassenger = freezed,
  }) {
    return _then(_$_PassengerDetail(
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      passportNumber: freezed == passportNumber
          ? _value.passportNumber
          : passportNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      customerPassportExpiry: freezed == customerPassportExpiry
          ? _value.customerPassportExpiry
          : customerPassportExpiry // ignore: cast_nullable_to_non_nullable
              as String?,
      flightNo: freezed == flightNo
          ? _value.flightNo
          : flightNo // ignore: cast_nullable_to_non_nullable
              as String?,
      flightTime: freezed == flightTime
          ? _value.flightTime
          : flightTime // ignore: cast_nullable_to_non_nullable
              as String?,
      pickupDate: freezed == pickupDate
          ? _value.pickupDate
          : pickupDate // ignore: cast_nullable_to_non_nullable
              as String?,
      pickupTime: freezed == pickupTime
          ? _value.pickupTime
          : pickupTime // ignore: cast_nullable_to_non_nullable
              as String?,
      mobile: freezed == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String?,
      emailId: freezed == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      countryName: freezed == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String?,
      customerDob: freezed == customerDob
          ? _value.customerDob
          : customerDob // ignore: cast_nullable_to_non_nullable
              as String?,
      countryDialCode: freezed == countryDialCode
          ? _value.countryDialCode
          : countryDialCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isPassenger: freezed == isPassenger
          ? _value.isPassenger
          : isPassenger // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PassengerDetail implements _PassengerDetail {
  const _$_PassengerDetail(
      {this.customerId,
      this.customerName,
      this.passportNumber,
      this.customerPassportExpiry,
      this.flightNo,
      this.flightTime,
      this.pickupDate,
      this.pickupTime,
      this.mobile,
      this.emailId,
      this.countryCode,
      this.countryName,
      this.customerDob,
      this.countryDialCode,
      this.isPassenger});

  factory _$_PassengerDetail.fromJson(Map<String, dynamic> json) =>
      _$$_PassengerDetailFromJson(json);

  @override
  final dynamic customerId;
  @override
  final String? customerName;
  @override
  final String? passportNumber;
  @override
  final String? customerPassportExpiry;
  @override
  final String? flightNo;
  @override
  final String? flightTime;
  @override
  final String? pickupDate;
  @override
  final String? pickupTime;
  @override
  final String? mobile;
  @override
  final String? emailId;
  @override
  final String? countryCode;
  @override
  final String? countryName;
  @override
  final String? customerDob;
  @override
  final String? countryDialCode;
  @override
  final bool? isPassenger;

  @override
  String toString() {
    return 'PassengerDetail(customerId: $customerId, customerName: $customerName, passportNumber: $passportNumber, customerPassportExpiry: $customerPassportExpiry, flightNo: $flightNo, flightTime: $flightTime, pickupDate: $pickupDate, pickupTime: $pickupTime, mobile: $mobile, emailId: $emailId, countryCode: $countryCode, countryName: $countryName, customerDob: $customerDob, countryDialCode: $countryDialCode, isPassenger: $isPassenger)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PassengerDetail &&
            const DeepCollectionEquality()
                .equals(other.customerId, customerId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.passportNumber, passportNumber) ||
                other.passportNumber == passportNumber) &&
            (identical(other.customerPassportExpiry, customerPassportExpiry) ||
                other.customerPassportExpiry == customerPassportExpiry) &&
            (identical(other.flightNo, flightNo) ||
                other.flightNo == flightNo) &&
            (identical(other.flightTime, flightTime) ||
                other.flightTime == flightTime) &&
            (identical(other.pickupDate, pickupDate) ||
                other.pickupDate == pickupDate) &&
            (identical(other.pickupTime, pickupTime) ||
                other.pickupTime == pickupTime) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.emailId, emailId) || other.emailId == emailId) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName) &&
            (identical(other.customerDob, customerDob) ||
                other.customerDob == customerDob) &&
            (identical(other.countryDialCode, countryDialCode) ||
                other.countryDialCode == countryDialCode) &&
            (identical(other.isPassenger, isPassenger) ||
                other.isPassenger == isPassenger));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(customerId),
      customerName,
      passportNumber,
      customerPassportExpiry,
      flightNo,
      flightTime,
      pickupDate,
      pickupTime,
      mobile,
      emailId,
      countryCode,
      countryName,
      customerDob,
      countryDialCode,
      isPassenger);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PassengerDetailCopyWith<_$_PassengerDetail> get copyWith =>
      __$$_PassengerDetailCopyWithImpl<_$_PassengerDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PassengerDetailToJson(
      this,
    );
  }
}

abstract class _PassengerDetail implements PassengerDetail {
  const factory _PassengerDetail(
      {final dynamic customerId,
      final String? customerName,
      final String? passportNumber,
      final String? customerPassportExpiry,
      final String? flightNo,
      final String? flightTime,
      final String? pickupDate,
      final String? pickupTime,
      final String? mobile,
      final String? emailId,
      final String? countryCode,
      final String? countryName,
      final String? customerDob,
      final String? countryDialCode,
      final bool? isPassenger}) = _$_PassengerDetail;

  factory _PassengerDetail.fromJson(Map<String, dynamic> json) =
      _$_PassengerDetail.fromJson;

  @override
  dynamic get customerId;
  @override
  String? get customerName;
  @override
  String? get passportNumber;
  @override
  String? get customerPassportExpiry;
  @override
  String? get flightNo;
  @override
  String? get flightTime;
  @override
  String? get pickupDate;
  @override
  String? get pickupTime;
  @override
  String? get mobile;
  @override
  String? get emailId;
  @override
  String? get countryCode;
  @override
  String? get countryName;
  @override
  String? get customerDob;
  @override
  String? get countryDialCode;
  @override
  bool? get isPassenger;
  @override
  @JsonKey(ignore: true)
  _$$_PassengerDetailCopyWith<_$_PassengerDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

DutyFreeCancelOrderDetailsStatusHistory
    _$DutyFreeCancelOrderDetailsStatusHistoryFromJson(
        Map<String, dynamic> json) {
  return _DutyFreeCancelOrderDetailsStatusHistory.fromJson(json);
}

/// @nodoc
mixin _$DutyFreeCancelOrderDetailsStatusHistory {
  String? get status => throw _privateConstructorUsedError;
  DateTime? get createdOn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DutyFreeCancelOrderDetailsStatusHistoryCopyWith<
          DutyFreeCancelOrderDetailsStatusHistory>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DutyFreeCancelOrderDetailsStatusHistoryCopyWith<$Res> {
  factory $DutyFreeCancelOrderDetailsStatusHistoryCopyWith(
          DutyFreeCancelOrderDetailsStatusHistory value,
          $Res Function(DutyFreeCancelOrderDetailsStatusHistory) then) =
      _$DutyFreeCancelOrderDetailsStatusHistoryCopyWithImpl<$Res,
          DutyFreeCancelOrderDetailsStatusHistory>;
  @useResult
  $Res call({String? status, DateTime? createdOn});
}

/// @nodoc
class _$DutyFreeCancelOrderDetailsStatusHistoryCopyWithImpl<$Res,
        $Val extends DutyFreeCancelOrderDetailsStatusHistory>
    implements $DutyFreeCancelOrderDetailsStatusHistoryCopyWith<$Res> {
  _$DutyFreeCancelOrderDetailsStatusHistoryCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? createdOn = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdOn: freezed == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DutyFreeCancelOrderDetailsStatusHistoryCopyWith<$Res>
    implements $DutyFreeCancelOrderDetailsStatusHistoryCopyWith<$Res> {
  factory _$$_DutyFreeCancelOrderDetailsStatusHistoryCopyWith(
          _$_DutyFreeCancelOrderDetailsStatusHistory value,
          $Res Function(_$_DutyFreeCancelOrderDetailsStatusHistory) then) =
      __$$_DutyFreeCancelOrderDetailsStatusHistoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, DateTime? createdOn});
}

/// @nodoc
class __$$_DutyFreeCancelOrderDetailsStatusHistoryCopyWithImpl<$Res>
    extends _$DutyFreeCancelOrderDetailsStatusHistoryCopyWithImpl<$Res,
        _$_DutyFreeCancelOrderDetailsStatusHistory>
    implements _$$_DutyFreeCancelOrderDetailsStatusHistoryCopyWith<$Res> {
  __$$_DutyFreeCancelOrderDetailsStatusHistoryCopyWithImpl(
      _$_DutyFreeCancelOrderDetailsStatusHistory _value,
      $Res Function(_$_DutyFreeCancelOrderDetailsStatusHistory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? createdOn = freezed,
  }) {
    return _then(_$_DutyFreeCancelOrderDetailsStatusHistory(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdOn: freezed == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DutyFreeCancelOrderDetailsStatusHistory
    implements _DutyFreeCancelOrderDetailsStatusHistory {
  const _$_DutyFreeCancelOrderDetailsStatusHistory(
      {this.status, this.createdOn});

  factory _$_DutyFreeCancelOrderDetailsStatusHistory.fromJson(
          Map<String, dynamic> json) =>
      _$$_DutyFreeCancelOrderDetailsStatusHistoryFromJson(json);

  @override
  final String? status;
  @override
  final DateTime? createdOn;

  @override
  String toString() {
    return 'DutyFreeCancelOrderDetailsStatusHistory(status: $status, createdOn: $createdOn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DutyFreeCancelOrderDetailsStatusHistory &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdOn, createdOn) ||
                other.createdOn == createdOn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, createdOn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DutyFreeCancelOrderDetailsStatusHistoryCopyWith<
          _$_DutyFreeCancelOrderDetailsStatusHistory>
      get copyWith => __$$_DutyFreeCancelOrderDetailsStatusHistoryCopyWithImpl<
          _$_DutyFreeCancelOrderDetailsStatusHistory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DutyFreeCancelOrderDetailsStatusHistoryToJson(
      this,
    );
  }
}

abstract class _DutyFreeCancelOrderDetailsStatusHistory
    implements DutyFreeCancelOrderDetailsStatusHistory {
  const factory _DutyFreeCancelOrderDetailsStatusHistory(
      {final String? status,
      final DateTime? createdOn}) = _$_DutyFreeCancelOrderDetailsStatusHistory;

  factory _DutyFreeCancelOrderDetailsStatusHistory.fromJson(
          Map<String, dynamic> json) =
      _$_DutyFreeCancelOrderDetailsStatusHistory.fromJson;

  @override
  String? get status;
  @override
  DateTime? get createdOn;
  @override
  @JsonKey(ignore: true)
  _$$_DutyFreeCancelOrderDetailsStatusHistoryCopyWith<
          _$_DutyFreeCancelOrderDetailsStatusHistory>
      get copyWith => throw _privateConstructorUsedError;
}

TransactionHistory _$TransactionHistoryFromJson(Map<String, dynamic> json) {
  return _TransactionHistory.fromJson(json);
}

/// @nodoc
mixin _$TransactionHistory {
  String? get transactionReferenceId => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  PaidBy? get paidBy => throw _privateConstructorUsedError;
  String? get transactionMode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionHistoryCopyWith<TransactionHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionHistoryCopyWith<$Res> {
  factory $TransactionHistoryCopyWith(
          TransactionHistory value, $Res Function(TransactionHistory) then) =
      _$TransactionHistoryCopyWithImpl<$Res, TransactionHistory>;
  @useResult
  $Res call(
      {String? transactionReferenceId,
      String? status,
      PaidBy? paidBy,
      String? transactionMode});

  $PaidByCopyWith<$Res>? get paidBy;
}

/// @nodoc
class _$TransactionHistoryCopyWithImpl<$Res, $Val extends TransactionHistory>
    implements $TransactionHistoryCopyWith<$Res> {
  _$TransactionHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionReferenceId = freezed,
    Object? status = freezed,
    Object? paidBy = freezed,
    Object? transactionMode = freezed,
  }) {
    return _then(_value.copyWith(
      transactionReferenceId: freezed == transactionReferenceId
          ? _value.transactionReferenceId
          : transactionReferenceId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      paidBy: freezed == paidBy
          ? _value.paidBy
          : paidBy // ignore: cast_nullable_to_non_nullable
              as PaidBy?,
      transactionMode: freezed == transactionMode
          ? _value.transactionMode
          : transactionMode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaidByCopyWith<$Res>? get paidBy {
    if (_value.paidBy == null) {
      return null;
    }

    return $PaidByCopyWith<$Res>(_value.paidBy!, (value) {
      return _then(_value.copyWith(paidBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TransactionHistoryCopyWith<$Res>
    implements $TransactionHistoryCopyWith<$Res> {
  factory _$$_TransactionHistoryCopyWith(_$_TransactionHistory value,
          $Res Function(_$_TransactionHistory) then) =
      __$$_TransactionHistoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? transactionReferenceId,
      String? status,
      PaidBy? paidBy,
      String? transactionMode});

  @override
  $PaidByCopyWith<$Res>? get paidBy;
}

/// @nodoc
class __$$_TransactionHistoryCopyWithImpl<$Res>
    extends _$TransactionHistoryCopyWithImpl<$Res, _$_TransactionHistory>
    implements _$$_TransactionHistoryCopyWith<$Res> {
  __$$_TransactionHistoryCopyWithImpl(
      _$_TransactionHistory _value, $Res Function(_$_TransactionHistory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionReferenceId = freezed,
    Object? status = freezed,
    Object? paidBy = freezed,
    Object? transactionMode = freezed,
  }) {
    return _then(_$_TransactionHistory(
      transactionReferenceId: freezed == transactionReferenceId
          ? _value.transactionReferenceId
          : transactionReferenceId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      paidBy: freezed == paidBy
          ? _value.paidBy
          : paidBy // ignore: cast_nullable_to_non_nullable
              as PaidBy?,
      transactionMode: freezed == transactionMode
          ? _value.transactionMode
          : transactionMode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionHistory implements _TransactionHistory {
  const _$_TransactionHistory(
      {this.transactionReferenceId,
      this.status,
      this.paidBy,
      this.transactionMode});

  factory _$_TransactionHistory.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionHistoryFromJson(json);

  @override
  final String? transactionReferenceId;
  @override
  final String? status;
  @override
  final PaidBy? paidBy;
  @override
  final String? transactionMode;

  @override
  String toString() {
    return 'TransactionHistory(transactionReferenceId: $transactionReferenceId, status: $status, paidBy: $paidBy, transactionMode: $transactionMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionHistory &&
            (identical(other.transactionReferenceId, transactionReferenceId) ||
                other.transactionReferenceId == transactionReferenceId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paidBy, paidBy) || other.paidBy == paidBy) &&
            (identical(other.transactionMode, transactionMode) ||
                other.transactionMode == transactionMode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, transactionReferenceId, status, paidBy, transactionMode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionHistoryCopyWith<_$_TransactionHistory> get copyWith =>
      __$$_TransactionHistoryCopyWithImpl<_$_TransactionHistory>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionHistoryToJson(
      this,
    );
  }
}

abstract class _TransactionHistory implements TransactionHistory {
  const factory _TransactionHistory(
      {final String? transactionReferenceId,
      final String? status,
      final PaidBy? paidBy,
      final String? transactionMode}) = _$_TransactionHistory;

  factory _TransactionHistory.fromJson(Map<String, dynamic> json) =
      _$_TransactionHistory.fromJson;

  @override
  String? get transactionReferenceId;
  @override
  String? get status;
  @override
  PaidBy? get paidBy;
  @override
  String? get transactionMode;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionHistoryCopyWith<_$_TransactionHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

PaidBy _$PaidByFromJson(Map<String, dynamic> json) {
  return _PaidBy.fromJson(json);
}

/// @nodoc
mixin _$PaidBy {
  Bank? get bank => throw _privateConstructorUsedError;
  Loyalty? get loyalty => throw _privateConstructorUsedError;
  dynamic get promo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaidByCopyWith<PaidBy> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaidByCopyWith<$Res> {
  factory $PaidByCopyWith(PaidBy value, $Res Function(PaidBy) then) =
      _$PaidByCopyWithImpl<$Res, PaidBy>;
  @useResult
  $Res call({Bank? bank, Loyalty? loyalty, dynamic promo});

  $BankCopyWith<$Res>? get bank;
  $LoyaltyCopyWith<$Res>? get loyalty;
}

/// @nodoc
class _$PaidByCopyWithImpl<$Res, $Val extends PaidBy>
    implements $PaidByCopyWith<$Res> {
  _$PaidByCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bank = freezed,
    Object? loyalty = freezed,
    Object? promo = freezed,
  }) {
    return _then(_value.copyWith(
      bank: freezed == bank
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as Bank?,
      loyalty: freezed == loyalty
          ? _value.loyalty
          : loyalty // ignore: cast_nullable_to_non_nullable
              as Loyalty?,
      promo: freezed == promo
          ? _value.promo
          : promo // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BankCopyWith<$Res>? get bank {
    if (_value.bank == null) {
      return null;
    }

    return $BankCopyWith<$Res>(_value.bank!, (value) {
      return _then(_value.copyWith(bank: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LoyaltyCopyWith<$Res>? get loyalty {
    if (_value.loyalty == null) {
      return null;
    }

    return $LoyaltyCopyWith<$Res>(_value.loyalty!, (value) {
      return _then(_value.copyWith(loyalty: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PaidByCopyWith<$Res> implements $PaidByCopyWith<$Res> {
  factory _$$_PaidByCopyWith(_$_PaidBy value, $Res Function(_$_PaidBy) then) =
      __$$_PaidByCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Bank? bank, Loyalty? loyalty, dynamic promo});

  @override
  $BankCopyWith<$Res>? get bank;
  @override
  $LoyaltyCopyWith<$Res>? get loyalty;
}

/// @nodoc
class __$$_PaidByCopyWithImpl<$Res>
    extends _$PaidByCopyWithImpl<$Res, _$_PaidBy>
    implements _$$_PaidByCopyWith<$Res> {
  __$$_PaidByCopyWithImpl(_$_PaidBy _value, $Res Function(_$_PaidBy) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bank = freezed,
    Object? loyalty = freezed,
    Object? promo = freezed,
  }) {
    return _then(_$_PaidBy(
      bank: freezed == bank
          ? _value.bank
          : bank // ignore: cast_nullable_to_non_nullable
              as Bank?,
      loyalty: freezed == loyalty
          ? _value.loyalty
          : loyalty // ignore: cast_nullable_to_non_nullable
              as Loyalty?,
      promo: freezed == promo
          ? _value.promo
          : promo // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaidBy implements _PaidBy {
  const _$_PaidBy({this.bank, this.loyalty, this.promo});

  factory _$_PaidBy.fromJson(Map<String, dynamic> json) =>
      _$$_PaidByFromJson(json);

  @override
  final Bank? bank;
  @override
  final Loyalty? loyalty;
  @override
  final dynamic promo;

  @override
  String toString() {
    return 'PaidBy(bank: $bank, loyalty: $loyalty, promo: $promo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaidBy &&
            (identical(other.bank, bank) || other.bank == bank) &&
            (identical(other.loyalty, loyalty) || other.loyalty == loyalty) &&
            const DeepCollectionEquality().equals(other.promo, promo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, bank, loyalty, const DeepCollectionEquality().hash(promo));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaidByCopyWith<_$_PaidBy> get copyWith =>
      __$$_PaidByCopyWithImpl<_$_PaidBy>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaidByToJson(
      this,
    );
  }
}

abstract class _PaidBy implements PaidBy {
  const factory _PaidBy(
      {final Bank? bank,
      final Loyalty? loyalty,
      final dynamic promo}) = _$_PaidBy;

  factory _PaidBy.fromJson(Map<String, dynamic> json) = _$_PaidBy.fromJson;

  @override
  Bank? get bank;
  @override
  Loyalty? get loyalty;
  @override
  dynamic get promo;
  @override
  @JsonKey(ignore: true)
  _$$_PaidByCopyWith<_$_PaidBy> get copyWith =>
      throw _privateConstructorUsedError;
}

Bank _$BankFromJson(Map<String, dynamic> json) {
  return _Bank.fromJson(json);
}

/// @nodoc
mixin _$Bank {
  double? get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankCopyWith<Bank> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankCopyWith<$Res> {
  factory $BankCopyWith(Bank value, $Res Function(Bank) then) =
      _$BankCopyWithImpl<$Res, Bank>;
  @useResult
  $Res call({double? amount});
}

/// @nodoc
class _$BankCopyWithImpl<$Res, $Val extends Bank>
    implements $BankCopyWith<$Res> {
  _$BankCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
  }) {
    return _then(_value.copyWith(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BankCopyWith<$Res> implements $BankCopyWith<$Res> {
  factory _$$_BankCopyWith(_$_Bank value, $Res Function(_$_Bank) then) =
      __$$_BankCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? amount});
}

/// @nodoc
class __$$_BankCopyWithImpl<$Res> extends _$BankCopyWithImpl<$Res, _$_Bank>
    implements _$$_BankCopyWith<$Res> {
  __$$_BankCopyWithImpl(_$_Bank _value, $Res Function(_$_Bank) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
  }) {
    return _then(_$_Bank(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Bank implements _Bank {
  const _$_Bank({this.amount});

  factory _$_Bank.fromJson(Map<String, dynamic> json) => _$$_BankFromJson(json);

  @override
  final double? amount;

  @override
  String toString() {
    return 'Bank(amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Bank &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BankCopyWith<_$_Bank> get copyWith =>
      __$$_BankCopyWithImpl<_$_Bank>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BankToJson(
      this,
    );
  }
}

abstract class _Bank implements Bank {
  const factory _Bank({final double? amount}) = _$_Bank;

  factory _Bank.fromJson(Map<String, dynamic> json) = _$_Bank.fromJson;

  @override
  double? get amount;
  @override
  @JsonKey(ignore: true)
  _$$_BankCopyWith<_$_Bank> get copyWith => throw _privateConstructorUsedError;
}

Loyalty _$LoyaltyFromJson(Map<String, dynamic> json) {
  return _Loyalty.fromJson(json);
}

/// @nodoc
mixin _$Loyalty {
  int? get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoyaltyCopyWith<Loyalty> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyCopyWith<$Res> {
  factory $LoyaltyCopyWith(Loyalty value, $Res Function(Loyalty) then) =
      _$LoyaltyCopyWithImpl<$Res, Loyalty>;
  @useResult
  $Res call({int? amount});
}

/// @nodoc
class _$LoyaltyCopyWithImpl<$Res, $Val extends Loyalty>
    implements $LoyaltyCopyWith<$Res> {
  _$LoyaltyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
  }) {
    return _then(_value.copyWith(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoyaltyCopyWith<$Res> implements $LoyaltyCopyWith<$Res> {
  factory _$$_LoyaltyCopyWith(
          _$_Loyalty value, $Res Function(_$_Loyalty) then) =
      __$$_LoyaltyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? amount});
}

/// @nodoc
class __$$_LoyaltyCopyWithImpl<$Res>
    extends _$LoyaltyCopyWithImpl<$Res, _$_Loyalty>
    implements _$$_LoyaltyCopyWith<$Res> {
  __$$_LoyaltyCopyWithImpl(_$_Loyalty _value, $Res Function(_$_Loyalty) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
  }) {
    return _then(_$_Loyalty(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Loyalty implements _Loyalty {
  const _$_Loyalty({this.amount});

  factory _$_Loyalty.fromJson(Map<String, dynamic> json) =>
      _$$_LoyaltyFromJson(json);

  @override
  final int? amount;

  @override
  String toString() {
    return 'Loyalty(amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loyalty &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoyaltyCopyWith<_$_Loyalty> get copyWith =>
      __$$_LoyaltyCopyWithImpl<_$_Loyalty>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoyaltyToJson(
      this,
    );
  }
}

abstract class _Loyalty implements Loyalty {
  const factory _Loyalty({final int? amount}) = _$_Loyalty;

  factory _Loyalty.fromJson(Map<String, dynamic> json) = _$_Loyalty.fromJson;

  @override
  int? get amount;
  @override
  @JsonKey(ignore: true)
  _$$_LoyaltyCopyWith<_$_Loyalty> get copyWith =>
      throw _privateConstructorUsedError;
}

Earning _$EarningFromJson(Map<String, dynamic> json) {
  return _Earning.fromJson(json);
}

/// @nodoc
mixin _$Earning {
  int? get total => throw _privateConstructorUsedError;
  int? get reward => throw _privateConstructorUsedError;
  int? get order => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EarningCopyWith<Earning> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EarningCopyWith<$Res> {
  factory $EarningCopyWith(Earning value, $Res Function(Earning) then) =
      _$EarningCopyWithImpl<$Res, Earning>;
  @useResult
  $Res call({int? total, int? reward, int? order});
}

/// @nodoc
class _$EarningCopyWithImpl<$Res, $Val extends Earning>
    implements $EarningCopyWith<$Res> {
  _$EarningCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? reward = freezed,
    Object? order = freezed,
  }) {
    return _then(_value.copyWith(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      reward: freezed == reward
          ? _value.reward
          : reward // ignore: cast_nullable_to_non_nullable
              as int?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EarningCopyWith<$Res> implements $EarningCopyWith<$Res> {
  factory _$$_EarningCopyWith(
          _$_Earning value, $Res Function(_$_Earning) then) =
      __$$_EarningCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? total, int? reward, int? order});
}

/// @nodoc
class __$$_EarningCopyWithImpl<$Res>
    extends _$EarningCopyWithImpl<$Res, _$_Earning>
    implements _$$_EarningCopyWith<$Res> {
  __$$_EarningCopyWithImpl(_$_Earning _value, $Res Function(_$_Earning) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? reward = freezed,
    Object? order = freezed,
  }) {
    return _then(_$_Earning(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      reward: freezed == reward
          ? _value.reward
          : reward // ignore: cast_nullable_to_non_nullable
              as int?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Earning implements _Earning {
  const _$_Earning({this.total, this.reward, this.order});

  factory _$_Earning.fromJson(Map<String, dynamic> json) =>
      _$$_EarningFromJson(json);

  @override
  final int? total;
  @override
  final int? reward;
  @override
  final int? order;

  @override
  String toString() {
    return 'Earning(total: $total, reward: $reward, order: $order)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Earning &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.reward, reward) || other.reward == reward) &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, total, reward, order);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EarningCopyWith<_$_Earning> get copyWith =>
      __$$_EarningCopyWithImpl<_$_Earning>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EarningToJson(
      this,
    );
  }
}

abstract class _Earning implements Earning {
  const factory _Earning(
      {final int? total, final int? reward, final int? order}) = _$_Earning;

  factory _Earning.fromJson(Map<String, dynamic> json) = _$_Earning.fromJson;

  @override
  int? get total;
  @override
  int? get reward;
  @override
  int? get order;
  @override
  @JsonKey(ignore: true)
  _$$_EarningCopyWith<_$_Earning> get copyWith =>
      throw _privateConstructorUsedError;
}
