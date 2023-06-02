// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'duty_free_status_history_details_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DutyFreeStatusHistoryDetailsResponse
    _$DutyFreeStatusHistoryDetailsResponseFromJson(Map<String, dynamic> json) {
  return _DutyFreeStatusHistoryDetailsResponse.fromJson(json);
}

/// @nodoc
mixin _$DutyFreeStatusHistoryDetailsResponse {
  String get status => throw _privateConstructorUsedError;
  String get createdOn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DutyFreeStatusHistoryDetailsResponseCopyWith<
          DutyFreeStatusHistoryDetailsResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DutyFreeStatusHistoryDetailsResponseCopyWith<$Res> {
  factory $DutyFreeStatusHistoryDetailsResponseCopyWith(
          DutyFreeStatusHistoryDetailsResponse value,
          $Res Function(DutyFreeStatusHistoryDetailsResponse) then) =
      _$DutyFreeStatusHistoryDetailsResponseCopyWithImpl<$Res,
          DutyFreeStatusHistoryDetailsResponse>;
  @useResult
  $Res call({String status, String createdOn});
}

/// @nodoc
class _$DutyFreeStatusHistoryDetailsResponseCopyWithImpl<$Res,
        $Val extends DutyFreeStatusHistoryDetailsResponse>
    implements $DutyFreeStatusHistoryDetailsResponseCopyWith<$Res> {
  _$DutyFreeStatusHistoryDetailsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? createdOn = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdOn: null == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DutyFreeStatusHistoryDetailsResponseCopyWith<$Res>
    implements $DutyFreeStatusHistoryDetailsResponseCopyWith<$Res> {
  factory _$$_DutyFreeStatusHistoryDetailsResponseCopyWith(
          _$_DutyFreeStatusHistoryDetailsResponse value,
          $Res Function(_$_DutyFreeStatusHistoryDetailsResponse) then) =
      __$$_DutyFreeStatusHistoryDetailsResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, String createdOn});
}

/// @nodoc
class __$$_DutyFreeStatusHistoryDetailsResponseCopyWithImpl<$Res>
    extends _$DutyFreeStatusHistoryDetailsResponseCopyWithImpl<$Res,
        _$_DutyFreeStatusHistoryDetailsResponse>
    implements _$$_DutyFreeStatusHistoryDetailsResponseCopyWith<$Res> {
  __$$_DutyFreeStatusHistoryDetailsResponseCopyWithImpl(
      _$_DutyFreeStatusHistoryDetailsResponse _value,
      $Res Function(_$_DutyFreeStatusHistoryDetailsResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? createdOn = null,
  }) {
    return _then(_$_DutyFreeStatusHistoryDetailsResponse(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdOn: null == createdOn
          ? _value.createdOn
          : createdOn // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DutyFreeStatusHistoryDetailsResponse
    with DiagnosticableTreeMixin
    implements _DutyFreeStatusHistoryDetailsResponse {
  const _$_DutyFreeStatusHistoryDetailsResponse(
      {this.status = '', this.createdOn = ''});

  factory _$_DutyFreeStatusHistoryDetailsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$$_DutyFreeStatusHistoryDetailsResponseFromJson(json);

  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final String createdOn;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DutyFreeStatusHistoryDetailsResponse(status: $status, createdOn: $createdOn)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DutyFreeStatusHistoryDetailsResponse'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('createdOn', createdOn));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DutyFreeStatusHistoryDetailsResponse &&
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
  _$$_DutyFreeStatusHistoryDetailsResponseCopyWith<
          _$_DutyFreeStatusHistoryDetailsResponse>
      get copyWith => __$$_DutyFreeStatusHistoryDetailsResponseCopyWithImpl<
          _$_DutyFreeStatusHistoryDetailsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DutyFreeStatusHistoryDetailsResponseToJson(
      this,
    );
  }
}

abstract class _DutyFreeStatusHistoryDetailsResponse
    implements DutyFreeStatusHistoryDetailsResponse {
  const factory _DutyFreeStatusHistoryDetailsResponse(
      {final String status,
      final String createdOn}) = _$_DutyFreeStatusHistoryDetailsResponse;

  factory _DutyFreeStatusHistoryDetailsResponse.fromJson(
          Map<String, dynamic> json) =
      _$_DutyFreeStatusHistoryDetailsResponse.fromJson;

  @override
  String get status;
  @override
  String get createdOn;
  @override
  @JsonKey(ignore: true)
  _$$_DutyFreeStatusHistoryDetailsResponseCopyWith<
          _$_DutyFreeStatusHistoryDetailsResponse>
      get copyWith => throw _privateConstructorUsedError;
}
