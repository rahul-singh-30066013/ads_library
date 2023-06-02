// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_feedback_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerFeedbackRequestModel _$CustomerFeedbackRequestModelFromJson(
    Map<String, dynamic> json) {
  return _CustomerFeedbackRequestModel.fromJson(json);
}

/// @nodoc
mixin _$CustomerFeedbackRequestModel {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get airport => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get mobileNumber => throw _privateConstructorUsedError;
  String get countryCode => throw _privateConstructorUsedError;
  FlightDetails? get flightDetails => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerFeedbackRequestModelCopyWith<CustomerFeedbackRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerFeedbackRequestModelCopyWith<$Res> {
  factory $CustomerFeedbackRequestModelCopyWith(
          CustomerFeedbackRequestModel value,
          $Res Function(CustomerFeedbackRequestModel) then) =
      _$CustomerFeedbackRequestModelCopyWithImpl<$Res,
          CustomerFeedbackRequestModel>;
  @useResult
  $Res call(
      {String name,
      String email,
      String airport,
      String type,
      String description,
      String mobileNumber,
      String countryCode,
      FlightDetails? flightDetails});

  $FlightDetailsCopyWith<$Res>? get flightDetails;
}

/// @nodoc
class _$CustomerFeedbackRequestModelCopyWithImpl<$Res,
        $Val extends CustomerFeedbackRequestModel>
    implements $CustomerFeedbackRequestModelCopyWith<$Res> {
  _$CustomerFeedbackRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? airport = null,
    Object? type = null,
    Object? description = null,
    Object? mobileNumber = null,
    Object? countryCode = null,
    Object? flightDetails = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      airport: null == airport
          ? _value.airport
          : airport // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      flightDetails: freezed == flightDetails
          ? _value.flightDetails
          : flightDetails // ignore: cast_nullable_to_non_nullable
              as FlightDetails?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FlightDetailsCopyWith<$Res>? get flightDetails {
    if (_value.flightDetails == null) {
      return null;
    }

    return $FlightDetailsCopyWith<$Res>(_value.flightDetails!, (value) {
      return _then(_value.copyWith(flightDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CustomerFeedbackRequestModelCopyWith<$Res>
    implements $CustomerFeedbackRequestModelCopyWith<$Res> {
  factory _$$_CustomerFeedbackRequestModelCopyWith(
          _$_CustomerFeedbackRequestModel value,
          $Res Function(_$_CustomerFeedbackRequestModel) then) =
      __$$_CustomerFeedbackRequestModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String email,
      String airport,
      String type,
      String description,
      String mobileNumber,
      String countryCode,
      FlightDetails? flightDetails});

  @override
  $FlightDetailsCopyWith<$Res>? get flightDetails;
}

/// @nodoc
class __$$_CustomerFeedbackRequestModelCopyWithImpl<$Res>
    extends _$CustomerFeedbackRequestModelCopyWithImpl<$Res,
        _$_CustomerFeedbackRequestModel>
    implements _$$_CustomerFeedbackRequestModelCopyWith<$Res> {
  __$$_CustomerFeedbackRequestModelCopyWithImpl(
      _$_CustomerFeedbackRequestModel _value,
      $Res Function(_$_CustomerFeedbackRequestModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? airport = null,
    Object? type = null,
    Object? description = null,
    Object? mobileNumber = null,
    Object? countryCode = null,
    Object? flightDetails = freezed,
  }) {
    return _then(_$_CustomerFeedbackRequestModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      airport: null == airport
          ? _value.airport
          : airport // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      flightDetails: freezed == flightDetails
          ? _value.flightDetails
          : flightDetails // ignore: cast_nullable_to_non_nullable
              as FlightDetails?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomerFeedbackRequestModel implements _CustomerFeedbackRequestModel {
  const _$_CustomerFeedbackRequestModel(
      {this.name = '',
      this.email = '',
      this.airport = '',
      this.type = '',
      this.description = '',
      this.mobileNumber = '',
      this.countryCode = '',
      this.flightDetails});

  factory _$_CustomerFeedbackRequestModel.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerFeedbackRequestModelFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String airport;
  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String mobileNumber;
  @override
  @JsonKey()
  final String countryCode;
  @override
  final FlightDetails? flightDetails;

  @override
  String toString() {
    return 'CustomerFeedbackRequestModel(name: $name, email: $email, airport: $airport, type: $type, description: $description, mobileNumber: $mobileNumber, countryCode: $countryCode, flightDetails: $flightDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerFeedbackRequestModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.airport, airport) || other.airport == airport) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.flightDetails, flightDetails) ||
                other.flightDetails == flightDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, email, airport, type,
      description, mobileNumber, countryCode, flightDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerFeedbackRequestModelCopyWith<_$_CustomerFeedbackRequestModel>
      get copyWith => __$$_CustomerFeedbackRequestModelCopyWithImpl<
          _$_CustomerFeedbackRequestModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerFeedbackRequestModelToJson(
      this,
    );
  }
}

abstract class _CustomerFeedbackRequestModel
    implements CustomerFeedbackRequestModel {
  const factory _CustomerFeedbackRequestModel(
      {final String name,
      final String email,
      final String airport,
      final String type,
      final String description,
      final String mobileNumber,
      final String countryCode,
      final FlightDetails? flightDetails}) = _$_CustomerFeedbackRequestModel;

  factory _CustomerFeedbackRequestModel.fromJson(Map<String, dynamic> json) =
      _$_CustomerFeedbackRequestModel.fromJson;

  @override
  String get name;
  @override
  String get email;
  @override
  String get airport;
  @override
  String get type;
  @override
  String get description;
  @override
  String get mobileNumber;
  @override
  String get countryCode;
  @override
  FlightDetails? get flightDetails;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerFeedbackRequestModelCopyWith<_$_CustomerFeedbackRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

FlightDetails _$FlightDetailsFromJson(Map<String, dynamic> json) {
  return _FlightDetails.fromJson(json);
}

/// @nodoc
mixin _$FlightDetails {
  String get flightNumber => throw _privateConstructorUsedError;
  String get flightDate => throw _privateConstructorUsedError;

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
  $Res call({String flightNumber, String flightDate});
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
    Object? flightNumber = null,
    Object? flightDate = null,
  }) {
    return _then(_value.copyWith(
      flightNumber: null == flightNumber
          ? _value.flightNumber
          : flightNumber // ignore: cast_nullable_to_non_nullable
              as String,
      flightDate: null == flightDate
          ? _value.flightDate
          : flightDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
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
  $Res call({String flightNumber, String flightDate});
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
    Object? flightNumber = null,
    Object? flightDate = null,
  }) {
    return _then(_$_FlightDetails(
      flightNumber: null == flightNumber
          ? _value.flightNumber
          : flightNumber // ignore: cast_nullable_to_non_nullable
              as String,
      flightDate: null == flightDate
          ? _value.flightDate
          : flightDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FlightDetails implements _FlightDetails {
  const _$_FlightDetails({this.flightNumber = '', this.flightDate = ''});

  factory _$_FlightDetails.fromJson(Map<String, dynamic> json) =>
      _$$_FlightDetailsFromJson(json);

  @override
  @JsonKey()
  final String flightNumber;
  @override
  @JsonKey()
  final String flightDate;

  @override
  String toString() {
    return 'FlightDetails(flightNumber: $flightNumber, flightDate: $flightDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FlightDetails &&
            (identical(other.flightNumber, flightNumber) ||
                other.flightNumber == flightNumber) &&
            (identical(other.flightDate, flightDate) ||
                other.flightDate == flightDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, flightNumber, flightDate);

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
      {final String flightNumber, final String flightDate}) = _$_FlightDetails;

  factory _FlightDetails.fromJson(Map<String, dynamic> json) =
      _$_FlightDetails.fromJson;

  @override
  String get flightNumber;
  @override
  String get flightDate;
  @override
  @JsonKey(ignore: true)
  _$$_FlightDetailsCopyWith<_$_FlightDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
