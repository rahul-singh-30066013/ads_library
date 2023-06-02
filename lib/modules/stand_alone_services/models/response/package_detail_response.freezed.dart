// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'package_detail_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PackageDetailResponse _$PackageDetailResponseFromJson(
    Map<String, dynamic> json) {
  return _PackageDetailResponse.fromJson(json);
}

/// @nodoc
mixin _$PackageDetailResponse {
  @JsonKey(name: 'standAloneProducts')
  List<StandAloneProduct> get standAloneProducts =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PackageDetailResponseCopyWith<PackageDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackageDetailResponseCopyWith<$Res> {
  factory $PackageDetailResponseCopyWith(PackageDetailResponse value,
          $Res Function(PackageDetailResponse) then) =
      _$PackageDetailResponseCopyWithImpl<$Res, PackageDetailResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'standAloneProducts')
          List<StandAloneProduct> standAloneProducts});
}

/// @nodoc
class _$PackageDetailResponseCopyWithImpl<$Res,
        $Val extends PackageDetailResponse>
    implements $PackageDetailResponseCopyWith<$Res> {
  _$PackageDetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? standAloneProducts = null,
  }) {
    return _then(_value.copyWith(
      standAloneProducts: null == standAloneProducts
          ? _value.standAloneProducts
          : standAloneProducts // ignore: cast_nullable_to_non_nullable
              as List<StandAloneProduct>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PackageDetailResponseCopyWith<$Res>
    implements $PackageDetailResponseCopyWith<$Res> {
  factory _$$_PackageDetailResponseCopyWith(_$_PackageDetailResponse value,
          $Res Function(_$_PackageDetailResponse) then) =
      __$$_PackageDetailResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'standAloneProducts')
          List<StandAloneProduct> standAloneProducts});
}

/// @nodoc
class __$$_PackageDetailResponseCopyWithImpl<$Res>
    extends _$PackageDetailResponseCopyWithImpl<$Res, _$_PackageDetailResponse>
    implements _$$_PackageDetailResponseCopyWith<$Res> {
  __$$_PackageDetailResponseCopyWithImpl(_$_PackageDetailResponse _value,
      $Res Function(_$_PackageDetailResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? standAloneProducts = null,
  }) {
    return _then(_$_PackageDetailResponse(
      standAloneProducts: null == standAloneProducts
          ? _value.standAloneProducts
          : standAloneProducts // ignore: cast_nullable_to_non_nullable
              as List<StandAloneProduct>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PackageDetailResponse implements _PackageDetailResponse {
  const _$_PackageDetailResponse(
      {@JsonKey(name: 'standAloneProducts')
          this.standAloneProducts = const []});

  factory _$_PackageDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$$_PackageDetailResponseFromJson(json);

  @override
  @JsonKey(name: 'standAloneProducts')
  final List<StandAloneProduct> standAloneProducts;

  @override
  String toString() {
    return 'PackageDetailResponse(standAloneProducts: $standAloneProducts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PackageDetailResponse &&
            const DeepCollectionEquality()
                .equals(other.standAloneProducts, standAloneProducts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(standAloneProducts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PackageDetailResponseCopyWith<_$_PackageDetailResponse> get copyWith =>
      __$$_PackageDetailResponseCopyWithImpl<_$_PackageDetailResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PackageDetailResponseToJson(
      this,
    );
  }
}

abstract class _PackageDetailResponse implements PackageDetailResponse {
  const factory _PackageDetailResponse(
          {@JsonKey(name: 'standAloneProducts')
              final List<StandAloneProduct> standAloneProducts}) =
      _$_PackageDetailResponse;

  factory _PackageDetailResponse.fromJson(Map<String, dynamic> json) =
      _$_PackageDetailResponse.fromJson;

  @override
  @JsonKey(name: 'standAloneProducts')
  List<StandAloneProduct> get standAloneProducts;
  @override
  @JsonKey(ignore: true)
  _$$_PackageDetailResponseCopyWith<_$_PackageDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

StandAloneProduct _$StandAloneProductFromJson(Map<String, dynamic> json) {
  return _StandAloneProduct.fromJson(json);
}

/// @nodoc
mixin _$StandAloneProduct {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get travelSectorId => throw _privateConstructorUsedError;
  int? get serviceTypeId => throw _privateConstructorUsedError;
  int? get airportMasterId => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'pricingInfo')
  PricingInfo get pricingInfo => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StandAloneProductCopyWith<StandAloneProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StandAloneProductCopyWith<$Res> {
  factory $StandAloneProductCopyWith(
          StandAloneProduct value, $Res Function(StandAloneProduct) then) =
      _$StandAloneProductCopyWithImpl<$Res, StandAloneProduct>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      int? travelSectorId,
      int? serviceTypeId,
      int? airportMasterId,
      String? description,
      @JsonKey(name: 'pricingInfo') PricingInfo pricingInfo,
      int? count,
      String? imageUrl});

  $PricingInfoCopyWith<$Res> get pricingInfo;
}

/// @nodoc
class _$StandAloneProductCopyWithImpl<$Res, $Val extends StandAloneProduct>
    implements $StandAloneProductCopyWith<$Res> {
  _$StandAloneProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? travelSectorId = freezed,
    Object? serviceTypeId = freezed,
    Object? airportMasterId = freezed,
    Object? description = freezed,
    Object? pricingInfo = null,
    Object? count = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      travelSectorId: freezed == travelSectorId
          ? _value.travelSectorId
          : travelSectorId // ignore: cast_nullable_to_non_nullable
              as int?,
      serviceTypeId: freezed == serviceTypeId
          ? _value.serviceTypeId
          : serviceTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      airportMasterId: freezed == airportMasterId
          ? _value.airportMasterId
          : airportMasterId // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      pricingInfo: null == pricingInfo
          ? _value.pricingInfo
          : pricingInfo // ignore: cast_nullable_to_non_nullable
              as PricingInfo,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PricingInfoCopyWith<$Res> get pricingInfo {
    return $PricingInfoCopyWith<$Res>(_value.pricingInfo, (value) {
      return _then(_value.copyWith(pricingInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_StandAloneProductCopyWith<$Res>
    implements $StandAloneProductCopyWith<$Res> {
  factory _$$_StandAloneProductCopyWith(_$_StandAloneProduct value,
          $Res Function(_$_StandAloneProduct) then) =
      __$$_StandAloneProductCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      int? travelSectorId,
      int? serviceTypeId,
      int? airportMasterId,
      String? description,
      @JsonKey(name: 'pricingInfo') PricingInfo pricingInfo,
      int? count,
      String? imageUrl});

  @override
  $PricingInfoCopyWith<$Res> get pricingInfo;
}

/// @nodoc
class __$$_StandAloneProductCopyWithImpl<$Res>
    extends _$StandAloneProductCopyWithImpl<$Res, _$_StandAloneProduct>
    implements _$$_StandAloneProductCopyWith<$Res> {
  __$$_StandAloneProductCopyWithImpl(
      _$_StandAloneProduct _value, $Res Function(_$_StandAloneProduct) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? travelSectorId = freezed,
    Object? serviceTypeId = freezed,
    Object? airportMasterId = freezed,
    Object? description = freezed,
    Object? pricingInfo = null,
    Object? count = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$_StandAloneProduct(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      travelSectorId: freezed == travelSectorId
          ? _value.travelSectorId
          : travelSectorId // ignore: cast_nullable_to_non_nullable
              as int?,
      serviceTypeId: freezed == serviceTypeId
          ? _value.serviceTypeId
          : serviceTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      airportMasterId: freezed == airportMasterId
          ? _value.airportMasterId
          : airportMasterId // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      pricingInfo: null == pricingInfo
          ? _value.pricingInfo
          : pricingInfo // ignore: cast_nullable_to_non_nullable
              as PricingInfo,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StandAloneProduct implements _StandAloneProduct {
  const _$_StandAloneProduct(
      {this.id,
      this.name,
      this.travelSectorId,
      this.serviceTypeId,
      this.airportMasterId,
      this.description,
      @JsonKey(name: 'pricingInfo') this.pricingInfo = const PricingInfo(),
      this.count,
      this.imageUrl});

  factory _$_StandAloneProduct.fromJson(Map<String, dynamic> json) =>
      _$$_StandAloneProductFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final int? travelSectorId;
  @override
  final int? serviceTypeId;
  @override
  final int? airportMasterId;
  @override
  final String? description;
  @override
  @JsonKey(name: 'pricingInfo')
  final PricingInfo pricingInfo;
  @override
  final int? count;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'StandAloneProduct(id: $id, name: $name, travelSectorId: $travelSectorId, serviceTypeId: $serviceTypeId, airportMasterId: $airportMasterId, description: $description, pricingInfo: $pricingInfo, count: $count, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StandAloneProduct &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.travelSectorId, travelSectorId) ||
                other.travelSectorId == travelSectorId) &&
            (identical(other.serviceTypeId, serviceTypeId) ||
                other.serviceTypeId == serviceTypeId) &&
            (identical(other.airportMasterId, airportMasterId) ||
                other.airportMasterId == airportMasterId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.pricingInfo, pricingInfo) ||
                other.pricingInfo == pricingInfo) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      travelSectorId,
      serviceTypeId,
      airportMasterId,
      description,
      pricingInfo,
      count,
      imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StandAloneProductCopyWith<_$_StandAloneProduct> get copyWith =>
      __$$_StandAloneProductCopyWithImpl<_$_StandAloneProduct>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StandAloneProductToJson(
      this,
    );
  }
}

abstract class _StandAloneProduct implements StandAloneProduct {
  const factory _StandAloneProduct(
      {final int? id,
      final String? name,
      final int? travelSectorId,
      final int? serviceTypeId,
      final int? airportMasterId,
      final String? description,
      @JsonKey(name: 'pricingInfo') final PricingInfo pricingInfo,
      final int? count,
      final String? imageUrl}) = _$_StandAloneProduct;

  factory _StandAloneProduct.fromJson(Map<String, dynamic> json) =
      _$_StandAloneProduct.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  int? get travelSectorId;
  @override
  int? get serviceTypeId;
  @override
  int? get airportMasterId;
  @override
  String? get description;
  @override
  @JsonKey(name: 'pricingInfo')
  PricingInfo get pricingInfo;
  @override
  int? get count;
  @override
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_StandAloneProductCopyWith<_$_StandAloneProduct> get copyWith =>
      throw _privateConstructorUsedError;
}
