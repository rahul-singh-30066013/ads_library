// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offer_dashboard_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OfferDashboardResponse _$OfferDashboardResponseFromJson(
    Map<String, dynamic> json) {
  return _OfferDashboardResponse.fromJson(json);
}

/// @nodoc
mixin _$OfferDashboardResponse {
  String get name => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  List<Elements> get elements => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OfferDashboardResponseCopyWith<OfferDashboardResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferDashboardResponseCopyWith<$Res> {
  factory $OfferDashboardResponseCopyWith(OfferDashboardResponse value,
          $Res Function(OfferDashboardResponse) then) =
      _$OfferDashboardResponseCopyWithImpl<$Res, OfferDashboardResponse>;
  @useResult
  $Res call({String name, String path, List<Elements> elements});
}

/// @nodoc
class _$OfferDashboardResponseCopyWithImpl<$Res,
        $Val extends OfferDashboardResponse>
    implements $OfferDashboardResponseCopyWith<$Res> {
  _$OfferDashboardResponseCopyWithImpl(this._value, this._then);

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
              as List<Elements>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OfferDashboardResponseCopyWith<$Res>
    implements $OfferDashboardResponseCopyWith<$Res> {
  factory _$$_OfferDashboardResponseCopyWith(_$_OfferDashboardResponse value,
          $Res Function(_$_OfferDashboardResponse) then) =
      __$$_OfferDashboardResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String path, List<Elements> elements});
}

/// @nodoc
class __$$_OfferDashboardResponseCopyWithImpl<$Res>
    extends _$OfferDashboardResponseCopyWithImpl<$Res,
        _$_OfferDashboardResponse>
    implements _$$_OfferDashboardResponseCopyWith<$Res> {
  __$$_OfferDashboardResponseCopyWithImpl(_$_OfferDashboardResponse _value,
      $Res Function(_$_OfferDashboardResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? path = null,
    Object? elements = null,
  }) {
    return _then(_$_OfferDashboardResponse(
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
              as List<Elements>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OfferDashboardResponse implements _OfferDashboardResponse {
  const _$_OfferDashboardResponse(
      {this.name = '', this.path = '', this.elements = const []});

  factory _$_OfferDashboardResponse.fromJson(Map<String, dynamic> json) =>
      _$$_OfferDashboardResponseFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String path;
  @override
  @JsonKey()
  final List<Elements> elements;

  @override
  String toString() {
    return 'OfferDashboardResponse(name: $name, path: $path, elements: $elements)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OfferDashboardResponse &&
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
  _$$_OfferDashboardResponseCopyWith<_$_OfferDashboardResponse> get copyWith =>
      __$$_OfferDashboardResponseCopyWithImpl<_$_OfferDashboardResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OfferDashboardResponseToJson(
      this,
    );
  }
}

abstract class _OfferDashboardResponse implements OfferDashboardResponse {
  const factory _OfferDashboardResponse(
      {final String name,
      final String path,
      final List<Elements> elements}) = _$_OfferDashboardResponse;

  factory _OfferDashboardResponse.fromJson(Map<String, dynamic> json) =
      _$_OfferDashboardResponse.fromJson;

  @override
  String get name;
  @override
  String get path;
  @override
  List<Elements> get elements;
  @override
  @JsonKey(ignore: true)
  _$$_OfferDashboardResponseCopyWith<_$_OfferDashboardResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

Elements _$ElementsFromJson(Map<String, dynamic> json) {
  return _Elements.fromJson(json);
}

/// @nodoc
mixin _$Elements {
  String get uid => throw _privateConstructorUsedError;
  String get componentName => throw _privateConstructorUsedError;
  String get dataSource => throw _privateConstructorUsedError;
  Params get params => throw _privateConstructorUsedError;
  Fields get fields => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ElementsCopyWith<Elements> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ElementsCopyWith<$Res> {
  factory $ElementsCopyWith(Elements value, $Res Function(Elements) then) =
      _$ElementsCopyWithImpl<$Res, Elements>;
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
class _$ElementsCopyWithImpl<$Res, $Val extends Elements>
    implements $ElementsCopyWith<$Res> {
  _$ElementsCopyWithImpl(this._value, this._then);

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
abstract class _$$_ElementsCopyWith<$Res> implements $ElementsCopyWith<$Res> {
  factory _$$_ElementsCopyWith(
          _$_Elements value, $Res Function(_$_Elements) then) =
      __$$_ElementsCopyWithImpl<$Res>;
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
class __$$_ElementsCopyWithImpl<$Res>
    extends _$ElementsCopyWithImpl<$Res, _$_Elements>
    implements _$$_ElementsCopyWith<$Res> {
  __$$_ElementsCopyWithImpl(
      _$_Elements _value, $Res Function(_$_Elements) _then)
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
    return _then(_$_Elements(
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
class _$_Elements implements _Elements {
  const _$_Elements(
      {this.uid = '',
      this.componentName = '',
      this.dataSource = '',
      this.params = const Params(),
      this.fields = const Fields()});

  factory _$_Elements.fromJson(Map<String, dynamic> json) =>
      _$$_ElementsFromJson(json);

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
    return 'Elements(uid: $uid, componentName: $componentName, dataSource: $dataSource, params: $params, fields: $fields)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Elements &&
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
  _$$_ElementsCopyWith<_$_Elements> get copyWith =>
      __$$_ElementsCopyWithImpl<_$_Elements>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ElementsToJson(
      this,
    );
  }
}

abstract class _Elements implements Elements {
  const factory _Elements(
      {final String uid,
      final String componentName,
      final String dataSource,
      final Params params,
      final Fields fields}) = _$_Elements;

  factory _Elements.fromJson(Map<String, dynamic> json) = _$_Elements.fromJson;

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
  _$$_ElementsCopyWith<_$_Elements> get copyWith =>
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
  String get ctaText => throw _privateConstructorUsedError;
  String get ctaURL => throw _privateConstructorUsedError;
  String get faqHTML => throw _privateConstructorUsedError;

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
      {DashboardItem widget,
      String title,
      List<ListElement> list,
      String ctaText,
      String ctaURL,
      String faqHTML});

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
    Object? ctaText = null,
    Object? ctaURL = null,
    Object? faqHTML = null,
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
      ctaText: null == ctaText
          ? _value.ctaText
          : ctaText // ignore: cast_nullable_to_non_nullable
              as String,
      ctaURL: null == ctaURL
          ? _value.ctaURL
          : ctaURL // ignore: cast_nullable_to_non_nullable
              as String,
      faqHTML: null == faqHTML
          ? _value.faqHTML
          : faqHTML // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call(
      {DashboardItem widget,
      String title,
      List<ListElement> list,
      String ctaText,
      String ctaURL,
      String faqHTML});

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
    Object? ctaText = null,
    Object? ctaURL = null,
    Object? faqHTML = null,
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
      ctaText: null == ctaText
          ? _value.ctaText
          : ctaText // ignore: cast_nullable_to_non_nullable
              as String,
      ctaURL: null == ctaURL
          ? _value.ctaURL
          : ctaURL // ignore: cast_nullable_to_non_nullable
              as String,
      faqHTML: null == faqHTML
          ? _value.faqHTML
          : faqHTML // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Fields implements _Fields {
  const _$_Fields(
      {this.widget = const DashboardItem(),
      this.title = '',
      this.list = const [],
      this.ctaText = '',
      this.ctaURL = '',
      this.faqHTML = ''});

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
  @JsonKey()
  final String ctaText;
  @override
  @JsonKey()
  final String ctaURL;
  @override
  @JsonKey()
  final String faqHTML;

  @override
  String toString() {
    return 'Fields(widget: $widget, title: $title, list: $list, ctaText: $ctaText, ctaURL: $ctaURL, faqHTML: $faqHTML)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fields &&
            (identical(other.widget, widget) || other.widget == widget) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other.list, list) &&
            (identical(other.ctaText, ctaText) || other.ctaText == ctaText) &&
            (identical(other.ctaURL, ctaURL) || other.ctaURL == ctaURL) &&
            (identical(other.faqHTML, faqHTML) || other.faqHTML == faqHTML));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, widget, title,
      const DeepCollectionEquality().hash(list), ctaText, ctaURL, faqHTML);

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
      final List<ListElement> list,
      final String ctaText,
      final String ctaURL,
      final String faqHTML}) = _$_Fields;

  factory _Fields.fromJson(Map<String, dynamic> json) = _$_Fields.fromJson;

  @override
  DashboardItem get widget;
  @override
  String get title;
  @override
  List<ListElement> get list;
  @override
  String get ctaText;
  @override
  String get ctaURL;
  @override
  String get faqHTML;
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
  String get subTitle => throw _privateConstructorUsedError;
  double get subItemRadius => throw _privateConstructorUsedError;
  double get subItemWidth => throw _privateConstructorUsedError;
  int get gridColumn => throw _privateConstructorUsedError;
  double get aspectRatio => throw _privateConstructorUsedError;
  double get borderRadius => throw _privateConstructorUsedError;
  ItemMargin get itemMargin => throw _privateConstructorUsedError;
  ItemMargin get subItemMargin => throw _privateConstructorUsedError;
  ActionTitle get actionTitle => throw _privateConstructorUsedError;
  List<WidgetItem> get widgetItems => throw _privateConstructorUsedError;

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
      String subTitle,
      double subItemRadius,
      double subItemWidth,
      int gridColumn,
      double aspectRatio,
      double borderRadius,
      ItemMargin itemMargin,
      ItemMargin subItemMargin,
      ActionTitle actionTitle,
      List<WidgetItem> widgetItems});

  $ItemMarginCopyWith<$Res> get itemMargin;
  $ItemMarginCopyWith<$Res> get subItemMargin;
  $ActionTitleCopyWith<$Res> get actionTitle;
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
    Object? subTitle = null,
    Object? subItemRadius = null,
    Object? subItemWidth = null,
    Object? gridColumn = null,
    Object? aspectRatio = null,
    Object? borderRadius = null,
    Object? itemMargin = null,
    Object? subItemMargin = null,
    Object? actionTitle = null,
    Object? widgetItems = null,
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
      widgetItems: null == widgetItems
          ? _value.widgetItems
          : widgetItems // ignore: cast_nullable_to_non_nullable
              as List<WidgetItem>,
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
      String subTitle,
      double subItemRadius,
      double subItemWidth,
      int gridColumn,
      double aspectRatio,
      double borderRadius,
      ItemMargin itemMargin,
      ItemMargin subItemMargin,
      ActionTitle actionTitle,
      List<WidgetItem> widgetItems});

  @override
  $ItemMarginCopyWith<$Res> get itemMargin;
  @override
  $ItemMarginCopyWith<$Res> get subItemMargin;
  @override
  $ActionTitleCopyWith<$Res> get actionTitle;
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
    Object? subTitle = null,
    Object? subItemRadius = null,
    Object? subItemWidth = null,
    Object? gridColumn = null,
    Object? aspectRatio = null,
    Object? borderRadius = null,
    Object? itemMargin = null,
    Object? subItemMargin = null,
    Object? actionTitle = null,
    Object? widgetItems = null,
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
      widgetItems: null == widgetItems
          ? _value.widgetItems
          : widgetItems // ignore: cast_nullable_to_non_nullable
              as List<WidgetItem>,
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
      this.subTitle = '',
      this.subItemRadius = 0,
      this.subItemWidth = 0,
      this.gridColumn = 0,
      this.aspectRatio = 0,
      this.borderRadius = 0,
      this.itemMargin = const ItemMargin(),
      this.subItemMargin = const ItemMargin(),
      this.actionTitle = const ActionTitle(),
      this.widgetItems = const []});

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
  final List<WidgetItem> widgetItems;

  @override
  String toString() {
    return 'DashboardItem(widgetId: $widgetId, widgetType: $widgetType, title: $title, subTitle: $subTitle, subItemRadius: $subItemRadius, subItemWidth: $subItemWidth, gridColumn: $gridColumn, aspectRatio: $aspectRatio, borderRadius: $borderRadius, itemMargin: $itemMargin, subItemMargin: $subItemMargin, actionTitle: $actionTitle, widgetItems: $widgetItems)';
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
            const DeepCollectionEquality()
                .equals(other.widgetItems, widgetItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      widgetId,
      widgetType,
      title,
      subTitle,
      subItemRadius,
      subItemWidth,
      gridColumn,
      aspectRatio,
      borderRadius,
      itemMargin,
      subItemMargin,
      actionTitle,
      const DeepCollectionEquality().hash(widgetItems));

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
      final String subTitle,
      final double subItemRadius,
      final double subItemWidth,
      final int gridColumn,
      final double aspectRatio,
      final double borderRadius,
      final ItemMargin itemMargin,
      final ItemMargin subItemMargin,
      final ActionTitle actionTitle,
      final List<WidgetItem> widgetItems}) = _$_DashboardItem;

  factory _DashboardItem.fromJson(Map<String, dynamic> json) =
      _$_DashboardItem.fromJson;

  @override
  int get widgetId;
  @override
  String get widgetType;
  @override
  String get title;
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
  List<WidgetItem> get widgetItems;
  @override
  @JsonKey(ignore: true)
  _$$_DashboardItemCopyWith<_$_DashboardItem> get copyWith =>
      throw _privateConstructorUsedError;
}

OfferItems _$OfferItemsFromJson(Map<String, dynamic> json) {
  return _OfferItems.fromJson(json);
}

/// @nodoc
mixin _$OfferItems {
  int get count => throw _privateConstructorUsedError;
  List<WidgetItem> get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OfferItemsCopyWith<OfferItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferItemsCopyWith<$Res> {
  factory $OfferItemsCopyWith(
          OfferItems value, $Res Function(OfferItems) then) =
      _$OfferItemsCopyWithImpl<$Res, OfferItems>;
  @useResult
  $Res call({int count, List<WidgetItem> result});
}

/// @nodoc
class _$OfferItemsCopyWithImpl<$Res, $Val extends OfferItems>
    implements $OfferItemsCopyWith<$Res> {
  _$OfferItemsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? result = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<WidgetItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OfferItemsCopyWith<$Res>
    implements $OfferItemsCopyWith<$Res> {
  factory _$$_OfferItemsCopyWith(
          _$_OfferItems value, $Res Function(_$_OfferItems) then) =
      __$$_OfferItemsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, List<WidgetItem> result});
}

/// @nodoc
class __$$_OfferItemsCopyWithImpl<$Res>
    extends _$OfferItemsCopyWithImpl<$Res, _$_OfferItems>
    implements _$$_OfferItemsCopyWith<$Res> {
  __$$_OfferItemsCopyWithImpl(
      _$_OfferItems _value, $Res Function(_$_OfferItems) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? result = null,
  }) {
    return _then(_$_OfferItems(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<WidgetItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OfferItems implements _OfferItems {
  const _$_OfferItems({this.count = 0, this.result = const []});

  factory _$_OfferItems.fromJson(Map<String, dynamic> json) =>
      _$$_OfferItemsFromJson(json);

  @override
  @JsonKey()
  final int count;
  @override
  @JsonKey()
  final List<WidgetItem> result;

  @override
  String toString() {
    return 'OfferItems(count: $count, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OfferItems &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality().equals(other.result, result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, count, const DeepCollectionEquality().hash(result));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OfferItemsCopyWith<_$_OfferItems> get copyWith =>
      __$$_OfferItemsCopyWithImpl<_$_OfferItems>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OfferItemsToJson(
      this,
    );
  }
}

abstract class _OfferItems implements OfferItems {
  const factory _OfferItems({final int count, final List<WidgetItem> result}) =
      _$_OfferItems;

  factory _OfferItems.fromJson(Map<String, dynamic> json) =
      _$_OfferItems.fromJson;

  @override
  int get count;
  @override
  List<WidgetItem> get result;
  @override
  @JsonKey(ignore: true)
  _$$_OfferItemsCopyWith<_$_OfferItems> get copyWith =>
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
  String get promotionType => throw _privateConstructorUsedError;
  String get promotionDescription => throw _privateConstructorUsedError;
  String get promotionCode => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get skuCode => throw _privateConstructorUsedError;
  String get offerType => throw _privateConstructorUsedError;
  String get displayText => throw _privateConstructorUsedError;
  String get effectiveFrom => throw _privateConstructorUsedError;
  String get effectiveTo => throw _privateConstructorUsedError;
  String get mobileImageSrc => throw _privateConstructorUsedError;
  String get thumbnailImageSrc => throw _privateConstructorUsedError;
  String get expiryOption => throw _privateConstructorUsedError;
  String get savings => throw _privateConstructorUsedError;
  String get apptype => throw _privateConstructorUsedError;
  String get extraImageSrc => throw _privateConstructorUsedError;
  String get linkURL => throw _privateConstructorUsedError;
  String get linkText => throw _privateConstructorUsedError;
  String get tcLinkAlt => throw _privateConstructorUsedError;
  String get validationType => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get tcLinkUrl => throw _privateConstructorUsedError;
  String get bannerImageMobSrc => throw _privateConstructorUsedError;
  String get categoryFilter => throw _privateConstructorUsedError;
  String get promotionTypeLabel => throw _privateConstructorUsedError;
  String get tabTitle => throw _privateConstructorUsedError;
  String get offerTitle => throw _privateConstructorUsedError;
  String get bankOfferText => throw _privateConstructorUsedError;
  String get unlockOfferTitle => throw _privateConstructorUsedError;
  bool get tcEnable => throw _privateConstructorUsedError;
  String get deepLinkAlt => throw _privateConstructorUsedError;
  String get offerUniqueID =>
      throw _privateConstructorUsedError; // @Default('') String terminalLocationType,
  List<String> get termCondition => throw _privateConstructorUsedError;
  bool get isInstoreOffer =>
      throw _privateConstructorUsedError; // @Default('') String terminalLocationType,
  List<String> get similarOffers => throw _privateConstructorUsedError;
  String get tncViewAllLink => throw _privateConstructorUsedError;
  String get displayRank => throw _privateConstructorUsedError;
  List<String> get howToUse => throw _privateConstructorUsedError;
  String get bookingConfirmedOfferText => throw _privateConstructorUsedError;
  String get bookingConfirmedOfferDescription =>
      throw _privateConstructorUsedError;
  String get offerLogoDesktop => throw _privateConstructorUsedError;
  String get offerLogoMobile => throw _privateConstructorUsedError;
  String get unlockOfferCTAText => throw _privateConstructorUsedError;
  String get UnlockOfferCTALink => throw _privateConstructorUsedError;
  String get unlockOfferCTAVisitWesiteText =>
      throw _privateConstructorUsedError;
  String get unlockOfferCTAVisitWesiteLink =>
      throw _privateConstructorUsedError;
  String get offerServicesRedirectionLink => throw _privateConstructorUsedError;
  bool get isExpired => throw _privateConstructorUsedError;

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
      {String promotionType,
      String promotionDescription,
      String promotionCode,
      String title,
      String skuCode,
      String offerType,
      String displayText,
      String effectiveFrom,
      String effectiveTo,
      String mobileImageSrc,
      String thumbnailImageSrc,
      String expiryOption,
      String savings,
      String apptype,
      String extraImageSrc,
      String linkURL,
      String linkText,
      String tcLinkAlt,
      String validationType,
      String currency,
      String tcLinkUrl,
      String bannerImageMobSrc,
      String categoryFilter,
      String promotionTypeLabel,
      String tabTitle,
      String offerTitle,
      String bankOfferText,
      String unlockOfferTitle,
      bool tcEnable,
      String deepLinkAlt,
      String offerUniqueID,
      List<String> termCondition,
      bool isInstoreOffer,
      List<String> similarOffers,
      String tncViewAllLink,
      String displayRank,
      List<String> howToUse,
      String bookingConfirmedOfferText,
      String bookingConfirmedOfferDescription,
      String offerLogoDesktop,
      String offerLogoMobile,
      String unlockOfferCTAText,
      String UnlockOfferCTALink,
      String unlockOfferCTAVisitWesiteText,
      String unlockOfferCTAVisitWesiteLink,
      String offerServicesRedirectionLink,
      bool isExpired});
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
    Object? promotionType = null,
    Object? promotionDescription = null,
    Object? promotionCode = null,
    Object? title = null,
    Object? skuCode = null,
    Object? offerType = null,
    Object? displayText = null,
    Object? effectiveFrom = null,
    Object? effectiveTo = null,
    Object? mobileImageSrc = null,
    Object? thumbnailImageSrc = null,
    Object? expiryOption = null,
    Object? savings = null,
    Object? apptype = null,
    Object? extraImageSrc = null,
    Object? linkURL = null,
    Object? linkText = null,
    Object? tcLinkAlt = null,
    Object? validationType = null,
    Object? currency = null,
    Object? tcLinkUrl = null,
    Object? bannerImageMobSrc = null,
    Object? categoryFilter = null,
    Object? promotionTypeLabel = null,
    Object? tabTitle = null,
    Object? offerTitle = null,
    Object? bankOfferText = null,
    Object? unlockOfferTitle = null,
    Object? tcEnable = null,
    Object? deepLinkAlt = null,
    Object? offerUniqueID = null,
    Object? termCondition = null,
    Object? isInstoreOffer = null,
    Object? similarOffers = null,
    Object? tncViewAllLink = null,
    Object? displayRank = null,
    Object? howToUse = null,
    Object? bookingConfirmedOfferText = null,
    Object? bookingConfirmedOfferDescription = null,
    Object? offerLogoDesktop = null,
    Object? offerLogoMobile = null,
    Object? unlockOfferCTAText = null,
    Object? UnlockOfferCTALink = null,
    Object? unlockOfferCTAVisitWesiteText = null,
    Object? unlockOfferCTAVisitWesiteLink = null,
    Object? offerServicesRedirectionLink = null,
    Object? isExpired = null,
  }) {
    return _then(_value.copyWith(
      promotionType: null == promotionType
          ? _value.promotionType
          : promotionType // ignore: cast_nullable_to_non_nullable
              as String,
      promotionDescription: null == promotionDescription
          ? _value.promotionDescription
          : promotionDescription // ignore: cast_nullable_to_non_nullable
              as String,
      promotionCode: null == promotionCode
          ? _value.promotionCode
          : promotionCode // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      skuCode: null == skuCode
          ? _value.skuCode
          : skuCode // ignore: cast_nullable_to_non_nullable
              as String,
      offerType: null == offerType
          ? _value.offerType
          : offerType // ignore: cast_nullable_to_non_nullable
              as String,
      displayText: null == displayText
          ? _value.displayText
          : displayText // ignore: cast_nullable_to_non_nullable
              as String,
      effectiveFrom: null == effectiveFrom
          ? _value.effectiveFrom
          : effectiveFrom // ignore: cast_nullable_to_non_nullable
              as String,
      effectiveTo: null == effectiveTo
          ? _value.effectiveTo
          : effectiveTo // ignore: cast_nullable_to_non_nullable
              as String,
      mobileImageSrc: null == mobileImageSrc
          ? _value.mobileImageSrc
          : mobileImageSrc // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailImageSrc: null == thumbnailImageSrc
          ? _value.thumbnailImageSrc
          : thumbnailImageSrc // ignore: cast_nullable_to_non_nullable
              as String,
      expiryOption: null == expiryOption
          ? _value.expiryOption
          : expiryOption // ignore: cast_nullable_to_non_nullable
              as String,
      savings: null == savings
          ? _value.savings
          : savings // ignore: cast_nullable_to_non_nullable
              as String,
      apptype: null == apptype
          ? _value.apptype
          : apptype // ignore: cast_nullable_to_non_nullable
              as String,
      extraImageSrc: null == extraImageSrc
          ? _value.extraImageSrc
          : extraImageSrc // ignore: cast_nullable_to_non_nullable
              as String,
      linkURL: null == linkURL
          ? _value.linkURL
          : linkURL // ignore: cast_nullable_to_non_nullable
              as String,
      linkText: null == linkText
          ? _value.linkText
          : linkText // ignore: cast_nullable_to_non_nullable
              as String,
      tcLinkAlt: null == tcLinkAlt
          ? _value.tcLinkAlt
          : tcLinkAlt // ignore: cast_nullable_to_non_nullable
              as String,
      validationType: null == validationType
          ? _value.validationType
          : validationType // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      tcLinkUrl: null == tcLinkUrl
          ? _value.tcLinkUrl
          : tcLinkUrl // ignore: cast_nullable_to_non_nullable
              as String,
      bannerImageMobSrc: null == bannerImageMobSrc
          ? _value.bannerImageMobSrc
          : bannerImageMobSrc // ignore: cast_nullable_to_non_nullable
              as String,
      categoryFilter: null == categoryFilter
          ? _value.categoryFilter
          : categoryFilter // ignore: cast_nullable_to_non_nullable
              as String,
      promotionTypeLabel: null == promotionTypeLabel
          ? _value.promotionTypeLabel
          : promotionTypeLabel // ignore: cast_nullable_to_non_nullable
              as String,
      tabTitle: null == tabTitle
          ? _value.tabTitle
          : tabTitle // ignore: cast_nullable_to_non_nullable
              as String,
      offerTitle: null == offerTitle
          ? _value.offerTitle
          : offerTitle // ignore: cast_nullable_to_non_nullable
              as String,
      bankOfferText: null == bankOfferText
          ? _value.bankOfferText
          : bankOfferText // ignore: cast_nullable_to_non_nullable
              as String,
      unlockOfferTitle: null == unlockOfferTitle
          ? _value.unlockOfferTitle
          : unlockOfferTitle // ignore: cast_nullable_to_non_nullable
              as String,
      tcEnable: null == tcEnable
          ? _value.tcEnable
          : tcEnable // ignore: cast_nullable_to_non_nullable
              as bool,
      deepLinkAlt: null == deepLinkAlt
          ? _value.deepLinkAlt
          : deepLinkAlt // ignore: cast_nullable_to_non_nullable
              as String,
      offerUniqueID: null == offerUniqueID
          ? _value.offerUniqueID
          : offerUniqueID // ignore: cast_nullable_to_non_nullable
              as String,
      termCondition: null == termCondition
          ? _value.termCondition
          : termCondition // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isInstoreOffer: null == isInstoreOffer
          ? _value.isInstoreOffer
          : isInstoreOffer // ignore: cast_nullable_to_non_nullable
              as bool,
      similarOffers: null == similarOffers
          ? _value.similarOffers
          : similarOffers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tncViewAllLink: null == tncViewAllLink
          ? _value.tncViewAllLink
          : tncViewAllLink // ignore: cast_nullable_to_non_nullable
              as String,
      displayRank: null == displayRank
          ? _value.displayRank
          : displayRank // ignore: cast_nullable_to_non_nullable
              as String,
      howToUse: null == howToUse
          ? _value.howToUse
          : howToUse // ignore: cast_nullable_to_non_nullable
              as List<String>,
      bookingConfirmedOfferText: null == bookingConfirmedOfferText
          ? _value.bookingConfirmedOfferText
          : bookingConfirmedOfferText // ignore: cast_nullable_to_non_nullable
              as String,
      bookingConfirmedOfferDescription: null == bookingConfirmedOfferDescription
          ? _value.bookingConfirmedOfferDescription
          : bookingConfirmedOfferDescription // ignore: cast_nullable_to_non_nullable
              as String,
      offerLogoDesktop: null == offerLogoDesktop
          ? _value.offerLogoDesktop
          : offerLogoDesktop // ignore: cast_nullable_to_non_nullable
              as String,
      offerLogoMobile: null == offerLogoMobile
          ? _value.offerLogoMobile
          : offerLogoMobile // ignore: cast_nullable_to_non_nullable
              as String,
      unlockOfferCTAText: null == unlockOfferCTAText
          ? _value.unlockOfferCTAText
          : unlockOfferCTAText // ignore: cast_nullable_to_non_nullable
              as String,
      UnlockOfferCTALink: null == UnlockOfferCTALink
          ? _value.UnlockOfferCTALink
          : UnlockOfferCTALink // ignore: cast_nullable_to_non_nullable
              as String,
      unlockOfferCTAVisitWesiteText: null == unlockOfferCTAVisitWesiteText
          ? _value.unlockOfferCTAVisitWesiteText
          : unlockOfferCTAVisitWesiteText // ignore: cast_nullable_to_non_nullable
              as String,
      unlockOfferCTAVisitWesiteLink: null == unlockOfferCTAVisitWesiteLink
          ? _value.unlockOfferCTAVisitWesiteLink
          : unlockOfferCTAVisitWesiteLink // ignore: cast_nullable_to_non_nullable
              as String,
      offerServicesRedirectionLink: null == offerServicesRedirectionLink
          ? _value.offerServicesRedirectionLink
          : offerServicesRedirectionLink // ignore: cast_nullable_to_non_nullable
              as String,
      isExpired: null == isExpired
          ? _value.isExpired
          : isExpired // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
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
      {String promotionType,
      String promotionDescription,
      String promotionCode,
      String title,
      String skuCode,
      String offerType,
      String displayText,
      String effectiveFrom,
      String effectiveTo,
      String mobileImageSrc,
      String thumbnailImageSrc,
      String expiryOption,
      String savings,
      String apptype,
      String extraImageSrc,
      String linkURL,
      String linkText,
      String tcLinkAlt,
      String validationType,
      String currency,
      String tcLinkUrl,
      String bannerImageMobSrc,
      String categoryFilter,
      String promotionTypeLabel,
      String tabTitle,
      String offerTitle,
      String bankOfferText,
      String unlockOfferTitle,
      bool tcEnable,
      String deepLinkAlt,
      String offerUniqueID,
      List<String> termCondition,
      bool isInstoreOffer,
      List<String> similarOffers,
      String tncViewAllLink,
      String displayRank,
      List<String> howToUse,
      String bookingConfirmedOfferText,
      String bookingConfirmedOfferDescription,
      String offerLogoDesktop,
      String offerLogoMobile,
      String unlockOfferCTAText,
      String UnlockOfferCTALink,
      String unlockOfferCTAVisitWesiteText,
      String unlockOfferCTAVisitWesiteLink,
      String offerServicesRedirectionLink,
      bool isExpired});
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
    Object? promotionType = null,
    Object? promotionDescription = null,
    Object? promotionCode = null,
    Object? title = null,
    Object? skuCode = null,
    Object? offerType = null,
    Object? displayText = null,
    Object? effectiveFrom = null,
    Object? effectiveTo = null,
    Object? mobileImageSrc = null,
    Object? thumbnailImageSrc = null,
    Object? expiryOption = null,
    Object? savings = null,
    Object? apptype = null,
    Object? extraImageSrc = null,
    Object? linkURL = null,
    Object? linkText = null,
    Object? tcLinkAlt = null,
    Object? validationType = null,
    Object? currency = null,
    Object? tcLinkUrl = null,
    Object? bannerImageMobSrc = null,
    Object? categoryFilter = null,
    Object? promotionTypeLabel = null,
    Object? tabTitle = null,
    Object? offerTitle = null,
    Object? bankOfferText = null,
    Object? unlockOfferTitle = null,
    Object? tcEnable = null,
    Object? deepLinkAlt = null,
    Object? offerUniqueID = null,
    Object? termCondition = null,
    Object? isInstoreOffer = null,
    Object? similarOffers = null,
    Object? tncViewAllLink = null,
    Object? displayRank = null,
    Object? howToUse = null,
    Object? bookingConfirmedOfferText = null,
    Object? bookingConfirmedOfferDescription = null,
    Object? offerLogoDesktop = null,
    Object? offerLogoMobile = null,
    Object? unlockOfferCTAText = null,
    Object? UnlockOfferCTALink = null,
    Object? unlockOfferCTAVisitWesiteText = null,
    Object? unlockOfferCTAVisitWesiteLink = null,
    Object? offerServicesRedirectionLink = null,
    Object? isExpired = null,
  }) {
    return _then(_$_WidgetItem(
      promotionType: null == promotionType
          ? _value.promotionType
          : promotionType // ignore: cast_nullable_to_non_nullable
              as String,
      promotionDescription: null == promotionDescription
          ? _value.promotionDescription
          : promotionDescription // ignore: cast_nullable_to_non_nullable
              as String,
      promotionCode: null == promotionCode
          ? _value.promotionCode
          : promotionCode // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      skuCode: null == skuCode
          ? _value.skuCode
          : skuCode // ignore: cast_nullable_to_non_nullable
              as String,
      offerType: null == offerType
          ? _value.offerType
          : offerType // ignore: cast_nullable_to_non_nullable
              as String,
      displayText: null == displayText
          ? _value.displayText
          : displayText // ignore: cast_nullable_to_non_nullable
              as String,
      effectiveFrom: null == effectiveFrom
          ? _value.effectiveFrom
          : effectiveFrom // ignore: cast_nullable_to_non_nullable
              as String,
      effectiveTo: null == effectiveTo
          ? _value.effectiveTo
          : effectiveTo // ignore: cast_nullable_to_non_nullable
              as String,
      mobileImageSrc: null == mobileImageSrc
          ? _value.mobileImageSrc
          : mobileImageSrc // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailImageSrc: null == thumbnailImageSrc
          ? _value.thumbnailImageSrc
          : thumbnailImageSrc // ignore: cast_nullable_to_non_nullable
              as String,
      expiryOption: null == expiryOption
          ? _value.expiryOption
          : expiryOption // ignore: cast_nullable_to_non_nullable
              as String,
      savings: null == savings
          ? _value.savings
          : savings // ignore: cast_nullable_to_non_nullable
              as String,
      apptype: null == apptype
          ? _value.apptype
          : apptype // ignore: cast_nullable_to_non_nullable
              as String,
      extraImageSrc: null == extraImageSrc
          ? _value.extraImageSrc
          : extraImageSrc // ignore: cast_nullable_to_non_nullable
              as String,
      linkURL: null == linkURL
          ? _value.linkURL
          : linkURL // ignore: cast_nullable_to_non_nullable
              as String,
      linkText: null == linkText
          ? _value.linkText
          : linkText // ignore: cast_nullable_to_non_nullable
              as String,
      tcLinkAlt: null == tcLinkAlt
          ? _value.tcLinkAlt
          : tcLinkAlt // ignore: cast_nullable_to_non_nullable
              as String,
      validationType: null == validationType
          ? _value.validationType
          : validationType // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      tcLinkUrl: null == tcLinkUrl
          ? _value.tcLinkUrl
          : tcLinkUrl // ignore: cast_nullable_to_non_nullable
              as String,
      bannerImageMobSrc: null == bannerImageMobSrc
          ? _value.bannerImageMobSrc
          : bannerImageMobSrc // ignore: cast_nullable_to_non_nullable
              as String,
      categoryFilter: null == categoryFilter
          ? _value.categoryFilter
          : categoryFilter // ignore: cast_nullable_to_non_nullable
              as String,
      promotionTypeLabel: null == promotionTypeLabel
          ? _value.promotionTypeLabel
          : promotionTypeLabel // ignore: cast_nullable_to_non_nullable
              as String,
      tabTitle: null == tabTitle
          ? _value.tabTitle
          : tabTitle // ignore: cast_nullable_to_non_nullable
              as String,
      offerTitle: null == offerTitle
          ? _value.offerTitle
          : offerTitle // ignore: cast_nullable_to_non_nullable
              as String,
      bankOfferText: null == bankOfferText
          ? _value.bankOfferText
          : bankOfferText // ignore: cast_nullable_to_non_nullable
              as String,
      unlockOfferTitle: null == unlockOfferTitle
          ? _value.unlockOfferTitle
          : unlockOfferTitle // ignore: cast_nullable_to_non_nullable
              as String,
      tcEnable: null == tcEnable
          ? _value.tcEnable
          : tcEnable // ignore: cast_nullable_to_non_nullable
              as bool,
      deepLinkAlt: null == deepLinkAlt
          ? _value.deepLinkAlt
          : deepLinkAlt // ignore: cast_nullable_to_non_nullable
              as String,
      offerUniqueID: null == offerUniqueID
          ? _value.offerUniqueID
          : offerUniqueID // ignore: cast_nullable_to_non_nullable
              as String,
      termCondition: null == termCondition
          ? _value.termCondition
          : termCondition // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isInstoreOffer: null == isInstoreOffer
          ? _value.isInstoreOffer
          : isInstoreOffer // ignore: cast_nullable_to_non_nullable
              as bool,
      similarOffers: null == similarOffers
          ? _value.similarOffers
          : similarOffers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tncViewAllLink: null == tncViewAllLink
          ? _value.tncViewAllLink
          : tncViewAllLink // ignore: cast_nullable_to_non_nullable
              as String,
      displayRank: null == displayRank
          ? _value.displayRank
          : displayRank // ignore: cast_nullable_to_non_nullable
              as String,
      howToUse: null == howToUse
          ? _value.howToUse
          : howToUse // ignore: cast_nullable_to_non_nullable
              as List<String>,
      bookingConfirmedOfferText: null == bookingConfirmedOfferText
          ? _value.bookingConfirmedOfferText
          : bookingConfirmedOfferText // ignore: cast_nullable_to_non_nullable
              as String,
      bookingConfirmedOfferDescription: null == bookingConfirmedOfferDescription
          ? _value.bookingConfirmedOfferDescription
          : bookingConfirmedOfferDescription // ignore: cast_nullable_to_non_nullable
              as String,
      offerLogoDesktop: null == offerLogoDesktop
          ? _value.offerLogoDesktop
          : offerLogoDesktop // ignore: cast_nullable_to_non_nullable
              as String,
      offerLogoMobile: null == offerLogoMobile
          ? _value.offerLogoMobile
          : offerLogoMobile // ignore: cast_nullable_to_non_nullable
              as String,
      unlockOfferCTAText: null == unlockOfferCTAText
          ? _value.unlockOfferCTAText
          : unlockOfferCTAText // ignore: cast_nullable_to_non_nullable
              as String,
      UnlockOfferCTALink: null == UnlockOfferCTALink
          ? _value.UnlockOfferCTALink
          : UnlockOfferCTALink // ignore: cast_nullable_to_non_nullable
              as String,
      unlockOfferCTAVisitWesiteText: null == unlockOfferCTAVisitWesiteText
          ? _value.unlockOfferCTAVisitWesiteText
          : unlockOfferCTAVisitWesiteText // ignore: cast_nullable_to_non_nullable
              as String,
      unlockOfferCTAVisitWesiteLink: null == unlockOfferCTAVisitWesiteLink
          ? _value.unlockOfferCTAVisitWesiteLink
          : unlockOfferCTAVisitWesiteLink // ignore: cast_nullable_to_non_nullable
              as String,
      offerServicesRedirectionLink: null == offerServicesRedirectionLink
          ? _value.offerServicesRedirectionLink
          : offerServicesRedirectionLink // ignore: cast_nullable_to_non_nullable
              as String,
      isExpired: null == isExpired
          ? _value.isExpired
          : isExpired // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WidgetItem implements _WidgetItem {
  const _$_WidgetItem(
      {this.promotionType = '',
      this.promotionDescription = '',
      this.promotionCode = '',
      this.title = '',
      this.skuCode = '',
      this.offerType = '',
      this.displayText = '',
      this.effectiveFrom = '',
      this.effectiveTo = '',
      this.mobileImageSrc = '',
      this.thumbnailImageSrc = '',
      this.expiryOption = '',
      this.savings = '',
      this.apptype = '',
      this.extraImageSrc = '',
      this.linkURL = '',
      this.linkText = '',
      this.tcLinkAlt = '',
      this.validationType = '',
      this.currency = '',
      this.tcLinkUrl = '',
      this.bannerImageMobSrc = '',
      this.categoryFilter = '',
      this.promotionTypeLabel = '',
      this.tabTitle = '',
      this.offerTitle = '',
      this.bankOfferText = '',
      this.unlockOfferTitle = '',
      this.tcEnable = false,
      this.deepLinkAlt = '',
      this.offerUniqueID = '',
      this.termCondition = const [],
      this.isInstoreOffer = false,
      this.similarOffers = const [],
      this.tncViewAllLink = '',
      this.displayRank = '',
      this.howToUse = const [],
      this.bookingConfirmedOfferText = '',
      this.bookingConfirmedOfferDescription = '',
      this.offerLogoDesktop = '',
      this.offerLogoMobile = '',
      this.unlockOfferCTAText = '',
      this.UnlockOfferCTALink = '',
      this.unlockOfferCTAVisitWesiteText = '',
      this.unlockOfferCTAVisitWesiteLink = '',
      this.offerServicesRedirectionLink = '',
      this.isExpired = false});

  factory _$_WidgetItem.fromJson(Map<String, dynamic> json) =>
      _$$_WidgetItemFromJson(json);

  @override
  @JsonKey()
  final String promotionType;
  @override
  @JsonKey()
  final String promotionDescription;
  @override
  @JsonKey()
  final String promotionCode;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String skuCode;
  @override
  @JsonKey()
  final String offerType;
  @override
  @JsonKey()
  final String displayText;
  @override
  @JsonKey()
  final String effectiveFrom;
  @override
  @JsonKey()
  final String effectiveTo;
  @override
  @JsonKey()
  final String mobileImageSrc;
  @override
  @JsonKey()
  final String thumbnailImageSrc;
  @override
  @JsonKey()
  final String expiryOption;
  @override
  @JsonKey()
  final String savings;
  @override
  @JsonKey()
  final String apptype;
  @override
  @JsonKey()
  final String extraImageSrc;
  @override
  @JsonKey()
  final String linkURL;
  @override
  @JsonKey()
  final String linkText;
  @override
  @JsonKey()
  final String tcLinkAlt;
  @override
  @JsonKey()
  final String validationType;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey()
  final String tcLinkUrl;
  @override
  @JsonKey()
  final String bannerImageMobSrc;
  @override
  @JsonKey()
  final String categoryFilter;
  @override
  @JsonKey()
  final String promotionTypeLabel;
  @override
  @JsonKey()
  final String tabTitle;
  @override
  @JsonKey()
  final String offerTitle;
  @override
  @JsonKey()
  final String bankOfferText;
  @override
  @JsonKey()
  final String unlockOfferTitle;
  @override
  @JsonKey()
  final bool tcEnable;
  @override
  @JsonKey()
  final String deepLinkAlt;
  @override
  @JsonKey()
  final String offerUniqueID;
// @Default('') String terminalLocationType,
  @override
  @JsonKey()
  final List<String> termCondition;
  @override
  @JsonKey()
  final bool isInstoreOffer;
// @Default('') String terminalLocationType,
  @override
  @JsonKey()
  final List<String> similarOffers;
  @override
  @JsonKey()
  final String tncViewAllLink;
  @override
  @JsonKey()
  final String displayRank;
  @override
  @JsonKey()
  final List<String> howToUse;
  @override
  @JsonKey()
  final String bookingConfirmedOfferText;
  @override
  @JsonKey()
  final String bookingConfirmedOfferDescription;
  @override
  @JsonKey()
  final String offerLogoDesktop;
  @override
  @JsonKey()
  final String offerLogoMobile;
  @override
  @JsonKey()
  final String unlockOfferCTAText;
  @override
  @JsonKey()
  final String UnlockOfferCTALink;
  @override
  @JsonKey()
  final String unlockOfferCTAVisitWesiteText;
  @override
  @JsonKey()
  final String unlockOfferCTAVisitWesiteLink;
  @override
  @JsonKey()
  final String offerServicesRedirectionLink;
  @override
  @JsonKey()
  final bool isExpired;

  @override
  String toString() {
    return 'WidgetItem(promotionType: $promotionType, promotionDescription: $promotionDescription, promotionCode: $promotionCode, title: $title, skuCode: $skuCode, offerType: $offerType, displayText: $displayText, effectiveFrom: $effectiveFrom, effectiveTo: $effectiveTo, mobileImageSrc: $mobileImageSrc, thumbnailImageSrc: $thumbnailImageSrc, expiryOption: $expiryOption, savings: $savings, apptype: $apptype, extraImageSrc: $extraImageSrc, linkURL: $linkURL, linkText: $linkText, tcLinkAlt: $tcLinkAlt, validationType: $validationType, currency: $currency, tcLinkUrl: $tcLinkUrl, bannerImageMobSrc: $bannerImageMobSrc, categoryFilter: $categoryFilter, promotionTypeLabel: $promotionTypeLabel, tabTitle: $tabTitle, offerTitle: $offerTitle, bankOfferText: $bankOfferText, unlockOfferTitle: $unlockOfferTitle, tcEnable: $tcEnable, deepLinkAlt: $deepLinkAlt, offerUniqueID: $offerUniqueID, termCondition: $termCondition, isInstoreOffer: $isInstoreOffer, similarOffers: $similarOffers, tncViewAllLink: $tncViewAllLink, displayRank: $displayRank, howToUse: $howToUse, bookingConfirmedOfferText: $bookingConfirmedOfferText, bookingConfirmedOfferDescription: $bookingConfirmedOfferDescription, offerLogoDesktop: $offerLogoDesktop, offerLogoMobile: $offerLogoMobile, unlockOfferCTAText: $unlockOfferCTAText, UnlockOfferCTALink: $UnlockOfferCTALink, unlockOfferCTAVisitWesiteText: $unlockOfferCTAVisitWesiteText, unlockOfferCTAVisitWesiteLink: $unlockOfferCTAVisitWesiteLink, offerServicesRedirectionLink: $offerServicesRedirectionLink, isExpired: $isExpired)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WidgetItem &&
            (identical(other.promotionType, promotionType) ||
                other.promotionType == promotionType) &&
            (identical(other.promotionDescription, promotionDescription) ||
                other.promotionDescription == promotionDescription) &&
            (identical(other.promotionCode, promotionCode) ||
                other.promotionCode == promotionCode) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.skuCode, skuCode) || other.skuCode == skuCode) &&
            (identical(other.offerType, offerType) ||
                other.offerType == offerType) &&
            (identical(other.displayText, displayText) ||
                other.displayText == displayText) &&
            (identical(other.effectiveFrom, effectiveFrom) ||
                other.effectiveFrom == effectiveFrom) &&
            (identical(other.effectiveTo, effectiveTo) ||
                other.effectiveTo == effectiveTo) &&
            (identical(other.mobileImageSrc, mobileImageSrc) ||
                other.mobileImageSrc == mobileImageSrc) &&
            (identical(other.thumbnailImageSrc, thumbnailImageSrc) ||
                other.thumbnailImageSrc == thumbnailImageSrc) &&
            (identical(other.expiryOption, expiryOption) ||
                other.expiryOption == expiryOption) &&
            (identical(other.savings, savings) || other.savings == savings) &&
            (identical(other.apptype, apptype) || other.apptype == apptype) &&
            (identical(other.extraImageSrc, extraImageSrc) ||
                other.extraImageSrc == extraImageSrc) &&
            (identical(other.linkURL, linkURL) || other.linkURL == linkURL) &&
            (identical(other.linkText, linkText) ||
                other.linkText == linkText) &&
            (identical(other.tcLinkAlt, tcLinkAlt) ||
                other.tcLinkAlt == tcLinkAlt) &&
            (identical(other.validationType, validationType) ||
                other.validationType == validationType) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.tcLinkUrl, tcLinkUrl) ||
                other.tcLinkUrl == tcLinkUrl) &&
            (identical(other.bannerImageMobSrc, bannerImageMobSrc) ||
                other.bannerImageMobSrc == bannerImageMobSrc) &&
            (identical(other.categoryFilter, categoryFilter) ||
                other.categoryFilter == categoryFilter) &&
            (identical(other.promotionTypeLabel, promotionTypeLabel) ||
                other.promotionTypeLabel == promotionTypeLabel) &&
            (identical(other.tabTitle, tabTitle) ||
                other.tabTitle == tabTitle) &&
            (identical(other.offerTitle, offerTitle) ||
                other.offerTitle == offerTitle) &&
            (identical(other.bankOfferText, bankOfferText) ||
                other.bankOfferText == bankOfferText) &&
            (identical(other.unlockOfferTitle, unlockOfferTitle) ||
                other.unlockOfferTitle == unlockOfferTitle) &&
            (identical(other.tcEnable, tcEnable) ||
                other.tcEnable == tcEnable) &&
            (identical(other.deepLinkAlt, deepLinkAlt) ||
                other.deepLinkAlt == deepLinkAlt) &&
            (identical(other.offerUniqueID, offerUniqueID) ||
                other.offerUniqueID == offerUniqueID) &&
            const DeepCollectionEquality()
                .equals(other.termCondition, termCondition) &&
            (identical(other.isInstoreOffer, isInstoreOffer) ||
                other.isInstoreOffer == isInstoreOffer) &&
            const DeepCollectionEquality()
                .equals(other.similarOffers, similarOffers) &&
            (identical(other.tncViewAllLink, tncViewAllLink) ||
                other.tncViewAllLink == tncViewAllLink) &&
            (identical(other.displayRank, displayRank) ||
                other.displayRank == displayRank) &&
            const DeepCollectionEquality().equals(other.howToUse, howToUse) &&
            (identical(other.bookingConfirmedOfferText, bookingConfirmedOfferText) ||
                other.bookingConfirmedOfferText == bookingConfirmedOfferText) &&
            (identical(other.bookingConfirmedOfferDescription, bookingConfirmedOfferDescription) ||
                other.bookingConfirmedOfferDescription ==
                    bookingConfirmedOfferDescription) &&
            (identical(other.offerLogoDesktop, offerLogoDesktop) ||
                other.offerLogoDesktop == offerLogoDesktop) &&
            (identical(other.offerLogoMobile, offerLogoMobile) ||
                other.offerLogoMobile == offerLogoMobile) &&
            (identical(other.unlockOfferCTAText, unlockOfferCTAText) ||
                other.unlockOfferCTAText == unlockOfferCTAText) &&
            (identical(other.UnlockOfferCTALink, UnlockOfferCTALink) ||
                other.UnlockOfferCTALink == UnlockOfferCTALink) &&
            (identical(other.unlockOfferCTAVisitWesiteText, unlockOfferCTAVisitWesiteText) ||
                other.unlockOfferCTAVisitWesiteText ==
                    unlockOfferCTAVisitWesiteText) &&
            (identical(other.unlockOfferCTAVisitWesiteLink, unlockOfferCTAVisitWesiteLink) ||
                other.unlockOfferCTAVisitWesiteLink ==
                    unlockOfferCTAVisitWesiteLink) &&
            (identical(other.offerServicesRedirectionLink, offerServicesRedirectionLink) || other.offerServicesRedirectionLink == offerServicesRedirectionLink) &&
            (identical(other.isExpired, isExpired) || other.isExpired == isExpired));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        promotionType,
        promotionDescription,
        promotionCode,
        title,
        skuCode,
        offerType,
        displayText,
        effectiveFrom,
        effectiveTo,
        mobileImageSrc,
        thumbnailImageSrc,
        expiryOption,
        savings,
        apptype,
        extraImageSrc,
        linkURL,
        linkText,
        tcLinkAlt,
        validationType,
        currency,
        tcLinkUrl,
        bannerImageMobSrc,
        categoryFilter,
        promotionTypeLabel,
        tabTitle,
        offerTitle,
        bankOfferText,
        unlockOfferTitle,
        tcEnable,
        deepLinkAlt,
        offerUniqueID,
        const DeepCollectionEquality().hash(termCondition),
        isInstoreOffer,
        const DeepCollectionEquality().hash(similarOffers),
        tncViewAllLink,
        displayRank,
        const DeepCollectionEquality().hash(howToUse),
        bookingConfirmedOfferText,
        bookingConfirmedOfferDescription,
        offerLogoDesktop,
        offerLogoMobile,
        unlockOfferCTAText,
        UnlockOfferCTALink,
        unlockOfferCTAVisitWesiteText,
        unlockOfferCTAVisitWesiteLink,
        offerServicesRedirectionLink,
        isExpired
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
      {final String promotionType,
      final String promotionDescription,
      final String promotionCode,
      final String title,
      final String skuCode,
      final String offerType,
      final String displayText,
      final String effectiveFrom,
      final String effectiveTo,
      final String mobileImageSrc,
      final String thumbnailImageSrc,
      final String expiryOption,
      final String savings,
      final String apptype,
      final String extraImageSrc,
      final String linkURL,
      final String linkText,
      final String tcLinkAlt,
      final String validationType,
      final String currency,
      final String tcLinkUrl,
      final String bannerImageMobSrc,
      final String categoryFilter,
      final String promotionTypeLabel,
      final String tabTitle,
      final String offerTitle,
      final String bankOfferText,
      final String unlockOfferTitle,
      final bool tcEnable,
      final String deepLinkAlt,
      final String offerUniqueID,
      final List<String> termCondition,
      final bool isInstoreOffer,
      final List<String> similarOffers,
      final String tncViewAllLink,
      final String displayRank,
      final List<String> howToUse,
      final String bookingConfirmedOfferText,
      final String bookingConfirmedOfferDescription,
      final String offerLogoDesktop,
      final String offerLogoMobile,
      final String unlockOfferCTAText,
      final String UnlockOfferCTALink,
      final String unlockOfferCTAVisitWesiteText,
      final String unlockOfferCTAVisitWesiteLink,
      final String offerServicesRedirectionLink,
      final bool isExpired}) = _$_WidgetItem;

  factory _WidgetItem.fromJson(Map<String, dynamic> json) =
      _$_WidgetItem.fromJson;

  @override
  String get promotionType;
  @override
  String get promotionDescription;
  @override
  String get promotionCode;
  @override
  String get title;
  @override
  String get skuCode;
  @override
  String get offerType;
  @override
  String get displayText;
  @override
  String get effectiveFrom;
  @override
  String get effectiveTo;
  @override
  String get mobileImageSrc;
  @override
  String get thumbnailImageSrc;
  @override
  String get expiryOption;
  @override
  String get savings;
  @override
  String get apptype;
  @override
  String get extraImageSrc;
  @override
  String get linkURL;
  @override
  String get linkText;
  @override
  String get tcLinkAlt;
  @override
  String get validationType;
  @override
  String get currency;
  @override
  String get tcLinkUrl;
  @override
  String get bannerImageMobSrc;
  @override
  String get categoryFilter;
  @override
  String get promotionTypeLabel;
  @override
  String get tabTitle;
  @override
  String get offerTitle;
  @override
  String get bankOfferText;
  @override
  String get unlockOfferTitle;
  @override
  bool get tcEnable;
  @override
  String get deepLinkAlt;
  @override
  String get offerUniqueID;
  @override // @Default('') String terminalLocationType,
  List<String> get termCondition;
  @override
  bool get isInstoreOffer;
  @override // @Default('') String terminalLocationType,
  List<String> get similarOffers;
  @override
  String get tncViewAllLink;
  @override
  String get displayRank;
  @override
  List<String> get howToUse;
  @override
  String get bookingConfirmedOfferText;
  @override
  String get bookingConfirmedOfferDescription;
  @override
  String get offerLogoDesktop;
  @override
  String get offerLogoMobile;
  @override
  String get unlockOfferCTAText;
  @override
  String get UnlockOfferCTALink;
  @override
  String get unlockOfferCTAVisitWesiteText;
  @override
  String get unlockOfferCTAVisitWesiteLink;
  @override
  String get offerServicesRedirectionLink;
  @override
  bool get isExpired;
  @override
  @JsonKey(ignore: true)
  _$$_WidgetItemCopyWith<_$_WidgetItem> get copyWith =>
      throw _privateConstructorUsedError;
}

Params _$ParamsFromJson(Map<String, dynamic> json) {
  return _Params.fromJson(json);
}

/// @nodoc
mixin _$Params {
  String get widget => throw _privateConstructorUsedError;
  String get widgetName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParamsCopyWith<Params> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParamsCopyWith<$Res> {
  factory $ParamsCopyWith(Params value, $Res Function(Params) then) =
      _$ParamsCopyWithImpl<$Res, Params>;
  @useResult
  $Res call({String widget, String widgetName});
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
    Object? widgetName = null,
  }) {
    return _then(_value.copyWith(
      widget: null == widget
          ? _value.widget
          : widget // ignore: cast_nullable_to_non_nullable
              as String,
      widgetName: null == widgetName
          ? _value.widgetName
          : widgetName // ignore: cast_nullable_to_non_nullable
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
  $Res call({String widget, String widgetName});
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
    Object? widgetName = null,
  }) {
    return _then(_$_Params(
      widget: null == widget
          ? _value.widget
          : widget // ignore: cast_nullable_to_non_nullable
              as String,
      widgetName: null == widgetName
          ? _value.widgetName
          : widgetName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Params implements _Params {
  const _$_Params({this.widget = '', this.widgetName = ''});

  factory _$_Params.fromJson(Map<String, dynamic> json) =>
      _$$_ParamsFromJson(json);

  @override
  @JsonKey()
  final String widget;
  @override
  @JsonKey()
  final String widgetName;

  @override
  String toString() {
    return 'Params(widget: $widget, widgetName: $widgetName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Params &&
            (identical(other.widget, widget) || other.widget == widget) &&
            (identical(other.widgetName, widgetName) ||
                other.widgetName == widgetName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, widget, widgetName);

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
  const factory _Params({final String widget, final String widgetName}) =
      _$_Params;

  factory _Params.fromJson(Map<String, dynamic> json) = _$_Params.fromJson;

  @override
  String get widget;
  @override
  String get widgetName;
  @override
  @JsonKey(ignore: true)
  _$$_ParamsCopyWith<_$_Params> get copyWith =>
      throw _privateConstructorUsedError;
}
