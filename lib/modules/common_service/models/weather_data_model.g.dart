// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WeatherDataModel _$$_WeatherDataModelFromJson(Map<String, dynamic> json) =>
    _$_WeatherDataModel(
      dailyForecasts: (json['dailyForecasts'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : DailyForecast.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      currentConditionForecast:
          (json['currentConditionForecast'] as List<dynamic>?)
                  ?.map((e) => e == null
                      ? null
                      : CurrentConditionForecast.fromJson(
                          e as Map<String, dynamic>))
                  .toList() ??
              const [],
    );

Map<String, dynamic> _$$_WeatherDataModelToJson(_$_WeatherDataModel instance) =>
    <String, dynamic>{
      'dailyForecasts': instance.dailyForecasts,
      'currentConditionForecast': instance.currentConditionForecast,
    };

_$_DailyForecast _$$_DailyForecastFromJson(Map<String, dynamic> json) =>
    _$_DailyForecast(
      date: json['date'] as String?,
      epochDate: json['epochDate'] as int?,
      temperature: json['temperature'] == null
          ? null
          : Temperature.fromJson(json['temperature'] as Map<String, dynamic>),
      day: json['day'] == null
          ? null
          : WeatherTime.fromJson(json['day'] as Map<String, dynamic>),
      night: json['night'] == null
          ? null
          : WeatherTime.fromJson(json['night'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DailyForecastToJson(_$_DailyForecast instance) =>
    <String, dynamic>{
      'date': instance.date,
      'epochDate': instance.epochDate,
      'temperature': instance.temperature,
      'day': instance.day,
      'night': instance.night,
    };

_$_CurrentConditionForecast _$$_CurrentConditionForecastFromJson(
        Map<String, dynamic> json) =>
    _$_CurrentConditionForecast(
      localObservationDateTime: json['localObservationDateTime'] as String?,
      epochTime: json['epochTime'] as int?,
      weatherText: json['weatherText'] as String?,
      weatherIcon: json['weatherIcon'] as int?,
      isDayTime: json['isDayTime'] as bool?,
      temperature: json['temperature'] == null
          ? null
          : TemperatureUnitData.fromJson(
              json['temperature'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CurrentConditionForecastToJson(
        _$_CurrentConditionForecast instance) =>
    <String, dynamic>{
      'localObservationDateTime': instance.localObservationDateTime,
      'epochTime': instance.epochTime,
      'weatherText': instance.weatherText,
      'weatherIcon': instance.weatherIcon,
      'isDayTime': instance.isDayTime,
      'temperature': instance.temperature,
    };

_$_TemperatureUnitData _$$_TemperatureUnitDataFromJson(
        Map<String, dynamic> json) =>
    _$_TemperatureUnitData(
      metric: json['metric'] == null
          ? null
          : TemperatureData.fromJson(json['metric'] as Map<String, dynamic>),
      imperial: json['imperial'] == null
          ? null
          : TemperatureData.fromJson(json['imperial'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TemperatureUnitDataToJson(
        _$_TemperatureUnitData instance) =>
    <String, dynamic>{
      'metric': instance.metric,
      'imperial': instance.imperial,
    };

_$_Temperature _$$_TemperatureFromJson(Map<String, dynamic> json) =>
    _$_Temperature(
      minimum: json['minimum'] == null
          ? null
          : TemperatureData.fromJson(json['minimum'] as Map<String, dynamic>),
      maximum: json['maximum'] == null
          ? null
          : TemperatureData.fromJson(json['maximum'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TemperatureToJson(_$_Temperature instance) =>
    <String, dynamic>{
      'minimum': instance.minimum,
      'maximum': instance.maximum,
    };

_$_TemperatureData _$$_TemperatureDataFromJson(Map<String, dynamic> json) =>
    _$_TemperatureData(
      value: (json['value'] as num?)?.toDouble(),
      unit: json['unit'] as String?,
      unitType: json['unitType'] as int?,
    );

Map<String, dynamic> _$$_TemperatureDataToJson(_$_TemperatureData instance) =>
    <String, dynamic>{
      'value': instance.value,
      'unit': instance.unit,
      'unitType': instance.unitType,
    };

_$_WeatherTime _$$_WeatherTimeFromJson(Map<String, dynamic> json) =>
    _$_WeatherTime(
      icon: json['icon'] as int?,
      iconPhrase: json['iconPhrase'] as String?,
      hasPrecipitation: json['hasPrecipitation'] as bool?,
    );

Map<String, dynamic> _$$_WeatherTimeToJson(_$_WeatherTime instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'iconPhrase': instance.iconPhrase,
      'hasPrecipitation': instance.hasPrecipitation,
    };
