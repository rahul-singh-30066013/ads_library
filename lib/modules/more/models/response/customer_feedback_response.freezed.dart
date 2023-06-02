// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_feedback_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerFeedbackResponse _$CustomerFeedbackResponseFromJson(
    Map<String, dynamic> json) {
  return _CustomerFeedbackResponse.fromJson(json);
}

/// @nodoc
mixin _$CustomerFeedbackResponse {
  IncidentDetail? get incidentDetail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerFeedbackResponseCopyWith<CustomerFeedbackResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerFeedbackResponseCopyWith<$Res> {
  factory $CustomerFeedbackResponseCopyWith(CustomerFeedbackResponse value,
          $Res Function(CustomerFeedbackResponse) then) =
      _$CustomerFeedbackResponseCopyWithImpl<$Res, CustomerFeedbackResponse>;
  @useResult
  $Res call({IncidentDetail? incidentDetail});

  $IncidentDetailCopyWith<$Res>? get incidentDetail;
}

/// @nodoc
class _$CustomerFeedbackResponseCopyWithImpl<$Res,
        $Val extends CustomerFeedbackResponse>
    implements $CustomerFeedbackResponseCopyWith<$Res> {
  _$CustomerFeedbackResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? incidentDetail = freezed,
  }) {
    return _then(_value.copyWith(
      incidentDetail: freezed == incidentDetail
          ? _value.incidentDetail
          : incidentDetail // ignore: cast_nullable_to_non_nullable
              as IncidentDetail?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $IncidentDetailCopyWith<$Res>? get incidentDetail {
    if (_value.incidentDetail == null) {
      return null;
    }

    return $IncidentDetailCopyWith<$Res>(_value.incidentDetail!, (value) {
      return _then(_value.copyWith(incidentDetail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CustomerFeedbackResponseCopyWith<$Res>
    implements $CustomerFeedbackResponseCopyWith<$Res> {
  factory _$$_CustomerFeedbackResponseCopyWith(
          _$_CustomerFeedbackResponse value,
          $Res Function(_$_CustomerFeedbackResponse) then) =
      __$$_CustomerFeedbackResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({IncidentDetail? incidentDetail});

  @override
  $IncidentDetailCopyWith<$Res>? get incidentDetail;
}

/// @nodoc
class __$$_CustomerFeedbackResponseCopyWithImpl<$Res>
    extends _$CustomerFeedbackResponseCopyWithImpl<$Res,
        _$_CustomerFeedbackResponse>
    implements _$$_CustomerFeedbackResponseCopyWith<$Res> {
  __$$_CustomerFeedbackResponseCopyWithImpl(_$_CustomerFeedbackResponse _value,
      $Res Function(_$_CustomerFeedbackResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? incidentDetail = freezed,
  }) {
    return _then(_$_CustomerFeedbackResponse(
      incidentDetail: freezed == incidentDetail
          ? _value.incidentDetail
          : incidentDetail // ignore: cast_nullable_to_non_nullable
              as IncidentDetail?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomerFeedbackResponse implements _CustomerFeedbackResponse {
  const _$_CustomerFeedbackResponse({this.incidentDetail});

  factory _$_CustomerFeedbackResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerFeedbackResponseFromJson(json);

  @override
  final IncidentDetail? incidentDetail;

  @override
  String toString() {
    return 'CustomerFeedbackResponse(incidentDetail: $incidentDetail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerFeedbackResponse &&
            (identical(other.incidentDetail, incidentDetail) ||
                other.incidentDetail == incidentDetail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, incidentDetail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerFeedbackResponseCopyWith<_$_CustomerFeedbackResponse>
      get copyWith => __$$_CustomerFeedbackResponseCopyWithImpl<
          _$_CustomerFeedbackResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerFeedbackResponseToJson(
      this,
    );
  }
}

abstract class _CustomerFeedbackResponse implements CustomerFeedbackResponse {
  const factory _CustomerFeedbackResponse(
      {final IncidentDetail? incidentDetail}) = _$_CustomerFeedbackResponse;

  factory _CustomerFeedbackResponse.fromJson(Map<String, dynamic> json) =
      _$_CustomerFeedbackResponse.fromJson;

  @override
  IncidentDetail? get incidentDetail;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerFeedbackResponseCopyWith<_$_CustomerFeedbackResponse>
      get copyWith => throw _privateConstructorUsedError;
}

IncidentDetail _$IncidentDetailFromJson(Map<String, dynamic> json) {
  return _IncidentDetail.fromJson(json);
}

/// @nodoc
mixin _$IncidentDetail {
  String get incidentId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IncidentDetailCopyWith<IncidentDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncidentDetailCopyWith<$Res> {
  factory $IncidentDetailCopyWith(
          IncidentDetail value, $Res Function(IncidentDetail) then) =
      _$IncidentDetailCopyWithImpl<$Res, IncidentDetail>;
  @useResult
  $Res call({String incidentId});
}

/// @nodoc
class _$IncidentDetailCopyWithImpl<$Res, $Val extends IncidentDetail>
    implements $IncidentDetailCopyWith<$Res> {
  _$IncidentDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? incidentId = null,
  }) {
    return _then(_value.copyWith(
      incidentId: null == incidentId
          ? _value.incidentId
          : incidentId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IncidentDetailCopyWith<$Res>
    implements $IncidentDetailCopyWith<$Res> {
  factory _$$_IncidentDetailCopyWith(
          _$_IncidentDetail value, $Res Function(_$_IncidentDetail) then) =
      __$$_IncidentDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String incidentId});
}

/// @nodoc
class __$$_IncidentDetailCopyWithImpl<$Res>
    extends _$IncidentDetailCopyWithImpl<$Res, _$_IncidentDetail>
    implements _$$_IncidentDetailCopyWith<$Res> {
  __$$_IncidentDetailCopyWithImpl(
      _$_IncidentDetail _value, $Res Function(_$_IncidentDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? incidentId = null,
  }) {
    return _then(_$_IncidentDetail(
      incidentId: null == incidentId
          ? _value.incidentId
          : incidentId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IncidentDetail implements _IncidentDetail {
  const _$_IncidentDetail({this.incidentId = ''});

  factory _$_IncidentDetail.fromJson(Map<String, dynamic> json) =>
      _$$_IncidentDetailFromJson(json);

  @override
  @JsonKey()
  final String incidentId;

  @override
  String toString() {
    return 'IncidentDetail(incidentId: $incidentId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IncidentDetail &&
            (identical(other.incidentId, incidentId) ||
                other.incidentId == incidentId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, incidentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IncidentDetailCopyWith<_$_IncidentDetail> get copyWith =>
      __$$_IncidentDetailCopyWithImpl<_$_IncidentDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IncidentDetailToJson(
      this,
    );
  }
}

abstract class _IncidentDetail implements IncidentDetail {
  const factory _IncidentDetail({final String incidentId}) = _$_IncidentDetail;

  factory _IncidentDetail.fromJson(Map<String, dynamic> json) =
      _$_IncidentDetail.fromJson;

  @override
  String get incidentId;
  @override
  @JsonKey(ignore: true)
  _$$_IncidentDetailCopyWith<_$_IncidentDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
