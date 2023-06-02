// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_flight_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SavedFlightModel _$SavedFlightModelFromJson(Map<String, dynamic> json) {
  return _SavedFlightModel.fromJson(json);
}

/// @nodoc
mixin _$SavedFlightModel {
  int get totalRecords => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  int get promoId => throw _privateConstructorUsedError;
  List<SavedFlightListData> get flights => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SavedFlightModelCopyWith<SavedFlightModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedFlightModelCopyWith<$Res> {
  factory $SavedFlightModelCopyWith(
          SavedFlightModel value, $Res Function(SavedFlightModel) then) =
      _$SavedFlightModelCopyWithImpl<$Res, SavedFlightModel>;
  @useResult
  $Res call(
      {int totalRecords,
      int totalPages,
      int pageSize,
      int promoId,
      List<SavedFlightListData> flights});
}

/// @nodoc
class _$SavedFlightModelCopyWithImpl<$Res, $Val extends SavedFlightModel>
    implements $SavedFlightModelCopyWith<$Res> {
  _$SavedFlightModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalRecords = null,
    Object? totalPages = null,
    Object? pageSize = null,
    Object? promoId = null,
    Object? flights = null,
  }) {
    return _then(_value.copyWith(
      totalRecords: null == totalRecords
          ? _value.totalRecords
          : totalRecords // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      promoId: null == promoId
          ? _value.promoId
          : promoId // ignore: cast_nullable_to_non_nullable
              as int,
      flights: null == flights
          ? _value.flights
          : flights // ignore: cast_nullable_to_non_nullable
              as List<SavedFlightListData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SavedFlightModelCopyWith<$Res>
    implements $SavedFlightModelCopyWith<$Res> {
  factory _$$_SavedFlightModelCopyWith(
          _$_SavedFlightModel value, $Res Function(_$_SavedFlightModel) then) =
      __$$_SavedFlightModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalRecords,
      int totalPages,
      int pageSize,
      int promoId,
      List<SavedFlightListData> flights});
}

/// @nodoc
class __$$_SavedFlightModelCopyWithImpl<$Res>
    extends _$SavedFlightModelCopyWithImpl<$Res, _$_SavedFlightModel>
    implements _$$_SavedFlightModelCopyWith<$Res> {
  __$$_SavedFlightModelCopyWithImpl(
      _$_SavedFlightModel _value, $Res Function(_$_SavedFlightModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalRecords = null,
    Object? totalPages = null,
    Object? pageSize = null,
    Object? promoId = null,
    Object? flights = null,
  }) {
    return _then(_$_SavedFlightModel(
      totalRecords: null == totalRecords
          ? _value.totalRecords
          : totalRecords // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      promoId: null == promoId
          ? _value.promoId
          : promoId // ignore: cast_nullable_to_non_nullable
              as int,
      flights: null == flights
          ? _value.flights
          : flights // ignore: cast_nullable_to_non_nullable
              as List<SavedFlightListData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SavedFlightModel implements _SavedFlightModel {
  const _$_SavedFlightModel(
      {this.totalRecords = 0,
      this.totalPages = 0,
      this.pageSize = 0,
      this.promoId = 0,
      this.flights = const []});

  factory _$_SavedFlightModel.fromJson(Map<String, dynamic> json) =>
      _$$_SavedFlightModelFromJson(json);

  @override
  @JsonKey()
  final int totalRecords;
  @override
  @JsonKey()
  final int totalPages;
  @override
  @JsonKey()
  final int pageSize;
  @override
  @JsonKey()
  final int promoId;
  @override
  @JsonKey()
  final List<SavedFlightListData> flights;

  @override
  String toString() {
    return 'SavedFlightModel(totalRecords: $totalRecords, totalPages: $totalPages, pageSize: $pageSize, promoId: $promoId, flights: $flights)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SavedFlightModel &&
            (identical(other.totalRecords, totalRecords) ||
                other.totalRecords == totalRecords) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.promoId, promoId) || other.promoId == promoId) &&
            const DeepCollectionEquality().equals(other.flights, flights));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalRecords, totalPages,
      pageSize, promoId, const DeepCollectionEquality().hash(flights));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SavedFlightModelCopyWith<_$_SavedFlightModel> get copyWith =>
      __$$_SavedFlightModelCopyWithImpl<_$_SavedFlightModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SavedFlightModelToJson(
      this,
    );
  }
}

abstract class _SavedFlightModel implements SavedFlightModel {
  const factory _SavedFlightModel(
      {final int totalRecords,
      final int totalPages,
      final int pageSize,
      final int promoId,
      final List<SavedFlightListData> flights}) = _$_SavedFlightModel;

  factory _SavedFlightModel.fromJson(Map<String, dynamic> json) =
      _$_SavedFlightModel.fromJson;

  @override
  int get totalRecords;
  @override
  int get totalPages;
  @override
  int get pageSize;
  @override
  int get promoId;
  @override
  List<SavedFlightListData> get flights;
  @override
  @JsonKey(ignore: true)
  _$$_SavedFlightModelCopyWith<_$_SavedFlightModel> get copyWith =>
      throw _privateConstructorUsedError;
}

SavedFlightListData _$SavedFlightListDataFromJson(Map<String, dynamic> json) {
  return _SavedFlightListData.fromJson(json);
}

/// @nodoc
mixin _$SavedFlightListData {
  String get cardId => throw _privateConstructorUsedError;
  String get airlineCode => throw _privateConstructorUsedError;
  String get flightNo => throw _privateConstructorUsedError;
  String get flightName => throw _privateConstructorUsedError;
  String get scheduledDate => throw _privateConstructorUsedError;
  String get scheduledTime => throw _privateConstructorUsedError;
  String get upcomingDate => throw _privateConstructorUsedError;
  Origin? get origin => throw _privateConstructorUsedError;
  Destination? get destination => throw _privateConstructorUsedError;
  String get terminal => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get remarkes => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get baggageBelt => throw _privateConstructorUsedError;
  String get mobileNo => throw _privateConstructorUsedError;
  bool? get isSelected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SavedFlightListDataCopyWith<SavedFlightListData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedFlightListDataCopyWith<$Res> {
  factory $SavedFlightListDataCopyWith(
          SavedFlightListData value, $Res Function(SavedFlightListData) then) =
      _$SavedFlightListDataCopyWithImpl<$Res, SavedFlightListData>;
  @useResult
  $Res call(
      {String cardId,
      String airlineCode,
      String flightNo,
      String flightName,
      String scheduledDate,
      String scheduledTime,
      String upcomingDate,
      Origin? origin,
      Destination? destination,
      String terminal,
      String status,
      String remarkes,
      String type,
      String baggageBelt,
      String mobileNo,
      bool? isSelected});

  $OriginCopyWith<$Res>? get origin;
  $DestinationCopyWith<$Res>? get destination;
}

/// @nodoc
class _$SavedFlightListDataCopyWithImpl<$Res, $Val extends SavedFlightListData>
    implements $SavedFlightListDataCopyWith<$Res> {
  _$SavedFlightListDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardId = null,
    Object? airlineCode = null,
    Object? flightNo = null,
    Object? flightName = null,
    Object? scheduledDate = null,
    Object? scheduledTime = null,
    Object? upcomingDate = null,
    Object? origin = freezed,
    Object? destination = freezed,
    Object? terminal = null,
    Object? status = null,
    Object? remarkes = null,
    Object? type = null,
    Object? baggageBelt = null,
    Object? mobileNo = null,
    Object? isSelected = freezed,
  }) {
    return _then(_value.copyWith(
      cardId: null == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as String,
      airlineCode: null == airlineCode
          ? _value.airlineCode
          : airlineCode // ignore: cast_nullable_to_non_nullable
              as String,
      flightNo: null == flightNo
          ? _value.flightNo
          : flightNo // ignore: cast_nullable_to_non_nullable
              as String,
      flightName: null == flightName
          ? _value.flightName
          : flightName // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledDate: null == scheduledDate
          ? _value.scheduledDate
          : scheduledDate // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledTime: null == scheduledTime
          ? _value.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as String,
      upcomingDate: null == upcomingDate
          ? _value.upcomingDate
          : upcomingDate // ignore: cast_nullable_to_non_nullable
              as String,
      origin: freezed == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as Origin?,
      destination: freezed == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as Destination?,
      terminal: null == terminal
          ? _value.terminal
          : terminal // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      remarkes: null == remarkes
          ? _value.remarkes
          : remarkes // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      baggageBelt: null == baggageBelt
          ? _value.baggageBelt
          : baggageBelt // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNo: null == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OriginCopyWith<$Res>? get origin {
    if (_value.origin == null) {
      return null;
    }

    return $OriginCopyWith<$Res>(_value.origin!, (value) {
      return _then(_value.copyWith(origin: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DestinationCopyWith<$Res>? get destination {
    if (_value.destination == null) {
      return null;
    }

    return $DestinationCopyWith<$Res>(_value.destination!, (value) {
      return _then(_value.copyWith(destination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SavedFlightListDataCopyWith<$Res>
    implements $SavedFlightListDataCopyWith<$Res> {
  factory _$$_SavedFlightListDataCopyWith(_$_SavedFlightListData value,
          $Res Function(_$_SavedFlightListData) then) =
      __$$_SavedFlightListDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String cardId,
      String airlineCode,
      String flightNo,
      String flightName,
      String scheduledDate,
      String scheduledTime,
      String upcomingDate,
      Origin? origin,
      Destination? destination,
      String terminal,
      String status,
      String remarkes,
      String type,
      String baggageBelt,
      String mobileNo,
      bool? isSelected});

  @override
  $OriginCopyWith<$Res>? get origin;
  @override
  $DestinationCopyWith<$Res>? get destination;
}

/// @nodoc
class __$$_SavedFlightListDataCopyWithImpl<$Res>
    extends _$SavedFlightListDataCopyWithImpl<$Res, _$_SavedFlightListData>
    implements _$$_SavedFlightListDataCopyWith<$Res> {
  __$$_SavedFlightListDataCopyWithImpl(_$_SavedFlightListData _value,
      $Res Function(_$_SavedFlightListData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cardId = null,
    Object? airlineCode = null,
    Object? flightNo = null,
    Object? flightName = null,
    Object? scheduledDate = null,
    Object? scheduledTime = null,
    Object? upcomingDate = null,
    Object? origin = freezed,
    Object? destination = freezed,
    Object? terminal = null,
    Object? status = null,
    Object? remarkes = null,
    Object? type = null,
    Object? baggageBelt = null,
    Object? mobileNo = null,
    Object? isSelected = freezed,
  }) {
    return _then(_$_SavedFlightListData(
      cardId: null == cardId
          ? _value.cardId
          : cardId // ignore: cast_nullable_to_non_nullable
              as String,
      airlineCode: null == airlineCode
          ? _value.airlineCode
          : airlineCode // ignore: cast_nullable_to_non_nullable
              as String,
      flightNo: null == flightNo
          ? _value.flightNo
          : flightNo // ignore: cast_nullable_to_non_nullable
              as String,
      flightName: null == flightName
          ? _value.flightName
          : flightName // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledDate: null == scheduledDate
          ? _value.scheduledDate
          : scheduledDate // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledTime: null == scheduledTime
          ? _value.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as String,
      upcomingDate: null == upcomingDate
          ? _value.upcomingDate
          : upcomingDate // ignore: cast_nullable_to_non_nullable
              as String,
      origin: freezed == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as Origin?,
      destination: freezed == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as Destination?,
      terminal: null == terminal
          ? _value.terminal
          : terminal // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      remarkes: null == remarkes
          ? _value.remarkes
          : remarkes // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      baggageBelt: null == baggageBelt
          ? _value.baggageBelt
          : baggageBelt // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNo: null == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: freezed == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SavedFlightListData implements _SavedFlightListData {
  const _$_SavedFlightListData(
      {this.cardId = '',
      this.airlineCode = '',
      this.flightNo = '',
      this.flightName = '',
      this.scheduledDate = '',
      this.scheduledTime = '',
      this.upcomingDate = '',
      this.origin,
      this.destination,
      this.terminal = '',
      this.status = '',
      this.remarkes = '',
      this.type = '',
      this.baggageBelt = '',
      this.mobileNo = '',
      this.isSelected = false});

  factory _$_SavedFlightListData.fromJson(Map<String, dynamic> json) =>
      _$$_SavedFlightListDataFromJson(json);

  @override
  @JsonKey()
  final String cardId;
  @override
  @JsonKey()
  final String airlineCode;
  @override
  @JsonKey()
  final String flightNo;
  @override
  @JsonKey()
  final String flightName;
  @override
  @JsonKey()
  final String scheduledDate;
  @override
  @JsonKey()
  final String scheduledTime;
  @override
  @JsonKey()
  final String upcomingDate;
  @override
  final Origin? origin;
  @override
  final Destination? destination;
  @override
  @JsonKey()
  final String terminal;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final String remarkes;
  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final String baggageBelt;
  @override
  @JsonKey()
  final String mobileNo;
  @override
  @JsonKey()
  final bool? isSelected;

  @override
  String toString() {
    return 'SavedFlightListData(cardId: $cardId, airlineCode: $airlineCode, flightNo: $flightNo, flightName: $flightName, scheduledDate: $scheduledDate, scheduledTime: $scheduledTime, upcomingDate: $upcomingDate, origin: $origin, destination: $destination, terminal: $terminal, status: $status, remarkes: $remarkes, type: $type, baggageBelt: $baggageBelt, mobileNo: $mobileNo, isSelected: $isSelected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SavedFlightListData &&
            (identical(other.cardId, cardId) || other.cardId == cardId) &&
            (identical(other.airlineCode, airlineCode) ||
                other.airlineCode == airlineCode) &&
            (identical(other.flightNo, flightNo) ||
                other.flightNo == flightNo) &&
            (identical(other.flightName, flightName) ||
                other.flightName == flightName) &&
            (identical(other.scheduledDate, scheduledDate) ||
                other.scheduledDate == scheduledDate) &&
            (identical(other.scheduledTime, scheduledTime) ||
                other.scheduledTime == scheduledTime) &&
            (identical(other.upcomingDate, upcomingDate) ||
                other.upcomingDate == upcomingDate) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.terminal, terminal) ||
                other.terminal == terminal) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.remarkes, remarkes) ||
                other.remarkes == remarkes) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.baggageBelt, baggageBelt) ||
                other.baggageBelt == baggageBelt) &&
            (identical(other.mobileNo, mobileNo) ||
                other.mobileNo == mobileNo) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      cardId,
      airlineCode,
      flightNo,
      flightName,
      scheduledDate,
      scheduledTime,
      upcomingDate,
      origin,
      destination,
      terminal,
      status,
      remarkes,
      type,
      baggageBelt,
      mobileNo,
      isSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SavedFlightListDataCopyWith<_$_SavedFlightListData> get copyWith =>
      __$$_SavedFlightListDataCopyWithImpl<_$_SavedFlightListData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SavedFlightListDataToJson(
      this,
    );
  }
}

abstract class _SavedFlightListData implements SavedFlightListData {
  const factory _SavedFlightListData(
      {final String cardId,
      final String airlineCode,
      final String flightNo,
      final String flightName,
      final String scheduledDate,
      final String scheduledTime,
      final String upcomingDate,
      final Origin? origin,
      final Destination? destination,
      final String terminal,
      final String status,
      final String remarkes,
      final String type,
      final String baggageBelt,
      final String mobileNo,
      final bool? isSelected}) = _$_SavedFlightListData;

  factory _SavedFlightListData.fromJson(Map<String, dynamic> json) =
      _$_SavedFlightListData.fromJson;

  @override
  String get cardId;
  @override
  String get airlineCode;
  @override
  String get flightNo;
  @override
  String get flightName;
  @override
  String get scheduledDate;
  @override
  String get scheduledTime;
  @override
  String get upcomingDate;
  @override
  Origin? get origin;
  @override
  Destination? get destination;
  @override
  String get terminal;
  @override
  String get status;
  @override
  String get remarkes;
  @override
  String get type;
  @override
  String get baggageBelt;
  @override
  String get mobileNo;
  @override
  bool? get isSelected;
  @override
  @JsonKey(ignore: true)
  _$$_SavedFlightListDataCopyWith<_$_SavedFlightListData> get copyWith =>
      throw _privateConstructorUsedError;
}

Origin _$OriginFromJson(Map<String, dynamic> json) {
  return _Origin.fromJson(json);
}

/// @nodoc
mixin _$Origin {
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OriginCopyWith<Origin> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OriginCopyWith<$Res> {
  factory $OriginCopyWith(Origin value, $Res Function(Origin) then) =
      _$OriginCopyWithImpl<$Res, Origin>;
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class _$OriginCopyWithImpl<$Res, $Val extends Origin>
    implements $OriginCopyWith<$Res> {
  _$OriginCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OriginCopyWith<$Res> implements $OriginCopyWith<$Res> {
  factory _$$_OriginCopyWith(_$_Origin value, $Res Function(_$_Origin) then) =
      __$$_OriginCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class __$$_OriginCopyWithImpl<$Res>
    extends _$OriginCopyWithImpl<$Res, _$_Origin>
    implements _$$_OriginCopyWith<$Res> {
  __$$_OriginCopyWithImpl(_$_Origin _value, $Res Function(_$_Origin) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_$_Origin(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Origin implements _Origin {
  const _$_Origin({this.name = '', this.code = ''});

  factory _$_Origin.fromJson(Map<String, dynamic> json) =>
      _$$_OriginFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String code;

  @override
  String toString() {
    return 'Origin(name: $name, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Origin &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OriginCopyWith<_$_Origin> get copyWith =>
      __$$_OriginCopyWithImpl<_$_Origin>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OriginToJson(
      this,
    );
  }
}

abstract class _Origin implements Origin {
  const factory _Origin({final String name, final String code}) = _$_Origin;

  factory _Origin.fromJson(Map<String, dynamic> json) = _$_Origin.fromJson;

  @override
  String get name;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$_OriginCopyWith<_$_Origin> get copyWith =>
      throw _privateConstructorUsedError;
}

Destination _$DestinationFromJson(Map<String, dynamic> json) {
  return _Destination.fromJson(json);
}

/// @nodoc
mixin _$Destination {
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DestinationCopyWith<Destination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DestinationCopyWith<$Res> {
  factory $DestinationCopyWith(
          Destination value, $Res Function(Destination) then) =
      _$DestinationCopyWithImpl<$Res, Destination>;
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class _$DestinationCopyWithImpl<$Res, $Val extends Destination>
    implements $DestinationCopyWith<$Res> {
  _$DestinationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DestinationCopyWith<$Res>
    implements $DestinationCopyWith<$Res> {
  factory _$$_DestinationCopyWith(
          _$_Destination value, $Res Function(_$_Destination) then) =
      __$$_DestinationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class __$$_DestinationCopyWithImpl<$Res>
    extends _$DestinationCopyWithImpl<$Res, _$_Destination>
    implements _$$_DestinationCopyWith<$Res> {
  __$$_DestinationCopyWithImpl(
      _$_Destination _value, $Res Function(_$_Destination) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_$_Destination(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Destination implements _Destination {
  const _$_Destination({this.name = '', this.code = ''});

  factory _$_Destination.fromJson(Map<String, dynamic> json) =>
      _$$_DestinationFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String code;

  @override
  String toString() {
    return 'Destination(name: $name, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Destination &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DestinationCopyWith<_$_Destination> get copyWith =>
      __$$_DestinationCopyWithImpl<_$_Destination>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DestinationToJson(
      this,
    );
  }
}

abstract class _Destination implements Destination {
  const factory _Destination({final String name, final String code}) =
      _$_Destination;

  factory _Destination.fromJson(Map<String, dynamic> json) =
      _$_Destination.fromJson;

  @override
  String get name;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$_DestinationCopyWith<_$_Destination> get copyWith =>
      throw _privateConstructorUsedError;
}
