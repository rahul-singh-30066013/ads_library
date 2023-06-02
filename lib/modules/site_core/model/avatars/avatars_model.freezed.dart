// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'avatars_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AvatarsModel _$AvatarsModelFromJson(Map<String, dynamic> json) {
  return _AvatarsModel.fromJson(json);
}

/// @nodoc
mixin _$AvatarsModel {
  int get count => throw _privateConstructorUsedError;
  List<Avatar> get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AvatarsModelCopyWith<AvatarsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvatarsModelCopyWith<$Res> {
  factory $AvatarsModelCopyWith(
          AvatarsModel value, $Res Function(AvatarsModel) then) =
      _$AvatarsModelCopyWithImpl<$Res, AvatarsModel>;
  @useResult
  $Res call({int count, List<Avatar> result});
}

/// @nodoc
class _$AvatarsModelCopyWithImpl<$Res, $Val extends AvatarsModel>
    implements $AvatarsModelCopyWith<$Res> {
  _$AvatarsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? result = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<Avatar>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AvatarsModelCopyWith<$Res>
    implements $AvatarsModelCopyWith<$Res> {
  factory _$$_AvatarsModelCopyWith(
          _$_AvatarsModel value, $Res Function(_$_AvatarsModel) then) =
      __$$_AvatarsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, List<Avatar> result});
}

/// @nodoc
class __$$_AvatarsModelCopyWithImpl<$Res>
    extends _$AvatarsModelCopyWithImpl<$Res, _$_AvatarsModel>
    implements _$$_AvatarsModelCopyWith<$Res> {
  __$$_AvatarsModelCopyWithImpl(
      _$_AvatarsModel _value, $Res Function(_$_AvatarsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? result = null,
  }) {
    return _then(_$_AvatarsModel(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<Avatar>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AvatarsModel implements _AvatarsModel {
  const _$_AvatarsModel({this.count = 0, this.result = const []});

  factory _$_AvatarsModel.fromJson(Map<String, dynamic> json) =>
      _$$_AvatarsModelFromJson(json);

  @override
  @JsonKey()
  final int count;
  @override
  @JsonKey()
  final List<Avatar> result;

  @override
  String toString() {
    return 'AvatarsModel(count: $count, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AvatarsModel &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality().equals(other.result, result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, count, const DeepCollectionEquality().hash(result));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AvatarsModelCopyWith<_$_AvatarsModel> get copyWith =>
      __$$_AvatarsModelCopyWithImpl<_$_AvatarsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AvatarsModelToJson(
      this,
    );
  }
}

abstract class _AvatarsModel implements AvatarsModel {
  const factory _AvatarsModel({final int count, final List<Avatar> result}) =
      _$_AvatarsModel;

  factory _AvatarsModel.fromJson(Map<String, dynamic> json) =
      _$_AvatarsModel.fromJson;

  @override
  int get count;
  @override
  List<Avatar> get result;
  @override
  @JsonKey(ignore: true)
  _$$_AvatarsModelCopyWith<_$_AvatarsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Avatar _$AvatarFromJson(Map<String, dynamic> json) {
  return _Avatar.fromJson(json);
}

/// @nodoc
mixin _$Avatar {
  String get avatarID => throw _privateConstructorUsedError;
  bool get avatarInclude => throw _privateConstructorUsedError;
  String get avatarImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AvatarCopyWith<Avatar> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvatarCopyWith<$Res> {
  factory $AvatarCopyWith(Avatar value, $Res Function(Avatar) then) =
      _$AvatarCopyWithImpl<$Res, Avatar>;
  @useResult
  $Res call({String avatarID, bool avatarInclude, String avatarImage});
}

/// @nodoc
class _$AvatarCopyWithImpl<$Res, $Val extends Avatar>
    implements $AvatarCopyWith<$Res> {
  _$AvatarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatarID = null,
    Object? avatarInclude = null,
    Object? avatarImage = null,
  }) {
    return _then(_value.copyWith(
      avatarID: null == avatarID
          ? _value.avatarID
          : avatarID // ignore: cast_nullable_to_non_nullable
              as String,
      avatarInclude: null == avatarInclude
          ? _value.avatarInclude
          : avatarInclude // ignore: cast_nullable_to_non_nullable
              as bool,
      avatarImage: null == avatarImage
          ? _value.avatarImage
          : avatarImage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AvatarCopyWith<$Res> implements $AvatarCopyWith<$Res> {
  factory _$$_AvatarCopyWith(_$_Avatar value, $Res Function(_$_Avatar) then) =
      __$$_AvatarCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String avatarID, bool avatarInclude, String avatarImage});
}

/// @nodoc
class __$$_AvatarCopyWithImpl<$Res>
    extends _$AvatarCopyWithImpl<$Res, _$_Avatar>
    implements _$$_AvatarCopyWith<$Res> {
  __$$_AvatarCopyWithImpl(_$_Avatar _value, $Res Function(_$_Avatar) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avatarID = null,
    Object? avatarInclude = null,
    Object? avatarImage = null,
  }) {
    return _then(_$_Avatar(
      avatarID: null == avatarID
          ? _value.avatarID
          : avatarID // ignore: cast_nullable_to_non_nullable
              as String,
      avatarInclude: null == avatarInclude
          ? _value.avatarInclude
          : avatarInclude // ignore: cast_nullable_to_non_nullable
              as bool,
      avatarImage: null == avatarImage
          ? _value.avatarImage
          : avatarImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Avatar implements _Avatar {
  const _$_Avatar(
      {this.avatarID = '', this.avatarInclude = false, this.avatarImage = ''});

  factory _$_Avatar.fromJson(Map<String, dynamic> json) =>
      _$$_AvatarFromJson(json);

  @override
  @JsonKey()
  final String avatarID;
  @override
  @JsonKey()
  final bool avatarInclude;
  @override
  @JsonKey()
  final String avatarImage;

  @override
  String toString() {
    return 'Avatar(avatarID: $avatarID, avatarInclude: $avatarInclude, avatarImage: $avatarImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Avatar &&
            (identical(other.avatarID, avatarID) ||
                other.avatarID == avatarID) &&
            (identical(other.avatarInclude, avatarInclude) ||
                other.avatarInclude == avatarInclude) &&
            (identical(other.avatarImage, avatarImage) ||
                other.avatarImage == avatarImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, avatarID, avatarInclude, avatarImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AvatarCopyWith<_$_Avatar> get copyWith =>
      __$$_AvatarCopyWithImpl<_$_Avatar>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AvatarToJson(
      this,
    );
  }
}

abstract class _Avatar implements Avatar {
  const factory _Avatar(
      {final String avatarID,
      final bool avatarInclude,
      final String avatarImage}) = _$_Avatar;

  factory _Avatar.fromJson(Map<String, dynamic> json) = _$_Avatar.fromJson;

  @override
  String get avatarID;
  @override
  bool get avatarInclude;
  @override
  String get avatarImage;
  @override
  @JsonKey(ignore: true)
  _$$_AvatarCopyWith<_$_Avatar> get copyWith =>
      throw _privateConstructorUsedError;
}
