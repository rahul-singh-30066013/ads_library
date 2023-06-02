// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'duty_free_status_history_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DutyFreeStatusHistoryResponse _$DutyFreeStatusHistoryResponseFromJson(
    Map<String, dynamic> json) {
  return _DutyFreeStatusHistoryResponse.fromJson(json);
}

/// @nodoc
mixin _$DutyFreeStatusHistoryResponse {
  List<DutyFreeStatusHistoryDetailsResponse> get statusHistory =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DutyFreeStatusHistoryResponseCopyWith<DutyFreeStatusHistoryResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DutyFreeStatusHistoryResponseCopyWith<$Res> {
  factory $DutyFreeStatusHistoryResponseCopyWith(
          DutyFreeStatusHistoryResponse value,
          $Res Function(DutyFreeStatusHistoryResponse) then) =
      _$DutyFreeStatusHistoryResponseCopyWithImpl<$Res,
          DutyFreeStatusHistoryResponse>;
  @useResult
  $Res call({List<DutyFreeStatusHistoryDetailsResponse> statusHistory});
}

/// @nodoc
class _$DutyFreeStatusHistoryResponseCopyWithImpl<$Res,
        $Val extends DutyFreeStatusHistoryResponse>
    implements $DutyFreeStatusHistoryResponseCopyWith<$Res> {
  _$DutyFreeStatusHistoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusHistory = null,
  }) {
    return _then(_value.copyWith(
      statusHistory: null == statusHistory
          ? _value.statusHistory
          : statusHistory // ignore: cast_nullable_to_non_nullable
              as List<DutyFreeStatusHistoryDetailsResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DutyFreeStatusHistoryResponseCopyWith<$Res>
    implements $DutyFreeStatusHistoryResponseCopyWith<$Res> {
  factory _$$_DutyFreeStatusHistoryResponseCopyWith(
          _$_DutyFreeStatusHistoryResponse value,
          $Res Function(_$_DutyFreeStatusHistoryResponse) then) =
      __$$_DutyFreeStatusHistoryResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DutyFreeStatusHistoryDetailsResponse> statusHistory});
}

/// @nodoc
class __$$_DutyFreeStatusHistoryResponseCopyWithImpl<$Res>
    extends _$DutyFreeStatusHistoryResponseCopyWithImpl<$Res,
        _$_DutyFreeStatusHistoryResponse>
    implements _$$_DutyFreeStatusHistoryResponseCopyWith<$Res> {
  __$$_DutyFreeStatusHistoryResponseCopyWithImpl(
      _$_DutyFreeStatusHistoryResponse _value,
      $Res Function(_$_DutyFreeStatusHistoryResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusHistory = null,
  }) {
    return _then(_$_DutyFreeStatusHistoryResponse(
      statusHistory: null == statusHistory
          ? _value.statusHistory
          : statusHistory // ignore: cast_nullable_to_non_nullable
              as List<DutyFreeStatusHistoryDetailsResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DutyFreeStatusHistoryResponse
    with DiagnosticableTreeMixin
    implements _DutyFreeStatusHistoryResponse {
  const _$_DutyFreeStatusHistoryResponse({this.statusHistory = const []});

  factory _$_DutyFreeStatusHistoryResponse.fromJson(
          Map<String, dynamic> json) =>
      _$$_DutyFreeStatusHistoryResponseFromJson(json);

  @override
  @JsonKey()
  final List<DutyFreeStatusHistoryDetailsResponse> statusHistory;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DutyFreeStatusHistoryResponse(statusHistory: $statusHistory)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DutyFreeStatusHistoryResponse'))
      ..add(DiagnosticsProperty('statusHistory', statusHistory));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DutyFreeStatusHistoryResponse &&
            const DeepCollectionEquality()
                .equals(other.statusHistory, statusHistory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(statusHistory));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DutyFreeStatusHistoryResponseCopyWith<_$_DutyFreeStatusHistoryResponse>
      get copyWith => __$$_DutyFreeStatusHistoryResponseCopyWithImpl<
          _$_DutyFreeStatusHistoryResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DutyFreeStatusHistoryResponseToJson(
      this,
    );
  }
}

abstract class _DutyFreeStatusHistoryResponse
    implements DutyFreeStatusHistoryResponse {
  const factory _DutyFreeStatusHistoryResponse(
          {final List<DutyFreeStatusHistoryDetailsResponse> statusHistory}) =
      _$_DutyFreeStatusHistoryResponse;

  factory _DutyFreeStatusHistoryResponse.fromJson(Map<String, dynamic> json) =
      _$_DutyFreeStatusHistoryResponse.fromJson;

  @override
  List<DutyFreeStatusHistoryDetailsResponse> get statusHistory;
  @override
  @JsonKey(ignore: true)
  _$$_DutyFreeStatusHistoryResponseCopyWith<_$_DutyFreeStatusHistoryResponse>
      get copyWith => throw _privateConstructorUsedError;
}
