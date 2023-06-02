// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'postal_code_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostalCodeResponseModel _$PostalCodeResponseModelFromJson(
    Map<String, dynamic> json) {
  return _PostalCodeResponseModel.fromJson(json);
}

/// @nodoc
mixin _$PostalCodeResponseModel {
  AddressDetailModel? get result => throw _privateConstructorUsedError;
  List<AddressDetailModel>? get results => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostalCodeResponseModelCopyWith<PostalCodeResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostalCodeResponseModelCopyWith<$Res> {
  factory $PostalCodeResponseModelCopyWith(PostalCodeResponseModel value,
          $Res Function(PostalCodeResponseModel) then) =
      _$PostalCodeResponseModelCopyWithImpl<$Res, PostalCodeResponseModel>;
  @useResult
  $Res call(
      {AddressDetailModel? result,
      List<AddressDetailModel>? results,
      String? status});

  $AddressDetailModelCopyWith<$Res>? get result;
}

/// @nodoc
class _$PostalCodeResponseModelCopyWithImpl<$Res,
        $Val extends PostalCodeResponseModel>
    implements $PostalCodeResponseModelCopyWith<$Res> {
  _$PostalCodeResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
    Object? results = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as AddressDetailModel?,
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<AddressDetailModel>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressDetailModelCopyWith<$Res>? get result {
    if (_value.result == null) {
      return null;
    }

    return $AddressDetailModelCopyWith<$Res>(_value.result!, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PostalCodeResponseModelCopyWith<$Res>
    implements $PostalCodeResponseModelCopyWith<$Res> {
  factory _$$_PostalCodeResponseModelCopyWith(_$_PostalCodeResponseModel value,
          $Res Function(_$_PostalCodeResponseModel) then) =
      __$$_PostalCodeResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AddressDetailModel? result,
      List<AddressDetailModel>? results,
      String? status});

  @override
  $AddressDetailModelCopyWith<$Res>? get result;
}

/// @nodoc
class __$$_PostalCodeResponseModelCopyWithImpl<$Res>
    extends _$PostalCodeResponseModelCopyWithImpl<$Res,
        _$_PostalCodeResponseModel>
    implements _$$_PostalCodeResponseModelCopyWith<$Res> {
  __$$_PostalCodeResponseModelCopyWithImpl(_$_PostalCodeResponseModel _value,
      $Res Function(_$_PostalCodeResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? result = freezed,
    Object? results = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_PostalCodeResponseModel(
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as AddressDetailModel?,
      results: freezed == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<AddressDetailModel>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostalCodeResponseModel implements _PostalCodeResponseModel {
  const _$_PostalCodeResponseModel({this.result, this.results, this.status});

  factory _$_PostalCodeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_PostalCodeResponseModelFromJson(json);

  @override
  final AddressDetailModel? result;
  @override
  final List<AddressDetailModel>? results;
  @override
  final String? status;

  @override
  String toString() {
    return 'PostalCodeResponseModel(result: $result, results: $results, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostalCodeResponseModel &&
            (identical(other.result, result) || other.result == result) &&
            const DeepCollectionEquality().equals(other.results, results) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, result,
      const DeepCollectionEquality().hash(results), status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostalCodeResponseModelCopyWith<_$_PostalCodeResponseModel>
      get copyWith =>
          __$$_PostalCodeResponseModelCopyWithImpl<_$_PostalCodeResponseModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostalCodeResponseModelToJson(
      this,
    );
  }
}

abstract class _PostalCodeResponseModel implements PostalCodeResponseModel {
  const factory _PostalCodeResponseModel(
      {final AddressDetailModel? result,
      final List<AddressDetailModel>? results,
      final String? status}) = _$_PostalCodeResponseModel;

  factory _PostalCodeResponseModel.fromJson(Map<String, dynamic> json) =
      _$_PostalCodeResponseModel.fromJson;

  @override
  AddressDetailModel? get result;
  @override
  List<AddressDetailModel>? get results;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$_PostalCodeResponseModelCopyWith<_$_PostalCodeResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

AddressDetailModel _$AddressDetailModelFromJson(Map<String, dynamic> json) {
  return _AddressDetailModel.fromJson(json);
}

/// @nodoc
mixin _$AddressDetailModel {
  String? get formattedAddress => throw _privateConstructorUsedError;
  Geometry? get geometry => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get placeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_components')
  List<AddressComponent>? get addressComponents =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'postcode_localities')
  List<String>? get postcodeLocalities => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressDetailModelCopyWith<AddressDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressDetailModelCopyWith<$Res> {
  factory $AddressDetailModelCopyWith(
          AddressDetailModel value, $Res Function(AddressDetailModel) then) =
      _$AddressDetailModelCopyWithImpl<$Res, AddressDetailModel>;
  @useResult
  $Res call(
      {String? formattedAddress,
      Geometry? geometry,
      String? name,
      String? placeId,
      @JsonKey(name: 'address_components')
          List<AddressComponent>? addressComponents,
      @JsonKey(name: 'postcode_localities')
          List<String>? postcodeLocalities});
}

/// @nodoc
class _$AddressDetailModelCopyWithImpl<$Res, $Val extends AddressDetailModel>
    implements $AddressDetailModelCopyWith<$Res> {
  _$AddressDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formattedAddress = freezed,
    Object? geometry = freezed,
    Object? name = freezed,
    Object? placeId = freezed,
    Object? addressComponents = freezed,
    Object? postcodeLocalities = freezed,
  }) {
    return _then(_value.copyWith(
      formattedAddress: freezed == formattedAddress
          ? _value.formattedAddress
          : formattedAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      geometry: freezed == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as Geometry?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      placeId: freezed == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String?,
      addressComponents: freezed == addressComponents
          ? _value.addressComponents
          : addressComponents // ignore: cast_nullable_to_non_nullable
              as List<AddressComponent>?,
      postcodeLocalities: freezed == postcodeLocalities
          ? _value.postcodeLocalities
          : postcodeLocalities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddressDetailModelCopyWith<$Res>
    implements $AddressDetailModelCopyWith<$Res> {
  factory _$$_AddressDetailModelCopyWith(_$_AddressDetailModel value,
          $Res Function(_$_AddressDetailModel) then) =
      __$$_AddressDetailModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? formattedAddress,
      Geometry? geometry,
      String? name,
      String? placeId,
      @JsonKey(name: 'address_components')
          List<AddressComponent>? addressComponents,
      @JsonKey(name: 'postcode_localities')
          List<String>? postcodeLocalities});
}

/// @nodoc
class __$$_AddressDetailModelCopyWithImpl<$Res>
    extends _$AddressDetailModelCopyWithImpl<$Res, _$_AddressDetailModel>
    implements _$$_AddressDetailModelCopyWith<$Res> {
  __$$_AddressDetailModelCopyWithImpl(
      _$_AddressDetailModel _value, $Res Function(_$_AddressDetailModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formattedAddress = freezed,
    Object? geometry = freezed,
    Object? name = freezed,
    Object? placeId = freezed,
    Object? addressComponents = freezed,
    Object? postcodeLocalities = freezed,
  }) {
    return _then(_$_AddressDetailModel(
      formattedAddress: freezed == formattedAddress
          ? _value.formattedAddress
          : formattedAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      geometry: freezed == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as Geometry?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      placeId: freezed == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String?,
      addressComponents: freezed == addressComponents
          ? _value.addressComponents
          : addressComponents // ignore: cast_nullable_to_non_nullable
              as List<AddressComponent>?,
      postcodeLocalities: freezed == postcodeLocalities
          ? _value.postcodeLocalities
          : postcodeLocalities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddressDetailModel implements _AddressDetailModel {
  const _$_AddressDetailModel(
      {this.formattedAddress,
      this.geometry,
      this.name,
      this.placeId,
      @JsonKey(name: 'address_components') this.addressComponents,
      @JsonKey(name: 'postcode_localities') this.postcodeLocalities});

  factory _$_AddressDetailModel.fromJson(Map<String, dynamic> json) =>
      _$$_AddressDetailModelFromJson(json);

  @override
  final String? formattedAddress;
  @override
  final Geometry? geometry;
  @override
  final String? name;
  @override
  final String? placeId;
  @override
  @JsonKey(name: 'address_components')
  final List<AddressComponent>? addressComponents;
  @override
  @JsonKey(name: 'postcode_localities')
  final List<String>? postcodeLocalities;

  @override
  String toString() {
    return 'AddressDetailModel(formattedAddress: $formattedAddress, geometry: $geometry, name: $name, placeId: $placeId, addressComponents: $addressComponents, postcodeLocalities: $postcodeLocalities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddressDetailModel &&
            (identical(other.formattedAddress, formattedAddress) ||
                other.formattedAddress == formattedAddress) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            const DeepCollectionEquality()
                .equals(other.addressComponents, addressComponents) &&
            const DeepCollectionEquality()
                .equals(other.postcodeLocalities, postcodeLocalities));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      formattedAddress,
      geometry,
      name,
      placeId,
      const DeepCollectionEquality().hash(addressComponents),
      const DeepCollectionEquality().hash(postcodeLocalities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddressDetailModelCopyWith<_$_AddressDetailModel> get copyWith =>
      __$$_AddressDetailModelCopyWithImpl<_$_AddressDetailModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddressDetailModelToJson(
      this,
    );
  }
}

abstract class _AddressDetailModel implements AddressDetailModel {
  const factory _AddressDetailModel(
      {final String? formattedAddress,
      final Geometry? geometry,
      final String? name,
      final String? placeId,
      @JsonKey(name: 'address_components')
          final List<AddressComponent>? addressComponents,
      @JsonKey(name: 'postcode_localities')
          final List<String>? postcodeLocalities}) = _$_AddressDetailModel;

  factory _AddressDetailModel.fromJson(Map<String, dynamic> json) =
      _$_AddressDetailModel.fromJson;

  @override
  String? get formattedAddress;
  @override
  Geometry? get geometry;
  @override
  String? get name;
  @override
  String? get placeId;
  @override
  @JsonKey(name: 'address_components')
  List<AddressComponent>? get addressComponents;
  @override
  @JsonKey(name: 'postcode_localities')
  List<String>? get postcodeLocalities;
  @override
  @JsonKey(ignore: true)
  _$$_AddressDetailModelCopyWith<_$_AddressDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

AddressComponent _$AddressComponentFromJson(Map<String, dynamic> json) {
  return _AddressComponent.fromJson(json);
}

/// @nodoc
mixin _$AddressComponent {
  @JsonKey(name: 'long_name')
  String? get longName => throw _privateConstructorUsedError;
  @JsonKey(name: 'short_name')
  String? get shortName => throw _privateConstructorUsedError;
  List<String?>? get types => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressComponentCopyWith<AddressComponent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressComponentCopyWith<$Res> {
  factory $AddressComponentCopyWith(
          AddressComponent value, $Res Function(AddressComponent) then) =
      _$AddressComponentCopyWithImpl<$Res, AddressComponent>;
  @useResult
  $Res call(
      {@JsonKey(name: 'long_name') String? longName,
      @JsonKey(name: 'short_name') String? shortName,
      List<String?>? types});
}

/// @nodoc
class _$AddressComponentCopyWithImpl<$Res, $Val extends AddressComponent>
    implements $AddressComponentCopyWith<$Res> {
  _$AddressComponentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? longName = freezed,
    Object? shortName = freezed,
    Object? types = freezed,
  }) {
    return _then(_value.copyWith(
      longName: freezed == longName
          ? _value.longName
          : longName // ignore: cast_nullable_to_non_nullable
              as String?,
      shortName: freezed == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String?,
      types: freezed == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddressComponentCopyWith<$Res>
    implements $AddressComponentCopyWith<$Res> {
  factory _$$_AddressComponentCopyWith(
          _$_AddressComponent value, $Res Function(_$_AddressComponent) then) =
      __$$_AddressComponentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'long_name') String? longName,
      @JsonKey(name: 'short_name') String? shortName,
      List<String?>? types});
}

/// @nodoc
class __$$_AddressComponentCopyWithImpl<$Res>
    extends _$AddressComponentCopyWithImpl<$Res, _$_AddressComponent>
    implements _$$_AddressComponentCopyWith<$Res> {
  __$$_AddressComponentCopyWithImpl(
      _$_AddressComponent _value, $Res Function(_$_AddressComponent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? longName = freezed,
    Object? shortName = freezed,
    Object? types = freezed,
  }) {
    return _then(_$_AddressComponent(
      longName: freezed == longName
          ? _value.longName
          : longName // ignore: cast_nullable_to_non_nullable
              as String?,
      shortName: freezed == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String?,
      types: freezed == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddressComponent implements _AddressComponent {
  const _$_AddressComponent(
      {@JsonKey(name: 'long_name') this.longName,
      @JsonKey(name: 'short_name') this.shortName,
      final List<String?>? types})
      : _types = types;

  factory _$_AddressComponent.fromJson(Map<String, dynamic> json) =>
      _$$_AddressComponentFromJson(json);

  @override
  @JsonKey(name: 'long_name')
  final String? longName;
  @override
  @JsonKey(name: 'short_name')
  final String? shortName;
  final List<String?>? _types;
  @override
  List<String?>? get types {
    final value = _types;
    if (value == null) return null;
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AddressComponent(longName: $longName, shortName: $shortName, types: $types)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddressComponent &&
            (identical(other.longName, longName) ||
                other.longName == longName) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            const DeepCollectionEquality().equals(other._types, _types));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, longName, shortName,
      const DeepCollectionEquality().hash(_types));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddressComponentCopyWith<_$_AddressComponent> get copyWith =>
      __$$_AddressComponentCopyWithImpl<_$_AddressComponent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddressComponentToJson(
      this,
    );
  }
}

abstract class _AddressComponent implements AddressComponent {
  const factory _AddressComponent(
      {@JsonKey(name: 'long_name') final String? longName,
      @JsonKey(name: 'short_name') final String? shortName,
      final List<String?>? types}) = _$_AddressComponent;

  factory _AddressComponent.fromJson(Map<String, dynamic> json) =
      _$_AddressComponent.fromJson;

  @override
  @JsonKey(name: 'long_name')
  String? get longName;
  @override
  @JsonKey(name: 'short_name')
  String? get shortName;
  @override
  List<String?>? get types;
  @override
  @JsonKey(ignore: true)
  _$$_AddressComponentCopyWith<_$_AddressComponent> get copyWith =>
      throw _privateConstructorUsedError;
}
