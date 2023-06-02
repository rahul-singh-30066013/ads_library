// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_flight_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddFlightRequestModel _$AddFlightRequestModelFromJson(
    Map<String, dynamic> json) {
  return _AddFlightRequestModel.fromJson(json);
}

/// @nodoc
mixin _$AddFlightRequestModel {
  FlightDetails get flightDetails => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddFlightRequestModelCopyWith<AddFlightRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddFlightRequestModelCopyWith<$Res> {
  factory $AddFlightRequestModelCopyWith(AddFlightRequestModel value,
          $Res Function(AddFlightRequestModel) then) =
      _$AddFlightRequestModelCopyWithImpl<$Res, AddFlightRequestModel>;
  @useResult
  $Res call({FlightDetails flightDetails});

  $FlightDetailsCopyWith<$Res> get flightDetails;
}

/// @nodoc
class _$AddFlightRequestModelCopyWithImpl<$Res,
        $Val extends AddFlightRequestModel>
    implements $AddFlightRequestModelCopyWith<$Res> {
  _$AddFlightRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flightDetails = null,
  }) {
    return _then(_value.copyWith(
      flightDetails: null == flightDetails
          ? _value.flightDetails
          : flightDetails // ignore: cast_nullable_to_non_nullable
              as FlightDetails,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FlightDetailsCopyWith<$Res> get flightDetails {
    return $FlightDetailsCopyWith<$Res>(_value.flightDetails, (value) {
      return _then(_value.copyWith(flightDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AddFlightRequestModelCopyWith<$Res>
    implements $AddFlightRequestModelCopyWith<$Res> {
  factory _$$_AddFlightRequestModelCopyWith(_$_AddFlightRequestModel value,
          $Res Function(_$_AddFlightRequestModel) then) =
      __$$_AddFlightRequestModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FlightDetails flightDetails});

  @override
  $FlightDetailsCopyWith<$Res> get flightDetails;
}

/// @nodoc
class __$$_AddFlightRequestModelCopyWithImpl<$Res>
    extends _$AddFlightRequestModelCopyWithImpl<$Res, _$_AddFlightRequestModel>
    implements _$$_AddFlightRequestModelCopyWith<$Res> {
  __$$_AddFlightRequestModelCopyWithImpl(_$_AddFlightRequestModel _value,
      $Res Function(_$_AddFlightRequestModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flightDetails = null,
  }) {
    return _then(_$_AddFlightRequestModel(
      null == flightDetails
          ? _value.flightDetails
          : flightDetails // ignore: cast_nullable_to_non_nullable
              as FlightDetails,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddFlightRequestModel implements _AddFlightRequestModel {
  const _$_AddFlightRequestModel(this.flightDetails);

  factory _$_AddFlightRequestModel.fromJson(Map<String, dynamic> json) =>
      _$$_AddFlightRequestModelFromJson(json);

  @override
  final FlightDetails flightDetails;

  @override
  String toString() {
    return 'AddFlightRequestModel(flightDetails: $flightDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddFlightRequestModel &&
            (identical(other.flightDetails, flightDetails) ||
                other.flightDetails == flightDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, flightDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddFlightRequestModelCopyWith<_$_AddFlightRequestModel> get copyWith =>
      __$$_AddFlightRequestModelCopyWithImpl<_$_AddFlightRequestModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddFlightRequestModelToJson(
      this,
    );
  }
}

abstract class _AddFlightRequestModel implements AddFlightRequestModel {
  const factory _AddFlightRequestModel(final FlightDetails flightDetails) =
      _$_AddFlightRequestModel;

  factory _AddFlightRequestModel.fromJson(Map<String, dynamic> json) =
      _$_AddFlightRequestModel.fromJson;

  @override
  FlightDetails get flightDetails;
  @override
  @JsonKey(ignore: true)
  _$$_AddFlightRequestModelCopyWith<_$_AddFlightRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

FlightDetails _$FlightDetailsFromJson(Map<String, dynamic> json) {
  return _FlightDetails.fromJson(json);
}

/// @nodoc
mixin _$FlightDetails {
  String get flightNo => throw _privateConstructorUsedError;
  String get scheduledDate => throw _privateConstructorUsedError;
  String get scheduledTime => throw _privateConstructorUsedError;
  String get flightName => throw _privateConstructorUsedError;
  Location get origin => throw _privateConstructorUsedError;
  Location get destination => throw _privateConstructorUsedError;
  String get terminal => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get airlineCode => throw _privateConstructorUsedError;
  String get baggageBelt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlightDetailsCopyWith<FlightDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlightDetailsCopyWith<$Res> {
  factory $FlightDetailsCopyWith(
          FlightDetails value, $Res Function(FlightDetails) then) =
      _$FlightDetailsCopyWithImpl<$Res, FlightDetails>;
  @useResult
  $Res call(
      {String flightNo,
      String scheduledDate,
      String scheduledTime,
      String flightName,
      Location origin,
      Location destination,
      String terminal,
      String status,
      String type,
      String airlineCode,
      String baggageBelt});

  $LocationCopyWith<$Res> get origin;
  $LocationCopyWith<$Res> get destination;
}

/// @nodoc
class _$FlightDetailsCopyWithImpl<$Res, $Val extends FlightDetails>
    implements $FlightDetailsCopyWith<$Res> {
  _$FlightDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flightNo = null,
    Object? scheduledDate = null,
    Object? scheduledTime = null,
    Object? flightName = null,
    Object? origin = null,
    Object? destination = null,
    Object? terminal = null,
    Object? status = null,
    Object? type = null,
    Object? airlineCode = null,
    Object? baggageBelt = null,
  }) {
    return _then(_value.copyWith(
      flightNo: null == flightNo
          ? _value.flightNo
          : flightNo // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledDate: null == scheduledDate
          ? _value.scheduledDate
          : scheduledDate // ignore: cast_nullable_to_non_nullable
              as String,
      scheduledTime: null == scheduledTime
          ? _value.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as String,
      flightName: null == flightName
          ? _value.flightName
          : flightName // ignore: cast_nullable_to_non_nullable
              as String,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as Location,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as Location,
      terminal: null == terminal
          ? _value.terminal
          : terminal // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      airlineCode: null == airlineCode
          ? _value.airlineCode
          : airlineCode // ignore: cast_nullable_to_non_nullable
              as String,
      baggageBelt: null == baggageBelt
          ? _value.baggageBelt
          : baggageBelt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get origin {
    return $LocationCopyWith<$Res>(_value.origin, (value) {
      return _then(_value.copyWith(origin: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get destination {
    return $LocationCopyWith<$Res>(_value.destination, (value) {
      return _then(_value.copyWith(destination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FlightDetailsCopyWith<$Res>
    implements $FlightDetailsCopyWith<$Res> {
  factory _$$_FlightDetailsCopyWith(
          _$_FlightDetails value, $Res Function(_$_FlightDetails) then) =
      __$$_FlightDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String flightNo,
      String scheduledDate,
      String scheduledTime,
      String flightName,
      Location origin,
      Location destination,
      String terminal,
      String status,
      String type,
      String airlineCode,
      String baggageBelt});

  @override
  $LocationCopyWith<$Res> get origin;
  @override
  $LocationCopyWith<$Res> get destination;
}

/// @nodoc
class __$$_FlightDetailsCopyWithImpl<$Res>
    extends _$FlightDetailsCopyWithImpl<$Res, _$_FlightDetails>
    implements _$$_FlightDetailsCopyWith<$Res> {
  __$$_FlightDetailsCopyWithImpl(
      _$_FlightDetails _value, $Res Function(_$_FlightDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flightNo = null,
    Object? scheduledDate = null,
    Object? scheduledTime = null,
    Object? flightName = null,
    Object? origin = null,
    Object? destination = null,
    Object? terminal = null,
    Object? status = null,
    Object? type = null,
    Object? airlineCode = null,
    Object? baggageBelt = null,
  }) {
    return _then(_$_FlightDetails(
      null == flightNo
          ? _value.flightNo
          : flightNo // ignore: cast_nullable_to_non_nullable
              as String,
      null == scheduledDate
          ? _value.scheduledDate
          : scheduledDate // ignore: cast_nullable_to_non_nullable
              as String,
      null == scheduledTime
          ? _value.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as String,
      null == flightName
          ? _value.flightName
          : flightName // ignore: cast_nullable_to_non_nullable
              as String,
      null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as Location,
      null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as Location,
      null == terminal
          ? _value.terminal
          : terminal // ignore: cast_nullable_to_non_nullable
              as String,
      null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      null == airlineCode
          ? _value.airlineCode
          : airlineCode // ignore: cast_nullable_to_non_nullable
              as String,
      null == baggageBelt
          ? _value.baggageBelt
          : baggageBelt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FlightDetails implements _FlightDetails {
  const _$_FlightDetails(
      this.flightNo,
      this.scheduledDate,
      this.scheduledTime,
      this.flightName,
      this.origin,
      this.destination,
      this.terminal,
      this.status,
      this.type,
      this.airlineCode,
      this.baggageBelt);

  factory _$_FlightDetails.fromJson(Map<String, dynamic> json) =>
      _$$_FlightDetailsFromJson(json);

  @override
  final String flightNo;
  @override
  final String scheduledDate;
  @override
  final String scheduledTime;
  @override
  final String flightName;
  @override
  final Location origin;
  @override
  final Location destination;
  @override
  final String terminal;
  @override
  final String status;
  @override
  final String type;
  @override
  final String airlineCode;
  @override
  final String baggageBelt;

  @override
  String toString() {
    return 'FlightDetails(flightNo: $flightNo, scheduledDate: $scheduledDate, scheduledTime: $scheduledTime, flightName: $flightName, origin: $origin, destination: $destination, terminal: $terminal, status: $status, type: $type, airlineCode: $airlineCode, baggageBelt: $baggageBelt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FlightDetails &&
            (identical(other.flightNo, flightNo) ||
                other.flightNo == flightNo) &&
            (identical(other.scheduledDate, scheduledDate) ||
                other.scheduledDate == scheduledDate) &&
            (identical(other.scheduledTime, scheduledTime) ||
                other.scheduledTime == scheduledTime) &&
            (identical(other.flightName, flightName) ||
                other.flightName == flightName) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.terminal, terminal) ||
                other.terminal == terminal) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.airlineCode, airlineCode) ||
                other.airlineCode == airlineCode) &&
            (identical(other.baggageBelt, baggageBelt) ||
                other.baggageBelt == baggageBelt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      flightNo,
      scheduledDate,
      scheduledTime,
      flightName,
      origin,
      destination,
      terminal,
      status,
      type,
      airlineCode,
      baggageBelt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FlightDetailsCopyWith<_$_FlightDetails> get copyWith =>
      __$$_FlightDetailsCopyWithImpl<_$_FlightDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FlightDetailsToJson(
      this,
    );
  }
}

abstract class _FlightDetails implements FlightDetails {
  const factory _FlightDetails(
      final String flightNo,
      final String scheduledDate,
      final String scheduledTime,
      final String flightName,
      final Location origin,
      final Location destination,
      final String terminal,
      final String status,
      final String type,
      final String airlineCode,
      final String baggageBelt) = _$_FlightDetails;

  factory _FlightDetails.fromJson(Map<String, dynamic> json) =
      _$_FlightDetails.fromJson;

  @override
  String get flightNo;
  @override
  String get scheduledDate;
  @override
  String get scheduledTime;
  @override
  String get flightName;
  @override
  Location get origin;
  @override
  Location get destination;
  @override
  String get terminal;
  @override
  String get status;
  @override
  String get type;
  @override
  String get airlineCode;
  @override
  String get baggageBelt;
  @override
  @JsonKey(ignore: true)
  _$$_FlightDetailsCopyWith<_$_FlightDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
mixin _$Location {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res, Location>;
  @useResult
  $Res call({String code, String name});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res, $Val extends Location>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocationCopyWith<$Res> implements $LocationCopyWith<$Res> {
  factory _$$_LocationCopyWith(
          _$_Location value, $Res Function(_$_Location) then) =
      __$$_LocationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String name});
}

/// @nodoc
class __$$_LocationCopyWithImpl<$Res>
    extends _$LocationCopyWithImpl<$Res, _$_Location>
    implements _$$_LocationCopyWith<$Res> {
  __$$_LocationCopyWithImpl(
      _$_Location _value, $Res Function(_$_Location) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
  }) {
    return _then(_$_Location(
      null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Location implements _Location {
  const _$_Location(this.code, this.name);

  factory _$_Location.fromJson(Map<String, dynamic> json) =>
      _$$_LocationFromJson(json);

  @override
  final String code;
  @override
  final String name;

  @override
  String toString() {
    return 'Location(code: $code, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Location &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocationCopyWith<_$_Location> get copyWith =>
      __$$_LocationCopyWithImpl<_$_Location>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocationToJson(
      this,
    );
  }
}

abstract class _Location implements Location {
  const factory _Location(final String code, final String name) = _$_Location;

  factory _Location.fromJson(Map<String, dynamic> json) = _$_Location.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_LocationCopyWith<_$_Location> get copyWith =>
      throw _privateConstructorUsedError;
}
