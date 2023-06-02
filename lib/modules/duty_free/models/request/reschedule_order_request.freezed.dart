// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reschedule_order_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RescheduleOrderRequest _$RescheduleOrderRequestFromJson(
    Map<String, dynamic> json) {
  return _RescheduleOrderRequest.fromJson(json);
}

/// @nodoc
mixin _$RescheduleOrderRequest {
  String get orderReferenceId => throw _privateConstructorUsedError;
  String get customerID => throw _privateConstructorUsedError;
  String get orderDate => throw _privateConstructorUsedError;
  String get orderTime => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  String get flightNo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RescheduleOrderRequestCopyWith<RescheduleOrderRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RescheduleOrderRequestCopyWith<$Res> {
  factory $RescheduleOrderRequestCopyWith(RescheduleOrderRequest value,
          $Res Function(RescheduleOrderRequest) then) =
      _$RescheduleOrderRequestCopyWithImpl<$Res, RescheduleOrderRequest>;
  @useResult
  $Res call(
      {String orderReferenceId,
      String customerID,
      String orderDate,
      String orderTime,
      String reason,
      String flightNo});
}

/// @nodoc
class _$RescheduleOrderRequestCopyWithImpl<$Res,
        $Val extends RescheduleOrderRequest>
    implements $RescheduleOrderRequestCopyWith<$Res> {
  _$RescheduleOrderRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderReferenceId = null,
    Object? customerID = null,
    Object? orderDate = null,
    Object? orderTime = null,
    Object? reason = null,
    Object? flightNo = null,
  }) {
    return _then(_value.copyWith(
      orderReferenceId: null == orderReferenceId
          ? _value.orderReferenceId
          : orderReferenceId // ignore: cast_nullable_to_non_nullable
              as String,
      customerID: null == customerID
          ? _value.customerID
          : customerID // ignore: cast_nullable_to_non_nullable
              as String,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as String,
      orderTime: null == orderTime
          ? _value.orderTime
          : orderTime // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      flightNo: null == flightNo
          ? _value.flightNo
          : flightNo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RescheduleOrderRequestCopyWith<$Res>
    implements $RescheduleOrderRequestCopyWith<$Res> {
  factory _$$_RescheduleOrderRequestCopyWith(_$_RescheduleOrderRequest value,
          $Res Function(_$_RescheduleOrderRequest) then) =
      __$$_RescheduleOrderRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String orderReferenceId,
      String customerID,
      String orderDate,
      String orderTime,
      String reason,
      String flightNo});
}

/// @nodoc
class __$$_RescheduleOrderRequestCopyWithImpl<$Res>
    extends _$RescheduleOrderRequestCopyWithImpl<$Res,
        _$_RescheduleOrderRequest>
    implements _$$_RescheduleOrderRequestCopyWith<$Res> {
  __$$_RescheduleOrderRequestCopyWithImpl(_$_RescheduleOrderRequest _value,
      $Res Function(_$_RescheduleOrderRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderReferenceId = null,
    Object? customerID = null,
    Object? orderDate = null,
    Object? orderTime = null,
    Object? reason = null,
    Object? flightNo = null,
  }) {
    return _then(_$_RescheduleOrderRequest(
      orderReferenceId: null == orderReferenceId
          ? _value.orderReferenceId
          : orderReferenceId // ignore: cast_nullable_to_non_nullable
              as String,
      customerID: null == customerID
          ? _value.customerID
          : customerID // ignore: cast_nullable_to_non_nullable
              as String,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as String,
      orderTime: null == orderTime
          ? _value.orderTime
          : orderTime // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      flightNo: null == flightNo
          ? _value.flightNo
          : flightNo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RescheduleOrderRequest implements _RescheduleOrderRequest {
  const _$_RescheduleOrderRequest(
      {this.orderReferenceId = '',
      this.customerID = '',
      this.orderDate = '',
      this.orderTime = '',
      this.reason = '',
      this.flightNo = ''});

  factory _$_RescheduleOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$$_RescheduleOrderRequestFromJson(json);

  @override
  @JsonKey()
  final String orderReferenceId;
  @override
  @JsonKey()
  final String customerID;
  @override
  @JsonKey()
  final String orderDate;
  @override
  @JsonKey()
  final String orderTime;
  @override
  @JsonKey()
  final String reason;
  @override
  @JsonKey()
  final String flightNo;

  @override
  String toString() {
    return 'RescheduleOrderRequest(orderReferenceId: $orderReferenceId, customerID: $customerID, orderDate: $orderDate, orderTime: $orderTime, reason: $reason, flightNo: $flightNo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RescheduleOrderRequest &&
            (identical(other.orderReferenceId, orderReferenceId) ||
                other.orderReferenceId == orderReferenceId) &&
            (identical(other.customerID, customerID) ||
                other.customerID == customerID) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.orderTime, orderTime) ||
                other.orderTime == orderTime) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.flightNo, flightNo) ||
                other.flightNo == flightNo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, orderReferenceId, customerID,
      orderDate, orderTime, reason, flightNo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RescheduleOrderRequestCopyWith<_$_RescheduleOrderRequest> get copyWith =>
      __$$_RescheduleOrderRequestCopyWithImpl<_$_RescheduleOrderRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RescheduleOrderRequestToJson(
      this,
    );
  }
}

abstract class _RescheduleOrderRequest implements RescheduleOrderRequest {
  const factory _RescheduleOrderRequest(
      {final String orderReferenceId,
      final String customerID,
      final String orderDate,
      final String orderTime,
      final String reason,
      final String flightNo}) = _$_RescheduleOrderRequest;

  factory _RescheduleOrderRequest.fromJson(Map<String, dynamic> json) =
      _$_RescheduleOrderRequest.fromJson;

  @override
  String get orderReferenceId;
  @override
  String get customerID;
  @override
  String get orderDate;
  @override
  String get orderTime;
  @override
  String get reason;
  @override
  String get flightNo;
  @override
  @JsonKey(ignore: true)
  _$$_RescheduleOrderRequestCopyWith<_$_RescheduleOrderRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
