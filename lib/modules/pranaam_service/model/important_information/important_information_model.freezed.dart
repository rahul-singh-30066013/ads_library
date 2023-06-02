// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'important_information_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImportantInformationModel _$ImportantInformationModelFromJson(
    Map<String, dynamic> json) {
  return _ImportantInformationModel.fromJson(json);
}

/// @nodoc
mixin _$ImportantInformationModel {
  @JsonKey(name: 'name')
  dynamic get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'path')
  String get path => throw _privateConstructorUsedError;
  @JsonKey(name: 'elements')
  List<Element> get elements => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImportantInformationModelCopyWith<ImportantInformationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImportantInformationModelCopyWith<$Res> {
  factory $ImportantInformationModelCopyWith(ImportantInformationModel value,
          $Res Function(ImportantInformationModel) then) =
      _$ImportantInformationModelCopyWithImpl<$Res, ImportantInformationModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') dynamic name,
      @JsonKey(name: 'path') String path,
      @JsonKey(name: 'elements') List<Element> elements});
}

/// @nodoc
class _$ImportantInformationModelCopyWithImpl<$Res,
        $Val extends ImportantInformationModel>
    implements $ImportantInformationModelCopyWith<$Res> {
  _$ImportantInformationModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_ImportantInformationModelCopyWith<$Res>
    implements $ImportantInformationModelCopyWith<$Res> {
  factory _$$_ImportantInformationModelCopyWith(
          _$_ImportantInformationModel value,
          $Res Function(_$_ImportantInformationModel) then) =
      __$$_ImportantInformationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') dynamic name,
      @JsonKey(name: 'path') String path,
      @JsonKey(name: 'elements') List<Element> elements});
}

/// @nodoc
class __$$_ImportantInformationModelCopyWithImpl<$Res>
    extends _$ImportantInformationModelCopyWithImpl<$Res,
        _$_ImportantInformationModel>
    implements _$$_ImportantInformationModelCopyWith<$Res> {
  __$$_ImportantInformationModelCopyWithImpl(
      _$_ImportantInformationModel _value,
      $Res Function(_$_ImportantInformationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? path = null,
    Object? elements = null,
  }) {
    return _then(_$_ImportantInformationModel(
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
class _$_ImportantInformationModel implements _ImportantInformationModel {
  const _$_ImportantInformationModel(
      {@JsonKey(name: 'name') this.name = '',
      @JsonKey(name: 'path') this.path = '',
      @JsonKey(name: 'elements') this.elements = const []});

  factory _$_ImportantInformationModel.fromJson(Map<String, dynamic> json) =>
      _$$_ImportantInformationModelFromJson(json);

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
    return 'ImportantInformationModel(name: $name, path: $path, elements: $elements)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImportantInformationModel &&
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
  _$$_ImportantInformationModelCopyWith<_$_ImportantInformationModel>
      get copyWith => __$$_ImportantInformationModelCopyWithImpl<
          _$_ImportantInformationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImportantInformationModelToJson(
      this,
    );
  }
}

abstract class _ImportantInformationModel implements ImportantInformationModel {
  const factory _ImportantInformationModel(
          {@JsonKey(name: 'name') final dynamic name,
          @JsonKey(name: 'path') final String path,
          @JsonKey(name: 'elements') final List<Element> elements}) =
      _$_ImportantInformationModel;

  factory _ImportantInformationModel.fromJson(Map<String, dynamic> json) =
      _$_ImportantInformationModel.fromJson;

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
  _$$_ImportantInformationModelCopyWith<_$_ImportantInformationModel>
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
  List<ContentList> get contentList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FieldsCopyWith<Fields> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldsCopyWith<$Res> {
  factory $FieldsCopyWith(Fields value, $Res Function(Fields) then) =
      _$FieldsCopyWithImpl<$Res, Fields>;
  @useResult
  $Res call({List<ContentList> contentList});
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
    Object? contentList = null,
  }) {
    return _then(_value.copyWith(
      contentList: null == contentList
          ? _value.contentList
          : contentList // ignore: cast_nullable_to_non_nullable
              as List<ContentList>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FieldsCopyWith<$Res> implements $FieldsCopyWith<$Res> {
  factory _$$_FieldsCopyWith(_$_Fields value, $Res Function(_$_Fields) then) =
      __$$_FieldsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ContentList> contentList});
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
    Object? contentList = null,
  }) {
    return _then(_$_Fields(
      contentList: null == contentList
          ? _value.contentList
          : contentList // ignore: cast_nullable_to_non_nullable
              as List<ContentList>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Fields implements _Fields {
  const _$_Fields({this.contentList = const []});

  factory _$_Fields.fromJson(Map<String, dynamic> json) =>
      _$$_FieldsFromJson(json);

  @override
  @JsonKey()
  final List<ContentList> contentList;

  @override
  String toString() {
    return 'Fields(contentList: $contentList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fields &&
            const DeepCollectionEquality()
                .equals(other.contentList, contentList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(contentList));

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
  const factory _Fields({final List<ContentList> contentList}) = _$_Fields;

  factory _Fields.fromJson(Map<String, dynamic> json) = _$_Fields.fromJson;

  @override
  List<ContentList> get contentList;
  @override
  @JsonKey(ignore: true)
  _$$_FieldsCopyWith<_$_Fields> get copyWith =>
      throw _privateConstructorUsedError;
}

ContentList _$ContentListFromJson(Map<String, dynamic> json) {
  return _ContentList.fromJson(json);
}

/// @nodoc
mixin _$ContentList {
  String get title => throw _privateConstructorUsedError;
  List<Lines> get lines => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentListCopyWith<ContentList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentListCopyWith<$Res> {
  factory $ContentListCopyWith(
          ContentList value, $Res Function(ContentList) then) =
      _$ContentListCopyWithImpl<$Res, ContentList>;
  @useResult
  $Res call({String title, List<Lines> lines});
}

/// @nodoc
class _$ContentListCopyWithImpl<$Res, $Val extends ContentList>
    implements $ContentListCopyWith<$Res> {
  _$ContentListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? lines = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      lines: null == lines
          ? _value.lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<Lines>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ContentListCopyWith<$Res>
    implements $ContentListCopyWith<$Res> {
  factory _$$_ContentListCopyWith(
          _$_ContentList value, $Res Function(_$_ContentList) then) =
      __$$_ContentListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, List<Lines> lines});
}

/// @nodoc
class __$$_ContentListCopyWithImpl<$Res>
    extends _$ContentListCopyWithImpl<$Res, _$_ContentList>
    implements _$$_ContentListCopyWith<$Res> {
  __$$_ContentListCopyWithImpl(
      _$_ContentList _value, $Res Function(_$_ContentList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? lines = null,
  }) {
    return _then(_$_ContentList(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      lines: null == lines
          ? _value.lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<Lines>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContentList implements _ContentList {
  const _$_ContentList({this.title = '', this.lines = const []});

  factory _$_ContentList.fromJson(Map<String, dynamic> json) =>
      _$$_ContentListFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final List<Lines> lines;

  @override
  String toString() {
    return 'ContentList(title: $title, lines: $lines)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContentList &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other.lines, lines));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, const DeepCollectionEquality().hash(lines));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContentListCopyWith<_$_ContentList> get copyWith =>
      __$$_ContentListCopyWithImpl<_$_ContentList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContentListToJson(
      this,
    );
  }
}

abstract class _ContentList implements ContentList {
  const factory _ContentList({final String title, final List<Lines> lines}) =
      _$_ContentList;

  factory _ContentList.fromJson(Map<String, dynamic> json) =
      _$_ContentList.fromJson;

  @override
  String get title;
  @override
  List<Lines> get lines;
  @override
  @JsonKey(ignore: true)
  _$$_ContentListCopyWith<_$_ContentList> get copyWith =>
      throw _privateConstructorUsedError;
}

Lines _$LinesFromJson(Map<String, dynamic> json) {
  return _Lines.fromJson(json);
}

/// @nodoc
mixin _$Lines {
  String get line => throw _privateConstructorUsedError;
  List<Links> get links => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LinesCopyWith<Lines> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinesCopyWith<$Res> {
  factory $LinesCopyWith(Lines value, $Res Function(Lines) then) =
      _$LinesCopyWithImpl<$Res, Lines>;
  @useResult
  $Res call({String line, List<Links> links});
}

/// @nodoc
class _$LinesCopyWithImpl<$Res, $Val extends Lines>
    implements $LinesCopyWith<$Res> {
  _$LinesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? line = null,
    Object? links = null,
  }) {
    return _then(_value.copyWith(
      line: null == line
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as String,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<Links>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LinesCopyWith<$Res> implements $LinesCopyWith<$Res> {
  factory _$$_LinesCopyWith(_$_Lines value, $Res Function(_$_Lines) then) =
      __$$_LinesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String line, List<Links> links});
}

/// @nodoc
class __$$_LinesCopyWithImpl<$Res> extends _$LinesCopyWithImpl<$Res, _$_Lines>
    implements _$$_LinesCopyWith<$Res> {
  __$$_LinesCopyWithImpl(_$_Lines _value, $Res Function(_$_Lines) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? line = null,
    Object? links = null,
  }) {
    return _then(_$_Lines(
      line: null == line
          ? _value.line
          : line // ignore: cast_nullable_to_non_nullable
              as String,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<Links>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Lines implements _Lines {
  const _$_Lines({this.line = '', this.links = const []});

  factory _$_Lines.fromJson(Map<String, dynamic> json) =>
      _$$_LinesFromJson(json);

  @override
  @JsonKey()
  final String line;
  @override
  @JsonKey()
  final List<Links> links;

  @override
  String toString() {
    return 'Lines(line: $line, links: $links)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Lines &&
            (identical(other.line, line) || other.line == line) &&
            const DeepCollectionEquality().equals(other.links, links));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, line, const DeepCollectionEquality().hash(links));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LinesCopyWith<_$_Lines> get copyWith =>
      __$$_LinesCopyWithImpl<_$_Lines>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LinesToJson(
      this,
    );
  }
}

abstract class _Lines implements Lines {
  const factory _Lines({final String line, final List<Links> links}) = _$_Lines;

  factory _Lines.fromJson(Map<String, dynamic> json) = _$_Lines.fromJson;

  @override
  String get line;
  @override
  List<Links> get links;
  @override
  @JsonKey(ignore: true)
  _$$_LinesCopyWith<_$_Lines> get copyWith =>
      throw _privateConstructorUsedError;
}

Links _$LinksFromJson(Map<String, dynamic> json) {
  return _Links.fromJson(json);
}

/// @nodoc
mixin _$Links {
  String get link => throw _privateConstructorUsedError;
  String get linkText => throw _privateConstructorUsedError;
  String get linkURL => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LinksCopyWith<Links> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinksCopyWith<$Res> {
  factory $LinksCopyWith(Links value, $Res Function(Links) then) =
      _$LinksCopyWithImpl<$Res, Links>;
  @useResult
  $Res call({String link, String linkText, String linkURL});
}

/// @nodoc
class _$LinksCopyWithImpl<$Res, $Val extends Links>
    implements $LinksCopyWith<$Res> {
  _$LinksCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = null,
    Object? linkText = null,
    Object? linkURL = null,
  }) {
    return _then(_value.copyWith(
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      linkText: null == linkText
          ? _value.linkText
          : linkText // ignore: cast_nullable_to_non_nullable
              as String,
      linkURL: null == linkURL
          ? _value.linkURL
          : linkURL // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LinksCopyWith<$Res> implements $LinksCopyWith<$Res> {
  factory _$$_LinksCopyWith(_$_Links value, $Res Function(_$_Links) then) =
      __$$_LinksCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String link, String linkText, String linkURL});
}

/// @nodoc
class __$$_LinksCopyWithImpl<$Res> extends _$LinksCopyWithImpl<$Res, _$_Links>
    implements _$$_LinksCopyWith<$Res> {
  __$$_LinksCopyWithImpl(_$_Links _value, $Res Function(_$_Links) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = null,
    Object? linkText = null,
    Object? linkURL = null,
  }) {
    return _then(_$_Links(
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      linkText: null == linkText
          ? _value.linkText
          : linkText // ignore: cast_nullable_to_non_nullable
              as String,
      linkURL: null == linkURL
          ? _value.linkURL
          : linkURL // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Links implements _Links {
  const _$_Links({this.link = '', this.linkText = '', this.linkURL = ''});

  factory _$_Links.fromJson(Map<String, dynamic> json) =>
      _$$_LinksFromJson(json);

  @override
  @JsonKey()
  final String link;
  @override
  @JsonKey()
  final String linkText;
  @override
  @JsonKey()
  final String linkURL;

  @override
  String toString() {
    return 'Links(link: $link, linkText: $linkText, linkURL: $linkURL)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Links &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.linkText, linkText) ||
                other.linkText == linkText) &&
            (identical(other.linkURL, linkURL) || other.linkURL == linkURL));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, link, linkText, linkURL);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LinksCopyWith<_$_Links> get copyWith =>
      __$$_LinksCopyWithImpl<_$_Links>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LinksToJson(
      this,
    );
  }
}

abstract class _Links implements Links {
  const factory _Links(
      {final String link,
      final String linkText,
      final String linkURL}) = _$_Links;

  factory _Links.fromJson(Map<String, dynamic> json) = _$_Links.fromJson;

  @override
  String get link;
  @override
  String get linkText;
  @override
  String get linkURL;
  @override
  @JsonKey(ignore: true)
  _$$_LinksCopyWith<_$_Links> get copyWith =>
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
