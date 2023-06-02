// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_booking_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateBookingResponseModel _$CreateBookingResponseModelFromJson(
    Map<String, dynamic> json) {
  return _CreateBookingResponseModel.fromJson(json);
}

/// @nodoc
mixin _$CreateBookingResponseModel {
  int get bookingId => throw _privateConstructorUsedError;
  int get customerId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateBookingResponseModelCopyWith<CreateBookingResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateBookingResponseModelCopyWith<$Res> {
  factory $CreateBookingResponseModelCopyWith(CreateBookingResponseModel value,
          $Res Function(CreateBookingResponseModel) then) =
      _$CreateBookingResponseModelCopyWithImpl<$Res,
          CreateBookingResponseModel>;
  @useResult
  $Res call({int bookingId, int customerId});
}

/// @nodoc
class _$CreateBookingResponseModelCopyWithImpl<$Res,
        $Val extends CreateBookingResponseModel>
    implements $CreateBookingResponseModelCopyWith<$Res> {
  _$CreateBookingResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = null,
    Object? customerId = null,
  }) {
    return _then(_value.copyWith(
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as int,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateBookingResponseModelCopyWith<$Res>
    implements $CreateBookingResponseModelCopyWith<$Res> {
  factory _$$_CreateBookingResponseModelCopyWith(
          _$_CreateBookingResponseModel value,
          $Res Function(_$_CreateBookingResponseModel) then) =
      __$$_CreateBookingResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int bookingId, int customerId});
}

/// @nodoc
class __$$_CreateBookingResponseModelCopyWithImpl<$Res>
    extends _$CreateBookingResponseModelCopyWithImpl<$Res,
        _$_CreateBookingResponseModel>
    implements _$$_CreateBookingResponseModelCopyWith<$Res> {
  __$$_CreateBookingResponseModelCopyWithImpl(
      _$_CreateBookingResponseModel _value,
      $Res Function(_$_CreateBookingResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = null,
    Object? customerId = null,
  }) {
    return _then(_$_CreateBookingResponseModel(
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as int,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreateBookingResponseModel implements _CreateBookingResponseModel {
  const _$_CreateBookingResponseModel(
      {this.bookingId = 0, this.customerId = 0});

  factory _$_CreateBookingResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_CreateBookingResponseModelFromJson(json);

  @override
  @JsonKey()
  final int bookingId;
  @override
  @JsonKey()
  final int customerId;

  @override
  String toString() {
    return 'CreateBookingResponseModel(bookingId: $bookingId, customerId: $customerId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateBookingResponseModel &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, bookingId, customerId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateBookingResponseModelCopyWith<_$_CreateBookingResponseModel>
      get copyWith => __$$_CreateBookingResponseModelCopyWithImpl<
          _$_CreateBookingResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateBookingResponseModelToJson(
      this,
    );
  }
}

abstract class _CreateBookingResponseModel
    implements CreateBookingResponseModel {
  const factory _CreateBookingResponseModel(
      {final int bookingId,
      final int customerId}) = _$_CreateBookingResponseModel;

  factory _CreateBookingResponseModel.fromJson(Map<String, dynamic> json) =
      _$_CreateBookingResponseModel.fromJson;

  @override
  int get bookingId;
  @override
  int get customerId;
  @override
  @JsonKey(ignore: true)
  _$$_CreateBookingResponseModelCopyWith<_$_CreateBookingResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}
