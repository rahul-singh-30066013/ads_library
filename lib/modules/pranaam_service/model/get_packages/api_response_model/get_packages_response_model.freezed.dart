// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_packages_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetPackagesResponseModel _$GetPackagesResponseModelFromJson(
    Map<String, dynamic> json) {
  return _GetPackagesResponseModel.fromJson(json);
}

/// @nodoc
mixin _$GetPackagesResponseModel {
  @JsonKey(name: 'data')
  Data get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  bool get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'warning')
  Error get warning => throw _privateConstructorUsedError;
  @JsonKey(name: 'error')
  Error get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetPackagesResponseModelCopyWith<GetPackagesResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetPackagesResponseModelCopyWith<$Res> {
  factory $GetPackagesResponseModelCopyWith(GetPackagesResponseModel value,
          $Res Function(GetPackagesResponseModel) then) =
      _$GetPackagesResponseModelCopyWithImpl<$Res, GetPackagesResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'data') Data data,
      @JsonKey(name: 'status') bool status,
      @JsonKey(name: 'warning') Error warning,
      @JsonKey(name: 'error') Error error});

  $DataCopyWith<$Res> get data;
  $ErrorCopyWith<$Res> get warning;
  $ErrorCopyWith<$Res> get error;
}

/// @nodoc
class _$GetPackagesResponseModelCopyWithImpl<$Res,
        $Val extends GetPackagesResponseModel>
    implements $GetPackagesResponseModelCopyWith<$Res> {
  _$GetPackagesResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? status = null,
    Object? warning = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      warning: null == warning
          ? _value.warning
          : warning // ignore: cast_nullable_to_non_nullable
              as Error,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res> get data {
    return $DataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ErrorCopyWith<$Res> get warning {
    return $ErrorCopyWith<$Res>(_value.warning, (value) {
      return _then(_value.copyWith(warning: value) as $Val);
    });
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
abstract class _$$_GetPackagesResponseModelCopyWith<$Res>
    implements $GetPackagesResponseModelCopyWith<$Res> {
  factory _$$_GetPackagesResponseModelCopyWith(
          _$_GetPackagesResponseModel value,
          $Res Function(_$_GetPackagesResponseModel) then) =
      __$$_GetPackagesResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'data') Data data,
      @JsonKey(name: 'status') bool status,
      @JsonKey(name: 'warning') Error warning,
      @JsonKey(name: 'error') Error error});

  @override
  $DataCopyWith<$Res> get data;
  @override
  $ErrorCopyWith<$Res> get warning;
  @override
  $ErrorCopyWith<$Res> get error;
}

/// @nodoc
class __$$_GetPackagesResponseModelCopyWithImpl<$Res>
    extends _$GetPackagesResponseModelCopyWithImpl<$Res,
        _$_GetPackagesResponseModel>
    implements _$$_GetPackagesResponseModelCopyWith<$Res> {
  __$$_GetPackagesResponseModelCopyWithImpl(_$_GetPackagesResponseModel _value,
      $Res Function(_$_GetPackagesResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? status = null,
    Object? warning = null,
    Object? error = null,
  }) {
    return _then(_$_GetPackagesResponseModel(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      warning: null == warning
          ? _value.warning
          : warning // ignore: cast_nullable_to_non_nullable
              as Error,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetPackagesResponseModel implements _GetPackagesResponseModel {
  const _$_GetPackagesResponseModel(
      {@JsonKey(name: 'data') this.data = const Data(),
      @JsonKey(name: 'status') this.status = false,
      @JsonKey(name: 'warning') this.warning = const Error(),
      @JsonKey(name: 'error') this.error = const Error()});

  factory _$_GetPackagesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_GetPackagesResponseModelFromJson(json);

  @override
  @JsonKey(name: 'data')
  final Data data;
  @override
  @JsonKey(name: 'status')
  final bool status;
  @override
  @JsonKey(name: 'warning')
  final Error warning;
  @override
  @JsonKey(name: 'error')
  final Error error;

  @override
  String toString() {
    return 'GetPackagesResponseModel(data: $data, status: $status, warning: $warning, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetPackagesResponseModel &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.warning, warning) || other.warning == warning) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data, status, warning, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetPackagesResponseModelCopyWith<_$_GetPackagesResponseModel>
      get copyWith => __$$_GetPackagesResponseModelCopyWithImpl<
          _$_GetPackagesResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetPackagesResponseModelToJson(
      this,
    );
  }
}

abstract class _GetPackagesResponseModel implements GetPackagesResponseModel {
  const factory _GetPackagesResponseModel(
      {@JsonKey(name: 'data') final Data data,
      @JsonKey(name: 'status') final bool status,
      @JsonKey(name: 'warning') final Error warning,
      @JsonKey(name: 'error') final Error error}) = _$_GetPackagesResponseModel;

  factory _GetPackagesResponseModel.fromJson(Map<String, dynamic> json) =
      _$_GetPackagesResponseModel.fromJson;

  @override
  @JsonKey(name: 'data')
  Data get data;
  @override
  @JsonKey(name: 'status')
  bool get status;
  @override
  @JsonKey(name: 'warning')
  Error get warning;
  @override
  @JsonKey(name: 'error')
  Error get error;
  @override
  @JsonKey(ignore: true)
  _$$_GetPackagesResponseModelCopyWith<_$_GetPackagesResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: 'packageDetails')
  List<PackageDetail> get packageDetails => throw _privateConstructorUsedError;
  @JsonKey(name: 'loyaltyPercentage')
  String get loyaltyPercentage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call(
      {@JsonKey(name: 'packageDetails') List<PackageDetail> packageDetails,
      @JsonKey(name: 'loyaltyPercentage') String loyaltyPercentage});
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packageDetails = null,
    Object? loyaltyPercentage = null,
  }) {
    return _then(_value.copyWith(
      packageDetails: null == packageDetails
          ? _value.packageDetails
          : packageDetails // ignore: cast_nullable_to_non_nullable
              as List<PackageDetail>,
      loyaltyPercentage: null == loyaltyPercentage
          ? _value.loyaltyPercentage
          : loyaltyPercentage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$_DataCopyWith(_$_Data value, $Res Function(_$_Data) then) =
      __$$_DataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'packageDetails') List<PackageDetail> packageDetails,
      @JsonKey(name: 'loyaltyPercentage') String loyaltyPercentage});
}

/// @nodoc
class __$$_DataCopyWithImpl<$Res> extends _$DataCopyWithImpl<$Res, _$_Data>
    implements _$$_DataCopyWith<$Res> {
  __$$_DataCopyWithImpl(_$_Data _value, $Res Function(_$_Data) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packageDetails = null,
    Object? loyaltyPercentage = null,
  }) {
    return _then(_$_Data(
      packageDetails: null == packageDetails
          ? _value.packageDetails
          : packageDetails // ignore: cast_nullable_to_non_nullable
              as List<PackageDetail>,
      loyaltyPercentage: null == loyaltyPercentage
          ? _value.loyaltyPercentage
          : loyaltyPercentage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Data implements _Data {
  const _$_Data(
      {@JsonKey(name: 'packageDetails') this.packageDetails = const [],
      @JsonKey(name: 'loyaltyPercentage') this.loyaltyPercentage = ''});

  factory _$_Data.fromJson(Map<String, dynamic> json) => _$$_DataFromJson(json);

  @override
  @JsonKey(name: 'packageDetails')
  final List<PackageDetail> packageDetails;
  @override
  @JsonKey(name: 'loyaltyPercentage')
  final String loyaltyPercentage;

  @override
  String toString() {
    return 'Data(packageDetails: $packageDetails, loyaltyPercentage: $loyaltyPercentage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Data &&
            const DeepCollectionEquality()
                .equals(other.packageDetails, packageDetails) &&
            (identical(other.loyaltyPercentage, loyaltyPercentage) ||
                other.loyaltyPercentage == loyaltyPercentage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(packageDetails), loyaltyPercentage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataCopyWith<_$_Data> get copyWith =>
      __$$_DataCopyWithImpl<_$_Data>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  const factory _Data(
      {@JsonKey(name: 'packageDetails')
          final List<PackageDetail> packageDetails,
      @JsonKey(name: 'loyaltyPercentage')
          final String loyaltyPercentage}) = _$_Data;

  factory _Data.fromJson(Map<String, dynamic> json) = _$_Data.fromJson;

  @override
  @JsonKey(name: 'packageDetails')
  List<PackageDetail> get packageDetails;
  @override
  @JsonKey(name: 'loyaltyPercentage')
  String get loyaltyPercentage;
  @override
  @JsonKey(ignore: true)
  _$$_DataCopyWith<_$_Data> get copyWith => throw _privateConstructorUsedError;
}

Error _$ErrorFromJson(Map<String, dynamic> json) {
  return _Error.fromJson(json);
}

/// @nodoc
mixin _$Error {
  @JsonKey(name: 'statusCode')
  int get statusCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'code')
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'source')
  String get source => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'statusCode') int statusCode,
      @JsonKey(name: 'code') String code,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'source') String source});
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
    Object? statusCode = null,
    Object? code = null,
    Object? description = null,
    Object? source = null,
  }) {
    return _then(_value.copyWith(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
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
      {@JsonKey(name: 'statusCode') int statusCode,
      @JsonKey(name: 'code') String code,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'source') String source});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res> extends _$ErrorCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? code = null,
    Object? description = null,
    Object? source = null,
  }) {
    return _then(_$_Error(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Error implements _Error {
  const _$_Error(
      {@JsonKey(name: 'statusCode') this.statusCode = 0,
      @JsonKey(name: 'code') this.code = '',
      @JsonKey(name: 'description') this.description = '',
      @JsonKey(name: 'source') this.source = ''});

  factory _$_Error.fromJson(Map<String, dynamic> json) =>
      _$$_ErrorFromJson(json);

  @override
  @JsonKey(name: 'statusCode')
  final int statusCode;
  @override
  @JsonKey(name: 'code')
  final String code;
  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'source')
  final String source;

  @override
  String toString() {
    return 'Error(statusCode: $statusCode, code: $code, description: $description, source: $source)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.source, source) || other.source == source));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, statusCode, code, description, source);

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
      {@JsonKey(name: 'statusCode') final int statusCode,
      @JsonKey(name: 'code') final String code,
      @JsonKey(name: 'description') final String description,
      @JsonKey(name: 'source') final String source}) = _$_Error;

  factory _Error.fromJson(Map<String, dynamic> json) = _$_Error.fromJson;

  @override
  @JsonKey(name: 'statusCode')
  int get statusCode;
  @override
  @JsonKey(name: 'code')
  String get code;
  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'source')
  String get source;
  @override
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
