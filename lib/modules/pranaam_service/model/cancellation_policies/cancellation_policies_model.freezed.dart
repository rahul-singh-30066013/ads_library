// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cancellation_policies_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CancellationPoliciesModel _$CancellationPoliciesModelFromJson(
    Map<String, dynamic> json) {
  return _CancellationPoliciesModel.fromJson(json);
}

/// @nodoc
mixin _$CancellationPoliciesModel {
  @JsonKey(name: 'name')
  dynamic get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'path')
  String get path => throw _privateConstructorUsedError;
  @JsonKey(name: 'elements')
  List<Element> get elements => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CancellationPoliciesModelCopyWith<CancellationPoliciesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CancellationPoliciesModelCopyWith<$Res> {
  factory $CancellationPoliciesModelCopyWith(CancellationPoliciesModel value,
          $Res Function(CancellationPoliciesModel) then) =
      _$CancellationPoliciesModelCopyWithImpl<$Res, CancellationPoliciesModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') dynamic name,
      @JsonKey(name: 'path') String path,
      @JsonKey(name: 'elements') List<Element> elements});
}

/// @nodoc
class _$CancellationPoliciesModelCopyWithImpl<$Res,
        $Val extends CancellationPoliciesModel>
    implements $CancellationPoliciesModelCopyWith<$Res> {
  _$CancellationPoliciesModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_CancellationPoliciesModelCopyWith<$Res>
    implements $CancellationPoliciesModelCopyWith<$Res> {
  factory _$$_CancellationPoliciesModelCopyWith(
          _$_CancellationPoliciesModel value,
          $Res Function(_$_CancellationPoliciesModel) then) =
      __$$_CancellationPoliciesModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') dynamic name,
      @JsonKey(name: 'path') String path,
      @JsonKey(name: 'elements') List<Element> elements});
}

/// @nodoc
class __$$_CancellationPoliciesModelCopyWithImpl<$Res>
    extends _$CancellationPoliciesModelCopyWithImpl<$Res,
        _$_CancellationPoliciesModel>
    implements _$$_CancellationPoliciesModelCopyWith<$Res> {
  __$$_CancellationPoliciesModelCopyWithImpl(
      _$_CancellationPoliciesModel _value,
      $Res Function(_$_CancellationPoliciesModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? path = null,
    Object? elements = null,
  }) {
    return _then(_$_CancellationPoliciesModel(
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
class _$_CancellationPoliciesModel implements _CancellationPoliciesModel {
  const _$_CancellationPoliciesModel(
      {@JsonKey(name: 'name') this.name = '',
      @JsonKey(name: 'path') this.path = '',
      @JsonKey(name: 'elements') this.elements = const []});

  factory _$_CancellationPoliciesModel.fromJson(Map<String, dynamic> json) =>
      _$$_CancellationPoliciesModelFromJson(json);

  @override
  @JsonKey(name: 'name')
  final dynamic name;
  @override
  @JsonKey(name: 'path')
  final String path;
  @override
  @JsonKey(name: 'elements')
  final List<Element> elements;

  @override
  String toString() {
    return 'CancellationPoliciesModel(name: $name, path: $path, elements: $elements)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CancellationPoliciesModel &&
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
  _$$_CancellationPoliciesModelCopyWith<_$_CancellationPoliciesModel>
      get copyWith => __$$_CancellationPoliciesModelCopyWithImpl<
          _$_CancellationPoliciesModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CancellationPoliciesModelToJson(
      this,
    );
  }
}

abstract class _CancellationPoliciesModel implements CancellationPoliciesModel {
  const factory _CancellationPoliciesModel(
          {@JsonKey(name: 'name') final dynamic name,
          @JsonKey(name: 'path') final String path,
          @JsonKey(name: 'elements') final List<Element> elements}) =
      _$_CancellationPoliciesModel;

  factory _CancellationPoliciesModel.fromJson(Map<String, dynamic> json) =
      _$_CancellationPoliciesModel.fromJson;

  @override
  @JsonKey(name: 'name')
  dynamic get name;
  @override
  @JsonKey(name: 'path')
  String get path;
  @override
  @JsonKey(name: 'elements')
  List<Element> get elements;
  @override
  @JsonKey(ignore: true)
  _$$_CancellationPoliciesModelCopyWith<_$_CancellationPoliciesModel>
      get copyWith => throw _privateConstructorUsedError;
}

Element _$ElementFromJson(Map<String, dynamic> json) {
  return _Element.fromJson(json);
}

/// @nodoc
mixin _$Element {
  @JsonKey(name: 'uid')
  String get uid => throw _privateConstructorUsedError;
  @JsonKey(name: 'componentName')
  String get componentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'dataSource')
  String get dataSource => throw _privateConstructorUsedError;
  @JsonKey(name: 'params')
  Params get params => throw _privateConstructorUsedError;
  @JsonKey(name: 'fields')
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
      {@JsonKey(name: 'uid') String uid,
      @JsonKey(name: 'componentName') String componentName,
      @JsonKey(name: 'dataSource') String dataSource,
      @JsonKey(name: 'params') Params params,
      @JsonKey(name: 'fields') Fields fields});

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
      {@JsonKey(name: 'uid') String uid,
      @JsonKey(name: 'componentName') String componentName,
      @JsonKey(name: 'dataSource') String dataSource,
      @JsonKey(name: 'params') Params params,
      @JsonKey(name: 'fields') Fields fields});

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
      {@JsonKey(name: 'uid') this.uid = '',
      @JsonKey(name: 'componentName') this.componentName = '',
      @JsonKey(name: 'dataSource') this.dataSource = '',
      @JsonKey(name: 'params') this.params = const Params(),
      @JsonKey(name: 'fields') this.fields = const Fields()});

  factory _$_Element.fromJson(Map<String, dynamic> json) =>
      _$$_ElementFromJson(json);

  @override
  @JsonKey(name: 'uid')
  final String uid;
  @override
  @JsonKey(name: 'componentName')
  final String componentName;
  @override
  @JsonKey(name: 'dataSource')
  final String dataSource;
  @override
  @JsonKey(name: 'params')
  final Params params;
  @override
  @JsonKey(name: 'fields')
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
      {@JsonKey(name: 'uid') final String uid,
      @JsonKey(name: 'componentName') final String componentName,
      @JsonKey(name: 'dataSource') final String dataSource,
      @JsonKey(name: 'params') final Params params,
      @JsonKey(name: 'fields') final Fields fields}) = _$_Element;

  factory _Element.fromJson(Map<String, dynamic> json) = _$_Element.fromJson;

  @override
  @JsonKey(name: 'uid')
  String get uid;
  @override
  @JsonKey(name: 'componentName')
  String get componentName;
  @override
  @JsonKey(name: 'dataSource')
  String get dataSource;
  @override
  @JsonKey(name: 'params')
  Params get params;
  @override
  @JsonKey(name: 'fields')
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
  @JsonKey(name: 'header')
  List<Header> get header => throw _privateConstructorUsedError;
  @JsonKey(name: 'rows')
  List<Row> get rows => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FieldsCopyWith<Fields> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldsCopyWith<$Res> {
  factory $FieldsCopyWith(Fields value, $Res Function(Fields) then) =
      _$FieldsCopyWithImpl<$Res, Fields>;
  @useResult
  $Res call(
      {@JsonKey(name: 'header') List<Header> header,
      @JsonKey(name: 'rows') List<Row> rows});
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
    Object? header = null,
    Object? rows = null,
  }) {
    return _then(_value.copyWith(
      header: null == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as List<Header>,
      rows: null == rows
          ? _value.rows
          : rows // ignore: cast_nullable_to_non_nullable
              as List<Row>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FieldsCopyWith<$Res> implements $FieldsCopyWith<$Res> {
  factory _$$_FieldsCopyWith(_$_Fields value, $Res Function(_$_Fields) then) =
      __$$_FieldsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'header') List<Header> header,
      @JsonKey(name: 'rows') List<Row> rows});
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
    Object? header = null,
    Object? rows = null,
  }) {
    return _then(_$_Fields(
      header: null == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as List<Header>,
      rows: null == rows
          ? _value.rows
          : rows // ignore: cast_nullable_to_non_nullable
              as List<Row>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Fields implements _Fields {
  const _$_Fields(
      {@JsonKey(name: 'header') this.header = const [],
      @JsonKey(name: 'rows') this.rows = const []});

  factory _$_Fields.fromJson(Map<String, dynamic> json) =>
      _$$_FieldsFromJson(json);

  @override
  @JsonKey(name: 'header')
  final List<Header> header;
  @override
  @JsonKey(name: 'rows')
  final List<Row> rows;

  @override
  String toString() {
    return 'Fields(header: $header, rows: $rows)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fields &&
            const DeepCollectionEquality().equals(other.header, header) &&
            const DeepCollectionEquality().equals(other.rows, rows));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(header),
      const DeepCollectionEquality().hash(rows));

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
  const factory _Fields(
      {@JsonKey(name: 'header') final List<Header> header,
      @JsonKey(name: 'rows') final List<Row> rows}) = _$_Fields;

  factory _Fields.fromJson(Map<String, dynamic> json) = _$_Fields.fromJson;

  @override
  @JsonKey(name: 'header')
  List<Header> get header;
  @override
  @JsonKey(name: 'rows')
  List<Row> get rows;
  @override
  @JsonKey(ignore: true)
  _$$_FieldsCopyWith<_$_Fields> get copyWith =>
      throw _privateConstructorUsedError;
}

Header _$HeaderFromJson(Map<String, dynamic> json) {
  return _Header.fromJson(json);
}

/// @nodoc
mixin _$Header {
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'value')
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HeaderCopyWith<Header> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeaderCopyWith<$Res> {
  factory $HeaderCopyWith(Header value, $Res Function(Header) then) =
      _$HeaderCopyWithImpl<$Res, Header>;
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String title,
      @JsonKey(name: 'value') String value});
}

/// @nodoc
class _$HeaderCopyWithImpl<$Res, $Val extends Header>
    implements $HeaderCopyWith<$Res> {
  _$HeaderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HeaderCopyWith<$Res> implements $HeaderCopyWith<$Res> {
  factory _$$_HeaderCopyWith(_$_Header value, $Res Function(_$_Header) then) =
      __$$_HeaderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String title,
      @JsonKey(name: 'value') String value});
}

/// @nodoc
class __$$_HeaderCopyWithImpl<$Res>
    extends _$HeaderCopyWithImpl<$Res, _$_Header>
    implements _$$_HeaderCopyWith<$Res> {
  __$$_HeaderCopyWithImpl(_$_Header _value, $Res Function(_$_Header) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? value = null,
  }) {
    return _then(_$_Header(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Header implements _Header {
  const _$_Header(
      {@JsonKey(name: 'title') this.title = '',
      @JsonKey(name: 'value') this.value = ''});

  factory _$_Header.fromJson(Map<String, dynamic> json) =>
      _$$_HeaderFromJson(json);

  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'value')
  final String value;

  @override
  String toString() {
    return 'Header(title: $title, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Header &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HeaderCopyWith<_$_Header> get copyWith =>
      __$$_HeaderCopyWithImpl<_$_Header>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HeaderToJson(
      this,
    );
  }
}

abstract class _Header implements Header {
  const factory _Header(
      {@JsonKey(name: 'title') final String title,
      @JsonKey(name: 'value') final String value}) = _$_Header;

  factory _Header.fromJson(Map<String, dynamic> json) = _$_Header.fromJson;

  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'value')
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$_HeaderCopyWith<_$_Header> get copyWith =>
      throw _privateConstructorUsedError;
}

Row _$RowFromJson(Map<String, dynamic> json) {
  return _Row.fromJson(json);
}

/// @nodoc
mixin _$Row {
  @JsonKey(name: 'srNo')
  String get srNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'services')
  String get services => throw _privateConstructorUsedError;
  @JsonKey(name: 'charges')
  String get charges => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RowCopyWith<Row> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RowCopyWith<$Res> {
  factory $RowCopyWith(Row value, $Res Function(Row) then) =
      _$RowCopyWithImpl<$Res, Row>;
  @useResult
  $Res call(
      {@JsonKey(name: 'srNo') String srNo,
      @JsonKey(name: 'services') String services,
      @JsonKey(name: 'charges') String charges});
}

/// @nodoc
class _$RowCopyWithImpl<$Res, $Val extends Row> implements $RowCopyWith<$Res> {
  _$RowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? srNo = null,
    Object? services = null,
    Object? charges = null,
  }) {
    return _then(_value.copyWith(
      srNo: null == srNo
          ? _value.srNo
          : srNo // ignore: cast_nullable_to_non_nullable
              as String,
      services: null == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as String,
      charges: null == charges
          ? _value.charges
          : charges // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RowCopyWith<$Res> implements $RowCopyWith<$Res> {
  factory _$$_RowCopyWith(_$_Row value, $Res Function(_$_Row) then) =
      __$$_RowCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'srNo') String srNo,
      @JsonKey(name: 'services') String services,
      @JsonKey(name: 'charges') String charges});
}

/// @nodoc
class __$$_RowCopyWithImpl<$Res> extends _$RowCopyWithImpl<$Res, _$_Row>
    implements _$$_RowCopyWith<$Res> {
  __$$_RowCopyWithImpl(_$_Row _value, $Res Function(_$_Row) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? srNo = null,
    Object? services = null,
    Object? charges = null,
  }) {
    return _then(_$_Row(
      srNo: null == srNo
          ? _value.srNo
          : srNo // ignore: cast_nullable_to_non_nullable
              as String,
      services: null == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as String,
      charges: null == charges
          ? _value.charges
          : charges // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Row implements _Row {
  const _$_Row(
      {@JsonKey(name: 'srNo') this.srNo = '',
      @JsonKey(name: 'services') this.services = '',
      @JsonKey(name: 'charges') this.charges = ''});

  factory _$_Row.fromJson(Map<String, dynamic> json) => _$$_RowFromJson(json);

  @override
  @JsonKey(name: 'srNo')
  final String srNo;
  @override
  @JsonKey(name: 'services')
  final String services;
  @override
  @JsonKey(name: 'charges')
  final String charges;

  @override
  String toString() {
    return 'Row(srNo: $srNo, services: $services, charges: $charges)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Row &&
            (identical(other.srNo, srNo) || other.srNo == srNo) &&
            (identical(other.services, services) ||
                other.services == services) &&
            (identical(other.charges, charges) || other.charges == charges));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, srNo, services, charges);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RowCopyWith<_$_Row> get copyWith =>
      __$$_RowCopyWithImpl<_$_Row>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RowToJson(
      this,
    );
  }
}

abstract class _Row implements Row {
  const factory _Row(
      {@JsonKey(name: 'srNo') final String srNo,
      @JsonKey(name: 'services') final String services,
      @JsonKey(name: 'charges') final String charges}) = _$_Row;

  factory _Row.fromJson(Map<String, dynamic> json) = _$_Row.fromJson;

  @override
  @JsonKey(name: 'srNo')
  String get srNo;
  @override
  @JsonKey(name: 'services')
  String get services;
  @override
  @JsonKey(name: 'charges')
  String get charges;
  @override
  @JsonKey(ignore: true)
  _$$_RowCopyWith<_$_Row> get copyWith => throw _privateConstructorUsedError;
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
