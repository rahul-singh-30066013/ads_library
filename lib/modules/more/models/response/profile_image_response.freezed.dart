// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_image_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProfileImageResponse _$ProfileImageResponseFromJson(Map<String, dynamic> json) {
  return _ProfileImageResponse.fromJson(json);
}

/// @nodoc
mixin _$ProfileImageResponse {
  String? get byteArray => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get contentType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileImageResponseCopyWith<ProfileImageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileImageResponseCopyWith<$Res> {
  factory $ProfileImageResponseCopyWith(ProfileImageResponse value,
          $Res Function(ProfileImageResponse) then) =
      _$ProfileImageResponseCopyWithImpl<$Res, ProfileImageResponse>;
  @useResult
  $Res call({String? byteArray, String? name, String? contentType});
}

/// @nodoc
class _$ProfileImageResponseCopyWithImpl<$Res,
        $Val extends ProfileImageResponse>
    implements $ProfileImageResponseCopyWith<$Res> {
  _$ProfileImageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? byteArray = freezed,
    Object? name = freezed,
    Object? contentType = freezed,
  }) {
    return _then(_value.copyWith(
      byteArray: freezed == byteArray
          ? _value.byteArray
          : byteArray // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      contentType: freezed == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProfileImageResponseCopyWith<$Res>
    implements $ProfileImageResponseCopyWith<$Res> {
  factory _$$_ProfileImageResponseCopyWith(_$_ProfileImageResponse value,
          $Res Function(_$_ProfileImageResponse) then) =
      __$$_ProfileImageResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? byteArray, String? name, String? contentType});
}

/// @nodoc
class __$$_ProfileImageResponseCopyWithImpl<$Res>
    extends _$ProfileImageResponseCopyWithImpl<$Res, _$_ProfileImageResponse>
    implements _$$_ProfileImageResponseCopyWith<$Res> {
  __$$_ProfileImageResponseCopyWithImpl(_$_ProfileImageResponse _value,
      $Res Function(_$_ProfileImageResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? byteArray = freezed,
    Object? name = freezed,
    Object? contentType = freezed,
  }) {
    return _then(_$_ProfileImageResponse(
      byteArray: freezed == byteArray
          ? _value.byteArray
          : byteArray // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      contentType: freezed == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProfileImageResponse implements _ProfileImageResponse {
  const _$_ProfileImageResponse({this.byteArray, this.name, this.contentType});

  factory _$_ProfileImageResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileImageResponseFromJson(json);

  @override
  final String? byteArray;
  @override
  final String? name;
  @override
  final String? contentType;

  @override
  String toString() {
    return 'ProfileImageResponse(byteArray: $byteArray, name: $name, contentType: $contentType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileImageResponse &&
            (identical(other.byteArray, byteArray) ||
                other.byteArray == byteArray) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, byteArray, name, contentType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileImageResponseCopyWith<_$_ProfileImageResponse> get copyWith =>
      __$$_ProfileImageResponseCopyWithImpl<_$_ProfileImageResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileImageResponseToJson(
      this,
    );
  }
}

abstract class _ProfileImageResponse implements ProfileImageResponse {
  const factory _ProfileImageResponse(
      {final String? byteArray,
      final String? name,
      final String? contentType}) = _$_ProfileImageResponse;

  factory _ProfileImageResponse.fromJson(Map<String, dynamic> json) =
      _$_ProfileImageResponse.fromJson;

  @override
  String? get byteArray;
  @override
  String? get name;
  @override
  String? get contentType;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileImageResponseCopyWith<_$_ProfileImageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
