// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cancel_booking_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CancelBookingResponseModel _$CancelBookingResponseModelFromJson(
    Map<String, dynamic> json) {
  return _CancelBookingResponseModel.fromJson(json);
}

/// @nodoc
mixin _$CancelBookingResponseModel {
  @JsonKey(name: 'isSuccess')
  bool get isSuccess => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CancelBookingResponseModelCopyWith<CancelBookingResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CancelBookingResponseModelCopyWith<$Res> {
  factory $CancelBookingResponseModelCopyWith(CancelBookingResponseModel value,
          $Res Function(CancelBookingResponseModel) then) =
      _$CancelBookingResponseModelCopyWithImpl<$Res,
          CancelBookingResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'isSuccess') bool isSuccess,
      @JsonKey(name: 'message') String message});
}

/// @nodoc
class _$CancelBookingResponseModelCopyWithImpl<$Res,
        $Val extends CancelBookingResponseModel>
    implements $CancelBookingResponseModelCopyWith<$Res> {
  _$CancelBookingResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuccess = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CancelBookingResponseModelCopyWith<$Res>
    implements $CancelBookingResponseModelCopyWith<$Res> {
  factory _$$_CancelBookingResponseModelCopyWith(
          _$_CancelBookingResponseModel value,
          $Res Function(_$_CancelBookingResponseModel) then) =
      __$$_CancelBookingResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'isSuccess') bool isSuccess,
      @JsonKey(name: 'message') String message});
}

/// @nodoc
class __$$_CancelBookingResponseModelCopyWithImpl<$Res>
    extends _$CancelBookingResponseModelCopyWithImpl<$Res,
        _$_CancelBookingResponseModel>
    implements _$$_CancelBookingResponseModelCopyWith<$Res> {
  __$$_CancelBookingResponseModelCopyWithImpl(
      _$_CancelBookingResponseModel _value,
      $Res Function(_$_CancelBookingResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuccess = null,
    Object? message = null,
  }) {
    return _then(_$_CancelBookingResponseModel(
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CancelBookingResponseModel implements _CancelBookingResponseModel {
  const _$_CancelBookingResponseModel(
      {@JsonKey(name: 'isSuccess') this.isSuccess = false,
      @JsonKey(name: 'message') this.message = ''});

  factory _$_CancelBookingResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_CancelBookingResponseModelFromJson(json);

  @override
  @JsonKey(name: 'isSuccess')
  final bool isSuccess;
  @override
  @JsonKey(name: 'message')
  final String message;

  @override
  String toString() {
    return 'CancelBookingResponseModel(isSuccess: $isSuccess, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CancelBookingResponseModel &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isSuccess, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CancelBookingResponseModelCopyWith<_$_CancelBookingResponseModel>
      get copyWith => __$$_CancelBookingResponseModelCopyWithImpl<
          _$_CancelBookingResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CancelBookingResponseModelToJson(
      this,
    );
  }
}

abstract class _CancelBookingResponseModel
    implements CancelBookingResponseModel {
  const factory _CancelBookingResponseModel(
          {@JsonKey(name: 'isSuccess') final bool isSuccess,
          @JsonKey(name: 'message') final String message}) =
      _$_CancelBookingResponseModel;

  factory _CancelBookingResponseModel.fromJson(Map<String, dynamic> json) =
      _$_CancelBookingResponseModel.fromJson;

  @override
  @JsonKey(name: 'isSuccess')
  bool get isSuccess;
  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_CancelBookingResponseModelCopyWith<_$_CancelBookingResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}
