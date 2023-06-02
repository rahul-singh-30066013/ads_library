// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'package_site_core_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PackageSiteCoreResponse _$PackageSiteCoreResponseFromJson(
    Map<String, dynamic> json) {
  return _PackageSiteCoreResponse.fromJson(json);
}

/// @nodoc
mixin _$PackageSiteCoreResponse {
  String get name => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  List<Element> get elements => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PackageSiteCoreResponseCopyWith<PackageSiteCoreResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackageSiteCoreResponseCopyWith<$Res> {
  factory $PackageSiteCoreResponseCopyWith(PackageSiteCoreResponse value,
          $Res Function(PackageSiteCoreResponse) then) =
      _$PackageSiteCoreResponseCopyWithImpl<$Res, PackageSiteCoreResponse>;
  @useResult
  $Res call({String name, String path, List<Element> elements});
}

/// @nodoc
class _$PackageSiteCoreResponseCopyWithImpl<$Res,
        $Val extends PackageSiteCoreResponse>
    implements $PackageSiteCoreResponseCopyWith<$Res> {
  _$PackageSiteCoreResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? path = null,
    Object? elements = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      elements: null == elements
          ? _value.elements
          : elements // ignore: cast_nullable_to_non_nullable
              as List<Element>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PackageSiteCoreResponseCopyWith<$Res>
    implements $PackageSiteCoreResponseCopyWith<$Res> {
  factory _$$_PackageSiteCoreResponseCopyWith(_$_PackageSiteCoreResponse value,
          $Res Function(_$_PackageSiteCoreResponse) then) =
      __$$_PackageSiteCoreResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String path, List<Element> elements});
}

/// @nodoc
class __$$_PackageSiteCoreResponseCopyWithImpl<$Res>
    extends _$PackageSiteCoreResponseCopyWithImpl<$Res,
        _$_PackageSiteCoreResponse>
    implements _$$_PackageSiteCoreResponseCopyWith<$Res> {
  __$$_PackageSiteCoreResponseCopyWithImpl(_$_PackageSiteCoreResponse _value,
      $Res Function(_$_PackageSiteCoreResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? path = null,
    Object? elements = null,
  }) {
    return _then(_$_PackageSiteCoreResponse(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      elements: null == elements
          ? _value.elements
          : elements // ignore: cast_nullable_to_non_nullable
              as List<Element>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PackageSiteCoreResponse implements _PackageSiteCoreResponse {
  const _$_PackageSiteCoreResponse(
      {this.name = '', this.path = '', this.elements = const []});

  factory _$_PackageSiteCoreResponse.fromJson(Map<String, dynamic> json) =>
      _$$_PackageSiteCoreResponseFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String path;
  @override
  @JsonKey()
  final List<Element> elements;

  @override
  String toString() {
    return 'PackageSiteCoreResponse(name: $name, path: $path, elements: $elements)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PackageSiteCoreResponse &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.path, path) || other.path == path) &&
            const DeepCollectionEquality().equals(other.elements, elements));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, path, const DeepCollectionEquality().hash(elements));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PackageSiteCoreResponseCopyWith<_$_PackageSiteCoreResponse>
      get copyWith =>
          __$$_PackageSiteCoreResponseCopyWithImpl<_$_PackageSiteCoreResponse>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PackageSiteCoreResponseToJson(
      this,
    );
  }
}

abstract class _PackageSiteCoreResponse implements PackageSiteCoreResponse {
  const factory _PackageSiteCoreResponse(
      {final String name,
      final String path,
      final List<Element> elements}) = _$_PackageSiteCoreResponse;

  factory _PackageSiteCoreResponse.fromJson(Map<String, dynamic> json) =
      _$_PackageSiteCoreResponse.fromJson;

  @override
  String get name;
  @override
  String get path;
  @override
  List<Element> get elements;
  @override
  @JsonKey(ignore: true)
  _$$_PackageSiteCoreResponseCopyWith<_$_PackageSiteCoreResponse>
      get copyWith => throw _privateConstructorUsedError;
}

Element _$ElementFromJson(Map<String, dynamic> json) {
  return _Element.fromJson(json);
}

/// @nodoc
mixin _$Element {
  String get uid => throw _privateConstructorUsedError;
  String get componentName => throw _privateConstructorUsedError;
  String get dataSource => throw _privateConstructorUsedError;
  Params get params => throw _privateConstructorUsedError;
  Fields get fields => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ElementCopyWith<Element> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ElementCopyWith<$Res> {
  factory $ElementCopyWith(Element value, $Res Function(Element) then) =
      _$ElementCopyWithImpl<$Res, Element>;
  @useResult
  $Res call(
      {String uid,
      String componentName,
      String dataSource,
      Params params,
      Fields fields});

  $ParamsCopyWith<$Res> get params;
  $FieldsCopyWith<$Res> get fields;
}

/// @nodoc
class _$ElementCopyWithImpl<$Res, $Val extends Element>
    implements $ElementCopyWith<$Res> {
  _$ElementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? componentName = null,
    Object? dataSource = null,
    Object? params = null,
    Object? fields = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      componentName: null == componentName
          ? _value.componentName
          : componentName // ignore: cast_nullable_to_non_nullable
              as String,
      dataSource: null == dataSource
          ? _value.dataSource
          : dataSource // ignore: cast_nullable_to_non_nullable
              as String,
      params: null == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as Params,
      fields: null == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as Fields,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ParamsCopyWith<$Res> get params {
    return $ParamsCopyWith<$Res>(_value.params, (value) {
      return _then(_value.copyWith(params: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FieldsCopyWith<$Res> get fields {
    return $FieldsCopyWith<$Res>(_value.fields, (value) {
      return _then(_value.copyWith(fields: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ElementCopyWith<$Res> implements $ElementCopyWith<$Res> {
  factory _$$_ElementCopyWith(
          _$_Element value, $Res Function(_$_Element) then) =
      __$$_ElementCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String componentName,
      String dataSource,
      Params params,
      Fields fields});

  @override
  $ParamsCopyWith<$Res> get params;
  @override
  $FieldsCopyWith<$Res> get fields;
}

/// @nodoc
class __$$_ElementCopyWithImpl<$Res>
    extends _$ElementCopyWithImpl<$Res, _$_Element>
    implements _$$_ElementCopyWith<$Res> {
  __$$_ElementCopyWithImpl(_$_Element _value, $Res Function(_$_Element) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? componentName = null,
    Object? dataSource = null,
    Object? params = null,
    Object? fields = null,
  }) {
    return _then(_$_Element(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      componentName: null == componentName
          ? _value.componentName
          : componentName // ignore: cast_nullable_to_non_nullable
              as String,
      dataSource: null == dataSource
          ? _value.dataSource
          : dataSource // ignore: cast_nullable_to_non_nullable
              as String,
      params: null == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as Params,
      fields: null == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as Fields,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Element implements _Element {
  const _$_Element(
      {this.uid = '',
      this.componentName = '',
      this.dataSource = '',
      this.params = const Params(),
      this.fields = const Fields()});

  factory _$_Element.fromJson(Map<String, dynamic> json) =>
      _$$_ElementFromJson(json);

  @override
  @JsonKey()
  final String uid;
  @override
  @JsonKey()
  final String componentName;
  @override
  @JsonKey()
  final String dataSource;
  @override
  @JsonKey()
  final Params params;
  @override
  @JsonKey()
  final Fields fields;

  @override
  String toString() {
    return 'Element(uid: $uid, componentName: $componentName, dataSource: $dataSource, params: $params, fields: $fields)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Element &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.componentName, componentName) ||
                other.componentName == componentName) &&
            (identical(other.dataSource, dataSource) ||
                other.dataSource == dataSource) &&
            (identical(other.params, params) || other.params == params) &&
            (identical(other.fields, fields) || other.fields == fields));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uid, componentName, dataSource, params, fields);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ElementCopyWith<_$_Element> get copyWith =>
      __$$_ElementCopyWithImpl<_$_Element>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ElementToJson(
      this,
    );
  }
}

abstract class _Element implements Element {
  const factory _Element(
      {final String uid,
      final String componentName,
      final String dataSource,
      final Params params,
      final Fields fields}) = _$_Element;

  factory _Element.fromJson(Map<String, dynamic> json) = _$_Element.fromJson;

  @override
  String get uid;
  @override
  String get componentName;
  @override
  String get dataSource;
  @override
  Params get params;
  @override
  Fields get fields;
  @override
  @JsonKey(ignore: true)
  _$$_ElementCopyWith<_$_Element> get copyWith =>
      throw _privateConstructorUsedError;
}

Fields _$FieldsFromJson(Map<String, dynamic> json) {
  return _Fields.fromJson(json);
}

/// @nodoc
mixin _$Fields {
  List<PackageData> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FieldsCopyWith<Fields> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldsCopyWith<$Res> {
  factory $FieldsCopyWith(Fields value, $Res Function(Fields) then) =
      _$FieldsCopyWithImpl<$Res, Fields>;
  @useResult
  $Res call({List<PackageData> data});
}

/// @nodoc
class _$FieldsCopyWithImpl<$Res, $Val extends Fields>
    implements $FieldsCopyWith<$Res> {
  _$FieldsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PackageData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FieldsCopyWith<$Res> implements $FieldsCopyWith<$Res> {
  factory _$$_FieldsCopyWith(_$_Fields value, $Res Function(_$_Fields) then) =
      __$$_FieldsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PackageData> data});
}

/// @nodoc
class __$$_FieldsCopyWithImpl<$Res>
    extends _$FieldsCopyWithImpl<$Res, _$_Fields>
    implements _$$_FieldsCopyWith<$Res> {
  __$$_FieldsCopyWithImpl(_$_Fields _value, $Res Function(_$_Fields) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_Fields(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PackageData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Fields implements _Fields {
  const _$_Fields({this.data = const []});

  factory _$_Fields.fromJson(Map<String, dynamic> json) =>
      _$$_FieldsFromJson(json);

  @override
  @JsonKey()
  final List<PackageData> data;

  @override
  String toString() {
    return 'Fields(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fields &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FieldsCopyWith<_$_Fields> get copyWith =>
      __$$_FieldsCopyWithImpl<_$_Fields>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FieldsToJson(
      this,
    );
  }
}

abstract class _Fields implements Fields {
  const factory _Fields({final List<PackageData> data}) = _$_Fields;

  factory _Fields.fromJson(Map<String, dynamic> json) = _$_Fields.fromJson;

  @override
  List<PackageData> get data;
  @override
  @JsonKey(ignore: true)
  _$$_FieldsCopyWith<_$_Fields> get copyWith =>
      throw _privateConstructorUsedError;
}

PackageData _$PackageDataFromJson(Map<String, dynamic> json) {
  return _PackageData.fromJson(json);
}

/// @nodoc
mixin _$PackageData {
  String get packageId => throw _privateConstructorUsedError;
  String get packageName => throw _privateConstructorUsedError;
  bool get isRecommended => throw _privateConstructorUsedError;
  List<ServicesList> get servicesList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PackageDataCopyWith<PackageData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackageDataCopyWith<$Res> {
  factory $PackageDataCopyWith(
          PackageData value, $Res Function(PackageData) then) =
      _$PackageDataCopyWithImpl<$Res, PackageData>;
  @useResult
  $Res call(
      {String packageId,
      String packageName,
      bool isRecommended,
      List<ServicesList> servicesList});
}

/// @nodoc
class _$PackageDataCopyWithImpl<$Res, $Val extends PackageData>
    implements $PackageDataCopyWith<$Res> {
  _$PackageDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packageId = null,
    Object? packageName = null,
    Object? isRecommended = null,
    Object? servicesList = null,
  }) {
    return _then(_value.copyWith(
      packageId: null == packageId
          ? _value.packageId
          : packageId // ignore: cast_nullable_to_non_nullable
              as String,
      packageName: null == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String,
      isRecommended: null == isRecommended
          ? _value.isRecommended
          : isRecommended // ignore: cast_nullable_to_non_nullable
              as bool,
      servicesList: null == servicesList
          ? _value.servicesList
          : servicesList // ignore: cast_nullable_to_non_nullable
              as List<ServicesList>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PackageDataCopyWith<$Res>
    implements $PackageDataCopyWith<$Res> {
  factory _$$_PackageDataCopyWith(
          _$_PackageData value, $Res Function(_$_PackageData) then) =
      __$$_PackageDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String packageId,
      String packageName,
      bool isRecommended,
      List<ServicesList> servicesList});
}

/// @nodoc
class __$$_PackageDataCopyWithImpl<$Res>
    extends _$PackageDataCopyWithImpl<$Res, _$_PackageData>
    implements _$$_PackageDataCopyWith<$Res> {
  __$$_PackageDataCopyWithImpl(
      _$_PackageData _value, $Res Function(_$_PackageData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packageId = null,
    Object? packageName = null,
    Object? isRecommended = null,
    Object? servicesList = null,
  }) {
    return _then(_$_PackageData(
      packageId: null == packageId
          ? _value.packageId
          : packageId // ignore: cast_nullable_to_non_nullable
              as String,
      packageName: null == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String,
      isRecommended: null == isRecommended
          ? _value.isRecommended
          : isRecommended // ignore: cast_nullable_to_non_nullable
              as bool,
      servicesList: null == servicesList
          ? _value.servicesList
          : servicesList // ignore: cast_nullable_to_non_nullable
              as List<ServicesList>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PackageData implements _PackageData {
  const _$_PackageData(
      {this.packageId = '',
      this.packageName = '',
      this.isRecommended = false,
      this.servicesList = const []});

  factory _$_PackageData.fromJson(Map<String, dynamic> json) =>
      _$$_PackageDataFromJson(json);

  @override
  @JsonKey()
  final String packageId;
  @override
  @JsonKey()
  final String packageName;
  @override
  @JsonKey()
  final bool isRecommended;
  @override
  @JsonKey()
  final List<ServicesList> servicesList;

  @override
  String toString() {
    return 'PackageData(packageId: $packageId, packageName: $packageName, isRecommended: $isRecommended, servicesList: $servicesList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PackageData &&
            (identical(other.packageId, packageId) ||
                other.packageId == packageId) &&
            (identical(other.packageName, packageName) ||
                other.packageName == packageName) &&
            (identical(other.isRecommended, isRecommended) ||
                other.isRecommended == isRecommended) &&
            const DeepCollectionEquality()
                .equals(other.servicesList, servicesList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, packageId, packageName,
      isRecommended, const DeepCollectionEquality().hash(servicesList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PackageDataCopyWith<_$_PackageData> get copyWith =>
      __$$_PackageDataCopyWithImpl<_$_PackageData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PackageDataToJson(
      this,
    );
  }
}

abstract class _PackageData implements PackageData {
  const factory _PackageData(
      {final String packageId,
      final String packageName,
      final bool isRecommended,
      final List<ServicesList> servicesList}) = _$_PackageData;

  factory _PackageData.fromJson(Map<String, dynamic> json) =
      _$_PackageData.fromJson;

  @override
  String get packageId;
  @override
  String get packageName;
  @override
  bool get isRecommended;
  @override
  List<ServicesList> get servicesList;
  @override
  @JsonKey(ignore: true)
  _$$_PackageDataCopyWith<_$_PackageData> get copyWith =>
      throw _privateConstructorUsedError;
}

ServicesList _$ServicesListFromJson(Map<String, dynamic> json) {
  return _ServicesList.fromJson(json);
}

/// @nodoc
mixin _$ServicesList {
  String get name => throw _privateConstructorUsedError;
  bool get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServicesListCopyWith<ServicesList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServicesListCopyWith<$Res> {
  factory $ServicesListCopyWith(
          ServicesList value, $Res Function(ServicesList) then) =
      _$ServicesListCopyWithImpl<$Res, ServicesList>;
  @useResult
  $Res call({String name, bool value});
}

/// @nodoc
class _$ServicesListCopyWithImpl<$Res, $Val extends ServicesList>
    implements $ServicesListCopyWith<$Res> {
  _$ServicesListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ServicesListCopyWith<$Res>
    implements $ServicesListCopyWith<$Res> {
  factory _$$_ServicesListCopyWith(
          _$_ServicesList value, $Res Function(_$_ServicesList) then) =
      __$$_ServicesListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, bool value});
}

/// @nodoc
class __$$_ServicesListCopyWithImpl<$Res>
    extends _$ServicesListCopyWithImpl<$Res, _$_ServicesList>
    implements _$$_ServicesListCopyWith<$Res> {
  __$$_ServicesListCopyWithImpl(
      _$_ServicesList _value, $Res Function(_$_ServicesList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? value = null,
  }) {
    return _then(_$_ServicesList(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServicesList implements _ServicesList {
  const _$_ServicesList({this.name = '', this.value = false});

  factory _$_ServicesList.fromJson(Map<String, dynamic> json) =>
      _$$_ServicesListFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final bool value;

  @override
  String toString() {
    return 'ServicesList(name: $name, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServicesList &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServicesListCopyWith<_$_ServicesList> get copyWith =>
      __$$_ServicesListCopyWithImpl<_$_ServicesList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServicesListToJson(
      this,
    );
  }
}

abstract class _ServicesList implements ServicesList {
  const factory _ServicesList({final String name, final bool value}) =
      _$_ServicesList;

  factory _ServicesList.fromJson(Map<String, dynamic> json) =
      _$_ServicesList.fromJson;

  @override
  String get name;
  @override
  bool get value;
  @override
  @JsonKey(ignore: true)
  _$$_ServicesListCopyWith<_$_ServicesList> get copyWith =>
      throw _privateConstructorUsedError;
}

Params _$ParamsFromJson(Map<String, dynamic> json) {
  return _Params.fromJson(json);
}

/// @nodoc
mixin _$Params {
  String get rewardsText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParamsCopyWith<Params> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParamsCopyWith<$Res> {
  factory $ParamsCopyWith(Params value, $Res Function(Params) then) =
      _$ParamsCopyWithImpl<$Res, Params>;
  @useResult
  $Res call({String rewardsText});
}

/// @nodoc
class _$ParamsCopyWithImpl<$Res, $Val extends Params>
    implements $ParamsCopyWith<$Res> {
  _$ParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rewardsText = null,
  }) {
    return _then(_value.copyWith(
      rewardsText: null == rewardsText
          ? _value.rewardsText
          : rewardsText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ParamsCopyWith<$Res> implements $ParamsCopyWith<$Res> {
  factory _$$_ParamsCopyWith(_$_Params value, $Res Function(_$_Params) then) =
      __$$_ParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String rewardsText});
}

/// @nodoc
class __$$_ParamsCopyWithImpl<$Res>
    extends _$ParamsCopyWithImpl<$Res, _$_Params>
    implements _$$_ParamsCopyWith<$Res> {
  __$$_ParamsCopyWithImpl(_$_Params _value, $Res Function(_$_Params) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rewardsText = null,
  }) {
    return _then(_$_Params(
      rewardsText: null == rewardsText
          ? _value.rewardsText
          : rewardsText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Params implements _Params {
  const _$_Params({this.rewardsText = ''});

  factory _$_Params.fromJson(Map<String, dynamic> json) =>
      _$$_ParamsFromJson(json);

  @override
  @JsonKey()
  final String rewardsText;

  @override
  String toString() {
    return 'Params(rewardsText: $rewardsText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Params &&
            (identical(other.rewardsText, rewardsText) ||
                other.rewardsText == rewardsText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, rewardsText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ParamsCopyWith<_$_Params> get copyWith =>
      __$$_ParamsCopyWithImpl<_$_Params>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ParamsToJson(
      this,
    );
  }
}

abstract class _Params implements Params {
  const factory _Params({final String rewardsText}) = _$_Params;

  factory _Params.fromJson(Map<String, dynamic> json) = _$_Params.fromJson;

  @override
  String get rewardsText;
  @override
  @JsonKey(ignore: true)
  _$$_ParamsCopyWith<_$_Params> get copyWith =>
      throw _privateConstructorUsedError;
}
