// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pranaam_banner_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PranaamBannerModel _$PranaamBannerModelFromJson(Map<String, dynamic> json) {
  return _PranaamBannerModel.fromJson(json);
}

/// @nodoc
mixin _$PranaamBannerModel {
  List<UpSellLink>? get upSellLink => throw _privateConstructorUsedError;
  List<UpSellLink>? get offerLink => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PranaamBannerModelCopyWith<PranaamBannerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PranaamBannerModelCopyWith<$Res> {
  factory $PranaamBannerModelCopyWith(
          PranaamBannerModel value, $Res Function(PranaamBannerModel) then) =
      _$PranaamBannerModelCopyWithImpl<$Res, PranaamBannerModel>;
  @useResult
  $Res call({List<UpSellLink>? upSellLink, List<UpSellLink>? offerLink});
}

/// @nodoc
class _$PranaamBannerModelCopyWithImpl<$Res, $Val extends PranaamBannerModel>
    implements $PranaamBannerModelCopyWith<$Res> {
  _$PranaamBannerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? upSellLink = freezed,
    Object? offerLink = freezed,
  }) {
    return _then(_value.copyWith(
      upSellLink: freezed == upSellLink
          ? _value.upSellLink
          : upSellLink // ignore: cast_nullable_to_non_nullable
              as List<UpSellLink>?,
      offerLink: freezed == offerLink
          ? _value.offerLink
          : offerLink // ignore: cast_nullable_to_non_nullable
              as List<UpSellLink>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PranaamBannerModelCopyWith<$Res>
    implements $PranaamBannerModelCopyWith<$Res> {
  factory _$$_PranaamBannerModelCopyWith(_$_PranaamBannerModel value,
          $Res Function(_$_PranaamBannerModel) then) =
      __$$_PranaamBannerModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UpSellLink>? upSellLink, List<UpSellLink>? offerLink});
}

/// @nodoc
class __$$_PranaamBannerModelCopyWithImpl<$Res>
    extends _$PranaamBannerModelCopyWithImpl<$Res, _$_PranaamBannerModel>
    implements _$$_PranaamBannerModelCopyWith<$Res> {
  __$$_PranaamBannerModelCopyWithImpl(
      _$_PranaamBannerModel _value, $Res Function(_$_PranaamBannerModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? upSellLink = freezed,
    Object? offerLink = freezed,
  }) {
    return _then(_$_PranaamBannerModel(
      upSellLink: freezed == upSellLink
          ? _value.upSellLink
          : upSellLink // ignore: cast_nullable_to_non_nullable
              as List<UpSellLink>?,
      offerLink: freezed == offerLink
          ? _value.offerLink
          : offerLink // ignore: cast_nullable_to_non_nullable
              as List<UpSellLink>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PranaamBannerModel implements _PranaamBannerModel {
  const _$_PranaamBannerModel({this.upSellLink, this.offerLink});

  factory _$_PranaamBannerModel.fromJson(Map<String, dynamic> json) =>
      _$$_PranaamBannerModelFromJson(json);

  @override
  final List<UpSellLink>? upSellLink;
  @override
  final List<UpSellLink>? offerLink;

  @override
  String toString() {
    return 'PranaamBannerModel(upSellLink: $upSellLink, offerLink: $offerLink)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PranaamBannerModel &&
            const DeepCollectionEquality()
                .equals(other.upSellLink, upSellLink) &&
            const DeepCollectionEquality().equals(other.offerLink, offerLink));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(upSellLink),
      const DeepCollectionEquality().hash(offerLink));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PranaamBannerModelCopyWith<_$_PranaamBannerModel> get copyWith =>
      __$$_PranaamBannerModelCopyWithImpl<_$_PranaamBannerModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PranaamBannerModelToJson(
      this,
    );
  }
}

abstract class _PranaamBannerModel implements PranaamBannerModel {
  const factory _PranaamBannerModel(
      {final List<UpSellLink>? upSellLink,
      final List<UpSellLink>? offerLink}) = _$_PranaamBannerModel;

  factory _PranaamBannerModel.fromJson(Map<String, dynamic> json) =
      _$_PranaamBannerModel.fromJson;

  @override
  List<UpSellLink>? get upSellLink;
  @override
  List<UpSellLink>? get offerLink;
  @override
  @JsonKey(ignore: true)
  _$$_PranaamBannerModelCopyWith<_$_PranaamBannerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

UpSellLink _$UpSellLinkFromJson(Map<String, dynamic> json) {
  return _UpSellLink.fromJson(json);
}

/// @nodoc
mixin _$UpSellLink {
  String get appBannerURL => throw _privateConstructorUsedError;
  String get lob => throw _privateConstructorUsedError;
  String get serviceAirport => throw _privateConstructorUsedError;
  String get serviceType => throw _privateConstructorUsedError;
  String get offerUniqueID => throw _privateConstructorUsedError;
  String get redirectUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpSellLinkCopyWith<UpSellLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpSellLinkCopyWith<$Res> {
  factory $UpSellLinkCopyWith(
          UpSellLink value, $Res Function(UpSellLink) then) =
      _$UpSellLinkCopyWithImpl<$Res, UpSellLink>;
  @useResult
  $Res call(
      {String appBannerURL,
      String lob,
      String serviceAirport,
      String serviceType,
      String offerUniqueID,
      String redirectUrl});
}

/// @nodoc
class _$UpSellLinkCopyWithImpl<$Res, $Val extends UpSellLink>
    implements $UpSellLinkCopyWith<$Res> {
  _$UpSellLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appBannerURL = null,
    Object? lob = null,
    Object? serviceAirport = null,
    Object? serviceType = null,
    Object? offerUniqueID = null,
    Object? redirectUrl = null,
  }) {
    return _then(_value.copyWith(
      appBannerURL: null == appBannerURL
          ? _value.appBannerURL
          : appBannerURL // ignore: cast_nullable_to_non_nullable
              as String,
      lob: null == lob
          ? _value.lob
          : lob // ignore: cast_nullable_to_non_nullable
              as String,
      serviceAirport: null == serviceAirport
          ? _value.serviceAirport
          : serviceAirport // ignore: cast_nullable_to_non_nullable
              as String,
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String,
      offerUniqueID: null == offerUniqueID
          ? _value.offerUniqueID
          : offerUniqueID // ignore: cast_nullable_to_non_nullable
              as String,
      redirectUrl: null == redirectUrl
          ? _value.redirectUrl
          : redirectUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpSellLinkCopyWith<$Res>
    implements $UpSellLinkCopyWith<$Res> {
  factory _$$_UpSellLinkCopyWith(
          _$_UpSellLink value, $Res Function(_$_UpSellLink) then) =
      __$$_UpSellLinkCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String appBannerURL,
      String lob,
      String serviceAirport,
      String serviceType,
      String offerUniqueID,
      String redirectUrl});
}

/// @nodoc
class __$$_UpSellLinkCopyWithImpl<$Res>
    extends _$UpSellLinkCopyWithImpl<$Res, _$_UpSellLink>
    implements _$$_UpSellLinkCopyWith<$Res> {
  __$$_UpSellLinkCopyWithImpl(
      _$_UpSellLink _value, $Res Function(_$_UpSellLink) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appBannerURL = null,
    Object? lob = null,
    Object? serviceAirport = null,
    Object? serviceType = null,
    Object? offerUniqueID = null,
    Object? redirectUrl = null,
  }) {
    return _then(_$_UpSellLink(
      appBannerURL: null == appBannerURL
          ? _value.appBannerURL
          : appBannerURL // ignore: cast_nullable_to_non_nullable
              as String,
      lob: null == lob
          ? _value.lob
          : lob // ignore: cast_nullable_to_non_nullable
              as String,
      serviceAirport: null == serviceAirport
          ? _value.serviceAirport
          : serviceAirport // ignore: cast_nullable_to_non_nullable
              as String,
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as String,
      offerUniqueID: null == offerUniqueID
          ? _value.offerUniqueID
          : offerUniqueID // ignore: cast_nullable_to_non_nullable
              as String,
      redirectUrl: null == redirectUrl
          ? _value.redirectUrl
          : redirectUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpSellLink implements _UpSellLink {
  const _$_UpSellLink(
      {this.appBannerURL = '',
      this.lob = '',
      this.serviceAirport = '',
      this.serviceType = '',
      this.offerUniqueID = '',
      this.redirectUrl = ''});

  factory _$_UpSellLink.fromJson(Map<String, dynamic> json) =>
      _$$_UpSellLinkFromJson(json);

  @override
  @JsonKey()
  final String appBannerURL;
  @override
  @JsonKey()
  final String lob;
  @override
  @JsonKey()
  final String serviceAirport;
  @override
  @JsonKey()
  final String serviceType;
  @override
  @JsonKey()
  final String offerUniqueID;
  @override
  @JsonKey()
  final String redirectUrl;

  @override
  String toString() {
    return 'UpSellLink(appBannerURL: $appBannerURL, lob: $lob, serviceAirport: $serviceAirport, serviceType: $serviceType, offerUniqueID: $offerUniqueID, redirectUrl: $redirectUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpSellLink &&
            (identical(other.appBannerURL, appBannerURL) ||
                other.appBannerURL == appBannerURL) &&
            (identical(other.lob, lob) || other.lob == lob) &&
            (identical(other.serviceAirport, serviceAirport) ||
                other.serviceAirport == serviceAirport) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            (identical(other.offerUniqueID, offerUniqueID) ||
                other.offerUniqueID == offerUniqueID) &&
            (identical(other.redirectUrl, redirectUrl) ||
                other.redirectUrl == redirectUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, appBannerURL, lob,
      serviceAirport, serviceType, offerUniqueID, redirectUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpSellLinkCopyWith<_$_UpSellLink> get copyWith =>
      __$$_UpSellLinkCopyWithImpl<_$_UpSellLink>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpSellLinkToJson(
      this,
    );
  }
}

abstract class _UpSellLink implements UpSellLink {
  const factory _UpSellLink(
      {final String appBannerURL,
      final String lob,
      final String serviceAirport,
      final String serviceType,
      final String offerUniqueID,
      final String redirectUrl}) = _$_UpSellLink;

  factory _UpSellLink.fromJson(Map<String, dynamic> json) =
      _$_UpSellLink.fromJson;

  @override
  String get appBannerURL;
  @override
  String get lob;
  @override
  String get serviceAirport;
  @override
  String get serviceType;
  @override
  String get offerUniqueID;
  @override
  String get redirectUrl;
  @override
  @JsonKey(ignore: true)
  _$$_UpSellLinkCopyWith<_$_UpSellLink> get copyWith =>
      throw _privateConstructorUsedError;
}
