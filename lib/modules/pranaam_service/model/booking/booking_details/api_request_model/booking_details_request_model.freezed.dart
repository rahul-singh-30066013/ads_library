// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_details_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookingDetailsRequestModel _$BookingDetailsRequestModelFromJson(
    Map<String, dynamic> json) {
  return _BookingDetailsRequestModel.fromJson(json);
}

/// @nodoc
mixin _$BookingDetailsRequestModel {
  @JsonKey(name: 'tripId')
  int get tripId => throw _privateConstructorUsedError;
  @JsonKey(name: 'bookingId')
  int get bookingId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingDetailsRequestModelCopyWith<BookingDetailsRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingDetailsRequestModelCopyWith<$Res> {
  factory $BookingDetailsRequestModelCopyWith(BookingDetailsRequestModel value,
          $Res Function(BookingDetailsRequestModel) then) =
      _$BookingDetailsRequestModelCopyWithImpl<$Res,
          BookingDetailsRequestModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'tripId') int tripId,
      @JsonKey(name: 'bookingId') int bookingId});
}

/// @nodoc
class _$BookingDetailsRequestModelCopyWithImpl<$Res,
        $Val extends BookingDetailsRequestModel>
    implements $BookingDetailsRequestModelCopyWith<$Res> {
  _$BookingDetailsRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tripId = null,
    Object? bookingId = null,
  }) {
    return _then(_value.copyWith(
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as int,
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookingDetailsRequestModelCopyWith<$Res>
    implements $BookingDetailsRequestModelCopyWith<$Res> {
  factory _$$_BookingDetailsRequestModelCopyWith(
          _$_BookingDetailsRequestModel value,
          $Res Function(_$_BookingDetailsRequestModel) then) =
      __$$_BookingDetailsRequestModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'tripId') int tripId,
      @JsonKey(name: 'bookingId') int bookingId});
}

/// @nodoc
class __$$_BookingDetailsRequestModelCopyWithImpl<$Res>
    extends _$BookingDetailsRequestModelCopyWithImpl<$Res,
        _$_BookingDetailsRequestModel>
    implements _$$_BookingDetailsRequestModelCopyWith<$Res> {
  __$$_BookingDetailsRequestModelCopyWithImpl(
      _$_BookingDetailsRequestModel _value,
      $Res Function(_$_BookingDetailsRequestModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tripId = null,
    Object? bookingId = null,
  }) {
    return _then(_$_BookingDetailsRequestModel(
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as int,
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BookingDetailsRequestModel implements _BookingDetailsRequestModel {
  const _$_BookingDetailsRequestModel(
      {@JsonKey(name: 'tripId') this.tripId = 0,
      @JsonKey(name: 'bookingId') this.bookingId = defaultBookingId});

  factory _$_BookingDetailsRequestModel.fromJson(Map<String, dynamic> json) =>
      _$$_BookingDetailsRequestModelFromJson(json);

  @override
  @JsonKey(name: 'tripId')
  final int tripId;
  @override
  @JsonKey(name: 'bookingId')
  final int bookingId;

  @override
  String toString() {
    return 'BookingDetailsRequestModel(tripId: $tripId, bookingId: $bookingId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookingDetailsRequestModel &&
            (identical(other.tripId, tripId) || other.tripId == tripId) &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, tripId, bookingId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookingDetailsRequestModelCopyWith<_$_BookingDetailsRequestModel>
      get copyWith => __$$_BookingDetailsRequestModelCopyWithImpl<
          _$_BookingDetailsRequestModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookingDetailsRequestModelToJson(
      this,
    );
  }
}

abstract class _BookingDetailsRequestModel
    implements BookingDetailsRequestModel {
  const factory _BookingDetailsRequestModel(
          {@JsonKey(name: 'tripId') final int tripId,
          @JsonKey(name: 'bookingId') final int bookingId}) =
      _$_BookingDetailsRequestModel;

  factory _BookingDetailsRequestModel.fromJson(Map<String, dynamic> json) =
      _$_BookingDetailsRequestModel.fromJson;

  @override
  @JsonKey(name: 'tripId')
  int get tripId;
  @override
  @JsonKey(name: 'bookingId')
  int get bookingId;
  @override
  @JsonKey(ignore: true)
  _$$_BookingDetailsRequestModelCopyWith<_$_BookingDetailsRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}
