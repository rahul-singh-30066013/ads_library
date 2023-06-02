// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CityListModel _$CityListModelFromJson(Map<String, dynamic> json) {
  return _CityListModel.fromJson(json);
}

/// @nodoc
mixin _$CityListModel {
  dynamic get name => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  List<Element> get elements => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CityListModelCopyWith<CityListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityListModelCopyWith<$Res> {
  factory $CityListModelCopyWith(
          CityListModel value, $Res Function(CityListModel) then) =
      _$CityListModelCopyWithImpl<$Res, CityListModel>;
  @useResult
  $Res call({dynamic name, String path, List<Element> elements});
}

/// @nodoc
class _$CityListModelCopyWithImpl<$Res, $Val extends CityListModel>
    implements $CityListModelCopyWith<$Res> {
  _$CityListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? path = null,
    Object? elements = null,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
abstract class _$$_CityListModelCopyWith<$Res>
    implements $CityListModelCopyWith<$Res> {
  factory _$$_CityListModelCopyWith(
          _$_CityListModel value, $Res Function(_$_CityListModel) then) =
      __$$_CityListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic name, String path, List<Element> elements});
}

/// @nodoc
class __$$_CityListModelCopyWithImpl<$Res>
    extends _$CityListModelCopyWithImpl<$Res, _$_CityListModel>
    implements _$$_CityListModelCopyWith<$Res> {
  __$$_CityListModelCopyWithImpl(
      _$_CityListModel _value, $Res Function(_$_CityListModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? path = null,
    Object? elements = null,
  }) {
    return _then(_$_CityListModel(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
class _$_CityListModel implements _CityListModel {
  const _$_CityListModel(
      {this.name = '', this.path = '', this.elements = const []});

  factory _$_CityListModel.fromJson(Map<String, dynamic> json) =>
      _$$_CityListModelFromJson(json);

  @override
  @JsonKey()
  final dynamic name;
  @override
  @JsonKey()
  final String path;
  @override
  @JsonKey()
  final List<Element> elements;

  @override
  String toString() {
    return 'CityListModel(name: $name, path: $path, elements: $elements)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CityListModel &&
            const DeepCollectionEquality().equals(other.name, name) &&
            (identical(other.path, path) || other.path == path) &&
            const DeepCollectionEquality().equals(other.elements, elements));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      path,
      const DeepCollectionEquality().hash(elements));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CityListModelCopyWith<_$_CityListModel> get copyWith =>
      __$$_CityListModelCopyWithImpl<_$_CityListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CityListModelToJson(
      this,
    );
  }
}

abstract class _CityListModel implements CityListModel {
  const factory _CityListModel(
      {final dynamic name,
      final String path,
      final List<Element> elements}) = _$_CityListModel;

  factory _CityListModel.fromJson(Map<String, dynamic> json) =
      _$_CityListModel.fromJson;

  @override
  dynamic get name;
  @override
  String get path;
  @override
  List<Element> get elements;
  @override
  @JsonKey(ignore: true)
  _$$_CityListModelCopyWith<_$_CityListModel> get copyWith =>
      throw _privateConstructorUsedError;
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
  List<Result> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FieldsCopyWith<Fields> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldsCopyWith<$Res> {
  factory $FieldsCopyWith(Fields value, $Res Function(Fields) then) =
      _$FieldsCopyWithImpl<$Res, Fields>;
  @useResult
  $Res call({List<Result> results});
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
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Result>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FieldsCopyWith<$Res> implements $FieldsCopyWith<$Res> {
  factory _$$_FieldsCopyWith(_$_Fields value, $Res Function(_$_Fields) then) =
      __$$_FieldsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Result> results});
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
    Object? results = null,
  }) {
    return _then(_$_Fields(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Result>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Fields implements _Fields {
  const _$_Fields({this.results = const []});

  factory _$_Fields.fromJson(Map<String, dynamic> json) =>
      _$$_FieldsFromJson(json);

  @override
  @JsonKey()
  final List<Result> results;

  @override
  String toString() {
    return 'Fields(results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fields &&
            const DeepCollectionEquality().equals(other.results, results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(results));

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
  const factory _Fields({final List<Result> results}) = _$_Fields;

  factory _Fields.fromJson(Map<String, dynamic> json) = _$_Fields.fromJson;

  @override
  List<Result> get results;
  @override
  @JsonKey(ignore: true)
  _$$_FieldsCopyWith<_$_Fields> get copyWith =>
      throw _privateConstructorUsedError;
}

Result _$ResultFromJson(Map<String, dynamic> json) {
  return _Result.fromJson(json);
}

/// @nodoc
mixin _$Result {
  String get stateMasterId => throw _privateConstructorUsedError;
  String get stateImportId => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get resultImport => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get countryMaster => throw _privateConstructorUsedError;
  String get countryCode => throw _privateConstructorUsedError;
  String get stateCode => throw _privateConstructorUsedError;
  String get latitude => throw _privateConstructorUsedError;
  String get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResultCopyWith<Result> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<$Res> {
  factory $ResultCopyWith(Result value, $Res Function(Result) then) =
      _$ResultCopyWithImpl<$Res, Result>;
  @useResult
  $Res call(
      {String stateMasterId,
      String stateImportId,
      String id,
      String resultImport,
      String name,
      String countryMaster,
      String countryCode,
      String stateCode,
      String latitude,
      String longitude});
}

/// @nodoc
class _$ResultCopyWithImpl<$Res, $Val extends Result>
    implements $ResultCopyWith<$Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateMasterId = null,
    Object? stateImportId = null,
    Object? id = null,
    Object? resultImport = null,
    Object? name = null,
    Object? countryMaster = null,
    Object? countryCode = null,
    Object? stateCode = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      stateMasterId: null == stateMasterId
          ? _value.stateMasterId
          : stateMasterId // ignore: cast_nullable_to_non_nullable
              as String,
      stateImportId: null == stateImportId
          ? _value.stateImportId
          : stateImportId // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      resultImport: null == resultImport
          ? _value.resultImport
          : resultImport // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      countryMaster: null == countryMaster
          ? _value.countryMaster
          : countryMaster // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      stateCode: null == stateCode
          ? _value.stateCode
          : stateCode // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResultCopyWith<$Res> implements $ResultCopyWith<$Res> {
  factory _$$_ResultCopyWith(_$_Result value, $Res Function(_$_Result) then) =
      __$$_ResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String stateMasterId,
      String stateImportId,
      String id,
      String resultImport,
      String name,
      String countryMaster,
      String countryCode,
      String stateCode,
      String latitude,
      String longitude});
}

/// @nodoc
class __$$_ResultCopyWithImpl<$Res>
    extends _$ResultCopyWithImpl<$Res, _$_Result>
    implements _$$_ResultCopyWith<$Res> {
  __$$_ResultCopyWithImpl(_$_Result _value, $Res Function(_$_Result) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateMasterId = null,
    Object? stateImportId = null,
    Object? id = null,
    Object? resultImport = null,
    Object? name = null,
    Object? countryMaster = null,
    Object? countryCode = null,
    Object? stateCode = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$_Result(
      stateMasterId: null == stateMasterId
          ? _value.stateMasterId
          : stateMasterId // ignore: cast_nullable_to_non_nullable
              as String,
      stateImportId: null == stateImportId
          ? _value.stateImportId
          : stateImportId // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      resultImport: null == resultImport
          ? _value.resultImport
          : resultImport // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      countryMaster: null == countryMaster
          ? _value.countryMaster
          : countryMaster // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      stateCode: null == stateCode
          ? _value.stateCode
          : stateCode // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Result implements _Result {
  const _$_Result(
      {this.stateMasterId = '',
      this.stateImportId = '',
      this.id = '',
      this.resultImport = '',
      this.name = '',
      this.countryMaster = '',
      this.countryCode = '',
      this.stateCode = '',
      this.latitude = '',
      this.longitude = ''});

  factory _$_Result.fromJson(Map<String, dynamic> json) =>
      _$$_ResultFromJson(json);

  @override
  @JsonKey()
  final String stateMasterId;
  @override
  @JsonKey()
  final String stateImportId;
  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String resultImport;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String countryMaster;
  @override
  @JsonKey()
  final String countryCode;
  @override
  @JsonKey()
  final String stateCode;
  @override
  @JsonKey()
  final String latitude;
  @override
  @JsonKey()
  final String longitude;

  @override
  String toString() {
    return 'Result(stateMasterId: $stateMasterId, stateImportId: $stateImportId, id: $id, resultImport: $resultImport, name: $name, countryMaster: $countryMaster, countryCode: $countryCode, stateCode: $stateCode, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Result &&
            (identical(other.stateMasterId, stateMasterId) ||
                other.stateMasterId == stateMasterId) &&
            (identical(other.stateImportId, stateImportId) ||
                other.stateImportId == stateImportId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.resultImport, resultImport) ||
                other.resultImport == resultImport) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.countryMaster, countryMaster) ||
                other.countryMaster == countryMaster) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.stateCode, stateCode) ||
                other.stateCode == stateCode) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      stateMasterId,
      stateImportId,
      id,
      resultImport,
      name,
      countryMaster,
      countryCode,
      stateCode,
      latitude,
      longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResultCopyWith<_$_Result> get copyWith =>
      __$$_ResultCopyWithImpl<_$_Result>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResultToJson(
      this,
    );
  }
}

abstract class _Result implements Result {
  const factory _Result(
      {final String stateMasterId,
      final String stateImportId,
      final String id,
      final String resultImport,
      final String name,
      final String countryMaster,
      final String countryCode,
      final String stateCode,
      final String latitude,
      final String longitude}) = _$_Result;

  factory _Result.fromJson(Map<String, dynamic> json) = _$_Result.fromJson;

  @override
  String get stateMasterId;
  @override
  String get stateImportId;
  @override
  String get id;
  @override
  String get resultImport;
  @override
  String get name;
  @override
  String get countryMaster;
  @override
  String get countryCode;
  @override
  String get stateCode;
  @override
  String get latitude;
  @override
  String get longitude;
  @override
  @JsonKey(ignore: true)
  _$$_ResultCopyWith<_$_Result> get copyWith =>
      throw _privateConstructorUsedError;
}

Params _$ParamsFromJson(Map<String, dynamic> json) {
  return _Params.fromJson(json);
}

/// @nodoc
mixin _$Params {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParamsCopyWith<$Res> {
  factory $ParamsCopyWith(Params value, $Res Function(Params) then) =
      _$ParamsCopyWithImpl<$Res, Params>;
}

/// @nodoc
class _$ParamsCopyWithImpl<$Res, $Val extends Params>
    implements $ParamsCopyWith<$Res> {
  _$ParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ParamsCopyWith<$Res> {
  factory _$$_ParamsCopyWith(_$_Params value, $Res Function(_$_Params) then) =
      __$$_ParamsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ParamsCopyWithImpl<$Res>
    extends _$ParamsCopyWithImpl<$Res, _$_Params>
    implements _$$_ParamsCopyWith<$Res> {
  __$$_ParamsCopyWithImpl(_$_Params _value, $Res Function(_$_Params) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$_Params implements _Params {
  const _$_Params();

  factory _$_Params.fromJson(Map<String, dynamic> json) =>
      _$$_ParamsFromJson(json);

  @override
  String toString() {
    return 'Params()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Params);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$_ParamsToJson(
      this,
    );
  }
}

abstract class _Params implements Params {
  const factory _Params() = _$_Params;

  factory _Params.fromJson(Map<String, dynamic> json) = _$_Params.fromJson;
}
