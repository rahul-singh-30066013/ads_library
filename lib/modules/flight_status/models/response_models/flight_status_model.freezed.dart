// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flight_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FlightStatusModel _$FlightStatusModelFromJson(Map<String, dynamic> json) {
  return _FlightStatusModel.fromJson(json);
}

/// @nodoc
mixin _$FlightStatusModel {
  List<FlightStatusSegment> get flightsegment =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlightStatusModelCopyWith<FlightStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlightStatusModelCopyWith<$Res> {
  factory $FlightStatusModelCopyWith(
          FlightStatusModel value, $Res Function(FlightStatusModel) then) =
      _$FlightStatusModelCopyWithImpl<$Res, FlightStatusModel>;
  @useResult
  $Res call({List<FlightStatusSegment> flightsegment});
}

/// @nodoc
class _$FlightStatusModelCopyWithImpl<$Res, $Val extends FlightStatusModel>
    implements $FlightStatusModelCopyWith<$Res> {
  _$FlightStatusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flightsegment = null,
  }) {
    return _then(_value.copyWith(
      flightsegment: null == flightsegment
          ? _value.flightsegment
          : flightsegment // ignore: cast_nullable_to_non_nullable
              as List<FlightStatusSegment>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FlightStatusModelCopyWith<$Res>
    implements $FlightStatusModelCopyWith<$Res> {
  factory _$$_FlightStatusModelCopyWith(_$_FlightStatusModel value,
          $Res Function(_$_FlightStatusModel) then) =
      __$$_FlightStatusModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<FlightStatusSegment> flightsegment});
}

/// @nodoc
class __$$_FlightStatusModelCopyWithImpl<$Res>
    extends _$FlightStatusModelCopyWithImpl<$Res, _$_FlightStatusModel>
    implements _$$_FlightStatusModelCopyWith<$Res> {
  __$$_FlightStatusModelCopyWithImpl(
      _$_FlightStatusModel _value, $Res Function(_$_FlightStatusModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flightsegment = null,
  }) {
    return _then(_$_FlightStatusModel(
      flightsegment: null == flightsegment
          ? _value.flightsegment
          : flightsegment // ignore: cast_nullable_to_non_nullable
              as List<FlightStatusSegment>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FlightStatusModel implements _FlightStatusModel {
  const _$_FlightStatusModel({this.flightsegment = const []});

  factory _$_FlightStatusModel.fromJson(Map<String, dynamic> json) =>
      _$$_FlightStatusModelFromJson(json);

  @override
  @JsonKey()
  final List<FlightStatusSegment> flightsegment;

  @override
  String toString() {
    return 'FlightStatusModel(flightsegment: $flightsegment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FlightStatusModel &&
            const DeepCollectionEquality()
                .equals(other.flightsegment, flightsegment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(flightsegment));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FlightStatusModelCopyWith<_$_FlightStatusModel> get copyWith =>
      __$$_FlightStatusModelCopyWithImpl<_$_FlightStatusModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FlightStatusModelToJson(
      this,
    );
  }
}

abstract class _FlightStatusModel implements FlightStatusModel {
  const factory _FlightStatusModel(
      {final List<FlightStatusSegment> flightsegment}) = _$_FlightStatusModel;

  factory _FlightStatusModel.fromJson(Map<String, dynamic> json) =
      _$_FlightStatusModel.fromJson;

  @override
  List<FlightStatusSegment> get flightsegment;
  @override
  @JsonKey(ignore: true)
  _$$_FlightStatusModelCopyWith<_$_FlightStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

FlightStatusSegment _$FlightStatusSegmentFromJson(Map<String, dynamic> json) {
  return _FlightStatusSegment.fromJson(json);
}

/// @nodoc
mixin _$FlightStatusSegment {
  String get iatalocalairport => throw _privateConstructorUsedError;
  String get iatalocalairportcode => throw _privateConstructorUsedError;
  String get iataroute => throw _privateConstructorUsedError;
  String get iataroutecode => throw _privateConstructorUsedError;
  String get estimatedtime => throw _privateConstructorUsedError;
  String get actualtime => throw _privateConstructorUsedError;
  String get airlinecode => throw _privateConstructorUsedError;
  String get flightnumber => throw _privateConstructorUsedError;
  String get terminal => throw _privateConstructorUsedError;
  String get aircrafttype => throw _privateConstructorUsedError;
  String get flighttype => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get remarkes => throw _privateConstructorUsedError;
  String get flightkind => throw _privateConstructorUsedError;
  String get scheduletime => throw _privateConstructorUsedError;
  String get estimateddate => throw _privateConstructorUsedError;
  String get actualdate => throw _privateConstructorUsedError;
  String get scheduledate => throw _privateConstructorUsedError;
  String get cardId => throw _privateConstructorUsedError;
  List<Carousel> get stands => throw _privateConstructorUsedError;
  List<Carousel> get gates => throw _privateConstructorUsedError;
  List<Carousel> get carousel => throw _privateConstructorUsedError;
  List<Carousel> get checkInCounter => throw _privateConstructorUsedError;
  List<String> get codeShare => throw _privateConstructorUsedError;
  bool get isFlightAdded => throw _privateConstructorUsedError;
  bool get isFlightAdding => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlightStatusSegmentCopyWith<FlightStatusSegment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlightStatusSegmentCopyWith<$Res> {
  factory $FlightStatusSegmentCopyWith(
          FlightStatusSegment value, $Res Function(FlightStatusSegment) then) =
      _$FlightStatusSegmentCopyWithImpl<$Res, FlightStatusSegment>;
  @useResult
  $Res call(
      {String iatalocalairport,
      String iatalocalairportcode,
      String iataroute,
      String iataroutecode,
      String estimatedtime,
      String actualtime,
      String airlinecode,
      String flightnumber,
      String terminal,
      String aircrafttype,
      String flighttype,
      String status,
      String remarkes,
      String flightkind,
      String scheduletime,
      String estimateddate,
      String actualdate,
      String scheduledate,
      String cardId,
      List<Carousel> stands,
      List<Carousel> gates,
      List<Carousel> carousel,
      List<Carousel> checkInCounter,
      List<String> codeShare,
      bool isFlightAdded,
      bool isFlightAdding});
}

/// @nodoc
class _$FlightStatusSegmentCopyWithImpl<$Res, $Val extends FlightStatusSegment>
    implements $FlightStatusSegmentCopyWith<$Res> {
  _$FlightStatusSegmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iatalocalairport = null,
    Object? iatalocalairportcode = null,
    Object? iataroute = null,
    Object? iataroutecode = null,
    Object? estimatedtime = null,
    Object? actualtime = null,
    Object? airlinecode = null,
    Object? flightnumber = null,
    Object? terminal = null,
    Object? aircrafttype = null,
    Object? flighttype = null,
    Object? status = null,
    Object? remarkes = null,
    Object? flightkind = null,
    Object? scheduletime = null,
    Object? estimateddate = null,
    Object? actualdate = null,
    Object? scheduledate = null,
    Object? cardId = null,
    Object? stands = null,
    Object? gates = null,
    Object? carousel = null,
    Object? checkInCounter = null,
    Object? codeShare = null,
    Object? isFlightAdded = null,
    Object? isFlightAdding = null,
  }) {
    return _then(_value.copyWith(
      iatalocalairport: null == iatalocalairport
          ? _value.iatalocalairport
          : iatalocalairport // ignore: cast_nullable_to_non_nullable
              as String,
      iatalocalairportcode: null == iatalocalairportcode
          ? _value.iatalocalairportcode
          : iatalocalairportcode // ignore: cast_nullable_to_non_nullable
              as String,
      iataroute: null == iataroute
          ? _value.iataroute
          : iataroute // ignore: cast_nullable_to_non_nullable
              as String,
      iataroutecode: null == iataroutecode
          ? _value.iataroutecode
          : iataroutecode // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedtime: null == estimatedtime
          ? _value.estimatedtime
          : estimatedtime // ignore: cast_nullable_to_non_nullable
              as String,
      actualtime: null == actualtime
          ? _value.actualtime
          : actualtime // ignore: cast_nullable_to_non_nullable
              as String,
      airlinecode: null == airlinecode
          ? _value.airlinecode
          : airlinecode // ignore: cast_nullable_to_non_nullable
              as String,
      flightnumber: null == flightnumber
          ? _value.flightnumber
          : flightnumber // ignore: cast_nullable_to_non_nullable
              as String,
      terminal: null == terminal
          ? _value.terminal
          : terminal // ignore: cast_nullable_to_non_nullable
              as String,
      aircrafttype: null == aircrafttype
          ? _value.aircrafttype
          : aircrafttype // ignore: cast_nullable_to_non_nullable
              as String,
      flighttype: null == flighttype
          ? _value.flighttype
          : flighttype // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      remarkes: null == remarkes
          ? _value.remarkes
          : remarkes // ignore: cast_nullable_to_non_nullable
              as String,
      flightkind: null == flightkind
          ? _value.flightkind
          : flightkind // ignore: cast_nullable_to_non_nullable
              as String,
      scheduletime: null == scheduletime
          ? _value.scheduletime
          : scheduletime // ignore: cast_nullable_to_non_nullable
              as String,
      estimateddate: null == estimateddate
          ? _value.estimateddate
          : estimateddate // ignore: cast_nullable_to_non_nullable
              as String,
      actualdate: null == actualdate
          ? _value.actualdate
          : actualdate // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledate: null == scheduledate
          ? _value.scheduledate
          : scheduledate // ignore: cast_nullable_to_non_nullable
              as String,
      cardId: null == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as String,
      stands: null == stands
          ? _value.stands
          : stands // ignore: cast_nullable_to_non_nullable
              as List<Carousel>,
      gates: null == gates
          ? _value.gates
          : gates // ignore: cast_nullable_to_non_nullable
              as List<Carousel>,
      carousel: null == carousel
          ? _value.carousel
          : carousel // ignore: cast_nullable_to_non_nullable
              as List<Carousel>,
      checkInCounter: null == checkInCounter
          ? _value.checkInCounter
          : checkInCounter // ignore: cast_nullable_to_non_nullable
              as List<Carousel>,
      codeShare: null == codeShare
          ? _value.codeShare
          : codeShare // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isFlightAdded: null == isFlightAdded
          ? _value.isFlightAdded
          : isFlightAdded // ignore: cast_nullable_to_non_nullable
              as bool,
      isFlightAdding: null == isFlightAdding
          ? _value.isFlightAdding
          : isFlightAdding // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FlightStatusSegmentCopyWith<$Res>
    implements $FlightStatusSegmentCopyWith<$Res> {
  factory _$$_FlightStatusSegmentCopyWith(_$_FlightStatusSegment value,
          $Res Function(_$_FlightStatusSegment) then) =
      __$$_FlightStatusSegmentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String iatalocalairport,
      String iatalocalairportcode,
      String iataroute,
      String iataroutecode,
      String estimatedtime,
      String actualtime,
      String airlinecode,
      String flightnumber,
      String terminal,
      String aircrafttype,
      String flighttype,
      String status,
      String remarkes,
      String flightkind,
      String scheduletime,
      String estimateddate,
      String actualdate,
      String scheduledate,
      String cardId,
      List<Carousel> stands,
      List<Carousel> gates,
      List<Carousel> carousel,
      List<Carousel> checkInCounter,
      List<String> codeShare,
      bool isFlightAdded,
      bool isFlightAdding});
}

/// @nodoc
class __$$_FlightStatusSegmentCopyWithImpl<$Res>
    extends _$FlightStatusSegmentCopyWithImpl<$Res, _$_FlightStatusSegment>
    implements _$$_FlightStatusSegmentCopyWith<$Res> {
  __$$_FlightStatusSegmentCopyWithImpl(_$_FlightStatusSegment _value,
      $Res Function(_$_FlightStatusSegment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iatalocalairport = null,
    Object? iatalocalairportcode = null,
    Object? iataroute = null,
    Object? iataroutecode = null,
    Object? estimatedtime = null,
    Object? actualtime = null,
    Object? airlinecode = null,
    Object? flightnumber = null,
    Object? terminal = null,
    Object? aircrafttype = null,
    Object? flighttype = null,
    Object? status = null,
    Object? remarkes = null,
    Object? flightkind = null,
    Object? scheduletime = null,
    Object? estimateddate = null,
    Object? actualdate = null,
    Object? scheduledate = null,
    Object? cardId = null,
    Object? stands = null,
    Object? gates = null,
    Object? carousel = null,
    Object? checkInCounter = null,
    Object? codeShare = null,
    Object? isFlightAdded = null,
    Object? isFlightAdding = null,
  }) {
    return _then(_$_FlightStatusSegment(
      iatalocalairport: null == iatalocalairport
          ? _value.iatalocalairport
          : iatalocalairport // ignore: cast_nullable_to_non_nullable
              as String,
      iatalocalairportcode: null == iatalocalairportcode
          ? _value.iatalocalairportcode
          : iatalocalairportcode // ignore: cast_nullable_to_non_nullable
              as String,
      iataroute: null == iataroute
          ? _value.iataroute
          : iataroute // ignore: cast_nullable_to_non_nullable
              as String,
      iataroutecode: null == iataroutecode
          ? _value.iataroutecode
          : iataroutecode // ignore: cast_nullable_to_non_nullable
              as String,
      estimatedtime: null == estimatedtime
          ? _value.estimatedtime
          : estimatedtime // ignore: cast_nullable_to_non_nullable
              as String,
      actualtime: null == actualtime
          ? _value.actualtime
          : actualtime // ignore: cast_nullable_to_non_nullable
              as String,
      airlinecode: null == airlinecode
          ? _value.airlinecode
          : airlinecode // ignore: cast_nullable_to_non_nullable
              as String,
      flightnumber: null == flightnumber
          ? _value.flightnumber
          : flightnumber // ignore: cast_nullable_to_non_nullable
              as String,
      terminal: null == terminal
          ? _value.terminal
          : terminal // ignore: cast_nullable_to_non_nullable
              as String,
      aircrafttype: null == aircrafttype
          ? _value.aircrafttype
          : aircrafttype // ignore: cast_nullable_to_non_nullable
              as String,
      flighttype: null == flighttype
          ? _value.flighttype
          : flighttype // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      remarkes: null == remarkes
          ? _value.remarkes
          : remarkes // ignore: cast_nullable_to_non_nullable
              as String,
      flightkind: null == flightkind
          ? _value.flightkind
          : flightkind // ignore: cast_nullable_to_non_nullable
              as String,
      scheduletime: null == scheduletime
          ? _value.scheduletime
          : scheduletime // ignore: cast_nullable_to_non_nullable
              as String,
      estimateddate: null == estimateddate
          ? _value.estimateddate
          : estimateddate // ignore: cast_nullable_to_non_nullable
              as String,
      actualdate: null == actualdate
          ? _value.actualdate
          : actualdate // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledate: null == scheduledate
          ? _value.scheduledate
          : scheduledate // ignore: cast_nullable_to_non_nullable
              as String,
      cardId: null == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as String,
      stands: null == stands
          ? _value.stands
          : stands // ignore: cast_nullable_to_non_nullable
              as List<Carousel>,
      gates: null == gates
          ? _value.gates
          : gates // ignore: cast_nullable_to_non_nullable
              as List<Carousel>,
      carousel: null == carousel
          ? _value.carousel
          : carousel // ignore: cast_nullable_to_non_nullable
              as List<Carousel>,
      checkInCounter: null == checkInCounter
          ? _value.checkInCounter
          : checkInCounter // ignore: cast_nullable_to_non_nullable
              as List<Carousel>,
      codeShare: null == codeShare
          ? _value.codeShare
          : codeShare // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isFlightAdded: null == isFlightAdded
          ? _value.isFlightAdded
          : isFlightAdded // ignore: cast_nullable_to_non_nullable
              as bool,
      isFlightAdding: null == isFlightAdding
          ? _value.isFlightAdding
          : isFlightAdding // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FlightStatusSegment implements _FlightStatusSegment {
  const _$_FlightStatusSegment(
      {this.iatalocalairport = '',
      this.iatalocalairportcode = '',
      this.iataroute = '',
      this.iataroutecode = '',
      this.estimatedtime = '',
      this.actualtime = '',
      this.airlinecode = '',
      this.flightnumber = '',
      this.terminal = '',
      this.aircrafttype = '',
      this.flighttype = '',
      this.status = '',
      this.remarkes = '',
      this.flightkind = '',
      this.scheduletime = '',
      this.estimateddate = '',
      this.actualdate = '',
      this.scheduledate = '',
      this.cardId = '',
      this.stands = const [],
      this.gates = const [],
      this.carousel = const [],
      this.checkInCounter = const [],
      this.codeShare = const [],
      this.isFlightAdded = false,
      this.isFlightAdding = false});

  factory _$_FlightStatusSegment.fromJson(Map<String, dynamic> json) =>
      _$$_FlightStatusSegmentFromJson(json);

  @override
  @JsonKey()
  final String iatalocalairport;
  @override
  @JsonKey()
  final String iatalocalairportcode;
  @override
  @JsonKey()
  final String iataroute;
  @override
  @JsonKey()
  final String iataroutecode;
  @override
  @JsonKey()
  final String estimatedtime;
  @override
  @JsonKey()
  final String actualtime;
  @override
  @JsonKey()
  final String airlinecode;
  @override
  @JsonKey()
  final String flightnumber;
  @override
  @JsonKey()
  final String terminal;
  @override
  @JsonKey()
  final String aircrafttype;
  @override
  @JsonKey()
  final String flighttype;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final String remarkes;
  @override
  @JsonKey()
  final String flightkind;
  @override
  @JsonKey()
  final String scheduletime;
  @override
  @JsonKey()
  final String estimateddate;
  @override
  @JsonKey()
  final String actualdate;
  @override
  @JsonKey()
  final String scheduledate;
  @override
  @JsonKey()
  final String cardId;
  @override
  @JsonKey()
  final List<Carousel> stands;
  @override
  @JsonKey()
  final List<Carousel> gates;
  @override
  @JsonKey()
  final List<Carousel> carousel;
  @override
  @JsonKey()
  final List<Carousel> checkInCounter;
  @override
  @JsonKey()
  final List<String> codeShare;
  @override
  @JsonKey()
  final bool isFlightAdded;
  @override
  @JsonKey()
  final bool isFlightAdding;

  @override
  String toString() {
    return 'FlightStatusSegment(iatalocalairport: $iatalocalairport, iatalocalairportcode: $iatalocalairportcode, iataroute: $iataroute, iataroutecode: $iataroutecode, estimatedtime: $estimatedtime, actualtime: $actualtime, airlinecode: $airlinecode, flightnumber: $flightnumber, terminal: $terminal, aircrafttype: $aircrafttype, flighttype: $flighttype, status: $status, remarkes: $remarkes, flightkind: $flightkind, scheduletime: $scheduletime, estimateddate: $estimateddate, actualdate: $actualdate, scheduledate: $scheduledate, cardId: $cardId, stands: $stands, gates: $gates, carousel: $carousel, checkInCounter: $checkInCounter, codeShare: $codeShare, isFlightAdded: $isFlightAdded, isFlightAdding: $isFlightAdding)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FlightStatusSegment &&
            (identical(other.iatalocalairport, iatalocalairport) ||
                other.iatalocalairport == iatalocalairport) &&
            (identical(other.iatalocalairportcode, iatalocalairportcode) ||
                other.iatalocalairportcode == iatalocalairportcode) &&
            (identical(other.iataroute, iataroute) ||
                other.iataroute == iataroute) &&
            (identical(other.iataroutecode, iataroutecode) ||
                other.iataroutecode == iataroutecode) &&
            (identical(other.estimatedtime, estimatedtime) ||
                other.estimatedtime == estimatedtime) &&
            (identical(other.actualtime, actualtime) ||
                other.actualtime == actualtime) &&
            (identical(other.airlinecode, airlinecode) ||
                other.airlinecode == airlinecode) &&
            (identical(other.flightnumber, flightnumber) ||
                other.flightnumber == flightnumber) &&
            (identical(other.terminal, terminal) ||
                other.terminal == terminal) &&
            (identical(other.aircrafttype, aircrafttype) ||
                other.aircrafttype == aircrafttype) &&
            (identical(other.flighttype, flighttype) ||
                other.flighttype == flighttype) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.remarkes, remarkes) ||
                other.remarkes == remarkes) &&
            (identical(other.flightkind, flightkind) ||
                other.flightkind == flightkind) &&
            (identical(other.scheduletime, scheduletime) ||
                other.scheduletime == scheduletime) &&
            (identical(other.estimateddate, estimateddate) ||
                other.estimateddate == estimateddate) &&
            (identical(other.actualdate, actualdate) ||
                other.actualdate == actualdate) &&
            (identical(other.scheduledate, scheduledate) ||
                other.scheduledate == scheduledate) &&
            (identical(other.cardId, cardId) || other.cardId == cardId) &&
            const DeepCollectionEquality().equals(other.stands, stands) &&
            const DeepCollectionEquality().equals(other.gates, gates) &&
            const DeepCollectionEquality().equals(other.carousel, carousel) &&
            const DeepCollectionEquality()
                .equals(other.checkInCounter, checkInCounter) &&
            const DeepCollectionEquality().equals(other.codeShare, codeShare) &&
            (identical(other.isFlightAdded, isFlightAdded) ||
                other.isFlightAdded == isFlightAdded) &&
            (identical(other.isFlightAdding, isFlightAdding) ||
                other.isFlightAdding == isFlightAdding));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        iatalocalairport,
        iatalocalairportcode,
        iataroute,
        iataroutecode,
        estimatedtime,
        actualtime,
        airlinecode,
        flightnumber,
        terminal,
        aircrafttype,
        flighttype,
        status,
        remarkes,
        flightkind,
        scheduletime,
        estimateddate,
        actualdate,
        scheduledate,
        cardId,
        const DeepCollectionEquality().hash(stands),
        const DeepCollectionEquality().hash(gates),
        const DeepCollectionEquality().hash(carousel),
        const DeepCollectionEquality().hash(checkInCounter),
        const DeepCollectionEquality().hash(codeShare),
        isFlightAdded,
        isFlightAdding
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FlightStatusSegmentCopyWith<_$_FlightStatusSegment> get copyWith =>
      __$$_FlightStatusSegmentCopyWithImpl<_$_FlightStatusSegment>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FlightStatusSegmentToJson(
      this,
    );
  }
}

abstract class _FlightStatusSegment implements FlightStatusSegment {
  const factory _FlightStatusSegment(
      {final String iatalocalairport,
      final String iatalocalairportcode,
      final String iataroute,
      final String iataroutecode,
      final String estimatedtime,
      final String actualtime,
      final String airlinecode,
      final String flightnumber,
      final String terminal,
      final String aircrafttype,
      final String flighttype,
      final String status,
      final String remarkes,
      final String flightkind,
      final String scheduletime,
      final String estimateddate,
      final String actualdate,
      final String scheduledate,
      final String cardId,
      final List<Carousel> stands,
      final List<Carousel> gates,
      final List<Carousel> carousel,
      final List<Carousel> checkInCounter,
      final List<String> codeShare,
      final bool isFlightAdded,
      final bool isFlightAdding}) = _$_FlightStatusSegment;

  factory _FlightStatusSegment.fromJson(Map<String, dynamic> json) =
      _$_FlightStatusSegment.fromJson;

  @override
  String get iatalocalairport;
  @override
  String get iatalocalairportcode;
  @override
  String get iataroute;
  @override
  String get iataroutecode;
  @override
  String get estimatedtime;
  @override
  String get actualtime;
  @override
  String get airlinecode;
  @override
  String get flightnumber;
  @override
  String get terminal;
  @override
  String get aircrafttype;
  @override
  String get flighttype;
  @override
  String get status;
  @override
  String get remarkes;
  @override
  String get flightkind;
  @override
  String get scheduletime;
  @override
  String get estimateddate;
  @override
  String get actualdate;
  @override
  String get scheduledate;
  @override
  String get cardId;
  @override
  List<Carousel> get stands;
  @override
  List<Carousel> get gates;
  @override
  List<Carousel> get carousel;
  @override
  List<Carousel> get checkInCounter;
  @override
  List<String> get codeShare;
  @override
  bool get isFlightAdded;
  @override
  bool get isFlightAdding;
  @override
  @JsonKey(ignore: true)
  _$$_FlightStatusSegmentCopyWith<_$_FlightStatusSegment> get copyWith =>
      throw _privateConstructorUsedError;
}

Carousel _$CarouselFromJson(Map<String, dynamic> json) {
  return _Carousel.fromJson(json);
}

/// @nodoc
mixin _$Carousel {
  String get fromtime => throw _privateConstructorUsedError;
  String get totime => throw _privateConstructorUsedError;
  String get carousel => throw _privateConstructorUsedError;
  int get sequence => throw _privateConstructorUsedError;
  String get gate => throw _privateConstructorUsedError;
  String get stand => throw _privateConstructorUsedError;
  String get checkincounter => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CarouselCopyWith<Carousel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarouselCopyWith<$Res> {
  factory $CarouselCopyWith(Carousel value, $Res Function(Carousel) then) =
      _$CarouselCopyWithImpl<$Res, Carousel>;
  @useResult
  $Res call(
      {String fromtime,
      String totime,
      String carousel,
      int sequence,
      String gate,
      String stand,
      String checkincounter});
}

/// @nodoc
class _$CarouselCopyWithImpl<$Res, $Val extends Carousel>
    implements $CarouselCopyWith<$Res> {
  _$CarouselCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromtime = null,
    Object? totime = null,
    Object? carousel = null,
    Object? sequence = null,
    Object? gate = null,
    Object? stand = null,
    Object? checkincounter = null,
  }) {
    return _then(_value.copyWith(
      fromtime: null == fromtime
          ? _value.fromtime
          : fromtime // ignore: cast_nullable_to_non_nullable
              as String,
      totime: null == totime
          ? _value.totime
          : totime // ignore: cast_nullable_to_non_nullable
              as String,
      carousel: null == carousel
          ? _value.carousel
          : carousel // ignore: cast_nullable_to_non_nullable
              as String,
      sequence: null == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
      gate: null == gate
          ? _value.gate
          : gate // ignore: cast_nullable_to_non_nullable
              as String,
      stand: null == stand
          ? _value.stand
          : stand // ignore: cast_nullable_to_non_nullable
              as String,
      checkincounter: null == checkincounter
          ? _value.checkincounter
          : checkincounter // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CarouselCopyWith<$Res> implements $CarouselCopyWith<$Res> {
  factory _$$_CarouselCopyWith(
          _$_Carousel value, $Res Function(_$_Carousel) then) =
      __$$_CarouselCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String fromtime,
      String totime,
      String carousel,
      int sequence,
      String gate,
      String stand,
      String checkincounter});
}

/// @nodoc
class __$$_CarouselCopyWithImpl<$Res>
    extends _$CarouselCopyWithImpl<$Res, _$_Carousel>
    implements _$$_CarouselCopyWith<$Res> {
  __$$_CarouselCopyWithImpl(
      _$_Carousel _value, $Res Function(_$_Carousel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromtime = null,
    Object? totime = null,
    Object? carousel = null,
    Object? sequence = null,
    Object? gate = null,
    Object? stand = null,
    Object? checkincounter = null,
  }) {
    return _then(_$_Carousel(
      fromtime: null == fromtime
          ? _value.fromtime
          : fromtime // ignore: cast_nullable_to_non_nullable
              as String,
      totime: null == totime
          ? _value.totime
          : totime // ignore: cast_nullable_to_non_nullable
              as String,
      carousel: null == carousel
          ? _value.carousel
          : carousel // ignore: cast_nullable_to_non_nullable
              as String,
      sequence: null == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
      gate: null == gate
          ? _value.gate
          : gate // ignore: cast_nullable_to_non_nullable
              as String,
      stand: null == stand
          ? _value.stand
          : stand // ignore: cast_nullable_to_non_nullable
              as String,
      checkincounter: null == checkincounter
          ? _value.checkincounter
          : checkincounter // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Carousel implements _Carousel {
  const _$_Carousel(
      {this.fromtime = '',
      this.totime = '',
      this.carousel = '',
      this.sequence = 0,
      this.gate = '',
      this.stand = '',
      this.checkincounter = ''});

  factory _$_Carousel.fromJson(Map<String, dynamic> json) =>
      _$$_CarouselFromJson(json);

  @override
  @JsonKey()
  final String fromtime;
  @override
  @JsonKey()
  final String totime;
  @override
  @JsonKey()
  final String carousel;
  @override
  @JsonKey()
  final int sequence;
  @override
  @JsonKey()
  final String gate;
  @override
  @JsonKey()
  final String stand;
  @override
  @JsonKey()
  final String checkincounter;

  @override
  String toString() {
    return 'Carousel(fromtime: $fromtime, totime: $totime, carousel: $carousel, sequence: $sequence, gate: $gate, stand: $stand, checkincounter: $checkincounter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Carousel &&
            (identical(other.fromtime, fromtime) ||
                other.fromtime == fromtime) &&
            (identical(other.totime, totime) || other.totime == totime) &&
            (identical(other.carousel, carousel) ||
                other.carousel == carousel) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence) &&
            (identical(other.gate, gate) || other.gate == gate) &&
            (identical(other.stand, stand) || other.stand == stand) &&
            (identical(other.checkincounter, checkincounter) ||
                other.checkincounter == checkincounter));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fromtime, totime, carousel,
      sequence, gate, stand, checkincounter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CarouselCopyWith<_$_Carousel> get copyWith =>
      __$$_CarouselCopyWithImpl<_$_Carousel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CarouselToJson(
      this,
    );
  }
}

abstract class _Carousel implements Carousel {
  const factory _Carousel(
      {final String fromtime,
      final String totime,
      final String carousel,
      final int sequence,
      final String gate,
      final String stand,
      final String checkincounter}) = _$_Carousel;

  factory _Carousel.fromJson(Map<String, dynamic> json) = _$_Carousel.fromJson;

  @override
  String get fromtime;
  @override
  String get totime;
  @override
  String get carousel;
  @override
  int get sequence;
  @override
  String get gate;
  @override
  String get stand;
  @override
  String get checkincounter;
  @override
  @JsonKey(ignore: true)
  _$$_CarouselCopyWith<_$_Carousel> get copyWith =>
      throw _privateConstructorUsedError;
}
