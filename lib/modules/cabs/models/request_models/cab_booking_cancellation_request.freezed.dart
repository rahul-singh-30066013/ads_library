// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cab_booking_cancellation_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CabBookingCancellationRequest _$CabBookingCancellationRequestFromJson(
    Map<String, dynamic> json) {
  return _CabBookingCancellationRequest.fromJson(json);
}

/// @nodoc
mixin _$CabBookingCancellationRequest {
  String? get cancelReason => throw _privateConstructorUsedError;
  String? get orderReferenceId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CabBookingCancellationRequestCopyWith<CabBookingCancellationRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CabBookingCancellationRequestCopyWith<$Res> {
  factory $CabBookingCancellationRequestCopyWith(
          CabBookingCancellationRequest value,
          $Res Function(CabBookingCancellationRequest) then) =
      _$CabBookingCancellationRequestCopyWithImpl<$Res,
          CabBookingCancellationRequest>;
  @useResult
  $Res call({String? cancelReason, String? orderReferenceId});
}

/// @nodoc
class _$CabBookingCancellationRequestCopyWithImpl<$Res,
        $Val extends CabBookingCancellationRequest>
    implements $CabBookingCancellationRequestCopyWith<$Res> {
  _$CabBookingCancellationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cancelReason = freezed,
    Object? orderReferenceId = freezed,
  }) {
    return _then(_value.copyWith(
      cancelReason: freezed == cancelReason
          ? _value.cancelReason
          : cancelReason // ignore: cast_nullable_to_non_nullable
              as String?,
      orderReferenceId: freezed == orderReferenceId
          ? _value.orderReferenceId
          : orderReferenceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CabBookingCancellationRequestCopyWith<$Res>
    implements $CabBookingCancellationRequestCopyWith<$Res> {
  factory _$$_CabBookingCancellationRequestCopyWith(
          _$_CabBookingCancellationRequest value,
          $Res Function(_$_CabBookingCancellationRequest) then) =
      __$$_CabBookingCancellationRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? cancelReason, String? orderReferenceId});
}

/// @nodoc
class __$$_CabBookingCancellationRequestCopyWithImpl<$Res>
    extends _$CabBookingCancellationRequestCopyWithImpl<$Res,
        _$_CabBookingCancellationRequest>
    implements _$$_CabBookingCancellationRequestCopyWith<$Res> {
  __$$_CabBookingCancellationRequestCopyWithImpl(
      _$_CabBookingCancellationRequest _value,
      $Res Function(_$_CabBookingCancellationRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cancelReason = freezed,
    Object? orderReferenceId = freezed,
  }) {
    return _then(_$_CabBookingCancellationRequest(
      cancelReason: freezed == cancelReason
          ? _value.cancelReason
          : cancelReason // ignore: cast_nullable_to_non_nullable
              as String?,
      orderReferenceId: freezed == orderReferenceId
          ? _value.orderReferenceId
          : orderReferenceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CabBookingCancellationRequest
    implements _CabBookingCancellationRequest {
  const _$_CabBookingCancellationRequest(
      {this.cancelReason = '', this.orderReferenceId = ''});

  factory _$_CabBookingCancellationRequest.fromJson(
          Map<String, dynamic> json) =>
      _$$_CabBookingCancellationRequestFromJson(json);

  @override
  @JsonKey()
  final String? cancelReason;
  @override
  @JsonKey()
  final String? orderReferenceId;

  @override
  String toString() {
    return 'CabBookingCancellationRequest(cancelReason: $cancelReason, orderReferenceId: $orderReferenceId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CabBookingCancellationRequest &&
            (identical(other.cancelReason, cancelReason) ||
                other.cancelReason == cancelReason) &&
            (identical(other.orderReferenceId, orderReferenceId) ||
                other.orderReferenceId == orderReferenceId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cancelReason, orderReferenceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CabBookingCancellationRequestCopyWith<_$_CabBookingCancellationRequest>
      get copyWith => __$$_CabBookingCancellationRequestCopyWithImpl<
          _$_CabBookingCancellationRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CabBookingCancellationRequestToJson(
      this,
    );
  }
}

abstract class _CabBookingCancellationRequest
    implements CabBookingCancellationRequest {
  const factory _CabBookingCancellationRequest(
      {final String? cancelReason,
      final String? orderReferenceId}) = _$_CabBookingCancellationRequest;

  factory _CabBookingCancellationRequest.fromJson(Map<String, dynamic> json) =
      _$_CabBookingCancellationRequest.fromJson;

  @override
  String? get cancelReason;
  @override
  String? get orderReferenceId;
  @override
  @JsonKey(ignore: true)
  _$$_CabBookingCancellationRequestCopyWith<_$_CabBookingCancellationRequest>
      get copyWith => throw _privateConstructorUsedError;
}
