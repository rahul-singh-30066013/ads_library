// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'salute_count_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SaluteCountResponseModel _$SaluteCountResponseModelFromJson(
    Map<String, dynamic> json) {
  return _SaluteCountResponseModel.fromJson(json);
}

/// @nodoc
mixin _$SaluteCountResponseModel {
  int? get counter => throw _privateConstructorUsedError;
  String? get campaignId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SaluteCountResponseModelCopyWith<SaluteCountResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaluteCountResponseModelCopyWith<$Res> {
  factory $SaluteCountResponseModelCopyWith(SaluteCountResponseModel value,
          $Res Function(SaluteCountResponseModel) then) =
      _$SaluteCountResponseModelCopyWithImpl<$Res, SaluteCountResponseModel>;
  @useResult
  $Res call({int? counter, String? campaignId});
}

/// @nodoc
class _$SaluteCountResponseModelCopyWithImpl<$Res,
        $Val extends SaluteCountResponseModel>
    implements $SaluteCountResponseModelCopyWith<$Res> {
  _$SaluteCountResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = freezed,
    Object? campaignId = freezed,
  }) {
    return _then(_value.copyWith(
      counter: freezed == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int?,
      campaignId: freezed == campaignId
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SaluteCountResponseModelCopyWith<$Res>
    implements $SaluteCountResponseModelCopyWith<$Res> {
  factory _$$_SaluteCountResponseModelCopyWith(
          _$_SaluteCountResponseModel value,
          $Res Function(_$_SaluteCountResponseModel) then) =
      __$$_SaluteCountResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? counter, String? campaignId});
}

/// @nodoc
class __$$_SaluteCountResponseModelCopyWithImpl<$Res>
    extends _$SaluteCountResponseModelCopyWithImpl<$Res,
        _$_SaluteCountResponseModel>
    implements _$$_SaluteCountResponseModelCopyWith<$Res> {
  __$$_SaluteCountResponseModelCopyWithImpl(_$_SaluteCountResponseModel _value,
      $Res Function(_$_SaluteCountResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? counter = freezed,
    Object? campaignId = freezed,
  }) {
    return _then(_$_SaluteCountResponseModel(
      counter: freezed == counter
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int?,
      campaignId: freezed == campaignId
          ? _value.campaignId
          : campaignId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SaluteCountResponseModel implements _SaluteCountResponseModel {
  const _$_SaluteCountResponseModel({this.counter, this.campaignId});

  factory _$_SaluteCountResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_SaluteCountResponseModelFromJson(json);

  @override
  final int? counter;
  @override
  final String? campaignId;

  @override
  String toString() {
    return 'SaluteCountResponseModel(counter: $counter, campaignId: $campaignId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SaluteCountResponseModel &&
            (identical(other.counter, counter) || other.counter == counter) &&
            (identical(other.campaignId, campaignId) ||
                other.campaignId == campaignId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, counter, campaignId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SaluteCountResponseModelCopyWith<_$_SaluteCountResponseModel>
      get copyWith => __$$_SaluteCountResponseModelCopyWithImpl<
          _$_SaluteCountResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SaluteCountResponseModelToJson(
      this,
    );
  }
}

abstract class _SaluteCountResponseModel implements SaluteCountResponseModel {
  const factory _SaluteCountResponseModel(
      {final int? counter,
      final String? campaignId}) = _$_SaluteCountResponseModel;

  factory _SaluteCountResponseModel.fromJson(Map<String, dynamic> json) =
      _$_SaluteCountResponseModel.fromJson;

  @override
  int? get counter;
  @override
  String? get campaignId;
  @override
  @JsonKey(ignore: true)
  _$$_SaluteCountResponseModelCopyWith<_$_SaluteCountResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}
