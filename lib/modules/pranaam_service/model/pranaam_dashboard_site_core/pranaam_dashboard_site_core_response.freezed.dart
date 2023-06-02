// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pranaam_dashboard_site_core_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PranaamDashboardSiteCoreResponse _$PranaamDashboardSiteCoreResponseFromJson(
    Map<String, dynamic> json) {
  return _PranaamDashboardSiteCoreResponse.fromJson(json);
}

/// @nodoc
mixin _$PranaamDashboardSiteCoreResponse {
  String get name => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  List<Element> get elements => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PranaamDashboardSiteCoreResponseCopyWith<PranaamDashboardSiteCoreResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PranaamDashboardSiteCoreResponseCopyWith<$Res> {
  factory $PranaamDashboardSiteCoreResponseCopyWith(
          PranaamDashboardSiteCoreResponse value,
          $Res Function(PranaamDashboardSiteCoreResponse) then) =
      _$PranaamDashboardSiteCoreResponseCopyWithImpl<$Res,
          PranaamDashboardSiteCoreResponse>;
  @useResult
  $Res call({String name, String path, List<Element> elements});
}

/// @nodoc
class _$PranaamDashboardSiteCoreResponseCopyWithImpl<$Res,
        $Val extends PranaamDashboardSiteCoreResponse>
    implements $PranaamDashboardSiteCoreResponseCopyWith<$Res> {
  _$PranaamDashboardSiteCoreResponseCopyWithImpl(this._value, this._then);

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
abstract class _$$_PranaamDashboardSiteCoreResponseCopyWith<$Res>
    implements $PranaamDashboardSiteCoreResponseCopyWith<$Res> {
  factory _$$_PranaamDashboardSiteCoreResponseCopyWith(
          _$_PranaamDashboardSiteCoreResponse value,
          $Res Function(_$_PranaamDashboardSiteCoreResponse) then) =
      __$$_PranaamDashboardSiteCoreResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String path, List<Element> elements});
}

/// @nodoc
class __$$_PranaamDashboardSiteCoreResponseCopyWithImpl<$Res>
    extends _$PranaamDashboardSiteCoreResponseCopyWithImpl<$Res,
        _$_PranaamDashboardSiteCoreResponse>
    implements _$$_PranaamDashboardSiteCoreResponseCopyWith<$Res> {
  __$$_PranaamDashboardSiteCoreResponseCopyWithImpl(
      _$_PranaamDashboardSiteCoreResponse _value,
      $Res Function(_$_PranaamDashboardSiteCoreResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? path = null,
    Object? elements = null,
  }) {
    return _then(_$_PranaamDashboardSiteCoreResponse(
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
class _$_PranaamDashboardSiteCoreResponse
    implements _PranaamDashboardSiteCoreResponse {
  const _$_PranaamDashboardSiteCoreResponse(
      {this.name = '', this.path = '', this.elements = const []});

  factory _$_PranaamDashboardSiteCoreResponse.fromJson(
          Map<String, dynamic> json) =>
      _$$_PranaamDashboardSiteCoreResponseFromJson(json);

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
    return 'PranaamDashboardSiteCoreResponse(name: $name, path: $path, elements: $elements)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PranaamDashboardSiteCoreResponse &&
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
  _$$_PranaamDashboardSiteCoreResponseCopyWith<
          _$_PranaamDashboardSiteCoreResponse>
      get copyWith => __$$_PranaamDashboardSiteCoreResponseCopyWithImpl<
          _$_PranaamDashboardSiteCoreResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PranaamDashboardSiteCoreResponseToJson(
      this,
    );
  }
}

abstract class _PranaamDashboardSiteCoreResponse
    implements PranaamDashboardSiteCoreResponse {
  const factory _PranaamDashboardSiteCoreResponse(
      {final String name,
      final String path,
      final List<Element> elements}) = _$_PranaamDashboardSiteCoreResponse;

  factory _PranaamDashboardSiteCoreResponse.fromJson(
      Map<String, dynamic> json) = _$_PranaamDashboardSiteCoreResponse.fromJson;

  @override
  String get name;
  @override
  String get path;
  @override
  List<Element> get elements;
  @override
  @JsonKey(ignore: true)
  _$$_PranaamDashboardSiteCoreResponseCopyWith<
          _$_PranaamDashboardSiteCoreResponse>
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
  DashboardItem get widget => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<ListElement> get list => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FieldsCopyWith<Fields> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldsCopyWith<$Res> {
  factory $FieldsCopyWith(Fields value, $Res Function(Fields) then) =
      _$FieldsCopyWithImpl<$Res, Fields>;
  @useResult
  $Res call({DashboardItem widget, String title, List<ListElement> list});

  $DashboardItemCopyWith<$Res> get widget;
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
    Object? widget = null,
    Object? title = null,
    Object? list = null,
  }) {
    return _then(_value.copyWith(
      widget: null == widget
          ? _value.widget
          : widget // ignore: cast_nullable_to_non_nullable
              as DashboardItem,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<ListElement>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DashboardItemCopyWith<$Res> get widget {
    return $DashboardItemCopyWith<$Res>(_value.widget, (value) {
      return _then(_value.copyWith(widget: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FieldsCopyWith<$Res> implements $FieldsCopyWith<$Res> {
  factory _$$_FieldsCopyWith(_$_Fields value, $Res Function(_$_Fields) then) =
      __$$_FieldsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DashboardItem widget, String title, List<ListElement> list});

  @override
  $DashboardItemCopyWith<$Res> get widget;
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
    Object? widget = null,
    Object? title = null,
    Object? list = null,
  }) {
    return _then(_$_Fields(
      widget: null == widget
          ? _value.widget
          : widget // ignore: cast_nullable_to_non_nullable
              as DashboardItem,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<ListElement>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Fields implements _Fields {
  const _$_Fields(
      {this.widget = const DashboardItem(),
      this.title = '',
      this.list = const []});

  factory _$_Fields.fromJson(Map<String, dynamic> json) =>
      _$$_FieldsFromJson(json);

  @override
  @JsonKey()
  final DashboardItem widget;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final List<ListElement> list;

  @override
  String toString() {
    return 'Fields(widget: $widget, title: $title, list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fields &&
            (identical(other.widget, widget) || other.widget == widget) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other.list, list));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, widget, title, const DeepCollectionEquality().hash(list));

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
      {final DashboardItem widget,
      final String title,
      final List<ListElement> list}) = _$_Fields;

  factory _Fields.fromJson(Map<String, dynamic> json) = _$_Fields.fromJson;

  @override
  DashboardItem get widget;
  @override
  String get title;
  @override
  List<ListElement> get list;
  @override
  @JsonKey(ignore: true)
  _$$_FieldsCopyWith<_$_Fields> get copyWith =>
      throw _privateConstructorUsedError;
}

ListElement _$ListElementFromJson(Map<String, dynamic> json) {
  return _ListElement.fromJson(json);
}

/// @nodoc
mixin _$ListElement {
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListElementCopyWith<ListElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListElementCopyWith<$Res> {
  factory $ListElementCopyWith(
          ListElement value, $Res Function(ListElement) then) =
      _$ListElementCopyWithImpl<$Res, ListElement>;
  @useResult
  $Res call({String title, String body});
}

/// @nodoc
class _$ListElementCopyWithImpl<$Res, $Val extends ListElement>
    implements $ListElementCopyWith<$Res> {
  _$ListElementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? body = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ListElementCopyWith<$Res>
    implements $ListElementCopyWith<$Res> {
  factory _$$_ListElementCopyWith(
          _$_ListElement value, $Res Function(_$_ListElement) then) =
      __$$_ListElementCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String body});
}

/// @nodoc
class __$$_ListElementCopyWithImpl<$Res>
    extends _$ListElementCopyWithImpl<$Res, _$_ListElement>
    implements _$$_ListElementCopyWith<$Res> {
  __$$_ListElementCopyWithImpl(
      _$_ListElement _value, $Res Function(_$_ListElement) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? body = null,
  }) {
    return _then(_$_ListElement(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListElement implements _ListElement {
  const _$_ListElement({this.title = '', this.body = ''});

  factory _$_ListElement.fromJson(Map<String, dynamic> json) =>
      _$$_ListElementFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String body;

  @override
  String toString() {
    return 'ListElement(title: $title, body: $body)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListElement &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListElementCopyWith<_$_ListElement> get copyWith =>
      __$$_ListElementCopyWithImpl<_$_ListElement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListElementToJson(
      this,
    );
  }
}

abstract class _ListElement implements ListElement {
  const factory _ListElement({final String title, final String body}) =
      _$_ListElement;

  factory _ListElement.fromJson(Map<String, dynamic> json) =
      _$_ListElement.fromJson;

  @override
  String get title;
  @override
  String get body;
  @override
  @JsonKey(ignore: true)
  _$$_ListElementCopyWith<_$_ListElement> get copyWith =>
      throw _privateConstructorUsedError;
}

DashboardItem _$DashboardItemFromJson(Map<String, dynamic> json) {
  return _DashboardItem.fromJson(json);
}

/// @nodoc
mixin _$DashboardItem {
  int get widgetId => throw _privateConstructorUsedError;
  String get widgetType => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get btnText => throw _privateConstructorUsedError;
  String get subTitle => throw _privateConstructorUsedError;
  double get subItemRadius => throw _privateConstructorUsedError;
  double get subItemWidth => throw _privateConstructorUsedError;
  int get gridColumn => throw _privateConstructorUsedError;
  double get aspectRatio => throw _privateConstructorUsedError;
  double get borderRadius => throw _privateConstructorUsedError;
  ItemMargin get itemMargin => throw _privateConstructorUsedError;
  ItemMargin get subItemMargin => throw _privateConstructorUsedError;
  ActionTitle get actionTitle => throw _privateConstructorUsedError;
  CarouselParam get carouselParam => throw _privateConstructorUsedError;
  List<WidgetItem> get widgetItems => throw _privateConstructorUsedError;
  WidgetItem get widgetItem => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardItemCopyWith<DashboardItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardItemCopyWith<$Res> {
  factory $DashboardItemCopyWith(
          DashboardItem value, $Res Function(DashboardItem) then) =
      _$DashboardItemCopyWithImpl<$Res, DashboardItem>;
  @useResult
  $Res call(
      {int widgetId,
      String widgetType,
      String title,
      String btnText,
      String subTitle,
      double subItemRadius,
      double subItemWidth,
      int gridColumn,
      double aspectRatio,
      double borderRadius,
      ItemMargin itemMargin,
      ItemMargin subItemMargin,
      ActionTitle actionTitle,
      CarouselParam carouselParam,
      List<WidgetItem> widgetItems,
      WidgetItem widgetItem});

  $ItemMarginCopyWith<$Res> get itemMargin;
  $ItemMarginCopyWith<$Res> get subItemMargin;
  $ActionTitleCopyWith<$Res> get actionTitle;
  $CarouselParamCopyWith<$Res> get carouselParam;
  $WidgetItemCopyWith<$Res> get widgetItem;
}

/// @nodoc
class _$DashboardItemCopyWithImpl<$Res, $Val extends DashboardItem>
    implements $DashboardItemCopyWith<$Res> {
  _$DashboardItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? widgetId = null,
    Object? widgetType = null,
    Object? title = null,
    Object? btnText = null,
    Object? subTitle = null,
    Object? subItemRadius = null,
    Object? subItemWidth = null,
    Object? gridColumn = null,
    Object? aspectRatio = null,
    Object? borderRadius = null,
    Object? itemMargin = null,
    Object? subItemMargin = null,
    Object? actionTitle = null,
    Object? carouselParam = null,
    Object? widgetItems = null,
    Object? widgetItem = null,
  }) {
    return _then(_value.copyWith(
      widgetId: null == widgetId
          ? _value.widgetId
          : widgetId // ignore: cast_nullable_to_non_nullable
              as int,
      widgetType: null == widgetType
          ? _value.widgetType
          : widgetType // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      btnText: null == btnText
          ? _value.btnText
          : btnText // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
      subItemRadius: null == subItemRadius
          ? _value.subItemRadius
          : subItemRadius // ignore: cast_nullable_to_non_nullable
              as double,
      subItemWidth: null == subItemWidth
          ? _value.subItemWidth
          : subItemWidth // ignore: cast_nullable_to_non_nullable
              as double,
      gridColumn: null == gridColumn
          ? _value.gridColumn
          : gridColumn // ignore: cast_nullable_to_non_nullable
              as int,
      aspectRatio: null == aspectRatio
          ? _value.aspectRatio
          : aspectRatio // ignore: cast_nullable_to_non_nullable
              as double,
      borderRadius: null == borderRadius
          ? _value.borderRadius
          : borderRadius // ignore: cast_nullable_to_non_nullable
              as double,
      itemMargin: null == itemMargin
          ? _value.itemMargin
          : itemMargin // ignore: cast_nullable_to_non_nullable
              as ItemMargin,
      subItemMargin: null == subItemMargin
          ? _value.subItemMargin
          : subItemMargin // ignore: cast_nullable_to_non_nullable
              as ItemMargin,
      actionTitle: null == actionTitle
          ? _value.actionTitle
          : actionTitle // ignore: cast_nullable_to_non_nullable
              as ActionTitle,
      carouselParam: null == carouselParam
          ? _value.carouselParam
          : carouselParam // ignore: cast_nullable_to_non_nullable
              as CarouselParam,
      widgetItems: null == widgetItems
          ? _value.widgetItems
          : widgetItems // ignore: cast_nullable_to_non_nullable
              as List<WidgetItem>,
      widgetItem: null == widgetItem
          ? _value.widgetItem
          : widgetItem // ignore: cast_nullable_to_non_nullable
              as WidgetItem,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ItemMarginCopyWith<$Res> get itemMargin {
    return $ItemMarginCopyWith<$Res>(_value.itemMargin, (value) {
      return _then(_value.copyWith(itemMargin: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ItemMarginCopyWith<$Res> get subItemMargin {
    return $ItemMarginCopyWith<$Res>(_value.subItemMargin, (value) {
      return _then(_value.copyWith(subItemMargin: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ActionTitleCopyWith<$Res> get actionTitle {
    return $ActionTitleCopyWith<$Res>(_value.actionTitle, (value) {
      return _then(_value.copyWith(actionTitle: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CarouselParamCopyWith<$Res> get carouselParam {
    return $CarouselParamCopyWith<$Res>(_value.carouselParam, (value) {
      return _then(_value.copyWith(carouselParam: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WidgetItemCopyWith<$Res> get widgetItem {
    return $WidgetItemCopyWith<$Res>(_value.widgetItem, (value) {
      return _then(_value.copyWith(widgetItem: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DashboardItemCopyWith<$Res>
    implements $DashboardItemCopyWith<$Res> {
  factory _$$_DashboardItemCopyWith(
          _$_DashboardItem value, $Res Function(_$_DashboardItem) then) =
      __$$_DashboardItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int widgetId,
      String widgetType,
      String title,
      String btnText,
      String subTitle,
      double subItemRadius,
      double subItemWidth,
      int gridColumn,
      double aspectRatio,
      double borderRadius,
      ItemMargin itemMargin,
      ItemMargin subItemMargin,
      ActionTitle actionTitle,
      CarouselParam carouselParam,
      List<WidgetItem> widgetItems,
      WidgetItem widgetItem});

  @override
  $ItemMarginCopyWith<$Res> get itemMargin;
  @override
  $ItemMarginCopyWith<$Res> get subItemMargin;
  @override
  $ActionTitleCopyWith<$Res> get actionTitle;
  @override
  $CarouselParamCopyWith<$Res> get carouselParam;
  @override
  $WidgetItemCopyWith<$Res> get widgetItem;
}

/// @nodoc
class __$$_DashboardItemCopyWithImpl<$Res>
    extends _$DashboardItemCopyWithImpl<$Res, _$_DashboardItem>
    implements _$$_DashboardItemCopyWith<$Res> {
  __$$_DashboardItemCopyWithImpl(
      _$_DashboardItem _value, $Res Function(_$_DashboardItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? widgetId = null,
    Object? widgetType = null,
    Object? title = null,
    Object? btnText = null,
    Object? subTitle = null,
    Object? subItemRadius = null,
    Object? subItemWidth = null,
    Object? gridColumn = null,
    Object? aspectRatio = null,
    Object? borderRadius = null,
    Object? itemMargin = null,
    Object? subItemMargin = null,
    Object? actionTitle = null,
    Object? carouselParam = null,
    Object? widgetItems = null,
    Object? widgetItem = null,
  }) {
    return _then(_$_DashboardItem(
      widgetId: null == widgetId
          ? _value.widgetId
          : widgetId // ignore: cast_nullable_to_non_nullable
              as int,
      widgetType: null == widgetType
          ? _value.widgetType
          : widgetType // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      btnText: null == btnText
          ? _value.btnText
          : btnText // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
      subItemRadius: null == subItemRadius
          ? _value.subItemRadius
          : subItemRadius // ignore: cast_nullable_to_non_nullable
              as double,
      subItemWidth: null == subItemWidth
          ? _value.subItemWidth
          : subItemWidth // ignore: cast_nullable_to_non_nullable
              as double,
      gridColumn: null == gridColumn
          ? _value.gridColumn
          : gridColumn // ignore: cast_nullable_to_non_nullable
              as int,
      aspectRatio: null == aspectRatio
          ? _value.aspectRatio
          : aspectRatio // ignore: cast_nullable_to_non_nullable
              as double,
      borderRadius: null == borderRadius
          ? _value.borderRadius
          : borderRadius // ignore: cast_nullable_to_non_nullable
              as double,
      itemMargin: null == itemMargin
          ? _value.itemMargin
          : itemMargin // ignore: cast_nullable_to_non_nullable
              as ItemMargin,
      subItemMargin: null == subItemMargin
          ? _value.subItemMargin
          : subItemMargin // ignore: cast_nullable_to_non_nullable
              as ItemMargin,
      actionTitle: null == actionTitle
          ? _value.actionTitle
          : actionTitle // ignore: cast_nullable_to_non_nullable
              as ActionTitle,
      carouselParam: null == carouselParam
          ? _value.carouselParam
          : carouselParam // ignore: cast_nullable_to_non_nullable
              as CarouselParam,
      widgetItems: null == widgetItems
          ? _value.widgetItems
          : widgetItems // ignore: cast_nullable_to_non_nullable
              as List<WidgetItem>,
      widgetItem: null == widgetItem
          ? _value.widgetItem
          : widgetItem // ignore: cast_nullable_to_non_nullable
              as WidgetItem,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DashboardItem implements _DashboardItem {
  const _$_DashboardItem(
      {this.widgetId = 0,
      this.widgetType = '',
      this.title = '',
      this.btnText = '',
      this.subTitle = '',
      this.subItemRadius = 0,
      this.subItemWidth = 0,
      this.gridColumn = 0,
      this.aspectRatio = 0,
      this.borderRadius = 0,
      this.itemMargin = const ItemMargin(),
      this.subItemMargin = const ItemMargin(),
      this.actionTitle = const ActionTitle(),
      this.carouselParam = const CarouselParam(),
      this.widgetItems = const [],
      this.widgetItem = const WidgetItem()});

  factory _$_DashboardItem.fromJson(Map<String, dynamic> json) =>
      _$$_DashboardItemFromJson(json);

  @override
  @JsonKey()
  final int widgetId;
  @override
  @JsonKey()
  final String widgetType;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String btnText;
  @override
  @JsonKey()
  final String subTitle;
  @override
  @JsonKey()
  final double subItemRadius;
  @override
  @JsonKey()
  final double subItemWidth;
  @override
  @JsonKey()
  final int gridColumn;
  @override
  @JsonKey()
  final double aspectRatio;
  @override
  @JsonKey()
  final double borderRadius;
  @override
  @JsonKey()
  final ItemMargin itemMargin;
  @override
  @JsonKey()
  final ItemMargin subItemMargin;
  @override
  @JsonKey()
  final ActionTitle actionTitle;
  @override
  @JsonKey()
  final CarouselParam carouselParam;
  @override
  @JsonKey()
  final List<WidgetItem> widgetItems;
  @override
  @JsonKey()
  final WidgetItem widgetItem;

  @override
  String toString() {
    return 'DashboardItem(widgetId: $widgetId, widgetType: $widgetType, title: $title, btnText: $btnText, subTitle: $subTitle, subItemRadius: $subItemRadius, subItemWidth: $subItemWidth, gridColumn: $gridColumn, aspectRatio: $aspectRatio, borderRadius: $borderRadius, itemMargin: $itemMargin, subItemMargin: $subItemMargin, actionTitle: $actionTitle, carouselParam: $carouselParam, widgetItems: $widgetItems, widgetItem: $widgetItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DashboardItem &&
            (identical(other.widgetId, widgetId) ||
                other.widgetId == widgetId) &&
            (identical(other.widgetType, widgetType) ||
                other.widgetType == widgetType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.btnText, btnText) || other.btnText == btnText) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.subItemRadius, subItemRadius) ||
                other.subItemRadius == subItemRadius) &&
            (identical(other.subItemWidth, subItemWidth) ||
                other.subItemWidth == subItemWidth) &&
            (identical(other.gridColumn, gridColumn) ||
                other.gridColumn == gridColumn) &&
            (identical(other.aspectRatio, aspectRatio) ||
                other.aspectRatio == aspectRatio) &&
            (identical(other.borderRadius, borderRadius) ||
                other.borderRadius == borderRadius) &&
            (identical(other.itemMargin, itemMargin) ||
                other.itemMargin == itemMargin) &&
            (identical(other.subItemMargin, subItemMargin) ||
                other.subItemMargin == subItemMargin) &&
            (identical(other.actionTitle, actionTitle) ||
                other.actionTitle == actionTitle) &&
            (identical(other.carouselParam, carouselParam) ||
                other.carouselParam == carouselParam) &&
            const DeepCollectionEquality()
                .equals(other.widgetItems, widgetItems) &&
            (identical(other.widgetItem, widgetItem) ||
                other.widgetItem == widgetItem));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      widgetId,
      widgetType,
      title,
      btnText,
      subTitle,
      subItemRadius,
      subItemWidth,
      gridColumn,
      aspectRatio,
      borderRadius,
      itemMargin,
      subItemMargin,
      actionTitle,
      carouselParam,
      const DeepCollectionEquality().hash(widgetItems),
      widgetItem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DashboardItemCopyWith<_$_DashboardItem> get copyWith =>
      __$$_DashboardItemCopyWithImpl<_$_DashboardItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DashboardItemToJson(
      this,
    );
  }
}

abstract class _DashboardItem implements DashboardItem {
  const factory _DashboardItem(
      {final int widgetId,
      final String widgetType,
      final String title,
      final String btnText,
      final String subTitle,
      final double subItemRadius,
      final double subItemWidth,
      final int gridColumn,
      final double aspectRatio,
      final double borderRadius,
      final ItemMargin itemMargin,
      final ItemMargin subItemMargin,
      final ActionTitle actionTitle,
      final CarouselParam carouselParam,
      final List<WidgetItem> widgetItems,
      final WidgetItem widgetItem}) = _$_DashboardItem;

  factory _DashboardItem.fromJson(Map<String, dynamic> json) =
      _$_DashboardItem.fromJson;

  @override
  int get widgetId;
  @override
  String get widgetType;
  @override
  String get title;
  @override
  String get btnText;
  @override
  String get subTitle;
  @override
  double get subItemRadius;
  @override
  double get subItemWidth;
  @override
  int get gridColumn;
  @override
  double get aspectRatio;
  @override
  double get borderRadius;
  @override
  ItemMargin get itemMargin;
  @override
  ItemMargin get subItemMargin;
  @override
  ActionTitle get actionTitle;
  @override
  CarouselParam get carouselParam;
  @override
  List<WidgetItem> get widgetItems;
  @override
  WidgetItem get widgetItem;
  @override
  @JsonKey(ignore: true)
  _$$_DashboardItemCopyWith<_$_DashboardItem> get copyWith =>
      throw _privateConstructorUsedError;
}

ActionTitle _$ActionTitleFromJson(Map<String, dynamic> json) {
  return _ActionTitle.fromJson(json);
}

/// @nodoc
mixin _$ActionTitle {
  int get actionId => throw _privateConstructorUsedError;
  String get deeplink => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActionTitleCopyWith<ActionTitle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActionTitleCopyWith<$Res> {
  factory $ActionTitleCopyWith(
          ActionTitle value, $Res Function(ActionTitle) then) =
      _$ActionTitleCopyWithImpl<$Res, ActionTitle>;
  @useResult
  $Res call({int actionId, String deeplink, String name});
}

/// @nodoc
class _$ActionTitleCopyWithImpl<$Res, $Val extends ActionTitle>
    implements $ActionTitleCopyWith<$Res> {
  _$ActionTitleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actionId = null,
    Object? deeplink = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      actionId: null == actionId
          ? _value.actionId
          : actionId // ignore: cast_nullable_to_non_nullable
              as int,
      deeplink: null == deeplink
          ? _value.deeplink
          : deeplink // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ActionTitleCopyWith<$Res>
    implements $ActionTitleCopyWith<$Res> {
  factory _$$_ActionTitleCopyWith(
          _$_ActionTitle value, $Res Function(_$_ActionTitle) then) =
      __$$_ActionTitleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int actionId, String deeplink, String name});
}

/// @nodoc
class __$$_ActionTitleCopyWithImpl<$Res>
    extends _$ActionTitleCopyWithImpl<$Res, _$_ActionTitle>
    implements _$$_ActionTitleCopyWith<$Res> {
  __$$_ActionTitleCopyWithImpl(
      _$_ActionTitle _value, $Res Function(_$_ActionTitle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actionId = null,
    Object? deeplink = null,
    Object? name = null,
  }) {
    return _then(_$_ActionTitle(
      actionId: null == actionId
          ? _value.actionId
          : actionId // ignore: cast_nullable_to_non_nullable
              as int,
      deeplink: null == deeplink
          ? _value.deeplink
          : deeplink // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ActionTitle implements _ActionTitle {
  const _$_ActionTitle({this.actionId = 0, this.deeplink = '', this.name = ''});

  factory _$_ActionTitle.fromJson(Map<String, dynamic> json) =>
      _$$_ActionTitleFromJson(json);

  @override
  @JsonKey()
  final int actionId;
  @override
  @JsonKey()
  final String deeplink;
  @override
  @JsonKey()
  final String name;

  @override
  String toString() {
    return 'ActionTitle(actionId: $actionId, deeplink: $deeplink, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ActionTitle &&
            (identical(other.actionId, actionId) ||
                other.actionId == actionId) &&
            (identical(other.deeplink, deeplink) ||
                other.deeplink == deeplink) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, actionId, deeplink, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ActionTitleCopyWith<_$_ActionTitle> get copyWith =>
      __$$_ActionTitleCopyWithImpl<_$_ActionTitle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ActionTitleToJson(
      this,
    );
  }
}

abstract class _ActionTitle implements ActionTitle {
  const factory _ActionTitle(
      {final int actionId,
      final String deeplink,
      final String name}) = _$_ActionTitle;

  factory _ActionTitle.fromJson(Map<String, dynamic> json) =
      _$_ActionTitle.fromJson;

  @override
  int get actionId;
  @override
  String get deeplink;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_ActionTitleCopyWith<_$_ActionTitle> get copyWith =>
      throw _privateConstructorUsedError;
}

ItemMargin _$ItemMarginFromJson(Map<String, dynamic> json) {
  return _ItemMargin.fromJson(json);
}

/// @nodoc
mixin _$ItemMargin {
  double get left => throw _privateConstructorUsedError;
  double get right => throw _privateConstructorUsedError;
  double get bottom => throw _privateConstructorUsedError;
  double get top => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemMarginCopyWith<ItemMargin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemMarginCopyWith<$Res> {
  factory $ItemMarginCopyWith(
          ItemMargin value, $Res Function(ItemMargin) then) =
      _$ItemMarginCopyWithImpl<$Res, ItemMargin>;
  @useResult
  $Res call({double left, double right, double bottom, double top});
}

/// @nodoc
class _$ItemMarginCopyWithImpl<$Res, $Val extends ItemMargin>
    implements $ItemMarginCopyWith<$Res> {
  _$ItemMarginCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? left = null,
    Object? right = null,
    Object? bottom = null,
    Object? top = null,
  }) {
    return _then(_value.copyWith(
      left: null == left
          ? _value.left
          : left // ignore: cast_nullable_to_non_nullable
              as double,
      right: null == right
          ? _value.right
          : right // ignore: cast_nullable_to_non_nullable
              as double,
      bottom: null == bottom
          ? _value.bottom
          : bottom // ignore: cast_nullable_to_non_nullable
              as double,
      top: null == top
          ? _value.top
          : top // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ItemMarginCopyWith<$Res>
    implements $ItemMarginCopyWith<$Res> {
  factory _$$_ItemMarginCopyWith(
          _$_ItemMargin value, $Res Function(_$_ItemMargin) then) =
      __$$_ItemMarginCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double left, double right, double bottom, double top});
}

/// @nodoc
class __$$_ItemMarginCopyWithImpl<$Res>
    extends _$ItemMarginCopyWithImpl<$Res, _$_ItemMargin>
    implements _$$_ItemMarginCopyWith<$Res> {
  __$$_ItemMarginCopyWithImpl(
      _$_ItemMargin _value, $Res Function(_$_ItemMargin) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? left = null,
    Object? right = null,
    Object? bottom = null,
    Object? top = null,
  }) {
    return _then(_$_ItemMargin(
      left: null == left
          ? _value.left
          : left // ignore: cast_nullable_to_non_nullable
              as double,
      right: null == right
          ? _value.right
          : right // ignore: cast_nullable_to_non_nullable
              as double,
      bottom: null == bottom
          ? _value.bottom
          : bottom // ignore: cast_nullable_to_non_nullable
              as double,
      top: null == top
          ? _value.top
          : top // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ItemMargin implements _ItemMargin {
  const _$_ItemMargin(
      {this.left = 0, this.right = 0, this.bottom = 0, this.top = 0});

  factory _$_ItemMargin.fromJson(Map<String, dynamic> json) =>
      _$$_ItemMarginFromJson(json);

  @override
  @JsonKey()
  final double left;
  @override
  @JsonKey()
  final double right;
  @override
  @JsonKey()
  final double bottom;
  @override
  @JsonKey()
  final double top;

  @override
  String toString() {
    return 'ItemMargin(left: $left, right: $right, bottom: $bottom, top: $top)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemMargin &&
            (identical(other.left, left) || other.left == left) &&
            (identical(other.right, right) || other.right == right) &&
            (identical(other.bottom, bottom) || other.bottom == bottom) &&
            (identical(other.top, top) || other.top == top));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, left, right, bottom, top);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemMarginCopyWith<_$_ItemMargin> get copyWith =>
      __$$_ItemMarginCopyWithImpl<_$_ItemMargin>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemMarginToJson(
      this,
    );
  }
}

abstract class _ItemMargin implements ItemMargin {
  const factory _ItemMargin(
      {final double left,
      final double right,
      final double bottom,
      final double top}) = _$_ItemMargin;

  factory _ItemMargin.fromJson(Map<String, dynamic> json) =
      _$_ItemMargin.fromJson;

  @override
  double get left;
  @override
  double get right;
  @override
  double get bottom;
  @override
  double get top;
  @override
  @JsonKey(ignore: true)
  _$$_ItemMarginCopyWith<_$_ItemMargin> get copyWith =>
      throw _privateConstructorUsedError;
}

WidgetItem _$WidgetItemFromJson(Map<String, dynamic> json) {
  return _WidgetItem.fromJson(json);
}

/// @nodoc
mixin _$WidgetItem {
  String get title => throw _privateConstructorUsedError;
  String get uniqueId => throw _privateConstructorUsedError;
  String get btnText => throw _privateConstructorUsedError;
  String get appbtnText => throw _privateConstructorUsedError;
  String get appbtnUrl => throw _privateConstructorUsedError;
  String get imageSrc => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get ctaLink => throw _privateConstructorUsedError;
  String get ctaText => throw _privateConstructorUsedError;
  String get deepLink => throw _privateConstructorUsedError;
  String get subTitle => throw _privateConstructorUsedError;
  String get materialGroup => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get subCategory => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get storeType => throw _privateConstructorUsedError;
  bool get restricted => throw _privateConstructorUsedError;
  String get imgSrc => throw _privateConstructorUsedError;
  String get alt => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get src => throw _privateConstructorUsedError;
  String get btn => throw _privateConstructorUsedError;
  String get btnUrl => throw _privateConstructorUsedError;
  String get carousalItems => throw _privateConstructorUsedError;
  List<Item> get items => throw _privateConstructorUsedError;
  List<String> get appDesc => throw _privateConstructorUsedError;
  String get btnTitle => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  List<Option> get options => throw _privateConstructorUsedError;
  String get urlMp4 => throw _privateConstructorUsedError;
  String get urlOgg => throw _privateConstructorUsedError;
  String get mobileImage => throw _privateConstructorUsedError;
  String get posterImage => throw _privateConstructorUsedError;
  ContactDetail? get contactDetail => throw _privateConstructorUsedError;
  PranaamPackage get pranaamPackage => throw _privateConstructorUsedError;
  List<TabContentItem> get tabContent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WidgetItemCopyWith<WidgetItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WidgetItemCopyWith<$Res> {
  factory $WidgetItemCopyWith(
          WidgetItem value, $Res Function(WidgetItem) then) =
      _$WidgetItemCopyWithImpl<$Res, WidgetItem>;
  @useResult
  $Res call(
      {String title,
      String uniqueId,
      String btnText,
      String appbtnText,
      String appbtnUrl,
      String imageSrc,
      String description,
      String ctaLink,
      String ctaText,
      String deepLink,
      String subTitle,
      String materialGroup,
      String category,
      String subCategory,
      String brand,
      String storeType,
      bool restricted,
      String imgSrc,
      String alt,
      String value,
      String text,
      String src,
      String btn,
      String btnUrl,
      String carousalItems,
      List<Item> items,
      List<String> appDesc,
      String btnTitle,
      String price,
      List<Option> options,
      String urlMp4,
      String urlOgg,
      String mobileImage,
      String posterImage,
      ContactDetail? contactDetail,
      PranaamPackage pranaamPackage,
      List<TabContentItem> tabContent});

  $ContactDetailCopyWith<$Res>? get contactDetail;
  $PranaamPackageCopyWith<$Res> get pranaamPackage;
}

/// @nodoc
class _$WidgetItemCopyWithImpl<$Res, $Val extends WidgetItem>
    implements $WidgetItemCopyWith<$Res> {
  _$WidgetItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? uniqueId = null,
    Object? btnText = null,
    Object? appbtnText = null,
    Object? appbtnUrl = null,
    Object? imageSrc = null,
    Object? description = null,
    Object? ctaLink = null,
    Object? ctaText = null,
    Object? deepLink = null,
    Object? subTitle = null,
    Object? materialGroup = null,
    Object? category = null,
    Object? subCategory = null,
    Object? brand = null,
    Object? storeType = null,
    Object? restricted = null,
    Object? imgSrc = null,
    Object? alt = null,
    Object? value = null,
    Object? text = null,
    Object? src = null,
    Object? btn = null,
    Object? btnUrl = null,
    Object? carousalItems = null,
    Object? items = null,
    Object? appDesc = null,
    Object? btnTitle = null,
    Object? price = null,
    Object? options = null,
    Object? urlMp4 = null,
    Object? urlOgg = null,
    Object? mobileImage = null,
    Object? posterImage = null,
    Object? contactDetail = freezed,
    Object? pranaamPackage = null,
    Object? tabContent = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      uniqueId: null == uniqueId
          ? _value.uniqueId
          : uniqueId // ignore: cast_nullable_to_non_nullable
              as String,
      btnText: null == btnText
          ? _value.btnText
          : btnText // ignore: cast_nullable_to_non_nullable
              as String,
      appbtnText: null == appbtnText
          ? _value.appbtnText
          : appbtnText // ignore: cast_nullable_to_non_nullable
              as String,
      appbtnUrl: null == appbtnUrl
          ? _value.appbtnUrl
          : appbtnUrl // ignore: cast_nullable_to_non_nullable
              as String,
      imageSrc: null == imageSrc
          ? _value.imageSrc
          : imageSrc // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ctaLink: null == ctaLink
          ? _value.ctaLink
          : ctaLink // ignore: cast_nullable_to_non_nullable
              as String,
      ctaText: null == ctaText
          ? _value.ctaText
          : ctaText // ignore: cast_nullable_to_non_nullable
              as String,
      deepLink: null == deepLink
          ? _value.deepLink
          : deepLink // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroup: null == materialGroup
          ? _value.materialGroup
          : materialGroup // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      subCategory: null == subCategory
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      storeType: null == storeType
          ? _value.storeType
          : storeType // ignore: cast_nullable_to_non_nullable
              as String,
      restricted: null == restricted
          ? _value.restricted
          : restricted // ignore: cast_nullable_to_non_nullable
              as bool,
      imgSrc: null == imgSrc
          ? _value.imgSrc
          : imgSrc // ignore: cast_nullable_to_non_nullable
              as String,
      alt: null == alt
          ? _value.alt
          : alt // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      src: null == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as String,
      btn: null == btn
          ? _value.btn
          : btn // ignore: cast_nullable_to_non_nullable
              as String,
      btnUrl: null == btnUrl
          ? _value.btnUrl
          : btnUrl // ignore: cast_nullable_to_non_nullable
              as String,
      carousalItems: null == carousalItems
          ? _value.carousalItems
          : carousalItems // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      appDesc: null == appDesc
          ? _value.appDesc
          : appDesc // ignore: cast_nullable_to_non_nullable
              as List<String>,
      btnTitle: null == btnTitle
          ? _value.btnTitle
          : btnTitle // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<Option>,
      urlMp4: null == urlMp4
          ? _value.urlMp4
          : urlMp4 // ignore: cast_nullable_to_non_nullable
              as String,
      urlOgg: null == urlOgg
          ? _value.urlOgg
          : urlOgg // ignore: cast_nullable_to_non_nullable
              as String,
      mobileImage: null == mobileImage
          ? _value.mobileImage
          : mobileImage // ignore: cast_nullable_to_non_nullable
              as String,
      posterImage: null == posterImage
          ? _value.posterImage
          : posterImage // ignore: cast_nullable_to_non_nullable
              as String,
      contactDetail: freezed == contactDetail
          ? _value.contactDetail
          : contactDetail // ignore: cast_nullable_to_non_nullable
              as ContactDetail?,
      pranaamPackage: null == pranaamPackage
          ? _value.pranaamPackage
          : pranaamPackage // ignore: cast_nullable_to_non_nullable
              as PranaamPackage,
      tabContent: null == tabContent
          ? _value.tabContent
          : tabContent // ignore: cast_nullable_to_non_nullable
              as List<TabContentItem>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContactDetailCopyWith<$Res>? get contactDetail {
    if (_value.contactDetail == null) {
      return null;
    }

    return $ContactDetailCopyWith<$Res>(_value.contactDetail!, (value) {
      return _then(_value.copyWith(contactDetail: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PranaamPackageCopyWith<$Res> get pranaamPackage {
    return $PranaamPackageCopyWith<$Res>(_value.pranaamPackage, (value) {
      return _then(_value.copyWith(pranaamPackage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WidgetItemCopyWith<$Res>
    implements $WidgetItemCopyWith<$Res> {
  factory _$$_WidgetItemCopyWith(
          _$_WidgetItem value, $Res Function(_$_WidgetItem) then) =
      __$$_WidgetItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String uniqueId,
      String btnText,
      String appbtnText,
      String appbtnUrl,
      String imageSrc,
      String description,
      String ctaLink,
      String ctaText,
      String deepLink,
      String subTitle,
      String materialGroup,
      String category,
      String subCategory,
      String brand,
      String storeType,
      bool restricted,
      String imgSrc,
      String alt,
      String value,
      String text,
      String src,
      String btn,
      String btnUrl,
      String carousalItems,
      List<Item> items,
      List<String> appDesc,
      String btnTitle,
      String price,
      List<Option> options,
      String urlMp4,
      String urlOgg,
      String mobileImage,
      String posterImage,
      ContactDetail? contactDetail,
      PranaamPackage pranaamPackage,
      List<TabContentItem> tabContent});

  @override
  $ContactDetailCopyWith<$Res>? get contactDetail;
  @override
  $PranaamPackageCopyWith<$Res> get pranaamPackage;
}

/// @nodoc
class __$$_WidgetItemCopyWithImpl<$Res>
    extends _$WidgetItemCopyWithImpl<$Res, _$_WidgetItem>
    implements _$$_WidgetItemCopyWith<$Res> {
  __$$_WidgetItemCopyWithImpl(
      _$_WidgetItem _value, $Res Function(_$_WidgetItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? uniqueId = null,
    Object? btnText = null,
    Object? appbtnText = null,
    Object? appbtnUrl = null,
    Object? imageSrc = null,
    Object? description = null,
    Object? ctaLink = null,
    Object? ctaText = null,
    Object? deepLink = null,
    Object? subTitle = null,
    Object? materialGroup = null,
    Object? category = null,
    Object? subCategory = null,
    Object? brand = null,
    Object? storeType = null,
    Object? restricted = null,
    Object? imgSrc = null,
    Object? alt = null,
    Object? value = null,
    Object? text = null,
    Object? src = null,
    Object? btn = null,
    Object? btnUrl = null,
    Object? carousalItems = null,
    Object? items = null,
    Object? appDesc = null,
    Object? btnTitle = null,
    Object? price = null,
    Object? options = null,
    Object? urlMp4 = null,
    Object? urlOgg = null,
    Object? mobileImage = null,
    Object? posterImage = null,
    Object? contactDetail = freezed,
    Object? pranaamPackage = null,
    Object? tabContent = null,
  }) {
    return _then(_$_WidgetItem(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      uniqueId: null == uniqueId
          ? _value.uniqueId
          : uniqueId // ignore: cast_nullable_to_non_nullable
              as String,
      btnText: null == btnText
          ? _value.btnText
          : btnText // ignore: cast_nullable_to_non_nullable
              as String,
      appbtnText: null == appbtnText
          ? _value.appbtnText
          : appbtnText // ignore: cast_nullable_to_non_nullable
              as String,
      appbtnUrl: null == appbtnUrl
          ? _value.appbtnUrl
          : appbtnUrl // ignore: cast_nullable_to_non_nullable
              as String,
      imageSrc: null == imageSrc
          ? _value.imageSrc
          : imageSrc // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ctaLink: null == ctaLink
          ? _value.ctaLink
          : ctaLink // ignore: cast_nullable_to_non_nullable
              as String,
      ctaText: null == ctaText
          ? _value.ctaText
          : ctaText // ignore: cast_nullable_to_non_nullable
              as String,
      deepLink: null == deepLink
          ? _value.deepLink
          : deepLink // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroup: null == materialGroup
          ? _value.materialGroup
          : materialGroup // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      subCategory: null == subCategory
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      storeType: null == storeType
          ? _value.storeType
          : storeType // ignore: cast_nullable_to_non_nullable
              as String,
      restricted: null == restricted
          ? _value.restricted
          : restricted // ignore: cast_nullable_to_non_nullable
              as bool,
      imgSrc: null == imgSrc
          ? _value.imgSrc
          : imgSrc // ignore: cast_nullable_to_non_nullable
              as String,
      alt: null == alt
          ? _value.alt
          : alt // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      src: null == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as String,
      btn: null == btn
          ? _value.btn
          : btn // ignore: cast_nullable_to_non_nullable
              as String,
      btnUrl: null == btnUrl
          ? _value.btnUrl
          : btnUrl // ignore: cast_nullable_to_non_nullable
              as String,
      carousalItems: null == carousalItems
          ? _value.carousalItems
          : carousalItems // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      appDesc: null == appDesc
          ? _value.appDesc
          : appDesc // ignore: cast_nullable_to_non_nullable
              as List<String>,
      btnTitle: null == btnTitle
          ? _value.btnTitle
          : btnTitle // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<Option>,
      urlMp4: null == urlMp4
          ? _value.urlMp4
          : urlMp4 // ignore: cast_nullable_to_non_nullable
              as String,
      urlOgg: null == urlOgg
          ? _value.urlOgg
          : urlOgg // ignore: cast_nullable_to_non_nullable
              as String,
      mobileImage: null == mobileImage
          ? _value.mobileImage
          : mobileImage // ignore: cast_nullable_to_non_nullable
              as String,
      posterImage: null == posterImage
          ? _value.posterImage
          : posterImage // ignore: cast_nullable_to_non_nullable
              as String,
      contactDetail: freezed == contactDetail
          ? _value.contactDetail
          : contactDetail // ignore: cast_nullable_to_non_nullable
              as ContactDetail?,
      pranaamPackage: null == pranaamPackage
          ? _value.pranaamPackage
          : pranaamPackage // ignore: cast_nullable_to_non_nullable
              as PranaamPackage,
      tabContent: null == tabContent
          ? _value.tabContent
          : tabContent // ignore: cast_nullable_to_non_nullable
              as List<TabContentItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WidgetItem implements _WidgetItem {
  const _$_WidgetItem(
      {this.title = '',
      this.uniqueId = '',
      this.btnText = '',
      this.appbtnText = '',
      this.appbtnUrl = '',
      this.imageSrc = '',
      this.description = '',
      this.ctaLink = '',
      this.ctaText = '',
      this.deepLink = '',
      this.subTitle = '',
      this.materialGroup = '',
      this.category = '',
      this.subCategory = '',
      this.brand = '',
      this.storeType = '',
      this.restricted = false,
      this.imgSrc = '',
      this.alt = '',
      this.value = '',
      this.text = '',
      this.src = '',
      this.btn = '',
      this.btnUrl = '',
      this.carousalItems = '',
      this.items = const [],
      this.appDesc = const [],
      this.btnTitle = '',
      this.price = '',
      this.options = const [],
      this.urlMp4 = '',
      this.urlOgg = '',
      this.mobileImage = '',
      this.posterImage = '',
      this.contactDetail,
      this.pranaamPackage = const PranaamPackage(),
      this.tabContent = const []});

  factory _$_WidgetItem.fromJson(Map<String, dynamic> json) =>
      _$$_WidgetItemFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String uniqueId;
  @override
  @JsonKey()
  final String btnText;
  @override
  @JsonKey()
  final String appbtnText;
  @override
  @JsonKey()
  final String appbtnUrl;
  @override
  @JsonKey()
  final String imageSrc;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String ctaLink;
  @override
  @JsonKey()
  final String ctaText;
  @override
  @JsonKey()
  final String deepLink;
  @override
  @JsonKey()
  final String subTitle;
  @override
  @JsonKey()
  final String materialGroup;
  @override
  @JsonKey()
  final String category;
  @override
  @JsonKey()
  final String subCategory;
  @override
  @JsonKey()
  final String brand;
  @override
  @JsonKey()
  final String storeType;
  @override
  @JsonKey()
  final bool restricted;
  @override
  @JsonKey()
  final String imgSrc;
  @override
  @JsonKey()
  final String alt;
  @override
  @JsonKey()
  final String value;
  @override
  @JsonKey()
  final String text;
  @override
  @JsonKey()
  final String src;
  @override
  @JsonKey()
  final String btn;
  @override
  @JsonKey()
  final String btnUrl;
  @override
  @JsonKey()
  final String carousalItems;
  @override
  @JsonKey()
  final List<Item> items;
  @override
  @JsonKey()
  final List<String> appDesc;
  @override
  @JsonKey()
  final String btnTitle;
  @override
  @JsonKey()
  final String price;
  @override
  @JsonKey()
  final List<Option> options;
  @override
  @JsonKey()
  final String urlMp4;
  @override
  @JsonKey()
  final String urlOgg;
  @override
  @JsonKey()
  final String mobileImage;
  @override
  @JsonKey()
  final String posterImage;
  @override
  final ContactDetail? contactDetail;
  @override
  @JsonKey()
  final PranaamPackage pranaamPackage;
  @override
  @JsonKey()
  final List<TabContentItem> tabContent;

  @override
  String toString() {
    return 'WidgetItem(title: $title, uniqueId: $uniqueId, btnText: $btnText, appbtnText: $appbtnText, appbtnUrl: $appbtnUrl, imageSrc: $imageSrc, description: $description, ctaLink: $ctaLink, ctaText: $ctaText, deepLink: $deepLink, subTitle: $subTitle, materialGroup: $materialGroup, category: $category, subCategory: $subCategory, brand: $brand, storeType: $storeType, restricted: $restricted, imgSrc: $imgSrc, alt: $alt, value: $value, text: $text, src: $src, btn: $btn, btnUrl: $btnUrl, carousalItems: $carousalItems, items: $items, appDesc: $appDesc, btnTitle: $btnTitle, price: $price, options: $options, urlMp4: $urlMp4, urlOgg: $urlOgg, mobileImage: $mobileImage, posterImage: $posterImage, contactDetail: $contactDetail, pranaamPackage: $pranaamPackage, tabContent: $tabContent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WidgetItem &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.uniqueId, uniqueId) ||
                other.uniqueId == uniqueId) &&
            (identical(other.btnText, btnText) || other.btnText == btnText) &&
            (identical(other.appbtnText, appbtnText) ||
                other.appbtnText == appbtnText) &&
            (identical(other.appbtnUrl, appbtnUrl) ||
                other.appbtnUrl == appbtnUrl) &&
            (identical(other.imageSrc, imageSrc) ||
                other.imageSrc == imageSrc) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.ctaLink, ctaLink) || other.ctaLink == ctaLink) &&
            (identical(other.ctaText, ctaText) || other.ctaText == ctaText) &&
            (identical(other.deepLink, deepLink) ||
                other.deepLink == deepLink) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.materialGroup, materialGroup) ||
                other.materialGroup == materialGroup) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.subCategory, subCategory) ||
                other.subCategory == subCategory) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.storeType, storeType) ||
                other.storeType == storeType) &&
            (identical(other.restricted, restricted) ||
                other.restricted == restricted) &&
            (identical(other.imgSrc, imgSrc) || other.imgSrc == imgSrc) &&
            (identical(other.alt, alt) || other.alt == alt) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.src, src) || other.src == src) &&
            (identical(other.btn, btn) || other.btn == btn) &&
            (identical(other.btnUrl, btnUrl) || other.btnUrl == btnUrl) &&
            (identical(other.carousalItems, carousalItems) ||
                other.carousalItems == carousalItems) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality().equals(other.appDesc, appDesc) &&
            (identical(other.btnTitle, btnTitle) ||
                other.btnTitle == btnTitle) &&
            (identical(other.price, price) || other.price == price) &&
            const DeepCollectionEquality().equals(other.options, options) &&
            (identical(other.urlMp4, urlMp4) || other.urlMp4 == urlMp4) &&
            (identical(other.urlOgg, urlOgg) || other.urlOgg == urlOgg) &&
            (identical(other.mobileImage, mobileImage) ||
                other.mobileImage == mobileImage) &&
            (identical(other.posterImage, posterImage) ||
                other.posterImage == posterImage) &&
            (identical(other.contactDetail, contactDetail) ||
                other.contactDetail == contactDetail) &&
            (identical(other.pranaamPackage, pranaamPackage) ||
                other.pranaamPackage == pranaamPackage) &&
            const DeepCollectionEquality()
                .equals(other.tabContent, tabContent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        title,
        uniqueId,
        btnText,
        appbtnText,
        appbtnUrl,
        imageSrc,
        description,
        ctaLink,
        ctaText,
        deepLink,
        subTitle,
        materialGroup,
        category,
        subCategory,
        brand,
        storeType,
        restricted,
        imgSrc,
        alt,
        value,
        text,
        src,
        btn,
        btnUrl,
        carousalItems,
        const DeepCollectionEquality().hash(items),
        const DeepCollectionEquality().hash(appDesc),
        btnTitle,
        price,
        const DeepCollectionEquality().hash(options),
        urlMp4,
        urlOgg,
        mobileImage,
        posterImage,
        contactDetail,
        pranaamPackage,
        const DeepCollectionEquality().hash(tabContent)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WidgetItemCopyWith<_$_WidgetItem> get copyWith =>
      __$$_WidgetItemCopyWithImpl<_$_WidgetItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WidgetItemToJson(
      this,
    );
  }
}

abstract class _WidgetItem implements WidgetItem {
  const factory _WidgetItem(
      {final String title,
      final String uniqueId,
      final String btnText,
      final String appbtnText,
      final String appbtnUrl,
      final String imageSrc,
      final String description,
      final String ctaLink,
      final String ctaText,
      final String deepLink,
      final String subTitle,
      final String materialGroup,
      final String category,
      final String subCategory,
      final String brand,
      final String storeType,
      final bool restricted,
      final String imgSrc,
      final String alt,
      final String value,
      final String text,
      final String src,
      final String btn,
      final String btnUrl,
      final String carousalItems,
      final List<Item> items,
      final List<String> appDesc,
      final String btnTitle,
      final String price,
      final List<Option> options,
      final String urlMp4,
      final String urlOgg,
      final String mobileImage,
      final String posterImage,
      final ContactDetail? contactDetail,
      final PranaamPackage pranaamPackage,
      final List<TabContentItem> tabContent}) = _$_WidgetItem;

  factory _WidgetItem.fromJson(Map<String, dynamic> json) =
      _$_WidgetItem.fromJson;

  @override
  String get title;
  @override
  String get uniqueId;
  @override
  String get btnText;
  @override
  String get appbtnText;
  @override
  String get appbtnUrl;
  @override
  String get imageSrc;
  @override
  String get description;
  @override
  String get ctaLink;
  @override
  String get ctaText;
  @override
  String get deepLink;
  @override
  String get subTitle;
  @override
  String get materialGroup;
  @override
  String get category;
  @override
  String get subCategory;
  @override
  String get brand;
  @override
  String get storeType;
  @override
  bool get restricted;
  @override
  String get imgSrc;
  @override
  String get alt;
  @override
  String get value;
  @override
  String get text;
  @override
  String get src;
  @override
  String get btn;
  @override
  String get btnUrl;
  @override
  String get carousalItems;
  @override
  List<Item> get items;
  @override
  List<String> get appDesc;
  @override
  String get btnTitle;
  @override
  String get price;
  @override
  List<Option> get options;
  @override
  String get urlMp4;
  @override
  String get urlOgg;
  @override
  String get mobileImage;
  @override
  String get posterImage;
  @override
  ContactDetail? get contactDetail;
  @override
  PranaamPackage get pranaamPackage;
  @override
  List<TabContentItem> get tabContent;
  @override
  @JsonKey(ignore: true)
  _$$_WidgetItemCopyWith<_$_WidgetItem> get copyWith =>
      throw _privateConstructorUsedError;
}

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  String get id => throw _privateConstructorUsedError;
  String get src => throw _privateConstructorUsedError;
  String get alt => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get initialPrice => throw _privateConstructorUsedError;
  String get finalPrice => throw _privateConstructorUsedError;
  String get btnText => throw _privateConstructorUsedError;
  String get btnUrl => throw _privateConstructorUsedError;
  String get btnVariant => throw _privateConstructorUsedError;
  String get desktopImage => throw _privateConstructorUsedError;
  String get desktopImageAlt => throw _privateConstructorUsedError;
  String get mobileImage => throw _privateConstructorUsedError;
  String get mobileImageAlt => throw _privateConstructorUsedError;
  String get thumbnailImage => throw _privateConstructorUsedError;
  String get thumbnailImageAlt => throw _privateConstructorUsedError;
  String get imageSrc => throw _privateConstructorUsedError;
  String get ctaLink => throw _privateConstructorUsedError;
  String get deepLink => throw _privateConstructorUsedError;
  String get subTitle => throw _privateConstructorUsedError;
  String get materialGroup => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get subCategory => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get storeType => throw _privateConstructorUsedError;
  String get appCtaLink => throw _privateConstructorUsedError;
  String get cardDesc => throw _privateConstructorUsedError;
  bool get restricted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res, Item>;
  @useResult
  $Res call(
      {String id,
      String src,
      String alt,
      String title,
      String description,
      String initialPrice,
      String finalPrice,
      String btnText,
      String btnUrl,
      String btnVariant,
      String desktopImage,
      String desktopImageAlt,
      String mobileImage,
      String mobileImageAlt,
      String thumbnailImage,
      String thumbnailImageAlt,
      String imageSrc,
      String ctaLink,
      String deepLink,
      String subTitle,
      String materialGroup,
      String category,
      String subCategory,
      String brand,
      String storeType,
      String appCtaLink,
      String cardDesc,
      bool restricted});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res, $Val extends Item>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? src = null,
    Object? alt = null,
    Object? title = null,
    Object? description = null,
    Object? initialPrice = null,
    Object? finalPrice = null,
    Object? btnText = null,
    Object? btnUrl = null,
    Object? btnVariant = null,
    Object? desktopImage = null,
    Object? desktopImageAlt = null,
    Object? mobileImage = null,
    Object? mobileImageAlt = null,
    Object? thumbnailImage = null,
    Object? thumbnailImageAlt = null,
    Object? imageSrc = null,
    Object? ctaLink = null,
    Object? deepLink = null,
    Object? subTitle = null,
    Object? materialGroup = null,
    Object? category = null,
    Object? subCategory = null,
    Object? brand = null,
    Object? storeType = null,
    Object? appCtaLink = null,
    Object? cardDesc = null,
    Object? restricted = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      src: null == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as String,
      alt: null == alt
          ? _value.alt
          : alt // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      initialPrice: null == initialPrice
          ? _value.initialPrice
          : initialPrice // ignore: cast_nullable_to_non_nullable
              as String,
      finalPrice: null == finalPrice
          ? _value.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
              as String,
      btnText: null == btnText
          ? _value.btnText
          : btnText // ignore: cast_nullable_to_non_nullable
              as String,
      btnUrl: null == btnUrl
          ? _value.btnUrl
          : btnUrl // ignore: cast_nullable_to_non_nullable
              as String,
      btnVariant: null == btnVariant
          ? _value.btnVariant
          : btnVariant // ignore: cast_nullable_to_non_nullable
              as String,
      desktopImage: null == desktopImage
          ? _value.desktopImage
          : desktopImage // ignore: cast_nullable_to_non_nullable
              as String,
      desktopImageAlt: null == desktopImageAlt
          ? _value.desktopImageAlt
          : desktopImageAlt // ignore: cast_nullable_to_non_nullable
              as String,
      mobileImage: null == mobileImage
          ? _value.mobileImage
          : mobileImage // ignore: cast_nullable_to_non_nullable
              as String,
      mobileImageAlt: null == mobileImageAlt
          ? _value.mobileImageAlt
          : mobileImageAlt // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailImage: null == thumbnailImage
          ? _value.thumbnailImage
          : thumbnailImage // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailImageAlt: null == thumbnailImageAlt
          ? _value.thumbnailImageAlt
          : thumbnailImageAlt // ignore: cast_nullable_to_non_nullable
              as String,
      imageSrc: null == imageSrc
          ? _value.imageSrc
          : imageSrc // ignore: cast_nullable_to_non_nullable
              as String,
      ctaLink: null == ctaLink
          ? _value.ctaLink
          : ctaLink // ignore: cast_nullable_to_non_nullable
              as String,
      deepLink: null == deepLink
          ? _value.deepLink
          : deepLink // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroup: null == materialGroup
          ? _value.materialGroup
          : materialGroup // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      subCategory: null == subCategory
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      storeType: null == storeType
          ? _value.storeType
          : storeType // ignore: cast_nullable_to_non_nullable
              as String,
      appCtaLink: null == appCtaLink
          ? _value.appCtaLink
          : appCtaLink // ignore: cast_nullable_to_non_nullable
              as String,
      cardDesc: null == cardDesc
          ? _value.cardDesc
          : cardDesc // ignore: cast_nullable_to_non_nullable
              as String,
      restricted: null == restricted
          ? _value.restricted
          : restricted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$_ItemCopyWith(_$_Item value, $Res Function(_$_Item) then) =
      __$$_ItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String src,
      String alt,
      String title,
      String description,
      String initialPrice,
      String finalPrice,
      String btnText,
      String btnUrl,
      String btnVariant,
      String desktopImage,
      String desktopImageAlt,
      String mobileImage,
      String mobileImageAlt,
      String thumbnailImage,
      String thumbnailImageAlt,
      String imageSrc,
      String ctaLink,
      String deepLink,
      String subTitle,
      String materialGroup,
      String category,
      String subCategory,
      String brand,
      String storeType,
      String appCtaLink,
      String cardDesc,
      bool restricted});
}

/// @nodoc
class __$$_ItemCopyWithImpl<$Res> extends _$ItemCopyWithImpl<$Res, _$_Item>
    implements _$$_ItemCopyWith<$Res> {
  __$$_ItemCopyWithImpl(_$_Item _value, $Res Function(_$_Item) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? src = null,
    Object? alt = null,
    Object? title = null,
    Object? description = null,
    Object? initialPrice = null,
    Object? finalPrice = null,
    Object? btnText = null,
    Object? btnUrl = null,
    Object? btnVariant = null,
    Object? desktopImage = null,
    Object? desktopImageAlt = null,
    Object? mobileImage = null,
    Object? mobileImageAlt = null,
    Object? thumbnailImage = null,
    Object? thumbnailImageAlt = null,
    Object? imageSrc = null,
    Object? ctaLink = null,
    Object? deepLink = null,
    Object? subTitle = null,
    Object? materialGroup = null,
    Object? category = null,
    Object? subCategory = null,
    Object? brand = null,
    Object? storeType = null,
    Object? appCtaLink = null,
    Object? cardDesc = null,
    Object? restricted = null,
  }) {
    return _then(_$_Item(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      src: null == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as String,
      alt: null == alt
          ? _value.alt
          : alt // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      initialPrice: null == initialPrice
          ? _value.initialPrice
          : initialPrice // ignore: cast_nullable_to_non_nullable
              as String,
      finalPrice: null == finalPrice
          ? _value.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
              as String,
      btnText: null == btnText
          ? _value.btnText
          : btnText // ignore: cast_nullable_to_non_nullable
              as String,
      btnUrl: null == btnUrl
          ? _value.btnUrl
          : btnUrl // ignore: cast_nullable_to_non_nullable
              as String,
      btnVariant: null == btnVariant
          ? _value.btnVariant
          : btnVariant // ignore: cast_nullable_to_non_nullable
              as String,
      desktopImage: null == desktopImage
          ? _value.desktopImage
          : desktopImage // ignore: cast_nullable_to_non_nullable
              as String,
      desktopImageAlt: null == desktopImageAlt
          ? _value.desktopImageAlt
          : desktopImageAlt // ignore: cast_nullable_to_non_nullable
              as String,
      mobileImage: null == mobileImage
          ? _value.mobileImage
          : mobileImage // ignore: cast_nullable_to_non_nullable
              as String,
      mobileImageAlt: null == mobileImageAlt
          ? _value.mobileImageAlt
          : mobileImageAlt // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailImage: null == thumbnailImage
          ? _value.thumbnailImage
          : thumbnailImage // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailImageAlt: null == thumbnailImageAlt
          ? _value.thumbnailImageAlt
          : thumbnailImageAlt // ignore: cast_nullable_to_non_nullable
              as String,
      imageSrc: null == imageSrc
          ? _value.imageSrc
          : imageSrc // ignore: cast_nullable_to_non_nullable
              as String,
      ctaLink: null == ctaLink
          ? _value.ctaLink
          : ctaLink // ignore: cast_nullable_to_non_nullable
              as String,
      deepLink: null == deepLink
          ? _value.deepLink
          : deepLink // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _value.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroup: null == materialGroup
          ? _value.materialGroup
          : materialGroup // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      subCategory: null == subCategory
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      storeType: null == storeType
          ? _value.storeType
          : storeType // ignore: cast_nullable_to_non_nullable
              as String,
      appCtaLink: null == appCtaLink
          ? _value.appCtaLink
          : appCtaLink // ignore: cast_nullable_to_non_nullable
              as String,
      cardDesc: null == cardDesc
          ? _value.cardDesc
          : cardDesc // ignore: cast_nullable_to_non_nullable
              as String,
      restricted: null == restricted
          ? _value.restricted
          : restricted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Item implements _Item {
  const _$_Item(
      {this.id = '',
      this.src = '',
      this.alt = '',
      this.title = '',
      this.description = '',
      this.initialPrice = '',
      this.finalPrice = '0',
      this.btnText = '',
      this.btnUrl = '',
      this.btnVariant = '',
      this.desktopImage = '',
      this.desktopImageAlt = '',
      this.mobileImage = '',
      this.mobileImageAlt = '',
      this.thumbnailImage = '',
      this.thumbnailImageAlt = '',
      this.imageSrc = '',
      this.ctaLink = '',
      this.deepLink = '',
      this.subTitle = '',
      this.materialGroup = '',
      this.category = '',
      this.subCategory = '',
      this.brand = '',
      this.storeType = '',
      this.appCtaLink = '',
      this.cardDesc = '',
      this.restricted = false});

  factory _$_Item.fromJson(Map<String, dynamic> json) => _$$_ItemFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String src;
  @override
  @JsonKey()
  final String alt;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String initialPrice;
  @override
  @JsonKey()
  final String finalPrice;
  @override
  @JsonKey()
  final String btnText;
  @override
  @JsonKey()
  final String btnUrl;
  @override
  @JsonKey()
  final String btnVariant;
  @override
  @JsonKey()
  final String desktopImage;
  @override
  @JsonKey()
  final String desktopImageAlt;
  @override
  @JsonKey()
  final String mobileImage;
  @override
  @JsonKey()
  final String mobileImageAlt;
  @override
  @JsonKey()
  final String thumbnailImage;
  @override
  @JsonKey()
  final String thumbnailImageAlt;
  @override
  @JsonKey()
  final String imageSrc;
  @override
  @JsonKey()
  final String ctaLink;
  @override
  @JsonKey()
  final String deepLink;
  @override
  @JsonKey()
  final String subTitle;
  @override
  @JsonKey()
  final String materialGroup;
  @override
  @JsonKey()
  final String category;
  @override
  @JsonKey()
  final String subCategory;
  @override
  @JsonKey()
  final String brand;
  @override
  @JsonKey()
  final String storeType;
  @override
  @JsonKey()
  final String appCtaLink;
  @override
  @JsonKey()
  final String cardDesc;
  @override
  @JsonKey()
  final bool restricted;

  @override
  String toString() {
    return 'Item(id: $id, src: $src, alt: $alt, title: $title, description: $description, initialPrice: $initialPrice, finalPrice: $finalPrice, btnText: $btnText, btnUrl: $btnUrl, btnVariant: $btnVariant, desktopImage: $desktopImage, desktopImageAlt: $desktopImageAlt, mobileImage: $mobileImage, mobileImageAlt: $mobileImageAlt, thumbnailImage: $thumbnailImage, thumbnailImageAlt: $thumbnailImageAlt, imageSrc: $imageSrc, ctaLink: $ctaLink, deepLink: $deepLink, subTitle: $subTitle, materialGroup: $materialGroup, category: $category, subCategory: $subCategory, brand: $brand, storeType: $storeType, appCtaLink: $appCtaLink, cardDesc: $cardDesc, restricted: $restricted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Item &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.src, src) || other.src == src) &&
            (identical(other.alt, alt) || other.alt == alt) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.initialPrice, initialPrice) ||
                other.initialPrice == initialPrice) &&
            (identical(other.finalPrice, finalPrice) ||
                other.finalPrice == finalPrice) &&
            (identical(other.btnText, btnText) || other.btnText == btnText) &&
            (identical(other.btnUrl, btnUrl) || other.btnUrl == btnUrl) &&
            (identical(other.btnVariant, btnVariant) ||
                other.btnVariant == btnVariant) &&
            (identical(other.desktopImage, desktopImage) ||
                other.desktopImage == desktopImage) &&
            (identical(other.desktopImageAlt, desktopImageAlt) ||
                other.desktopImageAlt == desktopImageAlt) &&
            (identical(other.mobileImage, mobileImage) ||
                other.mobileImage == mobileImage) &&
            (identical(other.mobileImageAlt, mobileImageAlt) ||
                other.mobileImageAlt == mobileImageAlt) &&
            (identical(other.thumbnailImage, thumbnailImage) ||
                other.thumbnailImage == thumbnailImage) &&
            (identical(other.thumbnailImageAlt, thumbnailImageAlt) ||
                other.thumbnailImageAlt == thumbnailImageAlt) &&
            (identical(other.imageSrc, imageSrc) ||
                other.imageSrc == imageSrc) &&
            (identical(other.ctaLink, ctaLink) || other.ctaLink == ctaLink) &&
            (identical(other.deepLink, deepLink) ||
                other.deepLink == deepLink) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.materialGroup, materialGroup) ||
                other.materialGroup == materialGroup) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.subCategory, subCategory) ||
                other.subCategory == subCategory) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.storeType, storeType) ||
                other.storeType == storeType) &&
            (identical(other.appCtaLink, appCtaLink) ||
                other.appCtaLink == appCtaLink) &&
            (identical(other.cardDesc, cardDesc) ||
                other.cardDesc == cardDesc) &&
            (identical(other.restricted, restricted) ||
                other.restricted == restricted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        src,
        alt,
        title,
        description,
        initialPrice,
        finalPrice,
        btnText,
        btnUrl,
        btnVariant,
        desktopImage,
        desktopImageAlt,
        mobileImage,
        mobileImageAlt,
        thumbnailImage,
        thumbnailImageAlt,
        imageSrc,
        ctaLink,
        deepLink,
        subTitle,
        materialGroup,
        category,
        subCategory,
        brand,
        storeType,
        appCtaLink,
        cardDesc,
        restricted
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemCopyWith<_$_Item> get copyWith =>
      __$$_ItemCopyWithImpl<_$_Item>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemToJson(
      this,
    );
  }
}

abstract class _Item implements Item {
  const factory _Item(
      {final String id,
      final String src,
      final String alt,
      final String title,
      final String description,
      final String initialPrice,
      final String finalPrice,
      final String btnText,
      final String btnUrl,
      final String btnVariant,
      final String desktopImage,
      final String desktopImageAlt,
      final String mobileImage,
      final String mobileImageAlt,
      final String thumbnailImage,
      final String thumbnailImageAlt,
      final String imageSrc,
      final String ctaLink,
      final String deepLink,
      final String subTitle,
      final String materialGroup,
      final String category,
      final String subCategory,
      final String brand,
      final String storeType,
      final String appCtaLink,
      final String cardDesc,
      final bool restricted}) = _$_Item;

  factory _Item.fromJson(Map<String, dynamic> json) = _$_Item.fromJson;

  @override
  String get id;
  @override
  String get src;
  @override
  String get alt;
  @override
  String get title;
  @override
  String get description;
  @override
  String get initialPrice;
  @override
  String get finalPrice;
  @override
  String get btnText;
  @override
  String get btnUrl;
  @override
  String get btnVariant;
  @override
  String get desktopImage;
  @override
  String get desktopImageAlt;
  @override
  String get mobileImage;
  @override
  String get mobileImageAlt;
  @override
  String get thumbnailImage;
  @override
  String get thumbnailImageAlt;
  @override
  String get imageSrc;
  @override
  String get ctaLink;
  @override
  String get deepLink;
  @override
  String get subTitle;
  @override
  String get materialGroup;
  @override
  String get category;
  @override
  String get subCategory;
  @override
  String get brand;
  @override
  String get storeType;
  @override
  String get appCtaLink;
  @override
  String get cardDesc;
  @override
  bool get restricted;
  @override
  @JsonKey(ignore: true)
  _$$_ItemCopyWith<_$_Item> get copyWith => throw _privateConstructorUsedError;
}

Option _$OptionFromJson(Map<String, dynamic> json) {
  return _Option.fromJson(json);
}

/// @nodoc
mixin _$Option {
  String get title => throw _privateConstructorUsedError;
  String get imgSrc => throw _privateConstructorUsedError;
  String get alt => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OptionCopyWith<Option> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OptionCopyWith<$Res> {
  factory $OptionCopyWith(Option value, $Res Function(Option) then) =
      _$OptionCopyWithImpl<$Res, Option>;
  @useResult
  $Res call({String title, String imgSrc, String alt, String description});
}

/// @nodoc
class _$OptionCopyWithImpl<$Res, $Val extends Option>
    implements $OptionCopyWith<$Res> {
  _$OptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? imgSrc = null,
    Object? alt = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imgSrc: null == imgSrc
          ? _value.imgSrc
          : imgSrc // ignore: cast_nullable_to_non_nullable
              as String,
      alt: null == alt
          ? _value.alt
          : alt // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OptionCopyWith<$Res> implements $OptionCopyWith<$Res> {
  factory _$$_OptionCopyWith(_$_Option value, $Res Function(_$_Option) then) =
      __$$_OptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String imgSrc, String alt, String description});
}

/// @nodoc
class __$$_OptionCopyWithImpl<$Res>
    extends _$OptionCopyWithImpl<$Res, _$_Option>
    implements _$$_OptionCopyWith<$Res> {
  __$$_OptionCopyWithImpl(_$_Option _value, $Res Function(_$_Option) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? imgSrc = null,
    Object? alt = null,
    Object? description = null,
  }) {
    return _then(_$_Option(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imgSrc: null == imgSrc
          ? _value.imgSrc
          : imgSrc // ignore: cast_nullable_to_non_nullable
              as String,
      alt: null == alt
          ? _value.alt
          : alt // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Option implements _Option {
  const _$_Option(
      {this.title = '',
      this.imgSrc = '',
      this.alt = '',
      this.description = ''});

  factory _$_Option.fromJson(Map<String, dynamic> json) =>
      _$$_OptionFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String imgSrc;
  @override
  @JsonKey()
  final String alt;
  @override
  @JsonKey()
  final String description;

  @override
  String toString() {
    return 'Option(title: $title, imgSrc: $imgSrc, alt: $alt, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Option &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.imgSrc, imgSrc) || other.imgSrc == imgSrc) &&
            (identical(other.alt, alt) || other.alt == alt) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, imgSrc, alt, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OptionCopyWith<_$_Option> get copyWith =>
      __$$_OptionCopyWithImpl<_$_Option>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OptionToJson(
      this,
    );
  }
}

abstract class _Option implements Option {
  const factory _Option(
      {final String title,
      final String imgSrc,
      final String alt,
      final String description}) = _$_Option;

  factory _Option.fromJson(Map<String, dynamic> json) = _$_Option.fromJson;

  @override
  String get title;
  @override
  String get imgSrc;
  @override
  String get alt;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_OptionCopyWith<_$_Option> get copyWith =>
      throw _privateConstructorUsedError;
}

Params _$ParamsFromJson(Map<String, dynamic> json) {
  return _Params.fromJson(json);
}

/// @nodoc
mixin _$Params {
  String get widget => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParamsCopyWith<Params> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParamsCopyWith<$Res> {
  factory $ParamsCopyWith(Params value, $Res Function(Params) then) =
      _$ParamsCopyWithImpl<$Res, Params>;
  @useResult
  $Res call({String widget});
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
    Object? widget = null,
  }) {
    return _then(_value.copyWith(
      widget: null == widget
          ? _value.widget
          : widget // ignore: cast_nullable_to_non_nullable
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
  $Res call({String widget});
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
    Object? widget = null,
  }) {
    return _then(_$_Params(
      widget: null == widget
          ? _value.widget
          : widget // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Params implements _Params {
  const _$_Params({this.widget = ''});

  factory _$_Params.fromJson(Map<String, dynamic> json) =>
      _$$_ParamsFromJson(json);

  @override
  @JsonKey()
  final String widget;

  @override
  String toString() {
    return 'Params(widget: $widget)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Params &&
            (identical(other.widget, widget) || other.widget == widget));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, widget);

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
  const factory _Params({final String widget}) = _$_Params;

  factory _Params.fromJson(Map<String, dynamic> json) = _$_Params.fromJson;

  @override
  String get widget;
  @override
  @JsonKey(ignore: true)
  _$$_ParamsCopyWith<_$_Params> get copyWith =>
      throw _privateConstructorUsedError;
}

CarouselParam _$CarouselParamFromJson(Map<String, dynamic> json) {
  return _CarouselParam.fromJson(json);
}

/// @nodoc
mixin _$CarouselParam {
  String get enableInfiniteScroll => throw _privateConstructorUsedError;
  String get enlargeCenterPage => throw _privateConstructorUsedError;
  String get autoPlay => throw _privateConstructorUsedError;
  String get viewportFraction => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CarouselParamCopyWith<CarouselParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarouselParamCopyWith<$Res> {
  factory $CarouselParamCopyWith(
          CarouselParam value, $Res Function(CarouselParam) then) =
      _$CarouselParamCopyWithImpl<$Res, CarouselParam>;
  @useResult
  $Res call(
      {String enableInfiniteScroll,
      String enlargeCenterPage,
      String autoPlay,
      String viewportFraction});
}

/// @nodoc
class _$CarouselParamCopyWithImpl<$Res, $Val extends CarouselParam>
    implements $CarouselParamCopyWith<$Res> {
  _$CarouselParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enableInfiniteScroll = null,
    Object? enlargeCenterPage = null,
    Object? autoPlay = null,
    Object? viewportFraction = null,
  }) {
    return _then(_value.copyWith(
      enableInfiniteScroll: null == enableInfiniteScroll
          ? _value.enableInfiniteScroll
          : enableInfiniteScroll // ignore: cast_nullable_to_non_nullable
              as String,
      enlargeCenterPage: null == enlargeCenterPage
          ? _value.enlargeCenterPage
          : enlargeCenterPage // ignore: cast_nullable_to_non_nullable
              as String,
      autoPlay: null == autoPlay
          ? _value.autoPlay
          : autoPlay // ignore: cast_nullable_to_non_nullable
              as String,
      viewportFraction: null == viewportFraction
          ? _value.viewportFraction
          : viewportFraction // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CarouselParamCopyWith<$Res>
    implements $CarouselParamCopyWith<$Res> {
  factory _$$_CarouselParamCopyWith(
          _$_CarouselParam value, $Res Function(_$_CarouselParam) then) =
      __$$_CarouselParamCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String enableInfiniteScroll,
      String enlargeCenterPage,
      String autoPlay,
      String viewportFraction});
}

/// @nodoc
class __$$_CarouselParamCopyWithImpl<$Res>
    extends _$CarouselParamCopyWithImpl<$Res, _$_CarouselParam>
    implements _$$_CarouselParamCopyWith<$Res> {
  __$$_CarouselParamCopyWithImpl(
      _$_CarouselParam _value, $Res Function(_$_CarouselParam) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enableInfiniteScroll = null,
    Object? enlargeCenterPage = null,
    Object? autoPlay = null,
    Object? viewportFraction = null,
  }) {
    return _then(_$_CarouselParam(
      enableInfiniteScroll: null == enableInfiniteScroll
          ? _value.enableInfiniteScroll
          : enableInfiniteScroll // ignore: cast_nullable_to_non_nullable
              as String,
      enlargeCenterPage: null == enlargeCenterPage
          ? _value.enlargeCenterPage
          : enlargeCenterPage // ignore: cast_nullable_to_non_nullable
              as String,
      autoPlay: null == autoPlay
          ? _value.autoPlay
          : autoPlay // ignore: cast_nullable_to_non_nullable
              as String,
      viewportFraction: null == viewportFraction
          ? _value.viewportFraction
          : viewportFraction // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CarouselParam implements _CarouselParam {
  const _$_CarouselParam(
      {this.enableInfiniteScroll = '',
      this.enlargeCenterPage = '',
      this.autoPlay = '',
      this.viewportFraction = ''});

  factory _$_CarouselParam.fromJson(Map<String, dynamic> json) =>
      _$$_CarouselParamFromJson(json);

  @override
  @JsonKey()
  final String enableInfiniteScroll;
  @override
  @JsonKey()
  final String enlargeCenterPage;
  @override
  @JsonKey()
  final String autoPlay;
  @override
  @JsonKey()
  final String viewportFraction;

  @override
  String toString() {
    return 'CarouselParam(enableInfiniteScroll: $enableInfiniteScroll, enlargeCenterPage: $enlargeCenterPage, autoPlay: $autoPlay, viewportFraction: $viewportFraction)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CarouselParam &&
            (identical(other.enableInfiniteScroll, enableInfiniteScroll) ||
                other.enableInfiniteScroll == enableInfiniteScroll) &&
            (identical(other.enlargeCenterPage, enlargeCenterPage) ||
                other.enlargeCenterPage == enlargeCenterPage) &&
            (identical(other.autoPlay, autoPlay) ||
                other.autoPlay == autoPlay) &&
            (identical(other.viewportFraction, viewportFraction) ||
                other.viewportFraction == viewportFraction));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, enableInfiniteScroll,
      enlargeCenterPage, autoPlay, viewportFraction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CarouselParamCopyWith<_$_CarouselParam> get copyWith =>
      __$$_CarouselParamCopyWithImpl<_$_CarouselParam>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CarouselParamToJson(
      this,
    );
  }
}

abstract class _CarouselParam implements CarouselParam {
  const factory _CarouselParam(
      {final String enableInfiniteScroll,
      final String enlargeCenterPage,
      final String autoPlay,
      final String viewportFraction}) = _$_CarouselParam;

  factory _CarouselParam.fromJson(Map<String, dynamic> json) =
      _$_CarouselParam.fromJson;

  @override
  String get enableInfiniteScroll;
  @override
  String get enlargeCenterPage;
  @override
  String get autoPlay;
  @override
  String get viewportFraction;
  @override
  @JsonKey(ignore: true)
  _$$_CarouselParamCopyWith<_$_CarouselParam> get copyWith =>
      throw _privateConstructorUsedError;
}

PranaamPackage _$PranaamPackageFromJson(Map<String, dynamic> json) {
  return _PranaamPackage.fromJson(json);
}

/// @nodoc
mixin _$PranaamPackage {
  String get title => throw _privateConstructorUsedError;
  Cards get cards => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PranaamPackageCopyWith<PranaamPackage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PranaamPackageCopyWith<$Res> {
  factory $PranaamPackageCopyWith(
          PranaamPackage value, $Res Function(PranaamPackage) then) =
      _$PranaamPackageCopyWithImpl<$Res, PranaamPackage>;
  @useResult
  $Res call({String title, Cards cards});

  $CardsCopyWith<$Res> get cards;
}

/// @nodoc
class _$PranaamPackageCopyWithImpl<$Res, $Val extends PranaamPackage>
    implements $PranaamPackageCopyWith<$Res> {
  _$PranaamPackageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? cards = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      cards: null == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as Cards,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CardsCopyWith<$Res> get cards {
    return $CardsCopyWith<$Res>(_value.cards, (value) {
      return _then(_value.copyWith(cards: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PranaamPackageCopyWith<$Res>
    implements $PranaamPackageCopyWith<$Res> {
  factory _$$_PranaamPackageCopyWith(
          _$_PranaamPackage value, $Res Function(_$_PranaamPackage) then) =
      __$$_PranaamPackageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, Cards cards});

  @override
  $CardsCopyWith<$Res> get cards;
}

/// @nodoc
class __$$_PranaamPackageCopyWithImpl<$Res>
    extends _$PranaamPackageCopyWithImpl<$Res, _$_PranaamPackage>
    implements _$$_PranaamPackageCopyWith<$Res> {
  __$$_PranaamPackageCopyWithImpl(
      _$_PranaamPackage _value, $Res Function(_$_PranaamPackage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? cards = null,
  }) {
    return _then(_$_PranaamPackage(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      cards: null == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as Cards,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PranaamPackage implements _PranaamPackage {
  const _$_PranaamPackage({this.title = '', this.cards = const Cards()});

  factory _$_PranaamPackage.fromJson(Map<String, dynamic> json) =>
      _$$_PranaamPackageFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final Cards cards;

  @override
  String toString() {
    return 'PranaamPackage(title: $title, cards: $cards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PranaamPackage &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.cards, cards) || other.cards == cards));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, cards);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PranaamPackageCopyWith<_$_PranaamPackage> get copyWith =>
      __$$_PranaamPackageCopyWithImpl<_$_PranaamPackage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PranaamPackageToJson(
      this,
    );
  }
}

abstract class _PranaamPackage implements PranaamPackage {
  const factory _PranaamPackage({final String title, final Cards cards}) =
      _$_PranaamPackage;

  factory _PranaamPackage.fromJson(Map<String, dynamic> json) =
      _$_PranaamPackage.fromJson;

  @override
  String get title;
  @override
  Cards get cards;
  @override
  @JsonKey(ignore: true)
  _$$_PranaamPackageCopyWith<_$_PranaamPackage> get copyWith =>
      throw _privateConstructorUsedError;
}

TabContent _$TabContentFromJson(Map<String, dynamic> json) {
  return _TabContent.fromJson(json);
}

/// @nodoc
mixin _$TabContent {
  List<TabContentItem> get tabContentItems =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TabContentCopyWith<TabContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabContentCopyWith<$Res> {
  factory $TabContentCopyWith(
          TabContent value, $Res Function(TabContent) then) =
      _$TabContentCopyWithImpl<$Res, TabContent>;
  @useResult
  $Res call({List<TabContentItem> tabContentItems});
}

/// @nodoc
class _$TabContentCopyWithImpl<$Res, $Val extends TabContent>
    implements $TabContentCopyWith<$Res> {
  _$TabContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabContentItems = null,
  }) {
    return _then(_value.copyWith(
      tabContentItems: null == tabContentItems
          ? _value.tabContentItems
          : tabContentItems // ignore: cast_nullable_to_non_nullable
              as List<TabContentItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TabContentCopyWith<$Res>
    implements $TabContentCopyWith<$Res> {
  factory _$$_TabContentCopyWith(
          _$_TabContent value, $Res Function(_$_TabContent) then) =
      __$$_TabContentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TabContentItem> tabContentItems});
}

/// @nodoc
class __$$_TabContentCopyWithImpl<$Res>
    extends _$TabContentCopyWithImpl<$Res, _$_TabContent>
    implements _$$_TabContentCopyWith<$Res> {
  __$$_TabContentCopyWithImpl(
      _$_TabContent _value, $Res Function(_$_TabContent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabContentItems = null,
  }) {
    return _then(_$_TabContent(
      tabContentItems: null == tabContentItems
          ? _value.tabContentItems
          : tabContentItems // ignore: cast_nullable_to_non_nullable
              as List<TabContentItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TabContent implements _TabContent {
  const _$_TabContent({this.tabContentItems = const []});

  factory _$_TabContent.fromJson(Map<String, dynamic> json) =>
      _$$_TabContentFromJson(json);

  @override
  @JsonKey()
  final List<TabContentItem> tabContentItems;

  @override
  String toString() {
    return 'TabContent(tabContentItems: $tabContentItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TabContent &&
            const DeepCollectionEquality()
                .equals(other.tabContentItems, tabContentItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(tabContentItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TabContentCopyWith<_$_TabContent> get copyWith =>
      __$$_TabContentCopyWithImpl<_$_TabContent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TabContentToJson(
      this,
    );
  }
}

abstract class _TabContent implements TabContent {
  const factory _TabContent({final List<TabContentItem> tabContentItems}) =
      _$_TabContent;

  factory _TabContent.fromJson(Map<String, dynamic> json) =
      _$_TabContent.fromJson;

  @override
  List<TabContentItem> get tabContentItems;
  @override
  @JsonKey(ignore: true)
  _$$_TabContentCopyWith<_$_TabContent> get copyWith =>
      throw _privateConstructorUsedError;
}

TabContentItem _$TabContentItemFromJson(Map<String, dynamic> json) {
  return _TabContentItem.fromJson(json);
}

/// @nodoc
mixin _$TabContentItem {
  String get title => throw _privateConstructorUsedError;
  List<CardsItem> get cards => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TabContentItemCopyWith<TabContentItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabContentItemCopyWith<$Res> {
  factory $TabContentItemCopyWith(
          TabContentItem value, $Res Function(TabContentItem) then) =
      _$TabContentItemCopyWithImpl<$Res, TabContentItem>;
  @useResult
  $Res call({String title, List<CardsItem> cards});
}

/// @nodoc
class _$TabContentItemCopyWithImpl<$Res, $Val extends TabContentItem>
    implements $TabContentItemCopyWith<$Res> {
  _$TabContentItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? cards = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      cards: null == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<CardsItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TabContentItemCopyWith<$Res>
    implements $TabContentItemCopyWith<$Res> {
  factory _$$_TabContentItemCopyWith(
          _$_TabContentItem value, $Res Function(_$_TabContentItem) then) =
      __$$_TabContentItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, List<CardsItem> cards});
}

/// @nodoc
class __$$_TabContentItemCopyWithImpl<$Res>
    extends _$TabContentItemCopyWithImpl<$Res, _$_TabContentItem>
    implements _$$_TabContentItemCopyWith<$Res> {
  __$$_TabContentItemCopyWithImpl(
      _$_TabContentItem _value, $Res Function(_$_TabContentItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? cards = null,
  }) {
    return _then(_$_TabContentItem(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      cards: null == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<CardsItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TabContentItem implements _TabContentItem {
  const _$_TabContentItem({this.title = '', this.cards = const []});

  factory _$_TabContentItem.fromJson(Map<String, dynamic> json) =>
      _$$_TabContentItemFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final List<CardsItem> cards;

  @override
  String toString() {
    return 'TabContentItem(title: $title, cards: $cards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TabContentItem &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other.cards, cards));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, const DeepCollectionEquality().hash(cards));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TabContentItemCopyWith<_$_TabContentItem> get copyWith =>
      __$$_TabContentItemCopyWithImpl<_$_TabContentItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TabContentItemToJson(
      this,
    );
  }
}

abstract class _TabContentItem implements TabContentItem {
  const factory _TabContentItem(
      {final String title, final List<CardsItem> cards}) = _$_TabContentItem;

  factory _TabContentItem.fromJson(Map<String, dynamic> json) =
      _$_TabContentItem.fromJson;

  @override
  String get title;
  @override
  List<CardsItem> get cards;
  @override
  @JsonKey(ignore: true)
  _$$_TabContentItemCopyWith<_$_TabContentItem> get copyWith =>
      throw _privateConstructorUsedError;
}

Cards _$CardsFromJson(Map<String, dynamic> json) {
  return _Cards.fromJson(json);
}

/// @nodoc
mixin _$Cards {
  List<CardsItem> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardsCopyWith<Cards> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardsCopyWith<$Res> {
  factory $CardsCopyWith(Cards value, $Res Function(Cards) then) =
      _$CardsCopyWithImpl<$Res, Cards>;
  @useResult
  $Res call({List<CardsItem> items});
}

/// @nodoc
class _$CardsCopyWithImpl<$Res, $Val extends Cards>
    implements $CardsCopyWith<$Res> {
  _$CardsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CardsItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CardsCopyWith<$Res> implements $CardsCopyWith<$Res> {
  factory _$$_CardsCopyWith(_$_Cards value, $Res Function(_$_Cards) then) =
      __$$_CardsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CardsItem> items});
}

/// @nodoc
class __$$_CardsCopyWithImpl<$Res> extends _$CardsCopyWithImpl<$Res, _$_Cards>
    implements _$$_CardsCopyWith<$Res> {
  __$$_CardsCopyWithImpl(_$_Cards _value, $Res Function(_$_Cards) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$_Cards(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CardsItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Cards implements _Cards {
  const _$_Cards({this.items = const []});

  factory _$_Cards.fromJson(Map<String, dynamic> json) =>
      _$$_CardsFromJson(json);

  @override
  @JsonKey()
  final List<CardsItem> items;

  @override
  String toString() {
    return 'Cards(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Cards &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardsCopyWith<_$_Cards> get copyWith =>
      __$$_CardsCopyWithImpl<_$_Cards>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CardsToJson(
      this,
    );
  }
}

abstract class _Cards implements Cards {
  const factory _Cards({final List<CardsItem> items}) = _$_Cards;

  factory _Cards.fromJson(Map<String, dynamic> json) = _$_Cards.fromJson;

  @override
  List<CardsItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$_CardsCopyWith<_$_Cards> get copyWith =>
      throw _privateConstructorUsedError;
}

CardsItem _$CardsItemFromJson(Map<String, dynamic> json) {
  return _CardsItem.fromJson(json);
}

/// @nodoc
mixin _$CardsItem {
  String get id => throw _privateConstructorUsedError;
  String get src => throw _privateConstructorUsedError;
  String get alt => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get desc => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  String get cardDesc => throw _privateConstructorUsedError;
  String get finalPrice => throw _privateConstructorUsedError;
  String get btnText => throw _privateConstructorUsedError;
  String get btnUrl => throw _privateConstructorUsedError;
  String get btnVariant => throw _privateConstructorUsedError;
  String get mobileImage => throw _privateConstructorUsedError;
  String get mobileImageAlt => throw _privateConstructorUsedError;
  String get webImage => throw _privateConstructorUsedError;
  String get webImageAlt => throw _privateConstructorUsedError;
  String get thumbnailImage => throw _privateConstructorUsedError;
  String get thumbnailImageAlt => throw _privateConstructorUsedError;
  bool get isRecommended => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardsItemCopyWith<CardsItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardsItemCopyWith<$Res> {
  factory $CardsItemCopyWith(CardsItem value, $Res Function(CardsItem) then) =
      _$CardsItemCopyWithImpl<$Res, CardsItem>;
  @useResult
  $Res call(
      {String id,
      String src,
      String alt,
      String title,
      String desc,
      String value,
      String cardDesc,
      String finalPrice,
      String btnText,
      String btnUrl,
      String btnVariant,
      String mobileImage,
      String mobileImageAlt,
      String webImage,
      String webImageAlt,
      String thumbnailImage,
      String thumbnailImageAlt,
      bool isRecommended});
}

/// @nodoc
class _$CardsItemCopyWithImpl<$Res, $Val extends CardsItem>
    implements $CardsItemCopyWith<$Res> {
  _$CardsItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? src = null,
    Object? alt = null,
    Object? title = null,
    Object? desc = null,
    Object? value = null,
    Object? cardDesc = null,
    Object? finalPrice = null,
    Object? btnText = null,
    Object? btnUrl = null,
    Object? btnVariant = null,
    Object? mobileImage = null,
    Object? mobileImageAlt = null,
    Object? webImage = null,
    Object? webImageAlt = null,
    Object? thumbnailImage = null,
    Object? thumbnailImageAlt = null,
    Object? isRecommended = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      src: null == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as String,
      alt: null == alt
          ? _value.alt
          : alt // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      cardDesc: null == cardDesc
          ? _value.cardDesc
          : cardDesc // ignore: cast_nullable_to_non_nullable
              as String,
      finalPrice: null == finalPrice
          ? _value.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
              as String,
      btnText: null == btnText
          ? _value.btnText
          : btnText // ignore: cast_nullable_to_non_nullable
              as String,
      btnUrl: null == btnUrl
          ? _value.btnUrl
          : btnUrl // ignore: cast_nullable_to_non_nullable
              as String,
      btnVariant: null == btnVariant
          ? _value.btnVariant
          : btnVariant // ignore: cast_nullable_to_non_nullable
              as String,
      mobileImage: null == mobileImage
          ? _value.mobileImage
          : mobileImage // ignore: cast_nullable_to_non_nullable
              as String,
      mobileImageAlt: null == mobileImageAlt
          ? _value.mobileImageAlt
          : mobileImageAlt // ignore: cast_nullable_to_non_nullable
              as String,
      webImage: null == webImage
          ? _value.webImage
          : webImage // ignore: cast_nullable_to_non_nullable
              as String,
      webImageAlt: null == webImageAlt
          ? _value.webImageAlt
          : webImageAlt // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailImage: null == thumbnailImage
          ? _value.thumbnailImage
          : thumbnailImage // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailImageAlt: null == thumbnailImageAlt
          ? _value.thumbnailImageAlt
          : thumbnailImageAlt // ignore: cast_nullable_to_non_nullable
              as String,
      isRecommended: null == isRecommended
          ? _value.isRecommended
          : isRecommended // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CardsItemCopyWith<$Res> implements $CardsItemCopyWith<$Res> {
  factory _$$_CardsItemCopyWith(
          _$_CardsItem value, $Res Function(_$_CardsItem) then) =
      __$$_CardsItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String src,
      String alt,
      String title,
      String desc,
      String value,
      String cardDesc,
      String finalPrice,
      String btnText,
      String btnUrl,
      String btnVariant,
      String mobileImage,
      String mobileImageAlt,
      String webImage,
      String webImageAlt,
      String thumbnailImage,
      String thumbnailImageAlt,
      bool isRecommended});
}

/// @nodoc
class __$$_CardsItemCopyWithImpl<$Res>
    extends _$CardsItemCopyWithImpl<$Res, _$_CardsItem>
    implements _$$_CardsItemCopyWith<$Res> {
  __$$_CardsItemCopyWithImpl(
      _$_CardsItem _value, $Res Function(_$_CardsItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? src = null,
    Object? alt = null,
    Object? title = null,
    Object? desc = null,
    Object? value = null,
    Object? cardDesc = null,
    Object? finalPrice = null,
    Object? btnText = null,
    Object? btnUrl = null,
    Object? btnVariant = null,
    Object? mobileImage = null,
    Object? mobileImageAlt = null,
    Object? webImage = null,
    Object? webImageAlt = null,
    Object? thumbnailImage = null,
    Object? thumbnailImageAlt = null,
    Object? isRecommended = null,
  }) {
    return _then(_$_CardsItem(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      src: null == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as String,
      alt: null == alt
          ? _value.alt
          : alt // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      desc: null == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      cardDesc: null == cardDesc
          ? _value.cardDesc
          : cardDesc // ignore: cast_nullable_to_non_nullable
              as String,
      finalPrice: null == finalPrice
          ? _value.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
              as String,
      btnText: null == btnText
          ? _value.btnText
          : btnText // ignore: cast_nullable_to_non_nullable
              as String,
      btnUrl: null == btnUrl
          ? _value.btnUrl
          : btnUrl // ignore: cast_nullable_to_non_nullable
              as String,
      btnVariant: null == btnVariant
          ? _value.btnVariant
          : btnVariant // ignore: cast_nullable_to_non_nullable
              as String,
      mobileImage: null == mobileImage
          ? _value.mobileImage
          : mobileImage // ignore: cast_nullable_to_non_nullable
              as String,
      mobileImageAlt: null == mobileImageAlt
          ? _value.mobileImageAlt
          : mobileImageAlt // ignore: cast_nullable_to_non_nullable
              as String,
      webImage: null == webImage
          ? _value.webImage
          : webImage // ignore: cast_nullable_to_non_nullable
              as String,
      webImageAlt: null == webImageAlt
          ? _value.webImageAlt
          : webImageAlt // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailImage: null == thumbnailImage
          ? _value.thumbnailImage
          : thumbnailImage // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailImageAlt: null == thumbnailImageAlt
          ? _value.thumbnailImageAlt
          : thumbnailImageAlt // ignore: cast_nullable_to_non_nullable
              as String,
      isRecommended: null == isRecommended
          ? _value.isRecommended
          : isRecommended // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CardsItem implements _CardsItem {
  const _$_CardsItem(
      {this.id = '',
      this.src = '',
      this.alt = '',
      this.title = '',
      this.desc = '',
      this.value = '',
      this.cardDesc = '',
      this.finalPrice = '',
      this.btnText = '',
      this.btnUrl = '',
      this.btnVariant = '',
      this.mobileImage = '',
      this.mobileImageAlt = '',
      this.webImage = '',
      this.webImageAlt = '',
      this.thumbnailImage = '',
      this.thumbnailImageAlt = '',
      this.isRecommended = false});

  factory _$_CardsItem.fromJson(Map<String, dynamic> json) =>
      _$$_CardsItemFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String src;
  @override
  @JsonKey()
  final String alt;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String desc;
  @override
  @JsonKey()
  final String value;
  @override
  @JsonKey()
  final String cardDesc;
  @override
  @JsonKey()
  final String finalPrice;
  @override
  @JsonKey()
  final String btnText;
  @override
  @JsonKey()
  final String btnUrl;
  @override
  @JsonKey()
  final String btnVariant;
  @override
  @JsonKey()
  final String mobileImage;
  @override
  @JsonKey()
  final String mobileImageAlt;
  @override
  @JsonKey()
  final String webImage;
  @override
  @JsonKey()
  final String webImageAlt;
  @override
  @JsonKey()
  final String thumbnailImage;
  @override
  @JsonKey()
  final String thumbnailImageAlt;
  @override
  @JsonKey()
  final bool isRecommended;

  @override
  String toString() {
    return 'CardsItem(id: $id, src: $src, alt: $alt, title: $title, desc: $desc, value: $value, cardDesc: $cardDesc, finalPrice: $finalPrice, btnText: $btnText, btnUrl: $btnUrl, btnVariant: $btnVariant, mobileImage: $mobileImage, mobileImageAlt: $mobileImageAlt, webImage: $webImage, webImageAlt: $webImageAlt, thumbnailImage: $thumbnailImage, thumbnailImageAlt: $thumbnailImageAlt, isRecommended: $isRecommended)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CardsItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.src, src) || other.src == src) &&
            (identical(other.alt, alt) || other.alt == alt) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.cardDesc, cardDesc) ||
                other.cardDesc == cardDesc) &&
            (identical(other.finalPrice, finalPrice) ||
                other.finalPrice == finalPrice) &&
            (identical(other.btnText, btnText) || other.btnText == btnText) &&
            (identical(other.btnUrl, btnUrl) || other.btnUrl == btnUrl) &&
            (identical(other.btnVariant, btnVariant) ||
                other.btnVariant == btnVariant) &&
            (identical(other.mobileImage, mobileImage) ||
                other.mobileImage == mobileImage) &&
            (identical(other.mobileImageAlt, mobileImageAlt) ||
                other.mobileImageAlt == mobileImageAlt) &&
            (identical(other.webImage, webImage) ||
                other.webImage == webImage) &&
            (identical(other.webImageAlt, webImageAlt) ||
                other.webImageAlt == webImageAlt) &&
            (identical(other.thumbnailImage, thumbnailImage) ||
                other.thumbnailImage == thumbnailImage) &&
            (identical(other.thumbnailImageAlt, thumbnailImageAlt) ||
                other.thumbnailImageAlt == thumbnailImageAlt) &&
            (identical(other.isRecommended, isRecommended) ||
                other.isRecommended == isRecommended));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      src,
      alt,
      title,
      desc,
      value,
      cardDesc,
      finalPrice,
      btnText,
      btnUrl,
      btnVariant,
      mobileImage,
      mobileImageAlt,
      webImage,
      webImageAlt,
      thumbnailImage,
      thumbnailImageAlt,
      isRecommended);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CardsItemCopyWith<_$_CardsItem> get copyWith =>
      __$$_CardsItemCopyWithImpl<_$_CardsItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CardsItemToJson(
      this,
    );
  }
}

abstract class _CardsItem implements CardsItem {
  const factory _CardsItem(
      {final String id,
      final String src,
      final String alt,
      final String title,
      final String desc,
      final String value,
      final String cardDesc,
      final String finalPrice,
      final String btnText,
      final String btnUrl,
      final String btnVariant,
      final String mobileImage,
      final String mobileImageAlt,
      final String webImage,
      final String webImageAlt,
      final String thumbnailImage,
      final String thumbnailImageAlt,
      final bool isRecommended}) = _$_CardsItem;

  factory _CardsItem.fromJson(Map<String, dynamic> json) =
      _$_CardsItem.fromJson;

  @override
  String get id;
  @override
  String get src;
  @override
  String get alt;
  @override
  String get title;
  @override
  String get desc;
  @override
  String get value;
  @override
  String get cardDesc;
  @override
  String get finalPrice;
  @override
  String get btnText;
  @override
  String get btnUrl;
  @override
  String get btnVariant;
  @override
  String get mobileImage;
  @override
  String get mobileImageAlt;
  @override
  String get webImage;
  @override
  String get webImageAlt;
  @override
  String get thumbnailImage;
  @override
  String get thumbnailImageAlt;
  @override
  bool get isRecommended;
  @override
  @JsonKey(ignore: true)
  _$$_CardsItemCopyWith<_$_CardsItem> get copyWith =>
      throw _privateConstructorUsedError;
}
