// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_list_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CatalogListResponseModel _$CatalogListResponseModelFromJson(
    Map<String, dynamic> json) {
  return _CatalogListResponseModel.fromJson(json);
}

/// @nodoc
mixin _$CatalogListResponseModel {
  List<DutyFreeProductDataModel> get result =>
      throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  List<DutyFreeProductDataModel>? get similar =>
      throw _privateConstructorUsedError;
  List<DutyFreeProductDataModel>? get soldTogether =>
      throw _privateConstructorUsedError;
  List<DutyFreeProductDataModel>? get exclusive =>
      throw _privateConstructorUsedError;
  DutyFreePolicyResponse? get policy => throw _privateConstructorUsedError;
  String get store => throw _privateConstructorUsedError;
  String get collectionPoint => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CatalogListResponseModelCopyWith<CatalogListResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatalogListResponseModelCopyWith<$Res> {
  factory $CatalogListResponseModelCopyWith(CatalogListResponseModel value,
          $Res Function(CatalogListResponseModel) then) =
      _$CatalogListResponseModelCopyWithImpl<$Res, CatalogListResponseModel>;
  @useResult
  $Res call(
      {List<DutyFreeProductDataModel> result,
      int count,
      List<DutyFreeProductDataModel>? similar,
      List<DutyFreeProductDataModel>? soldTogether,
      List<DutyFreeProductDataModel>? exclusive,
      DutyFreePolicyResponse? policy,
      String store,
      String collectionPoint});

  $DutyFreePolicyResponseCopyWith<$Res>? get policy;
}

/// @nodoc
class _$CatalogListResponseModelCopyWithImpl<$Res,
        $Val extends CatalogListResponseModel>
    implements $CatalogListResponseModelCopyWith<$Res> {
  _$CatalogListResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? count = null,
    Object? similar = freezed,
    Object? soldTogether = freezed,
    Object? exclusive = freezed,
    Object? policy = freezed,
    Object? store = null,
    Object? collectionPoint = null,
  }) {
    return _then(_value.copyWith(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<DutyFreeProductDataModel>,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      similar: freezed == similar
          ? _value.similar
          : similar // ignore: cast_nullable_to_non_nullable
              as List<DutyFreeProductDataModel>?,
      soldTogether: freezed == soldTogether
          ? _value.soldTogether
          : soldTogether // ignore: cast_nullable_to_non_nullable
              as List<DutyFreeProductDataModel>?,
      exclusive: freezed == exclusive
          ? _value.exclusive
          : exclusive // ignore: cast_nullable_to_non_nullable
              as List<DutyFreeProductDataModel>?,
      policy: freezed == policy
          ? _value.policy
          : policy // ignore: cast_nullable_to_non_nullable
              as DutyFreePolicyResponse?,
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as String,
      collectionPoint: null == collectionPoint
          ? _value.collectionPoint
          : collectionPoint // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DutyFreePolicyResponseCopyWith<$Res>? get policy {
    if (_value.policy == null) {
      return null;
    }

    return $DutyFreePolicyResponseCopyWith<$Res>(_value.policy!, (value) {
      return _then(_value.copyWith(policy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CatalogListResponseModelCopyWith<$Res>
    implements $CatalogListResponseModelCopyWith<$Res> {
  factory _$$_CatalogListResponseModelCopyWith(
          _$_CatalogListResponseModel value,
          $Res Function(_$_CatalogListResponseModel) then) =
      __$$_CatalogListResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DutyFreeProductDataModel> result,
      int count,
      List<DutyFreeProductDataModel>? similar,
      List<DutyFreeProductDataModel>? soldTogether,
      List<DutyFreeProductDataModel>? exclusive,
      DutyFreePolicyResponse? policy,
      String store,
      String collectionPoint});

  @override
  $DutyFreePolicyResponseCopyWith<$Res>? get policy;
}

/// @nodoc
class __$$_CatalogListResponseModelCopyWithImpl<$Res>
    extends _$CatalogListResponseModelCopyWithImpl<$Res,
        _$_CatalogListResponseModel>
    implements _$$_CatalogListResponseModelCopyWith<$Res> {
  __$$_CatalogListResponseModelCopyWithImpl(_$_CatalogListResponseModel _value,
      $Res Function(_$_CatalogListResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = null,
    Object? count = null,
    Object? similar = freezed,
    Object? soldTogether = freezed,
    Object? exclusive = freezed,
    Object? policy = freezed,
    Object? store = null,
    Object? collectionPoint = null,
  }) {
    return _then(_$_CatalogListResponseModel(
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<DutyFreeProductDataModel>,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      similar: freezed == similar
          ? _value.similar
          : similar // ignore: cast_nullable_to_non_nullable
              as List<DutyFreeProductDataModel>?,
      soldTogether: freezed == soldTogether
          ? _value.soldTogether
          : soldTogether // ignore: cast_nullable_to_non_nullable
              as List<DutyFreeProductDataModel>?,
      exclusive: freezed == exclusive
          ? _value.exclusive
          : exclusive // ignore: cast_nullable_to_non_nullable
              as List<DutyFreeProductDataModel>?,
      policy: freezed == policy
          ? _value.policy
          : policy // ignore: cast_nullable_to_non_nullable
              as DutyFreePolicyResponse?,
      store: null == store
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as String,
      collectionPoint: null == collectionPoint
          ? _value.collectionPoint
          : collectionPoint // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CatalogListResponseModel implements _CatalogListResponseModel {
  const _$_CatalogListResponseModel(
      {this.result = const [],
      this.count = 0,
      this.similar = null,
      this.soldTogether = null,
      this.exclusive = null,
      this.policy,
      this.store = '',
      this.collectionPoint = ''});

  factory _$_CatalogListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_CatalogListResponseModelFromJson(json);

  @override
  @JsonKey()
  final List<DutyFreeProductDataModel> result;
  @override
  @JsonKey()
  final int count;
  @override
  @JsonKey()
  final List<DutyFreeProductDataModel>? similar;
  @override
  @JsonKey()
  final List<DutyFreeProductDataModel>? soldTogether;
  @override
  @JsonKey()
  final List<DutyFreeProductDataModel>? exclusive;
  @override
  final DutyFreePolicyResponse? policy;
  @override
  @JsonKey()
  final String store;
  @override
  @JsonKey()
  final String collectionPoint;

  @override
  String toString() {
    return 'CatalogListResponseModel(result: $result, count: $count, similar: $similar, soldTogether: $soldTogether, exclusive: $exclusive, policy: $policy, store: $store, collectionPoint: $collectionPoint)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CatalogListResponseModel &&
            const DeepCollectionEquality().equals(other.result, result) &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality().equals(other.similar, similar) &&
            const DeepCollectionEquality()
                .equals(other.soldTogether, soldTogether) &&
            const DeepCollectionEquality().equals(other.exclusive, exclusive) &&
            (identical(other.policy, policy) || other.policy == policy) &&
            (identical(other.store, store) || other.store == store) &&
            (identical(other.collectionPoint, collectionPoint) ||
                other.collectionPoint == collectionPoint));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(result),
      count,
      const DeepCollectionEquality().hash(similar),
      const DeepCollectionEquality().hash(soldTogether),
      const DeepCollectionEquality().hash(exclusive),
      policy,
      store,
      collectionPoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CatalogListResponseModelCopyWith<_$_CatalogListResponseModel>
      get copyWith => __$$_CatalogListResponseModelCopyWithImpl<
          _$_CatalogListResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CatalogListResponseModelToJson(
      this,
    );
  }
}

abstract class _CatalogListResponseModel implements CatalogListResponseModel {
  const factory _CatalogListResponseModel(
      {final List<DutyFreeProductDataModel> result,
      final int count,
      final List<DutyFreeProductDataModel>? similar,
      final List<DutyFreeProductDataModel>? soldTogether,
      final List<DutyFreeProductDataModel>? exclusive,
      final DutyFreePolicyResponse? policy,
      final String store,
      final String collectionPoint}) = _$_CatalogListResponseModel;

  factory _CatalogListResponseModel.fromJson(Map<String, dynamic> json) =
      _$_CatalogListResponseModel.fromJson;

  @override
  List<DutyFreeProductDataModel> get result;
  @override
  int get count;
  @override
  List<DutyFreeProductDataModel>? get similar;
  @override
  List<DutyFreeProductDataModel>? get soldTogether;
  @override
  List<DutyFreeProductDataModel>? get exclusive;
  @override
  DutyFreePolicyResponse? get policy;
  @override
  String get store;
  @override
  String get collectionPoint;
  @override
  @JsonKey(ignore: true)
  _$$_CatalogListResponseModelCopyWith<_$_CatalogListResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}
