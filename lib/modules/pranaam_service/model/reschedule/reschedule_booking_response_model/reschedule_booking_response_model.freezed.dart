// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reschedule_booking_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RescheduleBookingResponseModel _$RescheduleBookingResponseModelFromJson(
    Map<String, dynamic> json) {
  return _RescheduleBookingResponseModel.fromJson(json);
}

/// @nodoc
mixin _$RescheduleBookingResponseModel {
  @JsonKey(name: 'bookingId')
  int get bookingId => throw _privateConstructorUsedError;
  @JsonKey(name: 'oldBookingId')
  int get oldBookingId => throw _privateConstructorUsedError;
  @JsonKey(name: 'bookingStatus')
  dynamic get bookingStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'tripIdList')
  dynamic get tripIdList => throw _privateConstructorUsedError;
  @JsonKey(name: 'meta')
  Meta get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RescheduleBookingResponseModelCopyWith<RescheduleBookingResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RescheduleBookingResponseModelCopyWith<$Res> {
  factory $RescheduleBookingResponseModelCopyWith(
          RescheduleBookingResponseModel value,
          $Res Function(RescheduleBookingResponseModel) then) =
      _$RescheduleBookingResponseModelCopyWithImpl<$Res,
          RescheduleBookingResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'bookingId') int bookingId,
      @JsonKey(name: 'oldBookingId') int oldBookingId,
      @JsonKey(name: 'bookingStatus') dynamic bookingStatus,
      @JsonKey(name: 'tripIdList') dynamic tripIdList,
      @JsonKey(name: 'meta') Meta meta});

  $MetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$RescheduleBookingResponseModelCopyWithImpl<$Res,
        $Val extends RescheduleBookingResponseModel>
    implements $RescheduleBookingResponseModelCopyWith<$Res> {
  _$RescheduleBookingResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = null,
    Object? oldBookingId = null,
    Object? bookingStatus = freezed,
    Object? tripIdList = freezed,
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as int,
      oldBookingId: null == oldBookingId
          ? _value.oldBookingId
          : oldBookingId // ignore: cast_nullable_to_non_nullable
              as int,
      bookingStatus: freezed == bookingStatus
          ? _value.bookingStatus
          : bookingStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      tripIdList: freezed == tripIdList
          ? _value.tripIdList
          : tripIdList // ignore: cast_nullable_to_non_nullable
              as dynamic,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MetaCopyWith<$Res> get meta {
    return $MetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RescheduleBookingResponseModelCopyWith<$Res>
    implements $RescheduleBookingResponseModelCopyWith<$Res> {
  factory _$$_RescheduleBookingResponseModelCopyWith(
          _$_RescheduleBookingResponseModel value,
          $Res Function(_$_RescheduleBookingResponseModel) then) =
      __$$_RescheduleBookingResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'bookingId') int bookingId,
      @JsonKey(name: 'oldBookingId') int oldBookingId,
      @JsonKey(name: 'bookingStatus') dynamic bookingStatus,
      @JsonKey(name: 'tripIdList') dynamic tripIdList,
      @JsonKey(name: 'meta') Meta meta});

  @override
  $MetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$_RescheduleBookingResponseModelCopyWithImpl<$Res>
    extends _$RescheduleBookingResponseModelCopyWithImpl<$Res,
        _$_RescheduleBookingResponseModel>
    implements _$$_RescheduleBookingResponseModelCopyWith<$Res> {
  __$$_RescheduleBookingResponseModelCopyWithImpl(
      _$_RescheduleBookingResponseModel _value,
      $Res Function(_$_RescheduleBookingResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = null,
    Object? oldBookingId = null,
    Object? bookingStatus = freezed,
    Object? tripIdList = freezed,
    Object? meta = null,
  }) {
    return _then(_$_RescheduleBookingResponseModel(
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as int,
      oldBookingId: null == oldBookingId
          ? _value.oldBookingId
          : oldBookingId // ignore: cast_nullable_to_non_nullable
              as int,
      bookingStatus: freezed == bookingStatus
          ? _value.bookingStatus
          : bookingStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      tripIdList: freezed == tripIdList
          ? _value.tripIdList
          : tripIdList // ignore: cast_nullable_to_non_nullable
              as dynamic,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RescheduleBookingResponseModel
    implements _RescheduleBookingResponseModel {
  const _$_RescheduleBookingResponseModel(
      {@JsonKey(name: 'bookingId') this.bookingId = 0,
      @JsonKey(name: 'oldBookingId') this.oldBookingId = 0,
      @JsonKey(name: 'bookingStatus') this.bookingStatus = '',
      @JsonKey(name: 'tripIdList') this.tripIdList = '',
      @JsonKey(name: 'meta') this.meta = const Meta()});

  factory _$_RescheduleBookingResponseModel.fromJson(
          Map<String, dynamic> json) =>
      _$$_RescheduleBookingResponseModelFromJson(json);

  @override
  @JsonKey(name: 'bookingId')
  final int bookingId;
  @override
  @JsonKey(name: 'oldBookingId')
  final int oldBookingId;
  @override
  @JsonKey(name: 'bookingStatus')
  final dynamic bookingStatus;
  @override
  @JsonKey(name: 'tripIdList')
  final dynamic tripIdList;
  @override
  @JsonKey(name: 'meta')
  final Meta meta;

  @override
  String toString() {
    return 'RescheduleBookingResponseModel(bookingId: $bookingId, oldBookingId: $oldBookingId, bookingStatus: $bookingStatus, tripIdList: $tripIdList, meta: $meta)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RescheduleBookingResponseModel &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.oldBookingId, oldBookingId) ||
                other.oldBookingId == oldBookingId) &&
            const DeepCollectionEquality()
                .equals(other.bookingStatus, bookingStatus) &&
            const DeepCollectionEquality()
                .equals(other.tripIdList, tripIdList) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      bookingId,
      oldBookingId,
      const DeepCollectionEquality().hash(bookingStatus),
      const DeepCollectionEquality().hash(tripIdList),
      meta);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RescheduleBookingResponseModelCopyWith<_$_RescheduleBookingResponseModel>
      get copyWith => __$$_RescheduleBookingResponseModelCopyWithImpl<
          _$_RescheduleBookingResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RescheduleBookingResponseModelToJson(
      this,
    );
  }
}

abstract class _RescheduleBookingResponseModel
    implements RescheduleBookingResponseModel {
  const factory _RescheduleBookingResponseModel(
          {@JsonKey(name: 'bookingId') final int bookingId,
          @JsonKey(name: 'oldBookingId') final int oldBookingId,
          @JsonKey(name: 'bookingStatus') final dynamic bookingStatus,
          @JsonKey(name: 'tripIdList') final dynamic tripIdList,
          @JsonKey(name: 'meta') final Meta meta}) =
      _$_RescheduleBookingResponseModel;

  factory _RescheduleBookingResponseModel.fromJson(Map<String, dynamic> json) =
      _$_RescheduleBookingResponseModel.fromJson;

  @override
  @JsonKey(name: 'bookingId')
  int get bookingId;
  @override
  @JsonKey(name: 'oldBookingId')
  int get oldBookingId;
  @override
  @JsonKey(name: 'bookingStatus')
  dynamic get bookingStatus;
  @override
  @JsonKey(name: 'tripIdList')
  dynamic get tripIdList;
  @override
  @JsonKey(name: 'meta')
  Meta get meta;
  @override
  @JsonKey(ignore: true)
  _$$_RescheduleBookingResponseModelCopyWith<_$_RescheduleBookingResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return _Meta.fromJson(json);
}

/// @nodoc
mixin _$Meta {
  @JsonKey(name: 'count')
  int get count => throw _privateConstructorUsedError;
  @JsonKey(name: 'statusCode')
  int get statusCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'error')
  Error get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetaCopyWith<Meta> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaCopyWith<$Res> {
  factory $MetaCopyWith(Meta value, $Res Function(Meta) then) =
      _$MetaCopyWithImpl<$Res, Meta>;
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int count,
      @JsonKey(name: 'statusCode') int statusCode,
      @JsonKey(name: 'error') Error error});

  $ErrorCopyWith<$Res> get error;
}

/// @nodoc
class _$MetaCopyWithImpl<$Res, $Val extends Meta>
    implements $MetaCopyWith<$Res> {
  _$MetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? statusCode = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ErrorCopyWith<$Res> get error {
    return $ErrorCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MetaCopyWith<$Res> implements $MetaCopyWith<$Res> {
  factory _$$_MetaCopyWith(_$_Meta value, $Res Function(_$_Meta) then) =
      __$$_MetaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int count,
      @JsonKey(name: 'statusCode') int statusCode,
      @JsonKey(name: 'error') Error error});

  @override
  $ErrorCopyWith<$Res> get error;
}

/// @nodoc
class __$$_MetaCopyWithImpl<$Res> extends _$MetaCopyWithImpl<$Res, _$_Meta>
    implements _$$_MetaCopyWith<$Res> {
  __$$_MetaCopyWithImpl(_$_Meta _value, $Res Function(_$_Meta) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? statusCode = null,
    Object? error = null,
  }) {
    return _then(_$_Meta(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Meta implements _Meta {
  const _$_Meta(
      {@JsonKey(name: 'count') this.count = 0,
      @JsonKey(name: 'statusCode') this.statusCode = 0,
      @JsonKey(name: 'error') this.error = const Error()});

  factory _$_Meta.fromJson(Map<String, dynamic> json) => _$$_MetaFromJson(json);

  @override
  @JsonKey(name: 'count')
  final int count;
  @override
  @JsonKey(name: 'statusCode')
  final int statusCode;
  @override
  @JsonKey(name: 'error')
  final Error error;

  @override
  String toString() {
    return 'Meta(count: $count, statusCode: $statusCode, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Meta &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, statusCode, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MetaCopyWith<_$_Meta> get copyWith =>
      __$$_MetaCopyWithImpl<_$_Meta>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MetaToJson(
      this,
    );
  }
}

abstract class _Meta implements Meta {
  const factory _Meta(
      {@JsonKey(name: 'count') final int count,
      @JsonKey(name: 'statusCode') final int statusCode,
      @JsonKey(name: 'error') final Error error}) = _$_Meta;

  factory _Meta.fromJson(Map<String, dynamic> json) = _$_Meta.fromJson;

  @override
  @JsonKey(name: 'count')
  int get count;
  @override
  @JsonKey(name: 'statusCode')
  int get statusCode;
  @override
  @JsonKey(name: 'error')
  Error get error;
  @override
  @JsonKey(ignore: true)
  _$$_MetaCopyWith<_$_Meta> get copyWith => throw _privateConstructorUsedError;
}

Error _$ErrorFromJson(Map<String, dynamic> json) {
  return _Error.fromJson(json);
}

/// @nodoc
mixin _$Error {
  @JsonKey(name: 'statusCode')
  dynamic get statusCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'code')
  dynamic get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'source')
  dynamic get source => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorCopyWith<Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res, Error>;
  @useResult
  $Res call(
      {@JsonKey(name: 'statusCode') dynamic statusCode,
      @JsonKey(name: 'code') dynamic code,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'source') dynamic source});
}

/// @nodoc
class _$ErrorCopyWithImpl<$Res, $Val extends Error>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? code = freezed,
    Object? description = null,
    Object? source = freezed,
  }) {
    return _then(_value.copyWith(
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as dynamic,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> implements $ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'statusCode') dynamic statusCode,
      @JsonKey(name: 'code') dynamic code,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'source') dynamic source});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res> extends _$ErrorCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = freezed,
    Object? code = freezed,
    Object? description = null,
    Object? source = freezed,
  }) {
    return _then(_$_Error(
      statusCode: freezed == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as dynamic,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Error implements _Error {
  const _$_Error(
      {@JsonKey(name: 'statusCode') this.statusCode = 0,
      @JsonKey(name: 'code') this.code = 0,
      @JsonKey(name: 'description') this.description = '',
      @JsonKey(name: 'source') this.source = ''});

  factory _$_Error.fromJson(Map<String, dynamic> json) =>
      _$$_ErrorFromJson(json);

  @override
  @JsonKey(name: 'statusCode')
  final dynamic statusCode;
  @override
  @JsonKey(name: 'code')
  final dynamic code;
  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'source')
  final dynamic source;

  @override
  String toString() {
    return 'Error(statusCode: $statusCode, code: $code, description: $description, source: $source)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            const DeepCollectionEquality()
                .equals(other.statusCode, statusCode) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.source, source));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(statusCode),
      const DeepCollectionEquality().hash(code),
      description,
      const DeepCollectionEquality().hash(source));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ErrorToJson(
      this,
    );
  }
}

abstract class _Error implements Error {
  const factory _Error(
      {@JsonKey(name: 'statusCode') final dynamic statusCode,
      @JsonKey(name: 'code') final dynamic code,
      @JsonKey(name: 'description') final String description,
      @JsonKey(name: 'source') final dynamic source}) = _$_Error;

  factory _Error.fromJson(Map<String, dynamic> json) = _$_Error.fromJson;

  @override
  @JsonKey(name: 'statusCode')
  dynamic get statusCode;
  @override
  @JsonKey(name: 'code')
  dynamic get code;
  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'source')
  dynamic get source;
  @override
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
