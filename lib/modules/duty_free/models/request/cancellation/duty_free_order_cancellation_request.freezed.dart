// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'duty_free_order_cancellation_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DutyFreeOrderCancellationRequest _$DutyFreeOrderCancellationRequestFromJson(
    Map<String, dynamic> json) {
  return _DutyFreeOrderCancellationRequest.fromJson(json);
}

/// @nodoc
mixin _$DutyFreeOrderCancellationRequest {
  String? get reason => throw _privateConstructorUsedError;
  String? get orderReferenceId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DutyFreeOrderCancellationRequestCopyWith<DutyFreeOrderCancellationRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DutyFreeOrderCancellationRequestCopyWith<$Res> {
  factory $DutyFreeOrderCancellationRequestCopyWith(
          DutyFreeOrderCancellationRequest value,
          $Res Function(DutyFreeOrderCancellationRequest) then) =
      _$DutyFreeOrderCancellationRequestCopyWithImpl<$Res,
          DutyFreeOrderCancellationRequest>;
  @useResult
  $Res call({String? reason, String? orderReferenceId});
}

/// @nodoc
class _$DutyFreeOrderCancellationRequestCopyWithImpl<$Res,
        $Val extends DutyFreeOrderCancellationRequest>
    implements $DutyFreeOrderCancellationRequestCopyWith<$Res> {
  _$DutyFreeOrderCancellationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = freezed,
    Object? orderReferenceId = freezed,
  }) {
    return _then(_value.copyWith(
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      orderReferenceId: freezed == orderReferenceId
          ? _value.orderReferenceId
          : orderReferenceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DutyFreeOrderCancellationRequestCopyWith<$Res>
    implements $DutyFreeOrderCancellationRequestCopyWith<$Res> {
  factory _$$_DutyFreeOrderCancellationRequestCopyWith(
          _$_DutyFreeOrderCancellationRequest value,
          $Res Function(_$_DutyFreeOrderCancellationRequest) then) =
      __$$_DutyFreeOrderCancellationRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? reason, String? orderReferenceId});
}

/// @nodoc
class __$$_DutyFreeOrderCancellationRequestCopyWithImpl<$Res>
    extends _$DutyFreeOrderCancellationRequestCopyWithImpl<$Res,
        _$_DutyFreeOrderCancellationRequest>
    implements _$$_DutyFreeOrderCancellationRequestCopyWith<$Res> {
  __$$_DutyFreeOrderCancellationRequestCopyWithImpl(
      _$_DutyFreeOrderCancellationRequest _value,
      $Res Function(_$_DutyFreeOrderCancellationRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reason = freezed,
    Object? orderReferenceId = freezed,
  }) {
    return _then(_$_DutyFreeOrderCancellationRequest(
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
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
class _$_DutyFreeOrderCancellationRequest
    implements _DutyFreeOrderCancellationRequest {
  const _$_DutyFreeOrderCancellationRequest(
      {this.reason = '', this.orderReferenceId = ''});

  factory _$_DutyFreeOrderCancellationRequest.fromJson(
          Map<String, dynamic> json) =>
      _$$_DutyFreeOrderCancellationRequestFromJson(json);

  @override
  @JsonKey()
  final String? reason;
  @override
  @JsonKey()
  final String? orderReferenceId;

  @override
  String toString() {
    return 'DutyFreeOrderCancellationRequest(reason: $reason, orderReferenceId: $orderReferenceId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DutyFreeOrderCancellationRequest &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.orderReferenceId, orderReferenceId) ||
                other.orderReferenceId == orderReferenceId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, reason, orderReferenceId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DutyFreeOrderCancellationRequestCopyWith<
          _$_DutyFreeOrderCancellationRequest>
      get copyWith => __$$_DutyFreeOrderCancellationRequestCopyWithImpl<
          _$_DutyFreeOrderCancellationRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DutyFreeOrderCancellationRequestToJson(
      this,
    );
  }
}

abstract class _DutyFreeOrderCancellationRequest
    implements DutyFreeOrderCancellationRequest {
  const factory _DutyFreeOrderCancellationRequest(
      {final String? reason,
      final String? orderReferenceId}) = _$_DutyFreeOrderCancellationRequest;

  factory _DutyFreeOrderCancellationRequest.fromJson(
      Map<String, dynamic> json) = _$_DutyFreeOrderCancellationRequest.fromJson;

  @override
  String? get reason;
  @override
  String? get orderReferenceId;
  @override
  @JsonKey(ignore: true)
  _$$_DutyFreeOrderCancellationRequestCopyWith<
          _$_DutyFreeOrderCancellationRequest>
      get copyWith => throw _privateConstructorUsedError;
}
