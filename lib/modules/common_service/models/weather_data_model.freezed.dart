// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WeatherDataModel _$WeatherDataModelFromJson(Map<String, dynamic> json) {
  return _WeatherDataModel.fromJson(json);
}

/// @nodoc
mixin _$WeatherDataModel {
  List<DailyForecast?> get dailyForecasts => throw _privateConstructorUsedError;
  List<CurrentConditionForecast?> get currentConditionForecast =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherDataModelCopyWith<WeatherDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherDataModelCopyWith<$Res> {
  factory $WeatherDataModelCopyWith(
          WeatherDataModel value, $Res Function(WeatherDataModel) then) =
      _$WeatherDataModelCopyWithImpl<$Res, WeatherDataModel>;
  @useResult
  $Res call(
      {List<DailyForecast?> dailyForecasts,
      List<CurrentConditionForecast?> currentConditionForecast});
}

/// @nodoc
class _$WeatherDataModelCopyWithImpl<$Res, $Val extends WeatherDataModel>
    implements $WeatherDataModelCopyWith<$Res> {
  _$WeatherDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailyForecasts = null,
    Object? currentConditionForecast = null,
  }) {
    return _then(_value.copyWith(
      dailyForecasts: null == dailyForecasts
          ? _value.dailyForecasts
          : dailyForecasts // ignore: cast_nullable_to_non_nullable
              as List<DailyForecast?>,
      currentConditionForecast: null == currentConditionForecast
          ? _value.currentConditionForecast
          : currentConditionForecast // ignore: cast_nullable_to_non_nullable
              as List<CurrentConditionForecast?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WeatherDataModelCopyWith<$Res>
    implements $WeatherDataModelCopyWith<$Res> {
  factory _$$_WeatherDataModelCopyWith(
          _$_WeatherDataModel value, $Res Function(_$_WeatherDataModel) then) =
      __$$_WeatherDataModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DailyForecast?> dailyForecasts,
      List<CurrentConditionForecast?> currentConditionForecast});
}

/// @nodoc
class __$$_WeatherDataModelCopyWithImpl<$Res>
    extends _$WeatherDataModelCopyWithImpl<$Res, _$_WeatherDataModel>
    implements _$$_WeatherDataModelCopyWith<$Res> {
  __$$_WeatherDataModelCopyWithImpl(
      _$_WeatherDataModel _value, $Res Function(_$_WeatherDataModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dailyForecasts = null,
    Object? currentConditionForecast = null,
  }) {
    return _then(_$_WeatherDataModel(
      dailyForecasts: null == dailyForecasts
          ? _value.dailyForecasts
          : dailyForecasts // ignore: cast_nullable_to_non_nullable
              as List<DailyForecast?>,
      currentConditionForecast: null == currentConditionForecast
          ? _value.currentConditionForecast
          : currentConditionForecast // ignore: cast_nullable_to_non_nullable
              as List<CurrentConditionForecast?>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeatherDataModel implements _WeatherDataModel {
  const _$_WeatherDataModel(
      {this.dailyForecasts = const [],
      this.currentConditionForecast = const []});

  factory _$_WeatherDataModel.fromJson(Map<String, dynamic> json) =>
      _$$_WeatherDataModelFromJson(json);

  @override
  @JsonKey()
  final List<DailyForecast?> dailyForecasts;
  @override
  @JsonKey()
  final List<CurrentConditionForecast?> currentConditionForecast;

  @override
  String toString() {
    return 'WeatherDataModel(dailyForecasts: $dailyForecasts, currentConditionForecast: $currentConditionForecast)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherDataModel &&
            const DeepCollectionEquality()
                .equals(other.dailyForecasts, dailyForecasts) &&
            const DeepCollectionEquality().equals(
                other.currentConditionForecast, currentConditionForecast));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(dailyForecasts),
      const DeepCollectionEquality().hash(currentConditionForecast));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherDataModelCopyWith<_$_WeatherDataModel> get copyWith =>
      __$$_WeatherDataModelCopyWithImpl<_$_WeatherDataModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeatherDataModelToJson(
      this,
    );
  }
}

abstract class _WeatherDataModel implements WeatherDataModel {
  const factory _WeatherDataModel(
          {final List<DailyForecast?> dailyForecasts,
          final List<CurrentConditionForecast?> currentConditionForecast}) =
      _$_WeatherDataModel;

  factory _WeatherDataModel.fromJson(Map<String, dynamic> json) =
      _$_WeatherDataModel.fromJson;

  @override
  List<DailyForecast?> get dailyForecasts;
  @override
  List<CurrentConditionForecast?> get currentConditionForecast;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherDataModelCopyWith<_$_WeatherDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyForecast _$DailyForecastFromJson(Map<String, dynamic> json) {
  return _DailyForecast.fromJson(json);
}

/// @nodoc
mixin _$DailyForecast {
  String? get date => throw _privateConstructorUsedError;
  int? get epochDate => throw _privateConstructorUsedError;
  Temperature? get temperature => throw _privateConstructorUsedError;
  WeatherTime? get day => throw _privateConstructorUsedError;
  WeatherTime? get night => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DailyForecastCopyWith<DailyForecast> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyForecastCopyWith<$Res> {
  factory $DailyForecastCopyWith(
          DailyForecast value, $Res Function(DailyForecast) then) =
      _$DailyForecastCopyWithImpl<$Res, DailyForecast>;
  @useResult
  $Res call(
      {String? date,
      int? epochDate,
      Temperature? temperature,
      WeatherTime? day,
      WeatherTime? night});

  $TemperatureCopyWith<$Res>? get temperature;
  $WeatherTimeCopyWith<$Res>? get day;
  $WeatherTimeCopyWith<$Res>? get night;
}

/// @nodoc
class _$DailyForecastCopyWithImpl<$Res, $Val extends DailyForecast>
    implements $DailyForecastCopyWith<$Res> {
  _$DailyForecastCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? epochDate = freezed,
    Object? temperature = freezed,
    Object? day = freezed,
    Object? night = freezed,
  }) {
    return _then(_value.copyWith(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      epochDate: freezed == epochDate
          ? _value.epochDate
          : epochDate // ignore: cast_nullable_to_non_nullable
              as int?,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as Temperature?,
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as WeatherTime?,
      night: freezed == night
          ? _value.night
          : night // ignore: cast_nullable_to_non_nullable
              as WeatherTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TemperatureCopyWith<$Res>? get temperature {
    if (_value.temperature == null) {
      return null;
    }

    return $TemperatureCopyWith<$Res>(_value.temperature!, (value) {
      return _then(_value.copyWith(temperature: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WeatherTimeCopyWith<$Res>? get day {
    if (_value.day == null) {
      return null;
    }

    return $WeatherTimeCopyWith<$Res>(_value.day!, (value) {
      return _then(_value.copyWith(day: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WeatherTimeCopyWith<$Res>? get night {
    if (_value.night == null) {
      return null;
    }

    return $WeatherTimeCopyWith<$Res>(_value.night!, (value) {
      return _then(_value.copyWith(night: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DailyForecastCopyWith<$Res>
    implements $DailyForecastCopyWith<$Res> {
  factory _$$_DailyForecastCopyWith(
          _$_DailyForecast value, $Res Function(_$_DailyForecast) then) =
      __$$_DailyForecastCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? date,
      int? epochDate,
      Temperature? temperature,
      WeatherTime? day,
      WeatherTime? night});

  @override
  $TemperatureCopyWith<$Res>? get temperature;
  @override
  $WeatherTimeCopyWith<$Res>? get day;
  @override
  $WeatherTimeCopyWith<$Res>? get night;
}

/// @nodoc
class __$$_DailyForecastCopyWithImpl<$Res>
    extends _$DailyForecastCopyWithImpl<$Res, _$_DailyForecast>
    implements _$$_DailyForecastCopyWith<$Res> {
  __$$_DailyForecastCopyWithImpl(
      _$_DailyForecast _value, $Res Function(_$_DailyForecast) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? epochDate = freezed,
    Object? temperature = freezed,
    Object? day = freezed,
    Object? night = freezed,
  }) {
    return _then(_$_DailyForecast(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      epochDate: freezed == epochDate
          ? _value.epochDate
          : epochDate // ignore: cast_nullable_to_non_nullable
              as int?,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as Temperature?,
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as WeatherTime?,
      night: freezed == night
          ? _value.night
          : night // ignore: cast_nullable_to_non_nullable
              as WeatherTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DailyForecast implements _DailyForecast {
  const _$_DailyForecast(
      {this.date, this.epochDate, this.temperature, this.day, this.night});

  factory _$_DailyForecast.fromJson(Map<String, dynamic> json) =>
      _$$_DailyForecastFromJson(json);

  @override
  final String? date;
  @override
  final int? epochDate;
  @override
  final Temperature? temperature;
  @override
  final WeatherTime? day;
  @override
  final WeatherTime? night;

  @override
  String toString() {
    return 'DailyForecast(date: $date, epochDate: $epochDate, temperature: $temperature, day: $day, night: $night)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DailyForecast &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.epochDate, epochDate) ||
                other.epochDate == epochDate) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.night, night) || other.night == night));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, date, epochDate, temperature, day, night);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DailyForecastCopyWith<_$_DailyForecast> get copyWith =>
      __$$_DailyForecastCopyWithImpl<_$_DailyForecast>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DailyForecastToJson(
      this,
    );
  }
}

abstract class _DailyForecast implements DailyForecast {
  const factory _DailyForecast(
      {final String? date,
      final int? epochDate,
      final Temperature? temperature,
      final WeatherTime? day,
      final WeatherTime? night}) = _$_DailyForecast;

  factory _DailyForecast.fromJson(Map<String, dynamic> json) =
      _$_DailyForecast.fromJson;

  @override
  String? get date;
  @override
  int? get epochDate;
  @override
  Temperature? get temperature;
  @override
  WeatherTime? get day;
  @override
  WeatherTime? get night;
  @override
  @JsonKey(ignore: true)
  _$$_DailyForecastCopyWith<_$_DailyForecast> get copyWith =>
      throw _privateConstructorUsedError;
}

CurrentConditionForecast _$CurrentConditionForecastFromJson(
    Map<String, dynamic> json) {
  return _CurrentConditionForecast.fromJson(json);
}

/// @nodoc
mixin _$CurrentConditionForecast {
  String? get localObservationDateTime => throw _privateConstructorUsedError;
  int? get epochTime => throw _privateConstructorUsedError;
  String? get weatherText => throw _privateConstructorUsedError;
  int? get weatherIcon => throw _privateConstructorUsedError;
  bool? get isDayTime => throw _privateConstructorUsedError;
  TemperatureUnitData? get temperature => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrentConditionForecastCopyWith<CurrentConditionForecast> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentConditionForecastCopyWith<$Res> {
  factory $CurrentConditionForecastCopyWith(CurrentConditionForecast value,
          $Res Function(CurrentConditionForecast) then) =
      _$CurrentConditionForecastCopyWithImpl<$Res, CurrentConditionForecast>;
  @useResult
  $Res call(
      {String? localObservationDateTime,
      int? epochTime,
      String? weatherText,
      int? weatherIcon,
      bool? isDayTime,
      TemperatureUnitData? temperature});

  $TemperatureUnitDataCopyWith<$Res>? get temperature;
}

/// @nodoc
class _$CurrentConditionForecastCopyWithImpl<$Res,
        $Val extends CurrentConditionForecast>
    implements $CurrentConditionForecastCopyWith<$Res> {
  _$CurrentConditionForecastCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localObservationDateTime = freezed,
    Object? epochTime = freezed,
    Object? weatherText = freezed,
    Object? weatherIcon = freezed,
    Object? isDayTime = freezed,
    Object? temperature = freezed,
  }) {
    return _then(_value.copyWith(
      localObservationDateTime: freezed == localObservationDateTime
          ? _value.localObservationDateTime
          : localObservationDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      epochTime: freezed == epochTime
          ? _value.epochTime
          : epochTime // ignore: cast_nullable_to_non_nullable
              as int?,
      weatherText: freezed == weatherText
          ? _value.weatherText
          : weatherText // ignore: cast_nullable_to_non_nullable
              as String?,
      weatherIcon: freezed == weatherIcon
          ? _value.weatherIcon
          : weatherIcon // ignore: cast_nullable_to_non_nullable
              as int?,
      isDayTime: freezed == isDayTime
          ? _value.isDayTime
          : isDayTime // ignore: cast_nullable_to_non_nullable
              as bool?,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as TemperatureUnitData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TemperatureUnitDataCopyWith<$Res>? get temperature {
    if (_value.temperature == null) {
      return null;
    }

    return $TemperatureUnitDataCopyWith<$Res>(_value.temperature!, (value) {
      return _then(_value.copyWith(temperature: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CurrentConditionForecastCopyWith<$Res>
    implements $CurrentConditionForecastCopyWith<$Res> {
  factory _$$_CurrentConditionForecastCopyWith(
          _$_CurrentConditionForecast value,
          $Res Function(_$_CurrentConditionForecast) then) =
      __$$_CurrentConditionForecastCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? localObservationDateTime,
      int? epochTime,
      String? weatherText,
      int? weatherIcon,
      bool? isDayTime,
      TemperatureUnitData? temperature});

  @override
  $TemperatureUnitDataCopyWith<$Res>? get temperature;
}

/// @nodoc
class __$$_CurrentConditionForecastCopyWithImpl<$Res>
    extends _$CurrentConditionForecastCopyWithImpl<$Res,
        _$_CurrentConditionForecast>
    implements _$$_CurrentConditionForecastCopyWith<$Res> {
  __$$_CurrentConditionForecastCopyWithImpl(_$_CurrentConditionForecast _value,
      $Res Function(_$_CurrentConditionForecast) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? localObservationDateTime = freezed,
    Object? epochTime = freezed,
    Object? weatherText = freezed,
    Object? weatherIcon = freezed,
    Object? isDayTime = freezed,
    Object? temperature = freezed,
  }) {
    return _then(_$_CurrentConditionForecast(
      localObservationDateTime: freezed == localObservationDateTime
          ? _value.localObservationDateTime
          : localObservationDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      epochTime: freezed == epochTime
          ? _value.epochTime
          : epochTime // ignore: cast_nullable_to_non_nullable
              as int?,
      weatherText: freezed == weatherText
          ? _value.weatherText
          : weatherText // ignore: cast_nullable_to_non_nullable
              as String?,
      weatherIcon: freezed == weatherIcon
          ? _value.weatherIcon
          : weatherIcon // ignore: cast_nullable_to_non_nullable
              as int?,
      isDayTime: freezed == isDayTime
          ? _value.isDayTime
          : isDayTime // ignore: cast_nullable_to_non_nullable
              as bool?,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as TemperatureUnitData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CurrentConditionForecast implements _CurrentConditionForecast {
  const _$_CurrentConditionForecast(
      {this.localObservationDateTime,
      this.epochTime,
      this.weatherText,
      this.weatherIcon,
      this.isDayTime,
      this.temperature});

  factory _$_CurrentConditionForecast.fromJson(Map<String, dynamic> json) =>
      _$$_CurrentConditionForecastFromJson(json);

  @override
  final String? localObservationDateTime;
  @override
  final int? epochTime;
  @override
  final String? weatherText;
  @override
  final int? weatherIcon;
  @override
  final bool? isDayTime;
  @override
  final TemperatureUnitData? temperature;

  @override
  String toString() {
    return 'CurrentConditionForecast(localObservationDateTime: $localObservationDateTime, epochTime: $epochTime, weatherText: $weatherText, weatherIcon: $weatherIcon, isDayTime: $isDayTime, temperature: $temperature)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CurrentConditionForecast &&
            (identical(
                    other.localObservationDateTime, localObservationDateTime) ||
                other.localObservationDateTime == localObservationDateTime) &&
            (identical(other.epochTime, epochTime) ||
                other.epochTime == epochTime) &&
            (identical(other.weatherText, weatherText) ||
                other.weatherText == weatherText) &&
            (identical(other.weatherIcon, weatherIcon) ||
                other.weatherIcon == weatherIcon) &&
            (identical(other.isDayTime, isDayTime) ||
                other.isDayTime == isDayTime) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, localObservationDateTime,
      epochTime, weatherText, weatherIcon, isDayTime, temperature);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CurrentConditionForecastCopyWith<_$_CurrentConditionForecast>
      get copyWith => __$$_CurrentConditionForecastCopyWithImpl<
          _$_CurrentConditionForecast>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CurrentConditionForecastToJson(
      this,
    );
  }
}

abstract class _CurrentConditionForecast implements CurrentConditionForecast {
  const factory _CurrentConditionForecast(
      {final String? localObservationDateTime,
      final int? epochTime,
      final String? weatherText,
      final int? weatherIcon,
      final bool? isDayTime,
      final TemperatureUnitData? temperature}) = _$_CurrentConditionForecast;

  factory _CurrentConditionForecast.fromJson(Map<String, dynamic> json) =
      _$_CurrentConditionForecast.fromJson;

  @override
  String? get localObservationDateTime;
  @override
  int? get epochTime;
  @override
  String? get weatherText;
  @override
  int? get weatherIcon;
  @override
  bool? get isDayTime;
  @override
  TemperatureUnitData? get temperature;
  @override
  @JsonKey(ignore: true)
  _$$_CurrentConditionForecastCopyWith<_$_CurrentConditionForecast>
      get copyWith => throw _privateConstructorUsedError;
}

TemperatureUnitData _$TemperatureUnitDataFromJson(Map<String, dynamic> json) {
  return _TemperatureUnitData.fromJson(json);
}

/// @nodoc
mixin _$TemperatureUnitData {
  TemperatureData? get metric => throw _privateConstructorUsedError;
  TemperatureData? get imperial => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TemperatureUnitDataCopyWith<TemperatureUnitData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemperatureUnitDataCopyWith<$Res> {
  factory $TemperatureUnitDataCopyWith(
          TemperatureUnitData value, $Res Function(TemperatureUnitData) then) =
      _$TemperatureUnitDataCopyWithImpl<$Res, TemperatureUnitData>;
  @useResult
  $Res call({TemperatureData? metric, TemperatureData? imperial});

  $TemperatureDataCopyWith<$Res>? get metric;
  $TemperatureDataCopyWith<$Res>? get imperial;
}

/// @nodoc
class _$TemperatureUnitDataCopyWithImpl<$Res, $Val extends TemperatureUnitData>
    implements $TemperatureUnitDataCopyWith<$Res> {
  _$TemperatureUnitDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metric = freezed,
    Object? imperial = freezed,
  }) {
    return _then(_value.copyWith(
      metric: freezed == metric
          ? _value.metric
          : metric // ignore: cast_nullable_to_non_nullable
              as TemperatureData?,
      imperial: freezed == imperial
          ? _value.imperial
          : imperial // ignore: cast_nullable_to_non_nullable
              as TemperatureData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TemperatureDataCopyWith<$Res>? get metric {
    if (_value.metric == null) {
      return null;
    }

    return $TemperatureDataCopyWith<$Res>(_value.metric!, (value) {
      return _then(_value.copyWith(metric: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TemperatureDataCopyWith<$Res>? get imperial {
    if (_value.imperial == null) {
      return null;
    }

    return $TemperatureDataCopyWith<$Res>(_value.imperial!, (value) {
      return _then(_value.copyWith(imperial: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TemperatureUnitDataCopyWith<$Res>
    implements $TemperatureUnitDataCopyWith<$Res> {
  factory _$$_TemperatureUnitDataCopyWith(_$_TemperatureUnitData value,
          $Res Function(_$_TemperatureUnitData) then) =
      __$$_TemperatureUnitDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TemperatureData? metric, TemperatureData? imperial});

  @override
  $TemperatureDataCopyWith<$Res>? get metric;
  @override
  $TemperatureDataCopyWith<$Res>? get imperial;
}

/// @nodoc
class __$$_TemperatureUnitDataCopyWithImpl<$Res>
    extends _$TemperatureUnitDataCopyWithImpl<$Res, _$_TemperatureUnitData>
    implements _$$_TemperatureUnitDataCopyWith<$Res> {
  __$$_TemperatureUnitDataCopyWithImpl(_$_TemperatureUnitData _value,
      $Res Function(_$_TemperatureUnitData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metric = freezed,
    Object? imperial = freezed,
  }) {
    return _then(_$_TemperatureUnitData(
      metric: freezed == metric
          ? _value.metric
          : metric // ignore: cast_nullable_to_non_nullable
              as TemperatureData?,
      imperial: freezed == imperial
          ? _value.imperial
          : imperial // ignore: cast_nullable_to_non_nullable
              as TemperatureData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TemperatureUnitData implements _TemperatureUnitData {
  const _$_TemperatureUnitData({this.metric, this.imperial});

  factory _$_TemperatureUnitData.fromJson(Map<String, dynamic> json) =>
      _$$_TemperatureUnitDataFromJson(json);

  @override
  final TemperatureData? metric;
  @override
  final TemperatureData? imperial;

  @override
  String toString() {
    return 'TemperatureUnitData(metric: $metric, imperial: $imperial)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TemperatureUnitData &&
            (identical(other.metric, metric) || other.metric == metric) &&
            (identical(other.imperial, imperial) ||
                other.imperial == imperial));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, metric, imperial);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TemperatureUnitDataCopyWith<_$_TemperatureUnitData> get copyWith =>
      __$$_TemperatureUnitDataCopyWithImpl<_$_TemperatureUnitData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TemperatureUnitDataToJson(
      this,
    );
  }
}

abstract class _TemperatureUnitData implements TemperatureUnitData {
  const factory _TemperatureUnitData(
      {final TemperatureData? metric,
      final TemperatureData? imperial}) = _$_TemperatureUnitData;

  factory _TemperatureUnitData.fromJson(Map<String, dynamic> json) =
      _$_TemperatureUnitData.fromJson;

  @override
  TemperatureData? get metric;
  @override
  TemperatureData? get imperial;
  @override
  @JsonKey(ignore: true)
  _$$_TemperatureUnitDataCopyWith<_$_TemperatureUnitData> get copyWith =>
      throw _privateConstructorUsedError;
}

Temperature _$TemperatureFromJson(Map<String, dynamic> json) {
  return _Temperature.fromJson(json);
}

/// @nodoc
mixin _$Temperature {
  TemperatureData? get minimum => throw _privateConstructorUsedError;
  TemperatureData? get maximum => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TemperatureCopyWith<Temperature> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemperatureCopyWith<$Res> {
  factory $TemperatureCopyWith(
          Temperature value, $Res Function(Temperature) then) =
      _$TemperatureCopyWithImpl<$Res, Temperature>;
  @useResult
  $Res call({TemperatureData? minimum, TemperatureData? maximum});

  $TemperatureDataCopyWith<$Res>? get minimum;
  $TemperatureDataCopyWith<$Res>? get maximum;
}

/// @nodoc
class _$TemperatureCopyWithImpl<$Res, $Val extends Temperature>
    implements $TemperatureCopyWith<$Res> {
  _$TemperatureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minimum = freezed,
    Object? maximum = freezed,
  }) {
    return _then(_value.copyWith(
      minimum: freezed == minimum
          ? _value.minimum
          : minimum // ignore: cast_nullable_to_non_nullable
              as TemperatureData?,
      maximum: freezed == maximum
          ? _value.maximum
          : maximum // ignore: cast_nullable_to_non_nullable
              as TemperatureData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TemperatureDataCopyWith<$Res>? get minimum {
    if (_value.minimum == null) {
      return null;
    }

    return $TemperatureDataCopyWith<$Res>(_value.minimum!, (value) {
      return _then(_value.copyWith(minimum: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TemperatureDataCopyWith<$Res>? get maximum {
    if (_value.maximum == null) {
      return null;
    }

    return $TemperatureDataCopyWith<$Res>(_value.maximum!, (value) {
      return _then(_value.copyWith(maximum: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TemperatureCopyWith<$Res>
    implements $TemperatureCopyWith<$Res> {
  factory _$$_TemperatureCopyWith(
          _$_Temperature value, $Res Function(_$_Temperature) then) =
      __$$_TemperatureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TemperatureData? minimum, TemperatureData? maximum});

  @override
  $TemperatureDataCopyWith<$Res>? get minimum;
  @override
  $TemperatureDataCopyWith<$Res>? get maximum;
}

/// @nodoc
class __$$_TemperatureCopyWithImpl<$Res>
    extends _$TemperatureCopyWithImpl<$Res, _$_Temperature>
    implements _$$_TemperatureCopyWith<$Res> {
  __$$_TemperatureCopyWithImpl(
      _$_Temperature _value, $Res Function(_$_Temperature) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minimum = freezed,
    Object? maximum = freezed,
  }) {
    return _then(_$_Temperature(
      minimum: freezed == minimum
          ? _value.minimum
          : minimum // ignore: cast_nullable_to_non_nullable
              as TemperatureData?,
      maximum: freezed == maximum
          ? _value.maximum
          : maximum // ignore: cast_nullable_to_non_nullable
              as TemperatureData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Temperature implements _Temperature {
  const _$_Temperature({this.minimum, this.maximum});

  factory _$_Temperature.fromJson(Map<String, dynamic> json) =>
      _$$_TemperatureFromJson(json);

  @override
  final TemperatureData? minimum;
  @override
  final TemperatureData? maximum;

  @override
  String toString() {
    return 'Temperature(minimum: $minimum, maximum: $maximum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Temperature &&
            (identical(other.minimum, minimum) || other.minimum == minimum) &&
            (identical(other.maximum, maximum) || other.maximum == maximum));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, minimum, maximum);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TemperatureCopyWith<_$_Temperature> get copyWith =>
      __$$_TemperatureCopyWithImpl<_$_Temperature>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TemperatureToJson(
      this,
    );
  }
}

abstract class _Temperature implements Temperature {
  const factory _Temperature(
      {final TemperatureData? minimum,
      final TemperatureData? maximum}) = _$_Temperature;

  factory _Temperature.fromJson(Map<String, dynamic> json) =
      _$_Temperature.fromJson;

  @override
  TemperatureData? get minimum;
  @override
  TemperatureData? get maximum;
  @override
  @JsonKey(ignore: true)
  _$$_TemperatureCopyWith<_$_Temperature> get copyWith =>
      throw _privateConstructorUsedError;
}

TemperatureData _$TemperatureDataFromJson(Map<String, dynamic> json) {
  return _TemperatureData.fromJson(json);
}

/// @nodoc
mixin _$TemperatureData {
  double? get value => throw _privateConstructorUsedError;
  String? get unit => throw _privateConstructorUsedError;
  int? get unitType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TemperatureDataCopyWith<TemperatureData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TemperatureDataCopyWith<$Res> {
  factory $TemperatureDataCopyWith(
          TemperatureData value, $Res Function(TemperatureData) then) =
      _$TemperatureDataCopyWithImpl<$Res, TemperatureData>;
  @useResult
  $Res call({double? value, String? unit, int? unitType});
}

/// @nodoc
class _$TemperatureDataCopyWithImpl<$Res, $Val extends TemperatureData>
    implements $TemperatureDataCopyWith<$Res> {
  _$TemperatureDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? unit = freezed,
    Object? unitType = freezed,
  }) {
    return _then(_value.copyWith(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      unitType: freezed == unitType
          ? _value.unitType
          : unitType // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TemperatureDataCopyWith<$Res>
    implements $TemperatureDataCopyWith<$Res> {
  factory _$$_TemperatureDataCopyWith(
          _$_TemperatureData value, $Res Function(_$_TemperatureData) then) =
      __$$_TemperatureDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? value, String? unit, int? unitType});
}

/// @nodoc
class __$$_TemperatureDataCopyWithImpl<$Res>
    extends _$TemperatureDataCopyWithImpl<$Res, _$_TemperatureData>
    implements _$$_TemperatureDataCopyWith<$Res> {
  __$$_TemperatureDataCopyWithImpl(
      _$_TemperatureData _value, $Res Function(_$_TemperatureData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? unit = freezed,
    Object? unitType = freezed,
  }) {
    return _then(_$_TemperatureData(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      unitType: freezed == unitType
          ? _value.unitType
          : unitType // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TemperatureData implements _TemperatureData {
  const _$_TemperatureData({this.value, this.unit, this.unitType});

  factory _$_TemperatureData.fromJson(Map<String, dynamic> json) =>
      _$$_TemperatureDataFromJson(json);

  @override
  final double? value;
  @override
  final String? unit;
  @override
  final int? unitType;

  @override
  String toString() {
    return 'TemperatureData(value: $value, unit: $unit, unitType: $unitType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TemperatureData &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.unitType, unitType) ||
                other.unitType == unitType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value, unit, unitType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TemperatureDataCopyWith<_$_TemperatureData> get copyWith =>
      __$$_TemperatureDataCopyWithImpl<_$_TemperatureData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TemperatureDataToJson(
      this,
    );
  }
}

abstract class _TemperatureData implements TemperatureData {
  const factory _TemperatureData(
      {final double? value,
      final String? unit,
      final int? unitType}) = _$_TemperatureData;

  factory _TemperatureData.fromJson(Map<String, dynamic> json) =
      _$_TemperatureData.fromJson;

  @override
  double? get value;
  @override
  String? get unit;
  @override
  int? get unitType;
  @override
  @JsonKey(ignore: true)
  _$$_TemperatureDataCopyWith<_$_TemperatureData> get copyWith =>
      throw _privateConstructorUsedError;
}

WeatherTime _$WeatherTimeFromJson(Map<String, dynamic> json) {
  return _WeatherTime.fromJson(json);
}

/// @nodoc
mixin _$WeatherTime {
  int? get icon => throw _privateConstructorUsedError;
  String? get iconPhrase => throw _privateConstructorUsedError;
  bool? get hasPrecipitation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherTimeCopyWith<WeatherTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherTimeCopyWith<$Res> {
  factory $WeatherTimeCopyWith(
          WeatherTime value, $Res Function(WeatherTime) then) =
      _$WeatherTimeCopyWithImpl<$Res, WeatherTime>;
  @useResult
  $Res call({int? icon, String? iconPhrase, bool? hasPrecipitation});
}

/// @nodoc
class _$WeatherTimeCopyWithImpl<$Res, $Val extends WeatherTime>
    implements $WeatherTimeCopyWith<$Res> {
  _$WeatherTimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = freezed,
    Object? iconPhrase = freezed,
    Object? hasPrecipitation = freezed,
  }) {
    return _then(_value.copyWith(
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as int?,
      iconPhrase: freezed == iconPhrase
          ? _value.iconPhrase
          : iconPhrase // ignore: cast_nullable_to_non_nullable
              as String?,
      hasPrecipitation: freezed == hasPrecipitation
          ? _value.hasPrecipitation
          : hasPrecipitation // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WeatherTimeCopyWith<$Res>
    implements $WeatherTimeCopyWith<$Res> {
  factory _$$_WeatherTimeCopyWith(
          _$_WeatherTime value, $Res Function(_$_WeatherTime) then) =
      __$$_WeatherTimeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? icon, String? iconPhrase, bool? hasPrecipitation});
}

/// @nodoc
class __$$_WeatherTimeCopyWithImpl<$Res>
    extends _$WeatherTimeCopyWithImpl<$Res, _$_WeatherTime>
    implements _$$_WeatherTimeCopyWith<$Res> {
  __$$_WeatherTimeCopyWithImpl(
      _$_WeatherTime _value, $Res Function(_$_WeatherTime) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = freezed,
    Object? iconPhrase = freezed,
    Object? hasPrecipitation = freezed,
  }) {
    return _then(_$_WeatherTime(
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as int?,
      iconPhrase: freezed == iconPhrase
          ? _value.iconPhrase
          : iconPhrase // ignore: cast_nullable_to_non_nullable
              as String?,
      hasPrecipitation: freezed == hasPrecipitation
          ? _value.hasPrecipitation
          : hasPrecipitation // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WeatherTime implements _WeatherTime {
  const _$_WeatherTime({this.icon, this.iconPhrase, this.hasPrecipitation});

  factory _$_WeatherTime.fromJson(Map<String, dynamic> json) =>
      _$$_WeatherTimeFromJson(json);

  @override
  final int? icon;
  @override
  final String? iconPhrase;
  @override
  final bool? hasPrecipitation;

  @override
  String toString() {
    return 'WeatherTime(icon: $icon, iconPhrase: $iconPhrase, hasPrecipitation: $hasPrecipitation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherTime &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.iconPhrase, iconPhrase) ||
                other.iconPhrase == iconPhrase) &&
            (identical(other.hasPrecipitation, hasPrecipitation) ||
                other.hasPrecipitation == hasPrecipitation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, icon, iconPhrase, hasPrecipitation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherTimeCopyWith<_$_WeatherTime> get copyWith =>
      __$$_WeatherTimeCopyWithImpl<_$_WeatherTime>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WeatherTimeToJson(
      this,
    );
  }
}

abstract class _WeatherTime implements WeatherTime {
  const factory _WeatherTime(
      {final int? icon,
      final String? iconPhrase,
      final bool? hasPrecipitation}) = _$_WeatherTime;

  factory _WeatherTime.fromJson(Map<String, dynamic> json) =
      _$_WeatherTime.fromJson;

  @override
  int? get icon;
  @override
  String? get iconPhrase;
  @override
  bool? get hasPrecipitation;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherTimeCopyWith<_$_WeatherTime> get copyWith =>
      throw _privateConstructorUsedError;
}
