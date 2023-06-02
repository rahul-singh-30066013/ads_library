/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_data_model.freezed.dart';
part 'weather_data_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class WeatherDataModel with _$WeatherDataModel {
  const factory WeatherDataModel({
    @Default([]) final List<DailyForecast?> dailyForecasts,
    @Default([]) final List<CurrentConditionForecast?> currentConditionForecast,
  }) = _WeatherDataModel;

  factory WeatherDataModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataModelFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class DailyForecast with _$DailyForecast {
  const factory DailyForecast({
    final String? date,
    final int? epochDate,
    final Temperature? temperature,
    final WeatherTime? day,
    final WeatherTime? night,
  }) = _DailyForecast;

  factory DailyForecast.fromJson(Map<String, dynamic> json) =>
      _$DailyForecastFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class CurrentConditionForecast with _$CurrentConditionForecast {
  const factory CurrentConditionForecast({
    final String? localObservationDateTime,
    final int? epochTime,
    final String? weatherText,
    final int? weatherIcon,
    final bool? isDayTime,
    final TemperatureUnitData? temperature,
  }) = _CurrentConditionForecast;

  factory CurrentConditionForecast.fromJson(Map<String, dynamic> json) =>
      _$CurrentConditionForecastFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class TemperatureUnitData with _$TemperatureUnitData {
  const factory TemperatureUnitData({
    final TemperatureData? metric,
    final TemperatureData? imperial,
  }) = _TemperatureUnitData;

  factory TemperatureUnitData.fromJson(Map<String, dynamic> json) =>
      _$TemperatureUnitDataFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class Temperature with _$Temperature {
  const factory Temperature({
    final TemperatureData? minimum,
    final TemperatureData? maximum,
  }) = _Temperature;

  factory Temperature.fromJson(Map<String, dynamic> json) =>
      _$TemperatureFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class TemperatureData with _$TemperatureData {
  const factory TemperatureData({
    final double? value,
    final String? unit,
    final int? unitType,
  }) = _TemperatureData;

  factory TemperatureData.fromJson(Map<String, dynamic> json) =>
      _$TemperatureDataFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
class WeatherTime with _$WeatherTime {
  const factory WeatherTime({
    final int? icon,
    final String? iconPhrase,
    final bool? hasPrecipitation,
  }) = _WeatherTime;

  factory WeatherTime.fromJson(Map<String, dynamic> json) =>
      _$WeatherTimeFromJson(json);
}
