// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site_core_masters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SiteCoreMasters _$SiteCoreMastersFromJson(Map<String, dynamic> json) {
  return _SiteCoreMasters.fromJson(json);
}

/// @nodoc
mixin _$SiteCoreMasters {
  List<Element> get elements => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SiteCoreMastersCopyWith<SiteCoreMasters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiteCoreMastersCopyWith<$Res> {
  factory $SiteCoreMastersCopyWith(
          SiteCoreMasters value, $Res Function(SiteCoreMasters) then) =
      _$SiteCoreMastersCopyWithImpl<$Res, SiteCoreMasters>;
  @useResult
  $Res call({List<Element> elements});
}

/// @nodoc
class _$SiteCoreMastersCopyWithImpl<$Res, $Val extends SiteCoreMasters>
    implements $SiteCoreMastersCopyWith<$Res> {
  _$SiteCoreMastersCopyWithImpl(this._value, this._then);

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
abstract class _$$_SiteCoreMastersCopyWith<$Res>
    implements $SiteCoreMastersCopyWith<$Res> {
  factory _$$_SiteCoreMastersCopyWith(
          _$_SiteCoreMasters value, $Res Function(_$_SiteCoreMasters) then) =
      __$$_SiteCoreMastersCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Element> elements});
}

/// @nodoc
class __$$_SiteCoreMastersCopyWithImpl<$Res>
    extends _$SiteCoreMastersCopyWithImpl<$Res, _$_SiteCoreMasters>
    implements _$$_SiteCoreMastersCopyWith<$Res> {
  __$$_SiteCoreMastersCopyWithImpl(
      _$_SiteCoreMasters _value, $Res Function(_$_SiteCoreMasters) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? elements = null,
  }) {
    return _then(_$_SiteCoreMasters(
      elements: null == elements
          ? _value.elements
          : elements // ignore: cast_nullable_to_non_nullable
              as List<Element>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SiteCoreMasters implements _SiteCoreMasters {
  const _$_SiteCoreMasters({this.elements = const []});

  factory _$_SiteCoreMasters.fromJson(Map<String, dynamic> json) =>
      _$$_SiteCoreMastersFromJson(json);

  @override
  @JsonKey()
  final List<Element> elements;

  @override
  String toString() {
    return 'SiteCoreMasters(elements: $elements)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SiteCoreMasters &&
            const DeepCollectionEquality().equals(other.elements, elements));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(elements));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SiteCoreMastersCopyWith<_$_SiteCoreMasters> get copyWith =>
      __$$_SiteCoreMastersCopyWithImpl<_$_SiteCoreMasters>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SiteCoreMastersToJson(
      this,
    );
  }
}

abstract class _SiteCoreMasters implements SiteCoreMasters {
  const factory _SiteCoreMasters({final List<Element> elements}) =
      _$_SiteCoreMasters;

  factory _SiteCoreMasters.fromJson(Map<String, dynamic> json) =
      _$_SiteCoreMasters.fromJson;

  @override
  List<Element> get elements;
  @override
  @JsonKey(ignore: true)
  _$$_SiteCoreMastersCopyWith<_$_SiteCoreMasters> get copyWith =>
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
  List<Country> get country => throw _privateConstructorUsedError;
  List<Nationality> get nationality => throw _privateConstructorUsedError;
  List<BookingStatus> get bookingStatus => throw _privateConstructorUsedError;
  List<BookingStatus> get flyingClass => throw _privateConstructorUsedError;
  List<BookingStatus> get passengerType => throw _privateConstructorUsedError;
  List<BookingStatus> get serviceType => throw _privateConstructorUsedError;
  List<Salutation> get salutation => throw _privateConstructorUsedError;
  List<State> get state => throw _privateConstructorUsedError;
  List<TravelSector> get travelSector => throw _privateConstructorUsedError;

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
      {List<Country> country,
      List<Nationality> nationality,
      List<BookingStatus> bookingStatus,
      List<BookingStatus> flyingClass,
      List<BookingStatus> passengerType,
      List<BookingStatus> serviceType,
      List<Salutation> salutation,
      List<State> state,
      List<TravelSector> travelSector});
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
    Object? country = null,
    Object? nationality = null,
    Object? bookingStatus = null,
    Object? flyingClass = null,
    Object? passengerType = null,
    Object? serviceType = null,
    Object? salutation = null,
    Object? state = null,
    Object? travelSector = null,
  }) {
    return _then(_value.copyWith(
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as List<Country>,
      nationality: null == nationality
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as List<Nationality>,
      bookingStatus: null == bookingStatus
          ? _value.bookingStatus
          : bookingStatus // ignore: cast_nullable_to_non_nullable
              as List<BookingStatus>,
      flyingClass: null == flyingClass
          ? _value.flyingClass
          : flyingClass // ignore: cast_nullable_to_non_nullable
              as List<BookingStatus>,
      passengerType: null == passengerType
          ? _value.passengerType
          : passengerType // ignore: cast_nullable_to_non_nullable
              as List<BookingStatus>,
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as List<BookingStatus>,
      salutation: null == salutation
          ? _value.salutation
          : salutation // ignore: cast_nullable_to_non_nullable
              as List<Salutation>,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as List<State>,
      travelSector: null == travelSector
          ? _value.travelSector
          : travelSector // ignore: cast_nullable_to_non_nullable
              as List<TravelSector>,
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
      {List<Country> country,
      List<Nationality> nationality,
      List<BookingStatus> bookingStatus,
      List<BookingStatus> flyingClass,
      List<BookingStatus> passengerType,
      List<BookingStatus> serviceType,
      List<Salutation> salutation,
      List<State> state,
      List<TravelSector> travelSector});
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
    Object? country = null,
    Object? nationality = null,
    Object? bookingStatus = null,
    Object? flyingClass = null,
    Object? passengerType = null,
    Object? serviceType = null,
    Object? salutation = null,
    Object? state = null,
    Object? travelSector = null,
  }) {
    return _then(_$_Fields(
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as List<Country>,
      nationality: null == nationality
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as List<Nationality>,
      bookingStatus: null == bookingStatus
          ? _value.bookingStatus
          : bookingStatus // ignore: cast_nullable_to_non_nullable
              as List<BookingStatus>,
      flyingClass: null == flyingClass
          ? _value.flyingClass
          : flyingClass // ignore: cast_nullable_to_non_nullable
              as List<BookingStatus>,
      passengerType: null == passengerType
          ? _value.passengerType
          : passengerType // ignore: cast_nullable_to_non_nullable
              as List<BookingStatus>,
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as List<BookingStatus>,
      salutation: null == salutation
          ? _value.salutation
          : salutation // ignore: cast_nullable_to_non_nullable
              as List<Salutation>,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as List<State>,
      travelSector: null == travelSector
          ? _value.travelSector
          : travelSector // ignore: cast_nullable_to_non_nullable
              as List<TravelSector>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Fields implements _Fields {
  const _$_Fields(
      {this.country = const [],
      this.nationality = const [],
      this.bookingStatus = const [],
      this.flyingClass = const [],
      this.passengerType = const [],
      this.serviceType = const [],
      this.salutation = const [],
      this.state = const [],
      this.travelSector = const []});

  factory _$_Fields.fromJson(Map<String, dynamic> json) =>
      _$$_FieldsFromJson(json);

  @override
  @JsonKey()
  final List<Country> country;
  @override
  @JsonKey()
  final List<Nationality> nationality;
  @override
  @JsonKey()
  final List<BookingStatus> bookingStatus;
  @override
  @JsonKey()
  final List<BookingStatus> flyingClass;
  @override
  @JsonKey()
  final List<BookingStatus> passengerType;
  @override
  @JsonKey()
  final List<BookingStatus> serviceType;
  @override
  @JsonKey()
  final List<Salutation> salutation;
  @override
  @JsonKey()
  final List<State> state;
  @override
  @JsonKey()
  final List<TravelSector> travelSector;

  @override
  String toString() {
    return 'Fields(country: $country, nationality: $nationality, bookingStatus: $bookingStatus, flyingClass: $flyingClass, passengerType: $passengerType, serviceType: $serviceType, salutation: $salutation, state: $state, travelSector: $travelSector)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fields &&
            const DeepCollectionEquality().equals(other.country, country) &&
            const DeepCollectionEquality()
                .equals(other.nationality, nationality) &&
            const DeepCollectionEquality()
                .equals(other.bookingStatus, bookingStatus) &&
            const DeepCollectionEquality()
                .equals(other.flyingClass, flyingClass) &&
            const DeepCollectionEquality()
                .equals(other.passengerType, passengerType) &&
            const DeepCollectionEquality()
                .equals(other.serviceType, serviceType) &&
            const DeepCollectionEquality()
                .equals(other.salutation, salutation) &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality()
                .equals(other.travelSector, travelSector));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(country),
      const DeepCollectionEquality().hash(nationality),
      const DeepCollectionEquality().hash(bookingStatus),
      const DeepCollectionEquality().hash(flyingClass),
      const DeepCollectionEquality().hash(passengerType),
      const DeepCollectionEquality().hash(serviceType),
      const DeepCollectionEquality().hash(salutation),
      const DeepCollectionEquality().hash(state),
      const DeepCollectionEquality().hash(travelSector));

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
      {final List<Country> country,
      final List<Nationality> nationality,
      final List<BookingStatus> bookingStatus,
      final List<BookingStatus> flyingClass,
      final List<BookingStatus> passengerType,
      final List<BookingStatus> serviceType,
      final List<Salutation> salutation,
      final List<State> state,
      final List<TravelSector> travelSector}) = _$_Fields;

  factory _Fields.fromJson(Map<String, dynamic> json) = _$_Fields.fromJson;

  @override
  List<Country> get country;
  @override
  List<Nationality> get nationality;
  @override
  List<BookingStatus> get bookingStatus;
  @override
  List<BookingStatus> get flyingClass;
  @override
  List<BookingStatus> get passengerType;
  @override
  List<BookingStatus> get serviceType;
  @override
  List<Salutation> get salutation;
  @override
  List<State> get state;
  @override
  List<TravelSector> get travelSector;
  @override
  @JsonKey(ignore: true)
  _$$_FieldsCopyWith<_$_Fields> get copyWith =>
      throw _privateConstructorUsedError;
}

BookingStatus _$BookingStatusFromJson(Map<String, dynamic> json) {
  return _BookingStatus.fromJson(json);
}

/// @nodoc
mixin _$BookingStatus {
  @JsonKey(name: 'label')
  String get label => throw _privateConstructorUsedError;
  @JsonKey(name: 'order')
  String get order => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingStatusCopyWith<BookingStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingStatusCopyWith<$Res> {
  factory $BookingStatusCopyWith(
          BookingStatus value, $Res Function(BookingStatus) then) =
      _$BookingStatusCopyWithImpl<$Res, BookingStatus>;
  @useResult
  $Res call(
      {@JsonKey(name: 'label') String label,
      @JsonKey(name: 'order') String order,
      @JsonKey(name: 'id') String id});
}

/// @nodoc
class _$BookingStatusCopyWithImpl<$Res, $Val extends BookingStatus>
    implements $BookingStatusCopyWith<$Res> {
  _$BookingStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? order = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookingStatusCopyWith<$Res>
    implements $BookingStatusCopyWith<$Res> {
  factory _$$_BookingStatusCopyWith(
          _$_BookingStatus value, $Res Function(_$_BookingStatus) then) =
      __$$_BookingStatusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'label') String label,
      @JsonKey(name: 'order') String order,
      @JsonKey(name: 'id') String id});
}

/// @nodoc
class __$$_BookingStatusCopyWithImpl<$Res>
    extends _$BookingStatusCopyWithImpl<$Res, _$_BookingStatus>
    implements _$$_BookingStatusCopyWith<$Res> {
  __$$_BookingStatusCopyWithImpl(
      _$_BookingStatus _value, $Res Function(_$_BookingStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? order = null,
    Object? id = null,
  }) {
    return _then(_$_BookingStatus(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BookingStatus implements _BookingStatus {
  const _$_BookingStatus(
      {@JsonKey(name: 'label') this.label = '',
      @JsonKey(name: 'order') this.order = '',
      @JsonKey(name: 'id') this.id = ''});

  factory _$_BookingStatus.fromJson(Map<String, dynamic> json) =>
      _$$_BookingStatusFromJson(json);

  @override
  @JsonKey(name: 'label')
  final String label;
  @override
  @JsonKey(name: 'order')
  final String order;
  @override
  @JsonKey(name: 'id')
  final String id;

  @override
  String toString() {
    return 'BookingStatus(label: $label, order: $order, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookingStatus &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, label, order, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookingStatusCopyWith<_$_BookingStatus> get copyWith =>
      __$$_BookingStatusCopyWithImpl<_$_BookingStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookingStatusToJson(
      this,
    );
  }
}

abstract class _BookingStatus implements BookingStatus {
  const factory _BookingStatus(
      {@JsonKey(name: 'label') final String label,
      @JsonKey(name: 'order') final String order,
      @JsonKey(name: 'id') final String id}) = _$_BookingStatus;

  factory _BookingStatus.fromJson(Map<String, dynamic> json) =
      _$_BookingStatus.fromJson;

  @override
  @JsonKey(name: 'label')
  String get label;
  @override
  @JsonKey(name: 'order')
  String get order;
  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_BookingStatusCopyWith<_$_BookingStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

Country _$CountryFromJson(Map<String, dynamic> json) {
  return _Country.fromJson(json);
}

/// @nodoc
mixin _$Country {
  @JsonKey(name: 'countryName')
  String get countryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'dialCode')
  String get dialCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'isO3')
  String get isO3 => throw _privateConstructorUsedError;
  @JsonKey(name: 'isO2')
  String get isO2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'currencyName')
  String get currencyName => throw _privateConstructorUsedError;
  @JsonKey(name: 'currencyCode')
  String get currencyCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'untermEnglish')
  String get untermEnglish => throw _privateConstructorUsedError;
  @JsonKey(name: 'regionName')
  String get regionName => throw _privateConstructorUsedError;
  @JsonKey(name: 'capital')
  String get capital => throw _privateConstructorUsedError;
  @JsonKey(name: 'continent')
  String get continent => throw _privateConstructorUsedError;
  @JsonKey(name: 'tld')
  String get tld => throw _privateConstructorUsedError;
  @JsonKey(name: 'languages')
  String get languages => throw _privateConstructorUsedError;
  @JsonKey(name: 'isDeleted')
  bool get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'countryFlagImage')
  String get countryFlagImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryCopyWith<Country> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryCopyWith<$Res> {
  factory $CountryCopyWith(Country value, $Res Function(Country) then) =
      _$CountryCopyWithImpl<$Res, Country>;
  @useResult
  $Res call(
      {@JsonKey(name: 'countryName') String countryName,
      @JsonKey(name: 'dialCode') String dialCode,
      @JsonKey(name: 'isO3') String isO3,
      @JsonKey(name: 'isO2') String isO2,
      @JsonKey(name: 'currencyName') String currencyName,
      @JsonKey(name: 'currencyCode') String currencyCode,
      @JsonKey(name: 'untermEnglish') String untermEnglish,
      @JsonKey(name: 'regionName') String regionName,
      @JsonKey(name: 'capital') String capital,
      @JsonKey(name: 'continent') String continent,
      @JsonKey(name: 'tld') String tld,
      @JsonKey(name: 'languages') String languages,
      @JsonKey(name: 'isDeleted') bool isDeleted,
      @JsonKey(name: 'id') String id,
      @JsonKey(name: 'countryFlagImage') String countryFlagImage});
}

/// @nodoc
class _$CountryCopyWithImpl<$Res, $Val extends Country>
    implements $CountryCopyWith<$Res> {
  _$CountryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryName = null,
    Object? dialCode = null,
    Object? isO3 = null,
    Object? isO2 = null,
    Object? currencyName = null,
    Object? currencyCode = null,
    Object? untermEnglish = null,
    Object? regionName = null,
    Object? capital = null,
    Object? continent = null,
    Object? tld = null,
    Object? languages = null,
    Object? isDeleted = null,
    Object? id = null,
    Object? countryFlagImage = null,
  }) {
    return _then(_value.copyWith(
      countryName: null == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String,
      dialCode: null == dialCode
          ? _value.dialCode
          : dialCode // ignore: cast_nullable_to_non_nullable
              as String,
      isO3: null == isO3
          ? _value.isO3
          : isO3 // ignore: cast_nullable_to_non_nullable
              as String,
      isO2: null == isO2
          ? _value.isO2
          : isO2 // ignore: cast_nullable_to_non_nullable
              as String,
      currencyName: null == currencyName
          ? _value.currencyName
          : currencyName // ignore: cast_nullable_to_non_nullable
              as String,
      currencyCode: null == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      untermEnglish: null == untermEnglish
          ? _value.untermEnglish
          : untermEnglish // ignore: cast_nullable_to_non_nullable
              as String,
      regionName: null == regionName
          ? _value.regionName
          : regionName // ignore: cast_nullable_to_non_nullable
              as String,
      capital: null == capital
          ? _value.capital
          : capital // ignore: cast_nullable_to_non_nullable
              as String,
      continent: null == continent
          ? _value.continent
          : continent // ignore: cast_nullable_to_non_nullable
              as String,
      tld: null == tld
          ? _value.tld
          : tld // ignore: cast_nullable_to_non_nullable
              as String,
      languages: null == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as String,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      countryFlagImage: null == countryFlagImage
          ? _value.countryFlagImage
          : countryFlagImage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CountryCopyWith<$Res> implements $CountryCopyWith<$Res> {
  factory _$$_CountryCopyWith(
          _$_Country value, $Res Function(_$_Country) then) =
      __$$_CountryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'countryName') String countryName,
      @JsonKey(name: 'dialCode') String dialCode,
      @JsonKey(name: 'isO3') String isO3,
      @JsonKey(name: 'isO2') String isO2,
      @JsonKey(name: 'currencyName') String currencyName,
      @JsonKey(name: 'currencyCode') String currencyCode,
      @JsonKey(name: 'untermEnglish') String untermEnglish,
      @JsonKey(name: 'regionName') String regionName,
      @JsonKey(name: 'capital') String capital,
      @JsonKey(name: 'continent') String continent,
      @JsonKey(name: 'tld') String tld,
      @JsonKey(name: 'languages') String languages,
      @JsonKey(name: 'isDeleted') bool isDeleted,
      @JsonKey(name: 'id') String id,
      @JsonKey(name: 'countryFlagImage') String countryFlagImage});
}

/// @nodoc
class __$$_CountryCopyWithImpl<$Res>
    extends _$CountryCopyWithImpl<$Res, _$_Country>
    implements _$$_CountryCopyWith<$Res> {
  __$$_CountryCopyWithImpl(_$_Country _value, $Res Function(_$_Country) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryName = null,
    Object? dialCode = null,
    Object? isO3 = null,
    Object? isO2 = null,
    Object? currencyName = null,
    Object? currencyCode = null,
    Object? untermEnglish = null,
    Object? regionName = null,
    Object? capital = null,
    Object? continent = null,
    Object? tld = null,
    Object? languages = null,
    Object? isDeleted = null,
    Object? id = null,
    Object? countryFlagImage = null,
  }) {
    return _then(_$_Country(
      countryName: null == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String,
      dialCode: null == dialCode
          ? _value.dialCode
          : dialCode // ignore: cast_nullable_to_non_nullable
              as String,
      isO3: null == isO3
          ? _value.isO3
          : isO3 // ignore: cast_nullable_to_non_nullable
              as String,
      isO2: null == isO2
          ? _value.isO2
          : isO2 // ignore: cast_nullable_to_non_nullable
              as String,
      currencyName: null == currencyName
          ? _value.currencyName
          : currencyName // ignore: cast_nullable_to_non_nullable
              as String,
      currencyCode: null == currencyCode
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String,
      untermEnglish: null == untermEnglish
          ? _value.untermEnglish
          : untermEnglish // ignore: cast_nullable_to_non_nullable
              as String,
      regionName: null == regionName
          ? _value.regionName
          : regionName // ignore: cast_nullable_to_non_nullable
              as String,
      capital: null == capital
          ? _value.capital
          : capital // ignore: cast_nullable_to_non_nullable
              as String,
      continent: null == continent
          ? _value.continent
          : continent // ignore: cast_nullable_to_non_nullable
              as String,
      tld: null == tld
          ? _value.tld
          : tld // ignore: cast_nullable_to_non_nullable
              as String,
      languages: null == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as String,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      countryFlagImage: null == countryFlagImage
          ? _value.countryFlagImage
          : countryFlagImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Country implements _Country {
  const _$_Country(
      {@JsonKey(name: 'countryName') this.countryName = '',
      @JsonKey(name: 'dialCode') this.dialCode = '',
      @JsonKey(name: 'isO3') this.isO3 = '',
      @JsonKey(name: 'isO2') this.isO2 = '',
      @JsonKey(name: 'currencyName') this.currencyName = '',
      @JsonKey(name: 'currencyCode') this.currencyCode = '',
      @JsonKey(name: 'untermEnglish') this.untermEnglish = '',
      @JsonKey(name: 'regionName') this.regionName = '',
      @JsonKey(name: 'capital') this.capital = '',
      @JsonKey(name: 'continent') this.continent = '',
      @JsonKey(name: 'tld') this.tld = '',
      @JsonKey(name: 'languages') this.languages = '',
      @JsonKey(name: 'isDeleted') this.isDeleted = false,
      @JsonKey(name: 'id') this.id = '',
      @JsonKey(name: 'countryFlagImage') this.countryFlagImage = ''});

  factory _$_Country.fromJson(Map<String, dynamic> json) =>
      _$$_CountryFromJson(json);

  @override
  @JsonKey(name: 'countryName')
  final String countryName;
  @override
  @JsonKey(name: 'dialCode')
  final String dialCode;
  @override
  @JsonKey(name: 'isO3')
  final String isO3;
  @override
  @JsonKey(name: 'isO2')
  final String isO2;
  @override
  @JsonKey(name: 'currencyName')
  final String currencyName;
  @override
  @JsonKey(name: 'currencyCode')
  final String currencyCode;
  @override
  @JsonKey(name: 'untermEnglish')
  final String untermEnglish;
  @override
  @JsonKey(name: 'regionName')
  final String regionName;
  @override
  @JsonKey(name: 'capital')
  final String capital;
  @override
  @JsonKey(name: 'continent')
  final String continent;
  @override
  @JsonKey(name: 'tld')
  final String tld;
  @override
  @JsonKey(name: 'languages')
  final String languages;
  @override
  @JsonKey(name: 'isDeleted')
  final bool isDeleted;
  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'countryFlagImage')
  final String countryFlagImage;

  @override
  String toString() {
    return 'Country(countryName: $countryName, dialCode: $dialCode, isO3: $isO3, isO2: $isO2, currencyName: $currencyName, currencyCode: $currencyCode, untermEnglish: $untermEnglish, regionName: $regionName, capital: $capital, continent: $continent, tld: $tld, languages: $languages, isDeleted: $isDeleted, id: $id, countryFlagImage: $countryFlagImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Country &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName) &&
            (identical(other.dialCode, dialCode) ||
                other.dialCode == dialCode) &&
            (identical(other.isO3, isO3) || other.isO3 == isO3) &&
            (identical(other.isO2, isO2) || other.isO2 == isO2) &&
            (identical(other.currencyName, currencyName) ||
                other.currencyName == currencyName) &&
            (identical(other.currencyCode, currencyCode) ||
                other.currencyCode == currencyCode) &&
            (identical(other.untermEnglish, untermEnglish) ||
                other.untermEnglish == untermEnglish) &&
            (identical(other.regionName, regionName) ||
                other.regionName == regionName) &&
            (identical(other.capital, capital) || other.capital == capital) &&
            (identical(other.continent, continent) ||
                other.continent == continent) &&
            (identical(other.tld, tld) || other.tld == tld) &&
            (identical(other.languages, languages) ||
                other.languages == languages) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.countryFlagImage, countryFlagImage) ||
                other.countryFlagImage == countryFlagImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      countryName,
      dialCode,
      isO3,
      isO2,
      currencyName,
      currencyCode,
      untermEnglish,
      regionName,
      capital,
      continent,
      tld,
      languages,
      isDeleted,
      id,
      countryFlagImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CountryCopyWith<_$_Country> get copyWith =>
      __$$_CountryCopyWithImpl<_$_Country>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CountryToJson(
      this,
    );
  }
}

abstract class _Country implements Country {
  const factory _Country(
          {@JsonKey(name: 'countryName') final String countryName,
          @JsonKey(name: 'dialCode') final String dialCode,
          @JsonKey(name: 'isO3') final String isO3,
          @JsonKey(name: 'isO2') final String isO2,
          @JsonKey(name: 'currencyName') final String currencyName,
          @JsonKey(name: 'currencyCode') final String currencyCode,
          @JsonKey(name: 'untermEnglish') final String untermEnglish,
          @JsonKey(name: 'regionName') final String regionName,
          @JsonKey(name: 'capital') final String capital,
          @JsonKey(name: 'continent') final String continent,
          @JsonKey(name: 'tld') final String tld,
          @JsonKey(name: 'languages') final String languages,
          @JsonKey(name: 'isDeleted') final bool isDeleted,
          @JsonKey(name: 'id') final String id,
          @JsonKey(name: 'countryFlagImage') final String countryFlagImage}) =
      _$_Country;

  factory _Country.fromJson(Map<String, dynamic> json) = _$_Country.fromJson;

  @override
  @JsonKey(name: 'countryName')
  String get countryName;
  @override
  @JsonKey(name: 'dialCode')
  String get dialCode;
  @override
  @JsonKey(name: 'isO3')
  String get isO3;
  @override
  @JsonKey(name: 'isO2')
  String get isO2;
  @override
  @JsonKey(name: 'currencyName')
  String get currencyName;
  @override
  @JsonKey(name: 'currencyCode')
  String get currencyCode;
  @override
  @JsonKey(name: 'untermEnglish')
  String get untermEnglish;
  @override
  @JsonKey(name: 'regionName')
  String get regionName;
  @override
  @JsonKey(name: 'capital')
  String get capital;
  @override
  @JsonKey(name: 'continent')
  String get continent;
  @override
  @JsonKey(name: 'tld')
  String get tld;
  @override
  @JsonKey(name: 'languages')
  String get languages;
  @override
  @JsonKey(name: 'isDeleted')
  bool get isDeleted;
  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'countryFlagImage')
  String get countryFlagImage;
  @override
  @JsonKey(ignore: true)
  _$$_CountryCopyWith<_$_Country> get copyWith =>
      throw _privateConstructorUsedError;
}

Nationality _$NationalityFromJson(Map<String, dynamic> json) {
  return _Nationality.fromJson(json);
}

/// @nodoc
mixin _$Nationality {
  @JsonKey(name: 'countryName')
  String get countryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'nationality')
  String get nationality => throw _privateConstructorUsedError;
  @JsonKey(name: 'countryFlagImage')
  String get countryFlagImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NationalityCopyWith<Nationality> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NationalityCopyWith<$Res> {
  factory $NationalityCopyWith(
          Nationality value, $Res Function(Nationality) then) =
      _$NationalityCopyWithImpl<$Res, Nationality>;
  @useResult
  $Res call(
      {@JsonKey(name: 'countryName') String countryName,
      @JsonKey(name: 'nationality') String nationality,
      @JsonKey(name: 'countryFlagImage') String countryFlagImage});
}

/// @nodoc
class _$NationalityCopyWithImpl<$Res, $Val extends Nationality>
    implements $NationalityCopyWith<$Res> {
  _$NationalityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryName = null,
    Object? nationality = null,
    Object? countryFlagImage = null,
  }) {
    return _then(_value.copyWith(
      countryName: null == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String,
      nationality: null == nationality
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String,
      countryFlagImage: null == countryFlagImage
          ? _value.countryFlagImage
          : countryFlagImage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NationalityCopyWith<$Res>
    implements $NationalityCopyWith<$Res> {
  factory _$$_NationalityCopyWith(
          _$_Nationality value, $Res Function(_$_Nationality) then) =
      __$$_NationalityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'countryName') String countryName,
      @JsonKey(name: 'nationality') String nationality,
      @JsonKey(name: 'countryFlagImage') String countryFlagImage});
}

/// @nodoc
class __$$_NationalityCopyWithImpl<$Res>
    extends _$NationalityCopyWithImpl<$Res, _$_Nationality>
    implements _$$_NationalityCopyWith<$Res> {
  __$$_NationalityCopyWithImpl(
      _$_Nationality _value, $Res Function(_$_Nationality) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryName = null,
    Object? nationality = null,
    Object? countryFlagImage = null,
  }) {
    return _then(_$_Nationality(
      countryName: null == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String,
      nationality: null == nationality
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String,
      countryFlagImage: null == countryFlagImage
          ? _value.countryFlagImage
          : countryFlagImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Nationality implements _Nationality {
  const _$_Nationality(
      {@JsonKey(name: 'countryName') this.countryName = '',
      @JsonKey(name: 'nationality') this.nationality = '',
      @JsonKey(name: 'countryFlagImage') this.countryFlagImage = ''});

  factory _$_Nationality.fromJson(Map<String, dynamic> json) =>
      _$$_NationalityFromJson(json);

  @override
  @JsonKey(name: 'countryName')
  final String countryName;
  @override
  @JsonKey(name: 'nationality')
  final String nationality;
  @override
  @JsonKey(name: 'countryFlagImage')
  final String countryFlagImage;

  @override
  String toString() {
    return 'Nationality(countryName: $countryName, nationality: $nationality, countryFlagImage: $countryFlagImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Nationality &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName) &&
            (identical(other.nationality, nationality) ||
                other.nationality == nationality) &&
            (identical(other.countryFlagImage, countryFlagImage) ||
                other.countryFlagImage == countryFlagImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, countryName, nationality, countryFlagImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NationalityCopyWith<_$_Nationality> get copyWith =>
      __$$_NationalityCopyWithImpl<_$_Nationality>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NationalityToJson(
      this,
    );
  }
}

abstract class _Nationality implements Nationality {
  const factory _Nationality(
          {@JsonKey(name: 'countryName') final String countryName,
          @JsonKey(name: 'nationality') final String nationality,
          @JsonKey(name: 'countryFlagImage') final String countryFlagImage}) =
      _$_Nationality;

  factory _Nationality.fromJson(Map<String, dynamic> json) =
      _$_Nationality.fromJson;

  @override
  @JsonKey(name: 'countryName')
  String get countryName;
  @override
  @JsonKey(name: 'nationality')
  String get nationality;
  @override
  @JsonKey(name: 'countryFlagImage')
  String get countryFlagImage;
  @override
  @JsonKey(ignore: true)
  _$$_NationalityCopyWith<_$_Nationality> get copyWith =>
      throw _privateConstructorUsedError;
}

Salutation _$SalutationFromJson(Map<String, dynamic> json) {
  return _Salutation.fromJson(json);
}

/// @nodoc
mixin _$Salutation {
  @JsonKey(name: 'label')
  String get label => throw _privateConstructorUsedError;
  @JsonKey(name: 'order')
  String get order => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_Adult')
  String get isAdult => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_Child')
  String get isChild => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_Infant')
  String get isInfant => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalutationCopyWith<Salutation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalutationCopyWith<$Res> {
  factory $SalutationCopyWith(
          Salutation value, $Res Function(Salutation) then) =
      _$SalutationCopyWithImpl<$Res, Salutation>;
  @useResult
  $Res call(
      {@JsonKey(name: 'label') String label,
      @JsonKey(name: 'order') String order,
      @JsonKey(name: 'id') String id,
      @JsonKey(name: 'is_Adult') String isAdult,
      @JsonKey(name: 'is_Child') String isChild,
      @JsonKey(name: 'is_Infant') String isInfant});
}

/// @nodoc
class _$SalutationCopyWithImpl<$Res, $Val extends Salutation>
    implements $SalutationCopyWith<$Res> {
  _$SalutationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? order = null,
    Object? id = null,
    Object? isAdult = null,
    Object? isChild = null,
    Object? isInfant = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isAdult: null == isAdult
          ? _value.isAdult
          : isAdult // ignore: cast_nullable_to_non_nullable
              as String,
      isChild: null == isChild
          ? _value.isChild
          : isChild // ignore: cast_nullable_to_non_nullable
              as String,
      isInfant: null == isInfant
          ? _value.isInfant
          : isInfant // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SalutationCopyWith<$Res>
    implements $SalutationCopyWith<$Res> {
  factory _$$_SalutationCopyWith(
          _$_Salutation value, $Res Function(_$_Salutation) then) =
      __$$_SalutationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'label') String label,
      @JsonKey(name: 'order') String order,
      @JsonKey(name: 'id') String id,
      @JsonKey(name: 'is_Adult') String isAdult,
      @JsonKey(name: 'is_Child') String isChild,
      @JsonKey(name: 'is_Infant') String isInfant});
}

/// @nodoc
class __$$_SalutationCopyWithImpl<$Res>
    extends _$SalutationCopyWithImpl<$Res, _$_Salutation>
    implements _$$_SalutationCopyWith<$Res> {
  __$$_SalutationCopyWithImpl(
      _$_Salutation _value, $Res Function(_$_Salutation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? order = null,
    Object? id = null,
    Object? isAdult = null,
    Object? isChild = null,
    Object? isInfant = null,
  }) {
    return _then(_$_Salutation(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isAdult: null == isAdult
          ? _value.isAdult
          : isAdult // ignore: cast_nullable_to_non_nullable
              as String,
      isChild: null == isChild
          ? _value.isChild
          : isChild // ignore: cast_nullable_to_non_nullable
              as String,
      isInfant: null == isInfant
          ? _value.isInfant
          : isInfant // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Salutation implements _Salutation {
  const _$_Salutation(
      {@JsonKey(name: 'label') this.label = '',
      @JsonKey(name: 'order') this.order = '',
      @JsonKey(name: 'id') this.id = '',
      @JsonKey(name: 'is_Adult') this.isAdult = '',
      @JsonKey(name: 'is_Child') this.isChild = '',
      @JsonKey(name: 'is_Infant') this.isInfant = ''});

  factory _$_Salutation.fromJson(Map<String, dynamic> json) =>
      _$$_SalutationFromJson(json);

  @override
  @JsonKey(name: 'label')
  final String label;
  @override
  @JsonKey(name: 'order')
  final String order;
  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'is_Adult')
  final String isAdult;
  @override
  @JsonKey(name: 'is_Child')
  final String isChild;
  @override
  @JsonKey(name: 'is_Infant')
  final String isInfant;

  @override
  String toString() {
    return 'Salutation(label: $label, order: $order, id: $id, isAdult: $isAdult, isChild: $isChild, isInfant: $isInfant)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Salutation &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isAdult, isAdult) || other.isAdult == isAdult) &&
            (identical(other.isChild, isChild) || other.isChild == isChild) &&
            (identical(other.isInfant, isInfant) ||
                other.isInfant == isInfant));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, label, order, id, isAdult, isChild, isInfant);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SalutationCopyWith<_$_Salutation> get copyWith =>
      __$$_SalutationCopyWithImpl<_$_Salutation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SalutationToJson(
      this,
    );
  }
}

abstract class _Salutation implements Salutation {
  const factory _Salutation(
      {@JsonKey(name: 'label') final String label,
      @JsonKey(name: 'order') final String order,
      @JsonKey(name: 'id') final String id,
      @JsonKey(name: 'is_Adult') final String isAdult,
      @JsonKey(name: 'is_Child') final String isChild,
      @JsonKey(name: 'is_Infant') final String isInfant}) = _$_Salutation;

  factory _Salutation.fromJson(Map<String, dynamic> json) =
      _$_Salutation.fromJson;

  @override
  @JsonKey(name: 'label')
  String get label;
  @override
  @JsonKey(name: 'order')
  String get order;
  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'is_Adult')
  String get isAdult;
  @override
  @JsonKey(name: 'is_Child')
  String get isChild;
  @override
  @JsonKey(name: 'is_Infant')
  String get isInfant;
  @override
  @JsonKey(ignore: true)
  _$$_SalutationCopyWith<_$_Salutation> get copyWith =>
      throw _privateConstructorUsedError;
}

State _$StateFromJson(Map<String, dynamic> json) {
  return _State.fromJson(json);
}

/// @nodoc
mixin _$State {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'import')
  String get stateImport => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_Master')
  String get countryMaster => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_Code')
  String get countryCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'state_Code')
  String get stateCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_State_Code')
  String get tinCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'latitude')
  String get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'longitude')
  String get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StateCopyWith<State> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateCopyWith<$Res> {
  factory $StateCopyWith(State value, $Res Function(State) then) =
      _$StateCopyWithImpl<$Res, State>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'import') String stateImport,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'country_Master') String countryMaster,
      @JsonKey(name: 'country_Code') String countryCode,
      @JsonKey(name: 'state_Code') String stateCode,
      @JsonKey(name: 'updated_State_Code') String tinCode,
      @JsonKey(name: 'latitude') String latitude,
      @JsonKey(name: 'longitude') String longitude});
}

/// @nodoc
class _$StateCopyWithImpl<$Res, $Val extends State>
    implements $StateCopyWith<$Res> {
  _$StateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? stateImport = null,
    Object? name = null,
    Object? countryMaster = null,
    Object? countryCode = null,
    Object? stateCode = null,
    Object? tinCode = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      stateImport: null == stateImport
          ? _value.stateImport
          : stateImport // ignore: cast_nullable_to_non_nullable
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
      tinCode: null == tinCode
          ? _value.tinCode
          : tinCode // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_StateCopyWith<$Res> implements $StateCopyWith<$Res> {
  factory _$$_StateCopyWith(_$_State value, $Res Function(_$_State) then) =
      __$$_StateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'import') String stateImport,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'country_Master') String countryMaster,
      @JsonKey(name: 'country_Code') String countryCode,
      @JsonKey(name: 'state_Code') String stateCode,
      @JsonKey(name: 'updated_State_Code') String tinCode,
      @JsonKey(name: 'latitude') String latitude,
      @JsonKey(name: 'longitude') String longitude});
}

/// @nodoc
class __$$_StateCopyWithImpl<$Res> extends _$StateCopyWithImpl<$Res, _$_State>
    implements _$$_StateCopyWith<$Res> {
  __$$_StateCopyWithImpl(_$_State _value, $Res Function(_$_State) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? stateImport = null,
    Object? name = null,
    Object? countryMaster = null,
    Object? countryCode = null,
    Object? stateCode = null,
    Object? tinCode = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$_State(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      stateImport: null == stateImport
          ? _value.stateImport
          : stateImport // ignore: cast_nullable_to_non_nullable
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
      tinCode: null == tinCode
          ? _value.tinCode
          : tinCode // ignore: cast_nullable_to_non_nullable
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
class _$_State implements _State {
  const _$_State(
      {@JsonKey(name: 'id') this.id = '',
      @JsonKey(name: 'import') this.stateImport = '',
      @JsonKey(name: 'name') this.name = '',
      @JsonKey(name: 'country_Master') this.countryMaster = '',
      @JsonKey(name: 'country_Code') this.countryCode = '',
      @JsonKey(name: 'state_Code') this.stateCode = '',
      @JsonKey(name: 'updated_State_Code') this.tinCode = '',
      @JsonKey(name: 'latitude') this.latitude = '',
      @JsonKey(name: 'longitude') this.longitude = ''});

  factory _$_State.fromJson(Map<String, dynamic> json) =>
      _$$_StateFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'import')
  final String stateImport;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'country_Master')
  final String countryMaster;
  @override
  @JsonKey(name: 'country_Code')
  final String countryCode;
  @override
  @JsonKey(name: 'state_Code')
  final String stateCode;
  @override
  @JsonKey(name: 'updated_State_Code')
  final String tinCode;
  @override
  @JsonKey(name: 'latitude')
  final String latitude;
  @override
  @JsonKey(name: 'longitude')
  final String longitude;

  @override
  String toString() {
    return 'State(id: $id, stateImport: $stateImport, name: $name, countryMaster: $countryMaster, countryCode: $countryCode, stateCode: $stateCode, tinCode: $tinCode, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_State &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.stateImport, stateImport) ||
                other.stateImport == stateImport) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.countryMaster, countryMaster) ||
                other.countryMaster == countryMaster) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.stateCode, stateCode) ||
                other.stateCode == stateCode) &&
            (identical(other.tinCode, tinCode) || other.tinCode == tinCode) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, stateImport, name,
      countryMaster, countryCode, stateCode, tinCode, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StateCopyWith<_$_State> get copyWith =>
      __$$_StateCopyWithImpl<_$_State>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StateToJson(
      this,
    );
  }
}

abstract class _State implements State {
  const factory _State(
      {@JsonKey(name: 'id') final String id,
      @JsonKey(name: 'import') final String stateImport,
      @JsonKey(name: 'name') final String name,
      @JsonKey(name: 'country_Master') final String countryMaster,
      @JsonKey(name: 'country_Code') final String countryCode,
      @JsonKey(name: 'state_Code') final String stateCode,
      @JsonKey(name: 'updated_State_Code') final String tinCode,
      @JsonKey(name: 'latitude') final String latitude,
      @JsonKey(name: 'longitude') final String longitude}) = _$_State;

  factory _State.fromJson(Map<String, dynamic> json) = _$_State.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'import')
  String get stateImport;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'country_Master')
  String get countryMaster;
  @override
  @JsonKey(name: 'country_Code')
  String get countryCode;
  @override
  @JsonKey(name: 'state_Code')
  String get stateCode;
  @override
  @JsonKey(name: 'updated_State_Code')
  String get tinCode;
  @override
  @JsonKey(name: 'latitude')
  String get latitude;
  @override
  @JsonKey(name: 'longitude')
  String get longitude;
  @override
  @JsonKey(ignore: true)
  _$$_StateCopyWith<_$_State> get copyWith =>
      throw _privateConstructorUsedError;
}

TravelSector _$TravelSectorFromJson(Map<String, dynamic> json) {
  return _TravelSector.fromJson(json);
}

/// @nodoc
mixin _$TravelSector {
  @JsonKey(name: 'label')
  String get label => throw _privateConstructorUsedError;
  @JsonKey(name: 'order')
  String get order => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_Transit')
  String get isTransit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TravelSectorCopyWith<TravelSector> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelSectorCopyWith<$Res> {
  factory $TravelSectorCopyWith(
          TravelSector value, $Res Function(TravelSector) then) =
      _$TravelSectorCopyWithImpl<$Res, TravelSector>;
  @useResult
  $Res call(
      {@JsonKey(name: 'label') String label,
      @JsonKey(name: 'order') String order,
      @JsonKey(name: 'id') String id,
      @JsonKey(name: 'is_Transit') String isTransit});
}

/// @nodoc
class _$TravelSectorCopyWithImpl<$Res, $Val extends TravelSector>
    implements $TravelSectorCopyWith<$Res> {
  _$TravelSectorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? order = null,
    Object? id = null,
    Object? isTransit = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isTransit: null == isTransit
          ? _value.isTransit
          : isTransit // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TravelSectorCopyWith<$Res>
    implements $TravelSectorCopyWith<$Res> {
  factory _$$_TravelSectorCopyWith(
          _$_TravelSector value, $Res Function(_$_TravelSector) then) =
      __$$_TravelSectorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'label') String label,
      @JsonKey(name: 'order') String order,
      @JsonKey(name: 'id') String id,
      @JsonKey(name: 'is_Transit') String isTransit});
}

/// @nodoc
class __$$_TravelSectorCopyWithImpl<$Res>
    extends _$TravelSectorCopyWithImpl<$Res, _$_TravelSector>
    implements _$$_TravelSectorCopyWith<$Res> {
  __$$_TravelSectorCopyWithImpl(
      _$_TravelSector _value, $Res Function(_$_TravelSector) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? order = null,
    Object? id = null,
    Object? isTransit = null,
  }) {
    return _then(_$_TravelSector(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isTransit: null == isTransit
          ? _value.isTransit
          : isTransit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TravelSector implements _TravelSector {
  const _$_TravelSector(
      {@JsonKey(name: 'label') this.label = '',
      @JsonKey(name: 'order') this.order = '',
      @JsonKey(name: 'id') this.id = '',
      @JsonKey(name: 'is_Transit') this.isTransit = ''});

  factory _$_TravelSector.fromJson(Map<String, dynamic> json) =>
      _$$_TravelSectorFromJson(json);

  @override
  @JsonKey(name: 'label')
  final String label;
  @override
  @JsonKey(name: 'order')
  final String order;
  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'is_Transit')
  final String isTransit;

  @override
  String toString() {
    return 'TravelSector(label: $label, order: $order, id: $id, isTransit: $isTransit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TravelSector &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isTransit, isTransit) ||
                other.isTransit == isTransit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, label, order, id, isTransit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TravelSectorCopyWith<_$_TravelSector> get copyWith =>
      __$$_TravelSectorCopyWithImpl<_$_TravelSector>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TravelSectorToJson(
      this,
    );
  }
}

abstract class _TravelSector implements TravelSector {
  const factory _TravelSector(
      {@JsonKey(name: 'label') final String label,
      @JsonKey(name: 'order') final String order,
      @JsonKey(name: 'id') final String id,
      @JsonKey(name: 'is_Transit') final String isTransit}) = _$_TravelSector;

  factory _TravelSector.fromJson(Map<String, dynamic> json) =
      _$_TravelSector.fromJson;

  @override
  @JsonKey(name: 'label')
  String get label;
  @override
  @JsonKey(name: 'order')
  String get order;
  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'is_Transit')
  String get isTransit;
  @override
  @JsonKey(ignore: true)
  _$$_TravelSectorCopyWith<_$_TravelSector> get copyWith =>
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
