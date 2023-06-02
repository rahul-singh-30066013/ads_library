// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loyalty_dashboard_site_core_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoyaltyDashboardSiteCoreResponse _$LoyaltyDashboardSiteCoreResponseFromJson(
    Map<String, dynamic> json) {
  return _LoyaltyDashboardSiteCoreResponse.fromJson(json);
}

/// @nodoc
mixin _$LoyaltyDashboardSiteCoreResponse {
  String get name => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  List<Elements> get elements => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoyaltyDashboardSiteCoreResponseCopyWith<LoyaltyDashboardSiteCoreResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyDashboardSiteCoreResponseCopyWith<$Res> {
  factory $LoyaltyDashboardSiteCoreResponseCopyWith(
          LoyaltyDashboardSiteCoreResponse value,
          $Res Function(LoyaltyDashboardSiteCoreResponse) then) =
      _$LoyaltyDashboardSiteCoreResponseCopyWithImpl<$Res,
          LoyaltyDashboardSiteCoreResponse>;
  @useResult
  $Res call({String name, String path, List<Elements> elements});
}

/// @nodoc
class _$LoyaltyDashboardSiteCoreResponseCopyWithImpl<$Res,
        $Val extends LoyaltyDashboardSiteCoreResponse>
    implements $LoyaltyDashboardSiteCoreResponseCopyWith<$Res> {
  _$LoyaltyDashboardSiteCoreResponseCopyWithImpl(this._value, this._then);

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
abstract class _$$_LoyaltyDashboardSiteCoreResponseCopyWith<$Res>
    implements $LoyaltyDashboardSiteCoreResponseCopyWith<$Res> {
  factory _$$_LoyaltyDashboardSiteCoreResponseCopyWith(
          _$_LoyaltyDashboardSiteCoreResponse value,
          $Res Function(_$_LoyaltyDashboardSiteCoreResponse) then) =
      __$$_LoyaltyDashboardSiteCoreResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String path, List<Elements> elements});
}

/// @nodoc
class __$$_LoyaltyDashboardSiteCoreResponseCopyWithImpl<$Res>
    extends _$LoyaltyDashboardSiteCoreResponseCopyWithImpl<$Res,
        _$_LoyaltyDashboardSiteCoreResponse>
    implements _$$_LoyaltyDashboardSiteCoreResponseCopyWith<$Res> {
  __$$_LoyaltyDashboardSiteCoreResponseCopyWithImpl(
      _$_LoyaltyDashboardSiteCoreResponse _value,
      $Res Function(_$_LoyaltyDashboardSiteCoreResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? path = null,
    Object? elements = null,
  }) {
    return _then(_$_LoyaltyDashboardSiteCoreResponse(
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
class _$_LoyaltyDashboardSiteCoreResponse
    implements _LoyaltyDashboardSiteCoreResponse {
  const _$_LoyaltyDashboardSiteCoreResponse(
      {this.name = '', this.path = '', this.elements = const []});

  factory _$_LoyaltyDashboardSiteCoreResponse.fromJson(
          Map<String, dynamic> json) =>
      _$$_LoyaltyDashboardSiteCoreResponseFromJson(json);

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
    return 'LoyaltyDashboardSiteCoreResponse(name: $name, path: $path, elements: $elements)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoyaltyDashboardSiteCoreResponse &&
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
  _$$_LoyaltyDashboardSiteCoreResponseCopyWith<
          _$_LoyaltyDashboardSiteCoreResponse>
      get copyWith => __$$_LoyaltyDashboardSiteCoreResponseCopyWithImpl<
          _$_LoyaltyDashboardSiteCoreResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoyaltyDashboardSiteCoreResponseToJson(
      this,
    );
  }
}

abstract class _LoyaltyDashboardSiteCoreResponse
    implements LoyaltyDashboardSiteCoreResponse {
  const factory _LoyaltyDashboardSiteCoreResponse(
      {final String name,
      final String path,
      final List<Elements> elements}) = _$_LoyaltyDashboardSiteCoreResponse;

  factory _LoyaltyDashboardSiteCoreResponse.fromJson(
      Map<String, dynamic> json) = _$_LoyaltyDashboardSiteCoreResponse.fromJson;

  @override
  String get name;
  @override
  String get path;
  @override
  List<Elements> get elements;
  @override
  @JsonKey(ignore: true)
  _$$_LoyaltyDashboardSiteCoreResponseCopyWith<
          _$_LoyaltyDashboardSiteCoreResponse>
      get copyWith => throw _privateConstructorUsedError;
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
  List<ContentList> get contentList => throw _privateConstructorUsedError;
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
      List<ContentList> contentList,
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
    Object? contentList = null,
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
      contentList: null == contentList
          ? _value.contentList
          : contentList // ignore: cast_nullable_to_non_nullable
              as List<ContentList>,
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
      List<ContentList> contentList,
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
    Object? contentList = null,
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
      contentList: null == contentList
          ? _value.contentList
          : contentList // ignore: cast_nullable_to_non_nullable
              as List<ContentList>,
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
      this.contentList = const [],
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
  final List<ContentList> contentList;
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
    return 'Fields(widget: $widget, contentList: $contentList, title: $title, list: $list, ctaText: $ctaText, ctaURL: $ctaURL, faqHTML: $faqHTML)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fields &&
            (identical(other.widget, widget) || other.widget == widget) &&
            const DeepCollectionEquality()
                .equals(other.contentList, contentList) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other.list, list) &&
            (identical(other.ctaText, ctaText) || other.ctaText == ctaText) &&
            (identical(other.ctaURL, ctaURL) || other.ctaURL == ctaURL) &&
            (identical(other.faqHTML, faqHTML) || other.faqHTML == faqHTML));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      widget,
      const DeepCollectionEquality().hash(contentList),
      title,
      const DeepCollectionEquality().hash(list),
      ctaText,
      ctaURL,
      faqHTML);

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
      final List<ContentList> contentList,
      final String title,
      final List<ListElement> list,
      final String ctaText,
      final String ctaURL,
      final String faqHTML}) = _$_Fields;

  factory _Fields.fromJson(Map<String, dynamic> json) = _$_Fields.fromJson;

  @override
  DashboardItem get widget;
  @override
  List<ContentList> get contentList;
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
  List<String> get links => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LinesCopyWith<Lines> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinesCopyWith<$Res> {
  factory $LinesCopyWith(Lines value, $Res Function(Lines) then) =
      _$LinesCopyWithImpl<$Res, Lines>;
  @useResult
  $Res call({String line, List<String> links});
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
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LinesCopyWith<$Res> implements $LinesCopyWith<$Res> {
  factory _$$_LinesCopyWith(_$_Lines value, $Res Function(_$_Lines) then) =
      __$$_LinesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String line, List<String> links});
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
              as List<String>,
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
  final List<String> links;

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
  const factory _Lines({final String line, final List<String> links}) =
      _$_Lines;

  factory _Lines.fromJson(Map<String, dynamic> json) = _$_Lines.fromJson;

  @override
  String get line;
  @override
  List<String> get links;
  @override
  @JsonKey(ignore: true)
  _$$_LinesCopyWith<_$_Lines> get copyWith =>
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
  ActionTitle get actionTitle =>
      throw _privateConstructorUsedError; //@Default('') String carouselParam,
//@Default('') String tagName,
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
//@Default('') String carouselParam,
//@Default('') String tagName,
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
  @override //@Default('') String carouselParam,
//@Default('') String tagName,
  List<WidgetItem> get widgetItems;
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
  String get apiUrl => throw _privateConstructorUsedError;
  bool get popular => throw _privateConstructorUsedError;
  bool get newArrival => throw _privateConstructorUsedError;
  bool get showOnHomepage => throw _privateConstructorUsedError;
  String get webImage => throw _privateConstructorUsedError;
  String get thumbnailImage => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get airportName => throw _privateConstructorUsedError;
  String get imageSrc => throw _privateConstructorUsedError;
  String get imageAlt => throw _privateConstructorUsedError;
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
  String get mobileImage => throw _privateConstructorUsedError;
  String get mobileImageSrc => throw _privateConstructorUsedError;
  String get rewardType => throw _privateConstructorUsedError;
  String get posterImage => throw _privateConstructorUsedError;
  List<RewardList> get rewardList => throw _privateConstructorUsedError;
  List<String> get list => throw _privateConstructorUsedError;
  String get descriptionApp => throw _privateConstructorUsedError;
  String get appImageSrc => throw _privateConstructorUsedError;
  String get rewardUniqueId => throw _privateConstructorUsedError;
  List<DutyFreeProductDataModel> get productDatas =>
      throw _privateConstructorUsedError;
  List<TableData> get tableData => throw _privateConstructorUsedError;
  String get buttonText => throw _privateConstructorUsedError;

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
      {String apiUrl,
      bool popular,
      bool newArrival,
      bool showOnHomepage,
      String webImage,
      String thumbnailImage,
      String title,
      String airportName,
      String imageSrc,
      String imageAlt,
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
      String mobileImage,
      String mobileImageSrc,
      String rewardType,
      String posterImage,
      List<RewardList> rewardList,
      List<String> list,
      String descriptionApp,
      String appImageSrc,
      String rewardUniqueId,
      List<DutyFreeProductDataModel> productDatas,
      List<TableData> tableData,
      String buttonText});
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
    Object? apiUrl = null,
    Object? popular = null,
    Object? newArrival = null,
    Object? showOnHomepage = null,
    Object? webImage = null,
    Object? thumbnailImage = null,
    Object? title = null,
    Object? airportName = null,
    Object? imageSrc = null,
    Object? imageAlt = null,
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
    Object? mobileImage = null,
    Object? mobileImageSrc = null,
    Object? rewardType = null,
    Object? posterImage = null,
    Object? rewardList = null,
    Object? list = null,
    Object? descriptionApp = null,
    Object? appImageSrc = null,
    Object? rewardUniqueId = null,
    Object? productDatas = null,
    Object? tableData = null,
    Object? buttonText = null,
  }) {
    return _then(_value.copyWith(
      apiUrl: null == apiUrl
          ? _value.apiUrl
          : apiUrl // ignore: cast_nullable_to_non_nullable
              as String,
      popular: null == popular
          ? _value.popular
          : popular // ignore: cast_nullable_to_non_nullable
              as bool,
      newArrival: null == newArrival
          ? _value.newArrival
          : newArrival // ignore: cast_nullable_to_non_nullable
              as bool,
      showOnHomepage: null == showOnHomepage
          ? _value.showOnHomepage
          : showOnHomepage // ignore: cast_nullable_to_non_nullable
              as bool,
      webImage: null == webImage
          ? _value.webImage
          : webImage // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailImage: null == thumbnailImage
          ? _value.thumbnailImage
          : thumbnailImage // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      airportName: null == airportName
          ? _value.airportName
          : airportName // ignore: cast_nullable_to_non_nullable
              as String,
      imageSrc: null == imageSrc
          ? _value.imageSrc
          : imageSrc // ignore: cast_nullable_to_non_nullable
              as String,
      imageAlt: null == imageAlt
          ? _value.imageAlt
          : imageAlt // ignore: cast_nullable_to_non_nullable
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
      mobileImage: null == mobileImage
          ? _value.mobileImage
          : mobileImage // ignore: cast_nullable_to_non_nullable
              as String,
      mobileImageSrc: null == mobileImageSrc
          ? _value.mobileImageSrc
          : mobileImageSrc // ignore: cast_nullable_to_non_nullable
              as String,
      rewardType: null == rewardType
          ? _value.rewardType
          : rewardType // ignore: cast_nullable_to_non_nullable
              as String,
      posterImage: null == posterImage
          ? _value.posterImage
          : posterImage // ignore: cast_nullable_to_non_nullable
              as String,
      rewardList: null == rewardList
          ? _value.rewardList
          : rewardList // ignore: cast_nullable_to_non_nullable
              as List<RewardList>,
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<String>,
      descriptionApp: null == descriptionApp
          ? _value.descriptionApp
          : descriptionApp // ignore: cast_nullable_to_non_nullable
              as String,
      appImageSrc: null == appImageSrc
          ? _value.appImageSrc
          : appImageSrc // ignore: cast_nullable_to_non_nullable
              as String,
      rewardUniqueId: null == rewardUniqueId
          ? _value.rewardUniqueId
          : rewardUniqueId // ignore: cast_nullable_to_non_nullable
              as String,
      productDatas: null == productDatas
          ? _value.productDatas
          : productDatas // ignore: cast_nullable_to_non_nullable
              as List<DutyFreeProductDataModel>,
      tableData: null == tableData
          ? _value.tableData
          : tableData // ignore: cast_nullable_to_non_nullable
              as List<TableData>,
      buttonText: null == buttonText
          ? _value.buttonText
          : buttonText // ignore: cast_nullable_to_non_nullable
              as String,
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
      {String apiUrl,
      bool popular,
      bool newArrival,
      bool showOnHomepage,
      String webImage,
      String thumbnailImage,
      String title,
      String airportName,
      String imageSrc,
      String imageAlt,
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
      String mobileImage,
      String mobileImageSrc,
      String rewardType,
      String posterImage,
      List<RewardList> rewardList,
      List<String> list,
      String descriptionApp,
      String appImageSrc,
      String rewardUniqueId,
      List<DutyFreeProductDataModel> productDatas,
      List<TableData> tableData,
      String buttonText});
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
    Object? apiUrl = null,
    Object? popular = null,
    Object? newArrival = null,
    Object? showOnHomepage = null,
    Object? webImage = null,
    Object? thumbnailImage = null,
    Object? title = null,
    Object? airportName = null,
    Object? imageSrc = null,
    Object? imageAlt = null,
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
    Object? mobileImage = null,
    Object? mobileImageSrc = null,
    Object? rewardType = null,
    Object? posterImage = null,
    Object? rewardList = null,
    Object? list = null,
    Object? descriptionApp = null,
    Object? appImageSrc = null,
    Object? rewardUniqueId = null,
    Object? productDatas = null,
    Object? tableData = null,
    Object? buttonText = null,
  }) {
    return _then(_$_WidgetItem(
      apiUrl: null == apiUrl
          ? _value.apiUrl
          : apiUrl // ignore: cast_nullable_to_non_nullable
              as String,
      popular: null == popular
          ? _value.popular
          : popular // ignore: cast_nullable_to_non_nullable
              as bool,
      newArrival: null == newArrival
          ? _value.newArrival
          : newArrival // ignore: cast_nullable_to_non_nullable
              as bool,
      showOnHomepage: null == showOnHomepage
          ? _value.showOnHomepage
          : showOnHomepage // ignore: cast_nullable_to_non_nullable
              as bool,
      webImage: null == webImage
          ? _value.webImage
          : webImage // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailImage: null == thumbnailImage
          ? _value.thumbnailImage
          : thumbnailImage // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      airportName: null == airportName
          ? _value.airportName
          : airportName // ignore: cast_nullable_to_non_nullable
              as String,
      imageSrc: null == imageSrc
          ? _value.imageSrc
          : imageSrc // ignore: cast_nullable_to_non_nullable
              as String,
      imageAlt: null == imageAlt
          ? _value.imageAlt
          : imageAlt // ignore: cast_nullable_to_non_nullable
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
      mobileImage: null == mobileImage
          ? _value.mobileImage
          : mobileImage // ignore: cast_nullable_to_non_nullable
              as String,
      mobileImageSrc: null == mobileImageSrc
          ? _value.mobileImageSrc
          : mobileImageSrc // ignore: cast_nullable_to_non_nullable
              as String,
      rewardType: null == rewardType
          ? _value.rewardType
          : rewardType // ignore: cast_nullable_to_non_nullable
              as String,
      posterImage: null == posterImage
          ? _value.posterImage
          : posterImage // ignore: cast_nullable_to_non_nullable
              as String,
      rewardList: null == rewardList
          ? _value.rewardList
          : rewardList // ignore: cast_nullable_to_non_nullable
              as List<RewardList>,
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<String>,
      descriptionApp: null == descriptionApp
          ? _value.descriptionApp
          : descriptionApp // ignore: cast_nullable_to_non_nullable
              as String,
      appImageSrc: null == appImageSrc
          ? _value.appImageSrc
          : appImageSrc // ignore: cast_nullable_to_non_nullable
              as String,
      rewardUniqueId: null == rewardUniqueId
          ? _value.rewardUniqueId
          : rewardUniqueId // ignore: cast_nullable_to_non_nullable
              as String,
      productDatas: null == productDatas
          ? _value.productDatas
          : productDatas // ignore: cast_nullable_to_non_nullable
              as List<DutyFreeProductDataModel>,
      tableData: null == tableData
          ? _value.tableData
          : tableData // ignore: cast_nullable_to_non_nullable
              as List<TableData>,
      buttonText: null == buttonText
          ? _value.buttonText
          : buttonText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WidgetItem implements _WidgetItem {
  const _$_WidgetItem(
      {this.apiUrl = '',
      this.popular = false,
      this.newArrival = false,
      this.showOnHomepage = false,
      this.webImage = '',
      this.thumbnailImage = '',
      this.title = '',
      this.airportName = '',
      this.imageSrc = '',
      this.imageAlt = '',
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
      this.mobileImage = '',
      this.mobileImageSrc = '',
      this.rewardType = '',
      this.posterImage = '',
      this.rewardList = const [],
      this.list = const [],
      this.descriptionApp = '',
      this.appImageSrc = '',
      this.rewardUniqueId = '',
      this.productDatas = const [],
      this.tableData = const [],
      this.buttonText = ''});

  factory _$_WidgetItem.fromJson(Map<String, dynamic> json) =>
      _$$_WidgetItemFromJson(json);

  @override
  @JsonKey()
  final String apiUrl;
  @override
  @JsonKey()
  final bool popular;
  @override
  @JsonKey()
  final bool newArrival;
  @override
  @JsonKey()
  final bool showOnHomepage;
  @override
  @JsonKey()
  final String webImage;
  @override
  @JsonKey()
  final String thumbnailImage;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String airportName;
  @override
  @JsonKey()
  final String imageSrc;
  @override
  @JsonKey()
  final String imageAlt;
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
  final String mobileImage;
  @override
  @JsonKey()
  final String mobileImageSrc;
  @override
  @JsonKey()
  final String rewardType;
  @override
  @JsonKey()
  final String posterImage;
  @override
  @JsonKey()
  final List<RewardList> rewardList;
  @override
  @JsonKey()
  final List<String> list;
  @override
  @JsonKey()
  final String descriptionApp;
  @override
  @JsonKey()
  final String appImageSrc;
  @override
  @JsonKey()
  final String rewardUniqueId;
  @override
  @JsonKey()
  final List<DutyFreeProductDataModel> productDatas;
  @override
  @JsonKey()
  final List<TableData> tableData;
  @override
  @JsonKey()
  final String buttonText;

  @override
  String toString() {
    return 'WidgetItem(apiUrl: $apiUrl, popular: $popular, newArrival: $newArrival, showOnHomepage: $showOnHomepage, webImage: $webImage, thumbnailImage: $thumbnailImage, title: $title, airportName: $airportName, imageSrc: $imageSrc, imageAlt: $imageAlt, description: $description, ctaLink: $ctaLink, ctaText: $ctaText, deepLink: $deepLink, subTitle: $subTitle, materialGroup: $materialGroup, category: $category, subCategory: $subCategory, brand: $brand, storeType: $storeType, restricted: $restricted, mobileImage: $mobileImage, mobileImageSrc: $mobileImageSrc, rewardType: $rewardType, posterImage: $posterImage, rewardList: $rewardList, list: $list, descriptionApp: $descriptionApp, appImageSrc: $appImageSrc, rewardUniqueId: $rewardUniqueId, productDatas: $productDatas, tableData: $tableData, buttonText: $buttonText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WidgetItem &&
            (identical(other.apiUrl, apiUrl) || other.apiUrl == apiUrl) &&
            (identical(other.popular, popular) || other.popular == popular) &&
            (identical(other.newArrival, newArrival) ||
                other.newArrival == newArrival) &&
            (identical(other.showOnHomepage, showOnHomepage) ||
                other.showOnHomepage == showOnHomepage) &&
            (identical(other.webImage, webImage) ||
                other.webImage == webImage) &&
            (identical(other.thumbnailImage, thumbnailImage) ||
                other.thumbnailImage == thumbnailImage) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.airportName, airportName) ||
                other.airportName == airportName) &&
            (identical(other.imageSrc, imageSrc) ||
                other.imageSrc == imageSrc) &&
            (identical(other.imageAlt, imageAlt) ||
                other.imageAlt == imageAlt) &&
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
            (identical(other.mobileImage, mobileImage) ||
                other.mobileImage == mobileImage) &&
            (identical(other.mobileImageSrc, mobileImageSrc) ||
                other.mobileImageSrc == mobileImageSrc) &&
            (identical(other.rewardType, rewardType) ||
                other.rewardType == rewardType) &&
            (identical(other.posterImage, posterImage) ||
                other.posterImage == posterImage) &&
            const DeepCollectionEquality()
                .equals(other.rewardList, rewardList) &&
            const DeepCollectionEquality().equals(other.list, list) &&
            (identical(other.descriptionApp, descriptionApp) ||
                other.descriptionApp == descriptionApp) &&
            (identical(other.appImageSrc, appImageSrc) ||
                other.appImageSrc == appImageSrc) &&
            (identical(other.rewardUniqueId, rewardUniqueId) ||
                other.rewardUniqueId == rewardUniqueId) &&
            const DeepCollectionEquality()
                .equals(other.productDatas, productDatas) &&
            const DeepCollectionEquality().equals(other.tableData, tableData) &&
            (identical(other.buttonText, buttonText) ||
                other.buttonText == buttonText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        apiUrl,
        popular,
        newArrival,
        showOnHomepage,
        webImage,
        thumbnailImage,
        title,
        airportName,
        imageSrc,
        imageAlt,
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
        mobileImage,
        mobileImageSrc,
        rewardType,
        posterImage,
        const DeepCollectionEquality().hash(rewardList),
        const DeepCollectionEquality().hash(list),
        descriptionApp,
        appImageSrc,
        rewardUniqueId,
        const DeepCollectionEquality().hash(productDatas),
        const DeepCollectionEquality().hash(tableData),
        buttonText
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
      {final String apiUrl,
      final bool popular,
      final bool newArrival,
      final bool showOnHomepage,
      final String webImage,
      final String thumbnailImage,
      final String title,
      final String airportName,
      final String imageSrc,
      final String imageAlt,
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
      final String mobileImage,
      final String mobileImageSrc,
      final String rewardType,
      final String posterImage,
      final List<RewardList> rewardList,
      final List<String> list,
      final String descriptionApp,
      final String appImageSrc,
      final String rewardUniqueId,
      final List<DutyFreeProductDataModel> productDatas,
      final List<TableData> tableData,
      final String buttonText}) = _$_WidgetItem;

  factory _WidgetItem.fromJson(Map<String, dynamic> json) =
      _$_WidgetItem.fromJson;

  @override
  String get apiUrl;
  @override
  bool get popular;
  @override
  bool get newArrival;
  @override
  bool get showOnHomepage;
  @override
  String get webImage;
  @override
  String get thumbnailImage;
  @override
  String get title;
  @override
  String get airportName;
  @override
  String get imageSrc;
  @override
  String get imageAlt;
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
  String get mobileImage;
  @override
  String get mobileImageSrc;
  @override
  String get rewardType;
  @override
  String get posterImage;
  @override
  List<RewardList> get rewardList;
  @override
  List<String> get list;
  @override
  String get descriptionApp;
  @override
  String get appImageSrc;
  @override
  String get rewardUniqueId;
  @override
  List<DutyFreeProductDataModel> get productDatas;
  @override
  List<TableData> get tableData;
  @override
  String get buttonText;
  @override
  @JsonKey(ignore: true)
  _$$_WidgetItemCopyWith<_$_WidgetItem> get copyWith =>
      throw _privateConstructorUsedError;
}

TableData _$TableDataFromJson(Map<String, dynamic> json) {
  return _TableData.fromJson(json);
}

/// @nodoc
mixin _$TableData {
  String get rowTitle => throw _privateConstructorUsedError;
  ColumnData get column => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TableDataCopyWith<TableData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TableDataCopyWith<$Res> {
  factory $TableDataCopyWith(TableData value, $Res Function(TableData) then) =
      _$TableDataCopyWithImpl<$Res, TableData>;
  @useResult
  $Res call({String rowTitle, ColumnData column});

  $ColumnDataCopyWith<$Res> get column;
}

/// @nodoc
class _$TableDataCopyWithImpl<$Res, $Val extends TableData>
    implements $TableDataCopyWith<$Res> {
  _$TableDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rowTitle = null,
    Object? column = null,
  }) {
    return _then(_value.copyWith(
      rowTitle: null == rowTitle
          ? _value.rowTitle
          : rowTitle // ignore: cast_nullable_to_non_nullable
              as String,
      column: null == column
          ? _value.column
          : column // ignore: cast_nullable_to_non_nullable
              as ColumnData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ColumnDataCopyWith<$Res> get column {
    return $ColumnDataCopyWith<$Res>(_value.column, (value) {
      return _then(_value.copyWith(column: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TableDataCopyWith<$Res> implements $TableDataCopyWith<$Res> {
  factory _$$_TableDataCopyWith(
          _$_TableData value, $Res Function(_$_TableData) then) =
      __$$_TableDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String rowTitle, ColumnData column});

  @override
  $ColumnDataCopyWith<$Res> get column;
}

/// @nodoc
class __$$_TableDataCopyWithImpl<$Res>
    extends _$TableDataCopyWithImpl<$Res, _$_TableData>
    implements _$$_TableDataCopyWith<$Res> {
  __$$_TableDataCopyWithImpl(
      _$_TableData _value, $Res Function(_$_TableData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rowTitle = null,
    Object? column = null,
  }) {
    return _then(_$_TableData(
      rowTitle: null == rowTitle
          ? _value.rowTitle
          : rowTitle // ignore: cast_nullable_to_non_nullable
              as String,
      column: null == column
          ? _value.column
          : column // ignore: cast_nullable_to_non_nullable
              as ColumnData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TableData implements _TableData {
  const _$_TableData({this.rowTitle = '', this.column = const ColumnData()});

  factory _$_TableData.fromJson(Map<String, dynamic> json) =>
      _$$_TableDataFromJson(json);

  @override
  @JsonKey()
  final String rowTitle;
  @override
  @JsonKey()
  final ColumnData column;

  @override
  String toString() {
    return 'TableData(rowTitle: $rowTitle, column: $column)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TableData &&
            (identical(other.rowTitle, rowTitle) ||
                other.rowTitle == rowTitle) &&
            (identical(other.column, column) || other.column == column));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, rowTitle, column);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TableDataCopyWith<_$_TableData> get copyWith =>
      __$$_TableDataCopyWithImpl<_$_TableData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TableDataToJson(
      this,
    );
  }
}

abstract class _TableData implements TableData {
  const factory _TableData({final String rowTitle, final ColumnData column}) =
      _$_TableData;

  factory _TableData.fromJson(Map<String, dynamic> json) =
      _$_TableData.fromJson;

  @override
  String get rowTitle;
  @override
  ColumnData get column;
  @override
  @JsonKey(ignore: true)
  _$$_TableDataCopyWith<_$_TableData> get copyWith =>
      throw _privateConstructorUsedError;
}

ColumnData _$ColumnDataFromJson(Map<String, dynamic> json) {
  return _ColumnData.fromJson(json);
}

/// @nodoc
mixin _$ColumnData {
  List<String> get columnValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ColumnDataCopyWith<ColumnData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColumnDataCopyWith<$Res> {
  factory $ColumnDataCopyWith(
          ColumnData value, $Res Function(ColumnData) then) =
      _$ColumnDataCopyWithImpl<$Res, ColumnData>;
  @useResult
  $Res call({List<String> columnValue});
}

/// @nodoc
class _$ColumnDataCopyWithImpl<$Res, $Val extends ColumnData>
    implements $ColumnDataCopyWith<$Res> {
  _$ColumnDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? columnValue = null,
  }) {
    return _then(_value.copyWith(
      columnValue: null == columnValue
          ? _value.columnValue
          : columnValue // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ColumnDataCopyWith<$Res>
    implements $ColumnDataCopyWith<$Res> {
  factory _$$_ColumnDataCopyWith(
          _$_ColumnData value, $Res Function(_$_ColumnData) then) =
      __$$_ColumnDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> columnValue});
}

/// @nodoc
class __$$_ColumnDataCopyWithImpl<$Res>
    extends _$ColumnDataCopyWithImpl<$Res, _$_ColumnData>
    implements _$$_ColumnDataCopyWith<$Res> {
  __$$_ColumnDataCopyWithImpl(
      _$_ColumnData _value, $Res Function(_$_ColumnData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? columnValue = null,
  }) {
    return _then(_$_ColumnData(
      columnValue: null == columnValue
          ? _value.columnValue
          : columnValue // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ColumnData implements _ColumnData {
  const _$_ColumnData({this.columnValue = const []});

  factory _$_ColumnData.fromJson(Map<String, dynamic> json) =>
      _$$_ColumnDataFromJson(json);

  @override
  @JsonKey()
  final List<String> columnValue;

  @override
  String toString() {
    return 'ColumnData(columnValue: $columnValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ColumnData &&
            const DeepCollectionEquality()
                .equals(other.columnValue, columnValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(columnValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ColumnDataCopyWith<_$_ColumnData> get copyWith =>
      __$$_ColumnDataCopyWithImpl<_$_ColumnData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ColumnDataToJson(
      this,
    );
  }
}

abstract class _ColumnData implements ColumnData {
  const factory _ColumnData({final List<String> columnValue}) = _$_ColumnData;

  factory _ColumnData.fromJson(Map<String, dynamic> json) =
      _$_ColumnData.fromJson;

  @override
  List<String> get columnValue;
  @override
  @JsonKey(ignore: true)
  _$$_ColumnDataCopyWith<_$_ColumnData> get copyWith =>
      throw _privateConstructorUsedError;
}

RewardList _$RewardListFromJson(Map<String, dynamic> json) {
  return _RewardList.fromJson(json);
}

/// @nodoc
mixin _$RewardList {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get descriptionApp => throw _privateConstructorUsedError;
  String get standerdImageUrl => throw _privateConstructorUsedError;
  String get standerdImageAlt => throw _privateConstructorUsedError;
  String get ctaLink => throw _privateConstructorUsedError;
  String get ctaText => throw _privateConstructorUsedError;
  bool get active => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RewardListCopyWith<RewardList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RewardListCopyWith<$Res> {
  factory $RewardListCopyWith(
          RewardList value, $Res Function(RewardList) then) =
      _$RewardListCopyWithImpl<$Res, RewardList>;
  @useResult
  $Res call(
      {String title,
      String description,
      String descriptionApp,
      String standerdImageUrl,
      String standerdImageAlt,
      String ctaLink,
      String ctaText,
      bool active});
}

/// @nodoc
class _$RewardListCopyWithImpl<$Res, $Val extends RewardList>
    implements $RewardListCopyWith<$Res> {
  _$RewardListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? descriptionApp = null,
    Object? standerdImageUrl = null,
    Object? standerdImageAlt = null,
    Object? ctaLink = null,
    Object? ctaText = null,
    Object? active = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionApp: null == descriptionApp
          ? _value.descriptionApp
          : descriptionApp // ignore: cast_nullable_to_non_nullable
              as String,
      standerdImageUrl: null == standerdImageUrl
          ? _value.standerdImageUrl
          : standerdImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      standerdImageAlt: null == standerdImageAlt
          ? _value.standerdImageAlt
          : standerdImageAlt // ignore: cast_nullable_to_non_nullable
              as String,
      ctaLink: null == ctaLink
          ? _value.ctaLink
          : ctaLink // ignore: cast_nullable_to_non_nullable
              as String,
      ctaText: null == ctaText
          ? _value.ctaText
          : ctaText // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RewardListCopyWith<$Res>
    implements $RewardListCopyWith<$Res> {
  factory _$$_RewardListCopyWith(
          _$_RewardList value, $Res Function(_$_RewardList) then) =
      __$$_RewardListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String description,
      String descriptionApp,
      String standerdImageUrl,
      String standerdImageAlt,
      String ctaLink,
      String ctaText,
      bool active});
}

/// @nodoc
class __$$_RewardListCopyWithImpl<$Res>
    extends _$RewardListCopyWithImpl<$Res, _$_RewardList>
    implements _$$_RewardListCopyWith<$Res> {
  __$$_RewardListCopyWithImpl(
      _$_RewardList _value, $Res Function(_$_RewardList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? descriptionApp = null,
    Object? standerdImageUrl = null,
    Object? standerdImageAlt = null,
    Object? ctaLink = null,
    Object? ctaText = null,
    Object? active = null,
  }) {
    return _then(_$_RewardList(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionApp: null == descriptionApp
          ? _value.descriptionApp
          : descriptionApp // ignore: cast_nullable_to_non_nullable
              as String,
      standerdImageUrl: null == standerdImageUrl
          ? _value.standerdImageUrl
          : standerdImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      standerdImageAlt: null == standerdImageAlt
          ? _value.standerdImageAlt
          : standerdImageAlt // ignore: cast_nullable_to_non_nullable
              as String,
      ctaLink: null == ctaLink
          ? _value.ctaLink
          : ctaLink // ignore: cast_nullable_to_non_nullable
              as String,
      ctaText: null == ctaText
          ? _value.ctaText
          : ctaText // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RewardList implements _RewardList {
  const _$_RewardList(
      {this.title = '',
      this.description = '',
      this.descriptionApp = '',
      this.standerdImageUrl = '',
      this.standerdImageAlt = '',
      this.ctaLink = '',
      this.ctaText = '',
      this.active = true});

  factory _$_RewardList.fromJson(Map<String, dynamic> json) =>
      _$$_RewardListFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String descriptionApp;
  @override
  @JsonKey()
  final String standerdImageUrl;
  @override
  @JsonKey()
  final String standerdImageAlt;
  @override
  @JsonKey()
  final String ctaLink;
  @override
  @JsonKey()
  final String ctaText;
  @override
  @JsonKey()
  final bool active;

  @override
  String toString() {
    return 'RewardList(title: $title, description: $description, descriptionApp: $descriptionApp, standerdImageUrl: $standerdImageUrl, standerdImageAlt: $standerdImageAlt, ctaLink: $ctaLink, ctaText: $ctaText, active: $active)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RewardList &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.descriptionApp, descriptionApp) ||
                other.descriptionApp == descriptionApp) &&
            (identical(other.standerdImageUrl, standerdImageUrl) ||
                other.standerdImageUrl == standerdImageUrl) &&
            (identical(other.standerdImageAlt, standerdImageAlt) ||
                other.standerdImageAlt == standerdImageAlt) &&
            (identical(other.ctaLink, ctaLink) || other.ctaLink == ctaLink) &&
            (identical(other.ctaText, ctaText) || other.ctaText == ctaText) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      description,
      descriptionApp,
      standerdImageUrl,
      standerdImageAlt,
      ctaLink,
      ctaText,
      active);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RewardListCopyWith<_$_RewardList> get copyWith =>
      __$$_RewardListCopyWithImpl<_$_RewardList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RewardListToJson(
      this,
    );
  }
}

abstract class _RewardList implements RewardList {
  const factory _RewardList(
      {final String title,
      final String description,
      final String descriptionApp,
      final String standerdImageUrl,
      final String standerdImageAlt,
      final String ctaLink,
      final String ctaText,
      final bool active}) = _$_RewardList;

  factory _RewardList.fromJson(Map<String, dynamic> json) =
      _$_RewardList.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  String get descriptionApp;
  @override
  String get standerdImageUrl;
  @override
  String get standerdImageAlt;
  @override
  String get ctaLink;
  @override
  String get ctaText;
  @override
  bool get active;
  @override
  @JsonKey(ignore: true)
  _$$_RewardListCopyWith<_$_RewardList> get copyWith =>
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
