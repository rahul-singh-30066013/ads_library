// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loyalty_dialog_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoyaltyDialogModel _$LoyaltyDialogModelFromJson(Map<String, dynamic> json) {
  return _LoyaltyDialogModel.fromJson(json);
}

/// @nodoc
mixin _$LoyaltyDialogModel {
  List<Element> get elements => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoyaltyDialogModelCopyWith<LoyaltyDialogModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyDialogModelCopyWith<$Res> {
  factory $LoyaltyDialogModelCopyWith(
          LoyaltyDialogModel value, $Res Function(LoyaltyDialogModel) then) =
      _$LoyaltyDialogModelCopyWithImpl<$Res, LoyaltyDialogModel>;
  @useResult
  $Res call({List<Element> elements});
}

/// @nodoc
class _$LoyaltyDialogModelCopyWithImpl<$Res, $Val extends LoyaltyDialogModel>
    implements $LoyaltyDialogModelCopyWith<$Res> {
  _$LoyaltyDialogModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? elements = null,
  }) {
    return _then(_value.copyWith(
      elements: null == elements
          ? _value.elements
          : elements // ignore: cast_nullable_to_non_nullable
              as List<Element>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoyaltyDialogModelCopyWith<$Res>
    implements $LoyaltyDialogModelCopyWith<$Res> {
  factory _$$_LoyaltyDialogModelCopyWith(_$_LoyaltyDialogModel value,
          $Res Function(_$_LoyaltyDialogModel) then) =
      __$$_LoyaltyDialogModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Element> elements});
}

/// @nodoc
class __$$_LoyaltyDialogModelCopyWithImpl<$Res>
    extends _$LoyaltyDialogModelCopyWithImpl<$Res, _$_LoyaltyDialogModel>
    implements _$$_LoyaltyDialogModelCopyWith<$Res> {
  __$$_LoyaltyDialogModelCopyWithImpl(
      _$_LoyaltyDialogModel _value, $Res Function(_$_LoyaltyDialogModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? elements = null,
  }) {
    return _then(_$_LoyaltyDialogModel(
      elements: null == elements
          ? _value.elements
          : elements // ignore: cast_nullable_to_non_nullable
              as List<Element>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoyaltyDialogModel implements _LoyaltyDialogModel {
  const _$_LoyaltyDialogModel({this.elements = const []});

  factory _$_LoyaltyDialogModel.fromJson(Map<String, dynamic> json) =>
      _$$_LoyaltyDialogModelFromJson(json);

  @override
  @JsonKey()
  final List<Element> elements;

  @override
  String toString() {
    return 'LoyaltyDialogModel(elements: $elements)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoyaltyDialogModel &&
            const DeepCollectionEquality().equals(other.elements, elements));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(elements));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoyaltyDialogModelCopyWith<_$_LoyaltyDialogModel> get copyWith =>
      __$$_LoyaltyDialogModelCopyWithImpl<_$_LoyaltyDialogModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoyaltyDialogModelToJson(
      this,
    );
  }
}

abstract class _LoyaltyDialogModel implements LoyaltyDialogModel {
  const factory _LoyaltyDialogModel({final List<Element> elements}) =
      _$_LoyaltyDialogModel;

  factory _LoyaltyDialogModel.fromJson(Map<String, dynamic> json) =
      _$_LoyaltyDialogModel.fromJson;

  @override
  List<Element> get elements;
  @override
  @JsonKey(ignore: true)
  _$$_LoyaltyDialogModelCopyWith<_$_LoyaltyDialogModel> get copyWith =>
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
  DilaogFields get fields => throw _privateConstructorUsedError;

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
      DilaogFields fields});

  $ParamsCopyWith<$Res> get params;
  $DilaogFieldsCopyWith<$Res> get fields;
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
              as DilaogFields,
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
  $DilaogFieldsCopyWith<$Res> get fields {
    return $DilaogFieldsCopyWith<$Res>(_value.fields, (value) {
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
      DilaogFields fields});

  @override
  $ParamsCopyWith<$Res> get params;
  @override
  $DilaogFieldsCopyWith<$Res> get fields;
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
              as DilaogFields,
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
      this.fields = const DilaogFields()});

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
  final DilaogFields fields;

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
      final DilaogFields fields}) = _$_Element;

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
  DilaogFields get fields;
  @override
  @JsonKey(ignore: true)
  _$$_ElementCopyWith<_$_Element> get copyWith =>
      throw _privateConstructorUsedError;
}

DilaogFields _$DilaogFieldsFromJson(Map<String, dynamic> json) {
  return _DilaogFields.fromJson(json);
}

/// @nodoc
mixin _$DilaogFields {
  LoyaltyDialogItems get widget => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DilaogFieldsCopyWith<DilaogFields> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DilaogFieldsCopyWith<$Res> {
  factory $DilaogFieldsCopyWith(
          DilaogFields value, $Res Function(DilaogFields) then) =
      _$DilaogFieldsCopyWithImpl<$Res, DilaogFields>;
  @useResult
  $Res call({LoyaltyDialogItems widget});

  $LoyaltyDialogItemsCopyWith<$Res> get widget;
}

/// @nodoc
class _$DilaogFieldsCopyWithImpl<$Res, $Val extends DilaogFields>
    implements $DilaogFieldsCopyWith<$Res> {
  _$DilaogFieldsCopyWithImpl(this._value, this._then);

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
              as LoyaltyDialogItems,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LoyaltyDialogItemsCopyWith<$Res> get widget {
    return $LoyaltyDialogItemsCopyWith<$Res>(_value.widget, (value) {
      return _then(_value.copyWith(widget: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DilaogFieldsCopyWith<$Res>
    implements $DilaogFieldsCopyWith<$Res> {
  factory _$$_DilaogFieldsCopyWith(
          _$_DilaogFields value, $Res Function(_$_DilaogFields) then) =
      __$$_DilaogFieldsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LoyaltyDialogItems widget});

  @override
  $LoyaltyDialogItemsCopyWith<$Res> get widget;
}

/// @nodoc
class __$$_DilaogFieldsCopyWithImpl<$Res>
    extends _$DilaogFieldsCopyWithImpl<$Res, _$_DilaogFields>
    implements _$$_DilaogFieldsCopyWith<$Res> {
  __$$_DilaogFieldsCopyWithImpl(
      _$_DilaogFields _value, $Res Function(_$_DilaogFields) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? widget = null,
  }) {
    return _then(_$_DilaogFields(
      widget: null == widget
          ? _value.widget
          : widget // ignore: cast_nullable_to_non_nullable
              as LoyaltyDialogItems,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DilaogFields implements _DilaogFields {
  const _$_DilaogFields({this.widget = const LoyaltyDialogItems()});

  factory _$_DilaogFields.fromJson(Map<String, dynamic> json) =>
      _$$_DilaogFieldsFromJson(json);

  @override
  @JsonKey()
  final LoyaltyDialogItems widget;

  @override
  String toString() {
    return 'DilaogFields(widget: $widget)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DilaogFields &&
            (identical(other.widget, widget) || other.widget == widget));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, widget);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DilaogFieldsCopyWith<_$_DilaogFields> get copyWith =>
      __$$_DilaogFieldsCopyWithImpl<_$_DilaogFields>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DilaogFieldsToJson(
      this,
    );
  }
}

abstract class _DilaogFields implements DilaogFields {
  const factory _DilaogFields({final LoyaltyDialogItems widget}) =
      _$_DilaogFields;

  factory _DilaogFields.fromJson(Map<String, dynamic> json) =
      _$_DilaogFields.fromJson;

  @override
  LoyaltyDialogItems get widget;
  @override
  @JsonKey(ignore: true)
  _$$_DilaogFieldsCopyWith<_$_DilaogFields> get copyWith =>
      throw _privateConstructorUsedError;
}

LoyaltyDialogItems _$LoyaltyDialogItemsFromJson(Map<String, dynamic> json) {
  return _LoyaltyDialogItems.fromJson(json);
}

/// @nodoc
mixin _$LoyaltyDialogItems {
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
  dynamic get carouselParam => throw _privateConstructorUsedError;
  List<WidgetItem> get widgetItems => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoyaltyDialogItemsCopyWith<LoyaltyDialogItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyDialogItemsCopyWith<$Res> {
  factory $LoyaltyDialogItemsCopyWith(
          LoyaltyDialogItems value, $Res Function(LoyaltyDialogItems) then) =
      _$LoyaltyDialogItemsCopyWithImpl<$Res, LoyaltyDialogItems>;
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
      dynamic carouselParam,
      List<WidgetItem> widgetItems});

  $ItemMarginCopyWith<$Res> get itemMargin;
  $ItemMarginCopyWith<$Res> get subItemMargin;
  $ActionTitleCopyWith<$Res> get actionTitle;
}

/// @nodoc
class _$LoyaltyDialogItemsCopyWithImpl<$Res, $Val extends LoyaltyDialogItems>
    implements $LoyaltyDialogItemsCopyWith<$Res> {
  _$LoyaltyDialogItemsCopyWithImpl(this._value, this._then);

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
    Object? carouselParam = freezed,
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
      carouselParam: freezed == carouselParam
          ? _value.carouselParam
          : carouselParam // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
abstract class _$$_LoyaltyDialogItemsCopyWith<$Res>
    implements $LoyaltyDialogItemsCopyWith<$Res> {
  factory _$$_LoyaltyDialogItemsCopyWith(_$_LoyaltyDialogItems value,
          $Res Function(_$_LoyaltyDialogItems) then) =
      __$$_LoyaltyDialogItemsCopyWithImpl<$Res>;
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
      dynamic carouselParam,
      List<WidgetItem> widgetItems});

  @override
  $ItemMarginCopyWith<$Res> get itemMargin;
  @override
  $ItemMarginCopyWith<$Res> get subItemMargin;
  @override
  $ActionTitleCopyWith<$Res> get actionTitle;
}

/// @nodoc
class __$$_LoyaltyDialogItemsCopyWithImpl<$Res>
    extends _$LoyaltyDialogItemsCopyWithImpl<$Res, _$_LoyaltyDialogItems>
    implements _$$_LoyaltyDialogItemsCopyWith<$Res> {
  __$$_LoyaltyDialogItemsCopyWithImpl(
      _$_LoyaltyDialogItems _value, $Res Function(_$_LoyaltyDialogItems) _then)
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
    Object? carouselParam = freezed,
    Object? widgetItems = null,
  }) {
    return _then(_$_LoyaltyDialogItems(
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
      carouselParam: freezed == carouselParam
          ? _value.carouselParam
          : carouselParam // ignore: cast_nullable_to_non_nullable
              as dynamic,
      widgetItems: null == widgetItems
          ? _value.widgetItems
          : widgetItems // ignore: cast_nullable_to_non_nullable
              as List<WidgetItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoyaltyDialogItems implements _LoyaltyDialogItems {
  const _$_LoyaltyDialogItems(
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
      this.carouselParam = null,
      this.widgetItems = const []});

  factory _$_LoyaltyDialogItems.fromJson(Map<String, dynamic> json) =>
      _$$_LoyaltyDialogItemsFromJson(json);

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
  final dynamic carouselParam;
  @override
  @JsonKey()
  final List<WidgetItem> widgetItems;

  @override
  String toString() {
    return 'LoyaltyDialogItems(widgetId: $widgetId, widgetType: $widgetType, title: $title, subTitle: $subTitle, subItemRadius: $subItemRadius, subItemWidth: $subItemWidth, gridColumn: $gridColumn, aspectRatio: $aspectRatio, borderRadius: $borderRadius, itemMargin: $itemMargin, subItemMargin: $subItemMargin, actionTitle: $actionTitle, carouselParam: $carouselParam, widgetItems: $widgetItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoyaltyDialogItems &&
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
                .equals(other.carouselParam, carouselParam) &&
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
      const DeepCollectionEquality().hash(carouselParam),
      const DeepCollectionEquality().hash(widgetItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoyaltyDialogItemsCopyWith<_$_LoyaltyDialogItems> get copyWith =>
      __$$_LoyaltyDialogItemsCopyWithImpl<_$_LoyaltyDialogItems>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoyaltyDialogItemsToJson(
      this,
    );
  }
}

abstract class _LoyaltyDialogItems implements LoyaltyDialogItems {
  const factory _LoyaltyDialogItems(
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
      final dynamic carouselParam,
      final List<WidgetItem> widgetItems}) = _$_LoyaltyDialogItems;

  factory _LoyaltyDialogItems.fromJson(Map<String, dynamic> json) =
      _$_LoyaltyDialogItems.fromJson;

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
  dynamic get carouselParam;
  @override
  List<WidgetItem> get widgetItems;
  @override
  @JsonKey(ignore: true)
  _$$_LoyaltyDialogItemsCopyWith<_$_LoyaltyDialogItems> get copyWith =>
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
  String get imageSrc => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get descriptionApp => throw _privateConstructorUsedError;
  String get ctaLink => throw _privateConstructorUsedError;
  String get deepLink => throw _privateConstructorUsedError;
  String get subTitle => throw _privateConstructorUsedError;
  String get materialGroup => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get subCategory => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get storeType => throw _privateConstructorUsedError;
  bool get restricted => throw _privateConstructorUsedError;
  String get mobileImage => throw _privateConstructorUsedError;
  dynamic get webImage => throw _privateConstructorUsedError;
  dynamic get thumbnailImage => throw _privateConstructorUsedError;
  String get ctaText => throw _privateConstructorUsedError;

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
      String imageSrc,
      String description,
      String descriptionApp,
      String ctaLink,
      String deepLink,
      String subTitle,
      String materialGroup,
      String category,
      String subCategory,
      String brand,
      String storeType,
      bool restricted,
      String mobileImage,
      dynamic webImage,
      dynamic thumbnailImage,
      String ctaText});
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
    Object? imageSrc = null,
    Object? description = null,
    Object? descriptionApp = null,
    Object? ctaLink = null,
    Object? deepLink = null,
    Object? subTitle = null,
    Object? materialGroup = null,
    Object? category = null,
    Object? subCategory = null,
    Object? brand = null,
    Object? storeType = null,
    Object? restricted = null,
    Object? mobileImage = null,
    Object? webImage = freezed,
    Object? thumbnailImage = freezed,
    Object? ctaText = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imageSrc: null == imageSrc
          ? _value.imageSrc
          : imageSrc // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionApp: null == descriptionApp
          ? _value.descriptionApp
          : descriptionApp // ignore: cast_nullable_to_non_nullable
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
      restricted: null == restricted
          ? _value.restricted
          : restricted // ignore: cast_nullable_to_non_nullable
              as bool,
      mobileImage: null == mobileImage
          ? _value.mobileImage
          : mobileImage // ignore: cast_nullable_to_non_nullable
              as String,
      webImage: freezed == webImage
          ? _value.webImage
          : webImage // ignore: cast_nullable_to_non_nullable
              as dynamic,
      thumbnailImage: freezed == thumbnailImage
          ? _value.thumbnailImage
          : thumbnailImage // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ctaText: null == ctaText
          ? _value.ctaText
          : ctaText // ignore: cast_nullable_to_non_nullable
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
      {String title,
      String imageSrc,
      String description,
      String descriptionApp,
      String ctaLink,
      String deepLink,
      String subTitle,
      String materialGroup,
      String category,
      String subCategory,
      String brand,
      String storeType,
      bool restricted,
      String mobileImage,
      dynamic webImage,
      dynamic thumbnailImage,
      String ctaText});
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
    Object? imageSrc = null,
    Object? description = null,
    Object? descriptionApp = null,
    Object? ctaLink = null,
    Object? deepLink = null,
    Object? subTitle = null,
    Object? materialGroup = null,
    Object? category = null,
    Object? subCategory = null,
    Object? brand = null,
    Object? storeType = null,
    Object? restricted = null,
    Object? mobileImage = null,
    Object? webImage = freezed,
    Object? thumbnailImage = freezed,
    Object? ctaText = null,
  }) {
    return _then(_$_WidgetItem(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imageSrc: null == imageSrc
          ? _value.imageSrc
          : imageSrc // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      descriptionApp: null == descriptionApp
          ? _value.descriptionApp
          : descriptionApp // ignore: cast_nullable_to_non_nullable
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
      restricted: null == restricted
          ? _value.restricted
          : restricted // ignore: cast_nullable_to_non_nullable
              as bool,
      mobileImage: null == mobileImage
          ? _value.mobileImage
          : mobileImage // ignore: cast_nullable_to_non_nullable
              as String,
      webImage: freezed == webImage
          ? _value.webImage
          : webImage // ignore: cast_nullable_to_non_nullable
              as dynamic,
      thumbnailImage: freezed == thumbnailImage
          ? _value.thumbnailImage
          : thumbnailImage // ignore: cast_nullable_to_non_nullable
              as dynamic,
      ctaText: null == ctaText
          ? _value.ctaText
          : ctaText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WidgetItem implements _WidgetItem {
  const _$_WidgetItem(
      {this.title = '',
      this.imageSrc = '',
      this.description = '',
      this.descriptionApp = '',
      this.ctaLink = '',
      this.deepLink = '',
      this.subTitle = '',
      this.materialGroup = '',
      this.category = '',
      this.subCategory = '',
      this.brand = '',
      this.storeType = '',
      this.restricted = false,
      this.mobileImage = '',
      this.webImage = null,
      this.thumbnailImage = null,
      this.ctaText = ''});

  factory _$_WidgetItem.fromJson(Map<String, dynamic> json) =>
      _$$_WidgetItemFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String imageSrc;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String descriptionApp;
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
  final bool restricted;
  @override
  @JsonKey()
  final String mobileImage;
  @override
  @JsonKey()
  final dynamic webImage;
  @override
  @JsonKey()
  final dynamic thumbnailImage;
  @override
  @JsonKey()
  final String ctaText;

  @override
  String toString() {
    return 'WidgetItem(title: $title, imageSrc: $imageSrc, description: $description, descriptionApp: $descriptionApp, ctaLink: $ctaLink, deepLink: $deepLink, subTitle: $subTitle, materialGroup: $materialGroup, category: $category, subCategory: $subCategory, brand: $brand, storeType: $storeType, restricted: $restricted, mobileImage: $mobileImage, webImage: $webImage, thumbnailImage: $thumbnailImage, ctaText: $ctaText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WidgetItem &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.imageSrc, imageSrc) ||
                other.imageSrc == imageSrc) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.descriptionApp, descriptionApp) ||
                other.descriptionApp == descriptionApp) &&
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
            (identical(other.restricted, restricted) ||
                other.restricted == restricted) &&
            (identical(other.mobileImage, mobileImage) ||
                other.mobileImage == mobileImage) &&
            const DeepCollectionEquality().equals(other.webImage, webImage) &&
            const DeepCollectionEquality()
                .equals(other.thumbnailImage, thumbnailImage) &&
            (identical(other.ctaText, ctaText) || other.ctaText == ctaText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      imageSrc,
      description,
      descriptionApp,
      ctaLink,
      deepLink,
      subTitle,
      materialGroup,
      category,
      subCategory,
      brand,
      storeType,
      restricted,
      mobileImage,
      const DeepCollectionEquality().hash(webImage),
      const DeepCollectionEquality().hash(thumbnailImage),
      ctaText);

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
      final String imageSrc,
      final String description,
      final String descriptionApp,
      final String ctaLink,
      final String deepLink,
      final String subTitle,
      final String materialGroup,
      final String category,
      final String subCategory,
      final String brand,
      final String storeType,
      final bool restricted,
      final String mobileImage,
      final dynamic webImage,
      final dynamic thumbnailImage,
      final String ctaText}) = _$_WidgetItem;

  factory _WidgetItem.fromJson(Map<String, dynamic> json) =
      _$_WidgetItem.fromJson;

  @override
  String get title;
  @override
  String get imageSrc;
  @override
  String get description;
  @override
  String get descriptionApp;
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
  bool get restricted;
  @override
  String get mobileImage;
  @override
  dynamic get webImage;
  @override
  dynamic get thumbnailImage;
  @override
  String get ctaText;
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
