// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loyalty_refer_and_earn_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoyaltyReferAndEarnModel _$LoyaltyReferAndEarnModelFromJson(
    Map<String, dynamic> json) {
  return _LoyaltyReferAndEarnModel.fromJson(json);
}

/// @nodoc
mixin _$LoyaltyReferAndEarnModel {
  List<Element> get elements => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoyaltyReferAndEarnModelCopyWith<LoyaltyReferAndEarnModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyReferAndEarnModelCopyWith<$Res> {
  factory $LoyaltyReferAndEarnModelCopyWith(LoyaltyReferAndEarnModel value,
          $Res Function(LoyaltyReferAndEarnModel) then) =
      _$LoyaltyReferAndEarnModelCopyWithImpl<$Res, LoyaltyReferAndEarnModel>;
  @useResult
  $Res call({List<Element> elements});
}

/// @nodoc
class _$LoyaltyReferAndEarnModelCopyWithImpl<$Res,
        $Val extends LoyaltyReferAndEarnModel>
    implements $LoyaltyReferAndEarnModelCopyWith<$Res> {
  _$LoyaltyReferAndEarnModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_LoyaltyReferAndEarnModelCopyWith<$Res>
    implements $LoyaltyReferAndEarnModelCopyWith<$Res> {
  factory _$$_LoyaltyReferAndEarnModelCopyWith(
          _$_LoyaltyReferAndEarnModel value,
          $Res Function(_$_LoyaltyReferAndEarnModel) then) =
      __$$_LoyaltyReferAndEarnModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Element> elements});
}

/// @nodoc
class __$$_LoyaltyReferAndEarnModelCopyWithImpl<$Res>
    extends _$LoyaltyReferAndEarnModelCopyWithImpl<$Res,
        _$_LoyaltyReferAndEarnModel>
    implements _$$_LoyaltyReferAndEarnModelCopyWith<$Res> {
  __$$_LoyaltyReferAndEarnModelCopyWithImpl(_$_LoyaltyReferAndEarnModel _value,
      $Res Function(_$_LoyaltyReferAndEarnModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? elements = null,
  }) {
    return _then(_$_LoyaltyReferAndEarnModel(
      elements: null == elements
          ? _value.elements
          : elements // ignore: cast_nullable_to_non_nullable
              as List<Element>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoyaltyReferAndEarnModel implements _LoyaltyReferAndEarnModel {
  const _$_LoyaltyReferAndEarnModel({this.elements = const []});

  factory _$_LoyaltyReferAndEarnModel.fromJson(Map<String, dynamic> json) =>
      _$$_LoyaltyReferAndEarnModelFromJson(json);

  @override
  @JsonKey()
  final List<Element> elements;

  @override
  String toString() {
    return 'LoyaltyReferAndEarnModel(elements: $elements)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoyaltyReferAndEarnModel &&
            const DeepCollectionEquality().equals(other.elements, elements));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(elements));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoyaltyReferAndEarnModelCopyWith<_$_LoyaltyReferAndEarnModel>
      get copyWith => __$$_LoyaltyReferAndEarnModelCopyWithImpl<
          _$_LoyaltyReferAndEarnModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoyaltyReferAndEarnModelToJson(
      this,
    );
  }
}

abstract class _LoyaltyReferAndEarnModel implements LoyaltyReferAndEarnModel {
  const factory _LoyaltyReferAndEarnModel({final List<Element> elements}) =
      _$_LoyaltyReferAndEarnModel;

  factory _LoyaltyReferAndEarnModel.fromJson(Map<String, dynamic> json) =
      _$_LoyaltyReferAndEarnModel.fromJson;

  @override
  List<Element> get elements;
  @override
  @JsonKey(ignore: true)
  _$$_LoyaltyReferAndEarnModelCopyWith<_$_LoyaltyReferAndEarnModel>
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
  ReferAndEarnFields get fields => throw _privateConstructorUsedError;

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
      ReferAndEarnFields fields});

  $ParamsCopyWith<$Res> get params;
  $ReferAndEarnFieldsCopyWith<$Res> get fields;
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
              as ReferAndEarnFields,
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
  $ReferAndEarnFieldsCopyWith<$Res> get fields {
    return $ReferAndEarnFieldsCopyWith<$Res>(_value.fields, (value) {
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
      ReferAndEarnFields fields});

  @override
  $ParamsCopyWith<$Res> get params;
  @override
  $ReferAndEarnFieldsCopyWith<$Res> get fields;
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
              as ReferAndEarnFields,
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
      this.fields = const ReferAndEarnFields()});

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
  final ReferAndEarnFields fields;

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
      final ReferAndEarnFields fields}) = _$_Element;

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
  ReferAndEarnFields get fields;
  @override
  @JsonKey(ignore: true)
  _$$_ElementCopyWith<_$_Element> get copyWith =>
      throw _privateConstructorUsedError;
}

ReferAndEarnFields _$ReferAndEarnFieldsFromJson(Map<String, dynamic> json) {
  return _ReferAndEarnFields.fromJson(json);
}

/// @nodoc
mixin _$ReferAndEarnFields {
  ReferAndEarnItem get widget => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReferAndEarnFieldsCopyWith<ReferAndEarnFields> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferAndEarnFieldsCopyWith<$Res> {
  factory $ReferAndEarnFieldsCopyWith(
          ReferAndEarnFields value, $Res Function(ReferAndEarnFields) then) =
      _$ReferAndEarnFieldsCopyWithImpl<$Res, ReferAndEarnFields>;
  @useResult
  $Res call({ReferAndEarnItem widget});

  $ReferAndEarnItemCopyWith<$Res> get widget;
}

/// @nodoc
class _$ReferAndEarnFieldsCopyWithImpl<$Res, $Val extends ReferAndEarnFields>
    implements $ReferAndEarnFieldsCopyWith<$Res> {
  _$ReferAndEarnFieldsCopyWithImpl(this._value, this._then);

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
              as ReferAndEarnItem,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReferAndEarnItemCopyWith<$Res> get widget {
    return $ReferAndEarnItemCopyWith<$Res>(_value.widget, (value) {
      return _then(_value.copyWith(widget: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ReferAndEarnFieldsCopyWith<$Res>
    implements $ReferAndEarnFieldsCopyWith<$Res> {
  factory _$$_ReferAndEarnFieldsCopyWith(_$_ReferAndEarnFields value,
          $Res Function(_$_ReferAndEarnFields) then) =
      __$$_ReferAndEarnFieldsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ReferAndEarnItem widget});

  @override
  $ReferAndEarnItemCopyWith<$Res> get widget;
}

/// @nodoc
class __$$_ReferAndEarnFieldsCopyWithImpl<$Res>
    extends _$ReferAndEarnFieldsCopyWithImpl<$Res, _$_ReferAndEarnFields>
    implements _$$_ReferAndEarnFieldsCopyWith<$Res> {
  __$$_ReferAndEarnFieldsCopyWithImpl(
      _$_ReferAndEarnFields _value, $Res Function(_$_ReferAndEarnFields) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? widget = null,
  }) {
    return _then(_$_ReferAndEarnFields(
      widget: null == widget
          ? _value.widget
          : widget // ignore: cast_nullable_to_non_nullable
              as ReferAndEarnItem,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReferAndEarnFields implements _ReferAndEarnFields {
  const _$_ReferAndEarnFields({this.widget = const ReferAndEarnItem()});

  factory _$_ReferAndEarnFields.fromJson(Map<String, dynamic> json) =>
      _$$_ReferAndEarnFieldsFromJson(json);

  @override
  @JsonKey()
  final ReferAndEarnItem widget;

  @override
  String toString() {
    return 'ReferAndEarnFields(widget: $widget)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReferAndEarnFields &&
            (identical(other.widget, widget) || other.widget == widget));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, widget);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReferAndEarnFieldsCopyWith<_$_ReferAndEarnFields> get copyWith =>
      __$$_ReferAndEarnFieldsCopyWithImpl<_$_ReferAndEarnFields>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReferAndEarnFieldsToJson(
      this,
    );
  }
}

abstract class _ReferAndEarnFields implements ReferAndEarnFields {
  const factory _ReferAndEarnFields({final ReferAndEarnItem widget}) =
      _$_ReferAndEarnFields;

  factory _ReferAndEarnFields.fromJson(Map<String, dynamic> json) =
      _$_ReferAndEarnFields.fromJson;

  @override
  ReferAndEarnItem get widget;
  @override
  @JsonKey(ignore: true)
  _$$_ReferAndEarnFieldsCopyWith<_$_ReferAndEarnFields> get copyWith =>
      throw _privateConstructorUsedError;
}

ReferAndEarnItem _$ReferAndEarnItemFromJson(Map<String, dynamic> json) {
  return _ReferAndEarnItem.fromJson(json);
}

/// @nodoc
mixin _$ReferAndEarnItem {
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
  $ReferAndEarnItemCopyWith<ReferAndEarnItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReferAndEarnItemCopyWith<$Res> {
  factory $ReferAndEarnItemCopyWith(
          ReferAndEarnItem value, $Res Function(ReferAndEarnItem) then) =
      _$ReferAndEarnItemCopyWithImpl<$Res, ReferAndEarnItem>;
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
class _$ReferAndEarnItemCopyWithImpl<$Res, $Val extends ReferAndEarnItem>
    implements $ReferAndEarnItemCopyWith<$Res> {
  _$ReferAndEarnItemCopyWithImpl(this._value, this._then);

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
abstract class _$$_ReferAndEarnItemCopyWith<$Res>
    implements $ReferAndEarnItemCopyWith<$Res> {
  factory _$$_ReferAndEarnItemCopyWith(
          _$_ReferAndEarnItem value, $Res Function(_$_ReferAndEarnItem) then) =
      __$$_ReferAndEarnItemCopyWithImpl<$Res>;
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
class __$$_ReferAndEarnItemCopyWithImpl<$Res>
    extends _$ReferAndEarnItemCopyWithImpl<$Res, _$_ReferAndEarnItem>
    implements _$$_ReferAndEarnItemCopyWith<$Res> {
  __$$_ReferAndEarnItemCopyWithImpl(
      _$_ReferAndEarnItem _value, $Res Function(_$_ReferAndEarnItem) _then)
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
    return _then(_$_ReferAndEarnItem(
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
class _$_ReferAndEarnItem implements _ReferAndEarnItem {
  const _$_ReferAndEarnItem(
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

  factory _$_ReferAndEarnItem.fromJson(Map<String, dynamic> json) =>
      _$$_ReferAndEarnItemFromJson(json);

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
    return 'ReferAndEarnItem(widgetId: $widgetId, widgetType: $widgetType, title: $title, subTitle: $subTitle, subItemRadius: $subItemRadius, subItemWidth: $subItemWidth, gridColumn: $gridColumn, aspectRatio: $aspectRatio, borderRadius: $borderRadius, itemMargin: $itemMargin, subItemMargin: $subItemMargin, actionTitle: $actionTitle, carouselParam: $carouselParam, widgetItems: $widgetItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReferAndEarnItem &&
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
  _$$_ReferAndEarnItemCopyWith<_$_ReferAndEarnItem> get copyWith =>
      __$$_ReferAndEarnItemCopyWithImpl<_$_ReferAndEarnItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReferAndEarnItemToJson(
      this,
    );
  }
}

abstract class _ReferAndEarnItem implements ReferAndEarnItem {
  const factory _ReferAndEarnItem(
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
      final List<WidgetItem> widgetItems}) = _$_ReferAndEarnItem;

  factory _ReferAndEarnItem.fromJson(Map<String, dynamic> json) =
      _$_ReferAndEarnItem.fromJson;

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
  _$$_ReferAndEarnItemCopyWith<_$_ReferAndEarnItem> get copyWith =>
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
  dynamic get webImage => throw _privateConstructorUsedError;
  dynamic get thumbnailImage => throw _privateConstructorUsedError;
  List<RewardStepList> get rewardStepList => throw _privateConstructorUsedError;
  List<Media> get media => throw _privateConstructorUsedError;

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
      dynamic webImage,
      dynamic thumbnailImage,
      List<RewardStepList> rewardStepList,
      List<Media> media});
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
    Object? webImage = freezed,
    Object? thumbnailImage = freezed,
    Object? rewardStepList = null,
    Object? media = null,
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
      webImage: freezed == webImage
          ? _value.webImage
          : webImage // ignore: cast_nullable_to_non_nullable
              as dynamic,
      thumbnailImage: freezed == thumbnailImage
          ? _value.thumbnailImage
          : thumbnailImage // ignore: cast_nullable_to_non_nullable
              as dynamic,
      rewardStepList: null == rewardStepList
          ? _value.rewardStepList
          : rewardStepList // ignore: cast_nullable_to_non_nullable
              as List<RewardStepList>,
      media: null == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as List<Media>,
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
      dynamic webImage,
      dynamic thumbnailImage,
      List<RewardStepList> rewardStepList,
      List<Media> media});
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
    Object? webImage = freezed,
    Object? thumbnailImage = freezed,
    Object? rewardStepList = null,
    Object? media = null,
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
      webImage: freezed == webImage
          ? _value.webImage
          : webImage // ignore: cast_nullable_to_non_nullable
              as dynamic,
      thumbnailImage: freezed == thumbnailImage
          ? _value.thumbnailImage
          : thumbnailImage // ignore: cast_nullable_to_non_nullable
              as dynamic,
      rewardStepList: null == rewardStepList
          ? _value.rewardStepList
          : rewardStepList // ignore: cast_nullable_to_non_nullable
              as List<RewardStepList>,
      media: null == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as List<Media>,
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
      this.webImage = null,
      this.thumbnailImage = null,
      this.rewardStepList = const [],
      this.media = const []});

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
  final dynamic webImage;
  @override
  @JsonKey()
  final dynamic thumbnailImage;
  @override
  @JsonKey()
  final List<RewardStepList> rewardStepList;
  @override
  @JsonKey()
  final List<Media> media;

  @override
  String toString() {
    return 'WidgetItem(title: $title, imageSrc: $imageSrc, description: $description, descriptionApp: $descriptionApp, ctaLink: $ctaLink, ctaText: $ctaText, deepLink: $deepLink, subTitle: $subTitle, materialGroup: $materialGroup, category: $category, subCategory: $subCategory, brand: $brand, storeType: $storeType, restricted: $restricted, mobileImage: $mobileImage, webImage: $webImage, thumbnailImage: $thumbnailImage, rewardStepList: $rewardStepList, media: $media)';
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
            const DeepCollectionEquality().equals(other.webImage, webImage) &&
            const DeepCollectionEquality()
                .equals(other.thumbnailImage, thumbnailImage) &&
            const DeepCollectionEquality()
                .equals(other.rewardStepList, rewardStepList) &&
            const DeepCollectionEquality().equals(other.media, media));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        title,
        imageSrc,
        description,
        descriptionApp,
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
        const DeepCollectionEquality().hash(webImage),
        const DeepCollectionEquality().hash(thumbnailImage),
        const DeepCollectionEquality().hash(rewardStepList),
        const DeepCollectionEquality().hash(media)
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
      final String imageSrc,
      final String description,
      final String descriptionApp,
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
      final dynamic webImage,
      final dynamic thumbnailImage,
      final List<RewardStepList> rewardStepList,
      final List<Media> media}) = _$_WidgetItem;

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
  dynamic get webImage;
  @override
  dynamic get thumbnailImage;
  @override
  List<RewardStepList> get rewardStepList;
  @override
  List<Media> get media;
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

RewardStepList _$RewardStepListFromJson(Map<String, dynamic> json) {
  return _RewardStepList.fromJson(json);
}

/// @nodoc
mixin _$RewardStepList {
  String get rewardsSteps => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RewardStepListCopyWith<RewardStepList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RewardStepListCopyWith<$Res> {
  factory $RewardStepListCopyWith(
          RewardStepList value, $Res Function(RewardStepList) then) =
      _$RewardStepListCopyWithImpl<$Res, RewardStepList>;
  @useResult
  $Res call({String rewardsSteps});
}

/// @nodoc
class _$RewardStepListCopyWithImpl<$Res, $Val extends RewardStepList>
    implements $RewardStepListCopyWith<$Res> {
  _$RewardStepListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rewardsSteps = null,
  }) {
    return _then(_value.copyWith(
      rewardsSteps: null == rewardsSteps
          ? _value.rewardsSteps
          : rewardsSteps // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RewardStepListCopyWith<$Res>
    implements $RewardStepListCopyWith<$Res> {
  factory _$$_RewardStepListCopyWith(
          _$_RewardStepList value, $Res Function(_$_RewardStepList) then) =
      __$$_RewardStepListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String rewardsSteps});
}

/// @nodoc
class __$$_RewardStepListCopyWithImpl<$Res>
    extends _$RewardStepListCopyWithImpl<$Res, _$_RewardStepList>
    implements _$$_RewardStepListCopyWith<$Res> {
  __$$_RewardStepListCopyWithImpl(
      _$_RewardStepList _value, $Res Function(_$_RewardStepList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rewardsSteps = null,
  }) {
    return _then(_$_RewardStepList(
      rewardsSteps: null == rewardsSteps
          ? _value.rewardsSteps
          : rewardsSteps // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RewardStepList implements _RewardStepList {
  const _$_RewardStepList({this.rewardsSteps = ''});

  factory _$_RewardStepList.fromJson(Map<String, dynamic> json) =>
      _$$_RewardStepListFromJson(json);

  @override
  @JsonKey()
  final String rewardsSteps;

  @override
  String toString() {
    return 'RewardStepList(rewardsSteps: $rewardsSteps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RewardStepList &&
            (identical(other.rewardsSteps, rewardsSteps) ||
                other.rewardsSteps == rewardsSteps));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, rewardsSteps);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RewardStepListCopyWith<_$_RewardStepList> get copyWith =>
      __$$_RewardStepListCopyWithImpl<_$_RewardStepList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RewardStepListToJson(
      this,
    );
  }
}

abstract class _RewardStepList implements RewardStepList {
  const factory _RewardStepList({final String rewardsSteps}) =
      _$_RewardStepList;

  factory _RewardStepList.fromJson(Map<String, dynamic> json) =
      _$_RewardStepList.fromJson;

  @override
  String get rewardsSteps;
  @override
  @JsonKey(ignore: true)
  _$$_RewardStepListCopyWith<_$_RewardStepList> get copyWith =>
      throw _privateConstructorUsedError;
}

Media _$MediaFromJson(Map<String, dynamic> json) {
  return _Media.fromJson(json);
}

/// @nodoc
mixin _$Media {
  String get title => throw _privateConstructorUsedError;
  String get mediaText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaCopyWith<Media> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaCopyWith<$Res> {
  factory $MediaCopyWith(Media value, $Res Function(Media) then) =
      _$MediaCopyWithImpl<$Res, Media>;
  @useResult
  $Res call({String title, String mediaText});
}

/// @nodoc
class _$MediaCopyWithImpl<$Res, $Val extends Media>
    implements $MediaCopyWith<$Res> {
  _$MediaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? mediaText = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      mediaText: null == mediaText
          ? _value.mediaText
          : mediaText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MediaCopyWith<$Res> implements $MediaCopyWith<$Res> {
  factory _$$_MediaCopyWith(_$_Media value, $Res Function(_$_Media) then) =
      __$$_MediaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String mediaText});
}

/// @nodoc
class __$$_MediaCopyWithImpl<$Res> extends _$MediaCopyWithImpl<$Res, _$_Media>
    implements _$$_MediaCopyWith<$Res> {
  __$$_MediaCopyWithImpl(_$_Media _value, $Res Function(_$_Media) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? mediaText = null,
  }) {
    return _then(_$_Media(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      mediaText: null == mediaText
          ? _value.mediaText
          : mediaText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Media implements _Media {
  const _$_Media({this.title = '', this.mediaText = ''});

  factory _$_Media.fromJson(Map<String, dynamic> json) =>
      _$$_MediaFromJson(json);

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String mediaText;

  @override
  String toString() {
    return 'Media(title: $title, mediaText: $mediaText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Media &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.mediaText, mediaText) ||
                other.mediaText == mediaText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, mediaText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MediaCopyWith<_$_Media> get copyWith =>
      __$$_MediaCopyWithImpl<_$_Media>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MediaToJson(
      this,
    );
  }
}

abstract class _Media implements Media {
  const factory _Media({final String title, final String mediaText}) = _$_Media;

  factory _Media.fromJson(Map<String, dynamic> json) = _$_Media.fromJson;

  @override
  String get title;
  @override
  String get mediaText;
  @override
  @JsonKey(ignore: true)
  _$$_MediaCopyWith<_$_Media> get copyWith =>
      throw _privateConstructorUsedError;
}
