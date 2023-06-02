// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_flights_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetFlightsResponseModel _$GetFlightsResponseModelFromJson(
    Map<String, dynamic> json) {
  return _GetFlightsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$GetFlightsResponseModel {
  List<PranaamFlights>? get pranaamFlights =>
      throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetFlightsResponseModelCopyWith<GetFlightsResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetFlightsResponseModelCopyWith<$Res> {
  factory $GetFlightsResponseModelCopyWith(GetFlightsResponseModel value,
          $Res Function(GetFlightsResponseModel) then) =
      _$GetFlightsResponseModelCopyWithImpl<$Res, GetFlightsResponseModel>;
  @useResult
  $Res call({List<PranaamFlights>? pranaamFlights, String message});
}

/// @nodoc
class _$GetFlightsResponseModelCopyWithImpl<$Res,
        $Val extends GetFlightsResponseModel>
    implements $GetFlightsResponseModelCopyWith<$Res> {
  _$GetFlightsResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pranaamFlights = freezed,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      pranaamFlights: freezed == pranaamFlights
          ? _value.pranaamFlights
          : pranaamFlights // ignore: cast_nullable_to_non_nullable
              as List<PranaamFlights>?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetFlightsResponseModelCopyWith<$Res>
    implements $GetFlightsResponseModelCopyWith<$Res> {
  factory _$$_GetFlightsResponseModelCopyWith(_$_GetFlightsResponseModel value,
          $Res Function(_$_GetFlightsResponseModel) then) =
      __$$_GetFlightsResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PranaamFlights>? pranaamFlights, String message});
}

/// @nodoc
class __$$_GetFlightsResponseModelCopyWithImpl<$Res>
    extends _$GetFlightsResponseModelCopyWithImpl<$Res,
        _$_GetFlightsResponseModel>
    implements _$$_GetFlightsResponseModelCopyWith<$Res> {
  __$$_GetFlightsResponseModelCopyWithImpl(_$_GetFlightsResponseModel _value,
      $Res Function(_$_GetFlightsResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pranaamFlights = freezed,
    Object? message = null,
  }) {
    return _then(_$_GetFlightsResponseModel(
      pranaamFlights: freezed == pranaamFlights
          ? _value.pranaamFlights
          : pranaamFlights // ignore: cast_nullable_to_non_nullable
              as List<PranaamFlights>?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetFlightsResponseModel implements _GetFlightsResponseModel {
  const _$_GetFlightsResponseModel(
      {this.pranaamFlights = const [], this.message = ''});

  factory _$_GetFlightsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_GetFlightsResponseModelFromJson(json);

  @override
  @JsonKey()
  final List<PranaamFlights>? pranaamFlights;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'GetFlightsResponseModel(pranaamFlights: $pranaamFlights, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetFlightsResponseModel &&
            const DeepCollectionEquality()
                .equals(other.pranaamFlights, pranaamFlights) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(pranaamFlights), message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetFlightsResponseModelCopyWith<_$_GetFlightsResponseModel>
      get copyWith =>
          __$$_GetFlightsResponseModelCopyWithImpl<_$_GetFlightsResponseModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetFlightsResponseModelToJson(
      this,
    );
  }
}

abstract class _GetFlightsResponseModel implements GetFlightsResponseModel {
  const factory _GetFlightsResponseModel(
      {final List<PranaamFlights>? pranaamFlights,
      final String message}) = _$_GetFlightsResponseModel;

  factory _GetFlightsResponseModel.fromJson(Map<String, dynamic> json) =
      _$_GetFlightsResponseModel.fromJson;

  @override
  List<PranaamFlights>? get pranaamFlights;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_GetFlightsResponseModelCopyWith<_$_GetFlightsResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}
