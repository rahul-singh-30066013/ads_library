// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'package_detail_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PackageDetailRequest _$PackageDetailRequestFromJson(Map<String, dynamic> json) {
  return _PackageDetailRequest.fromJson(json);
}

/// @nodoc
mixin _$PackageDetailRequest {
  int get travelSectorId => throw _privateConstructorUsedError;
  int get serviceTypeId => throw _privateConstructorUsedError;
  String get serviceAirport => throw _privateConstructorUsedError;
  int get standaloneProductType => throw _privateConstructorUsedError;
  int get itemCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PackageDetailRequestCopyWith<PackageDetailRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackageDetailRequestCopyWith<$Res> {
  factory $PackageDetailRequestCopyWith(PackageDetailRequest value,
          $Res Function(PackageDetailRequest) then) =
      _$PackageDetailRequestCopyWithImpl<$Res, PackageDetailRequest>;
  @useResult
  $Res call(
      {int travelSectorId,
      int serviceTypeId,
      String serviceAirport,
      int standaloneProductType,
      int itemCount});
}

/// @nodoc
class _$PackageDetailRequestCopyWithImpl<$Res,
        $Val extends PackageDetailRequest>
    implements $PackageDetailRequestCopyWith<$Res> {
  _$PackageDetailRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? travelSectorId = null,
    Object? serviceTypeId = null,
    Object? serviceAirport = null,
    Object? standaloneProductType = null,
    Object? itemCount = null,
  }) {
    return _then(_value.copyWith(
      travelSectorId: null == travelSectorId
          ? _value.travelSectorId
          : travelSectorId // ignore: cast_nullable_to_non_nullable
              as int,
      serviceTypeId: null == serviceTypeId
          ? _value.serviceTypeId
          : serviceTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      serviceAirport: null == serviceAirport
          ? _value.serviceAirport
          : serviceAirport // ignore: cast_nullable_to_non_nullable
              as String,
      standaloneProductType: null == standaloneProductType
          ? _value.standaloneProductType
          : standaloneProductType // ignore: cast_nullable_to_non_nullable
              as int,
      itemCount: null == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PackageDetailRequestCopyWith<$Res>
    implements $PackageDetailRequestCopyWith<$Res> {
  factory _$$_PackageDetailRequestCopyWith(_$_PackageDetailRequest value,
          $Res Function(_$_PackageDetailRequest) then) =
      __$$_PackageDetailRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int travelSectorId,
      int serviceTypeId,
      String serviceAirport,
      int standaloneProductType,
      int itemCount});
}

/// @nodoc
class __$$_PackageDetailRequestCopyWithImpl<$Res>
    extends _$PackageDetailRequestCopyWithImpl<$Res, _$_PackageDetailRequest>
    implements _$$_PackageDetailRequestCopyWith<$Res> {
  __$$_PackageDetailRequestCopyWithImpl(_$_PackageDetailRequest _value,
      $Res Function(_$_PackageDetailRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? travelSectorId = null,
    Object? serviceTypeId = null,
    Object? serviceAirport = null,
    Object? standaloneProductType = null,
    Object? itemCount = null,
  }) {
    return _then(_$_PackageDetailRequest(
      travelSectorId: null == travelSectorId
          ? _value.travelSectorId
          : travelSectorId // ignore: cast_nullable_to_non_nullable
              as int,
      serviceTypeId: null == serviceTypeId
          ? _value.serviceTypeId
          : serviceTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      serviceAirport: null == serviceAirport
          ? _value.serviceAirport
          : serviceAirport // ignore: cast_nullable_to_non_nullable
              as String,
      standaloneProductType: null == standaloneProductType
          ? _value.standaloneProductType
          : standaloneProductType // ignore: cast_nullable_to_non_nullable
              as int,
      itemCount: null == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PackageDetailRequest implements _PackageDetailRequest {
  const _$_PackageDetailRequest(
      {required this.travelSectorId,
      required this.serviceTypeId,
      required this.serviceAirport,
      required this.standaloneProductType,
      required this.itemCount});

  factory _$_PackageDetailRequest.fromJson(Map<String, dynamic> json) =>
      _$$_PackageDetailRequestFromJson(json);

  @override
  final int travelSectorId;
  @override
  final int serviceTypeId;
  @override
  final String serviceAirport;
  @override
  final int standaloneProductType;
  @override
  final int itemCount;

  @override
  String toString() {
    return 'PackageDetailRequest(travelSectorId: $travelSectorId, serviceTypeId: $serviceTypeId, serviceAirport: $serviceAirport, standaloneProductType: $standaloneProductType, itemCount: $itemCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PackageDetailRequest &&
            (identical(other.travelSectorId, travelSectorId) ||
                other.travelSectorId == travelSectorId) &&
            (identical(other.serviceTypeId, serviceTypeId) ||
                other.serviceTypeId == serviceTypeId) &&
            (identical(other.serviceAirport, serviceAirport) ||
                other.serviceAirport == serviceAirport) &&
            (identical(other.standaloneProductType, standaloneProductType) ||
                other.standaloneProductType == standaloneProductType) &&
            (identical(other.itemCount, itemCount) ||
                other.itemCount == itemCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, travelSectorId, serviceTypeId,
      serviceAirport, standaloneProductType, itemCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PackageDetailRequestCopyWith<_$_PackageDetailRequest> get copyWith =>
      __$$_PackageDetailRequestCopyWithImpl<_$_PackageDetailRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PackageDetailRequestToJson(
      this,
    );
  }
}

abstract class _PackageDetailRequest implements PackageDetailRequest {
  const factory _PackageDetailRequest(
      {required final int travelSectorId,
      required final int serviceTypeId,
      required final String serviceAirport,
      required final int standaloneProductType,
      required final int itemCount}) = _$_PackageDetailRequest;

  factory _PackageDetailRequest.fromJson(Map<String, dynamic> json) =
      _$_PackageDetailRequest.fromJson;

  @override
  int get travelSectorId;
  @override
  int get serviceTypeId;
  @override
  String get serviceAirport;
  @override
  int get standaloneProductType;
  @override
  int get itemCount;
  @override
  @JsonKey(ignore: true)
  _$$_PackageDetailRequestCopyWith<_$_PackageDetailRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
