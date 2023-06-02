// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state_prov_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StateProvModel _$StateProvModelFromJson(Map<String, dynamic> json) {
  return _StateProvModel.fromJson(json);
}

/// @nodoc
mixin _$StateProvModel {
  @JsonKey(name: 'stateCode')
  int get stateCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'stateName')
  String get stateName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StateProvModelCopyWith<StateProvModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateProvModelCopyWith<$Res> {
  factory $StateProvModelCopyWith(
          StateProvModel value, $Res Function(StateProvModel) then) =
      _$StateProvModelCopyWithImpl<$Res, StateProvModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'stateCode') int stateCode,
      @JsonKey(name: 'stateName') String stateName});
}

/// @nodoc
class _$StateProvModelCopyWithImpl<$Res, $Val extends StateProvModel>
    implements $StateProvModelCopyWith<$Res> {
  _$StateProvModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateCode = null,
    Object? stateName = null,
  }) {
    return _then(_value.copyWith(
      stateCode: null == stateCode
          ? _value.stateCode
          : stateCode // ignore: cast_nullable_to_non_nullable
              as int,
      stateName: null == stateName
          ? _value.stateName
          : stateName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StateProvModelCopyWith<$Res>
    implements $StateProvModelCopyWith<$Res> {
  factory _$$_StateProvModelCopyWith(
          _$_StateProvModel value, $Res Function(_$_StateProvModel) then) =
      __$$_StateProvModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'stateCode') int stateCode,
      @JsonKey(name: 'stateName') String stateName});
}

/// @nodoc
class __$$_StateProvModelCopyWithImpl<$Res>
    extends _$StateProvModelCopyWithImpl<$Res, _$_StateProvModel>
    implements _$$_StateProvModelCopyWith<$Res> {
  __$$_StateProvModelCopyWithImpl(
      _$_StateProvModel _value, $Res Function(_$_StateProvModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateCode = null,
    Object? stateName = null,
  }) {
    return _then(_$_StateProvModel(
      stateCode: null == stateCode
          ? _value.stateCode
          : stateCode // ignore: cast_nullable_to_non_nullable
              as int,
      stateName: null == stateName
          ? _value.stateName
          : stateName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_StateProvModel implements _StateProvModel {
  const _$_StateProvModel(
      {@JsonKey(name: 'stateCode') this.stateCode = 0,
      @JsonKey(name: 'stateName') this.stateName = ''});

  factory _$_StateProvModel.fromJson(Map<String, dynamic> json) =>
      _$$_StateProvModelFromJson(json);

  @override
  @JsonKey(name: 'stateCode')
  final int stateCode;
  @override
  @JsonKey(name: 'stateName')
  final String stateName;

  @override
  String toString() {
    return 'StateProvModel(stateCode: $stateCode, stateName: $stateName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StateProvModel &&
            (identical(other.stateCode, stateCode) ||
                other.stateCode == stateCode) &&
            (identical(other.stateName, stateName) ||
                other.stateName == stateName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, stateCode, stateName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StateProvModelCopyWith<_$_StateProvModel> get copyWith =>
      __$$_StateProvModelCopyWithImpl<_$_StateProvModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StateProvModelToJson(
      this,
    );
  }
}

abstract class _StateProvModel implements StateProvModel {
  const factory _StateProvModel(
      {@JsonKey(name: 'stateCode') final int stateCode,
      @JsonKey(name: 'stateName') final String stateName}) = _$_StateProvModel;

  factory _StateProvModel.fromJson(Map<String, dynamic> json) =
      _$_StateProvModel.fromJson;

  @override
  @JsonKey(name: 'stateCode')
  int get stateCode;
  @override
  @JsonKey(name: 'stateName')
  String get stateName;
  @override
  @JsonKey(ignore: true)
  _$$_StateProvModelCopyWith<_$_StateProvModel> get copyWith =>
      throw _privateConstructorUsedError;
}
