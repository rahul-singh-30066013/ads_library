/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/common_service/models/weather_data_model.dart';
import 'package:adani_airport_mobile/modules/components/weather/weather_utils.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class ADWeatherSheet extends StatelessWidget {
  const ADWeatherSheet({
    Key? key,
    required this.weatherDataModel,
  }) : super(key: key);

  final WeatherDataModel weatherDataModel;

  @override
  Widget build(BuildContext context) {
    final todayWeatherData = weatherDataModel.currentConditionForecast.first;
    final isDayTime = todayWeatherData?.isDayTime;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _getDisplayTemperature(todayWeatherData),
                  style: ADTextStyle700.size32.setTextColor(
                    context.adColors.black,
                  ),
                ),
                SizedBox(
                  height: context.k_10,
                ),
                Text(
                  'local_weather'.localize(context),
                  style: ADTextStyle400.size14.setTextColor(
                    context.adColors.black,
                  ),
                ),
              ],
            ),
            Image.network(
              _getImageSrc(
                todayWeatherData,
              ),
              width: context.k_60,
              fit: BoxFit.fill,
            ),
          ],
        ),
        SizedBox(
          height: context.k_40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: weatherDataModel.dailyForecasts
              .map(
                (forecast) => _WeatherDayDetails(
                  day: forecast?.date ?? '',
                  minimum: _getChildDisplayMinTemperature(forecast),
                  maximum: _getChildDisplayMaxTemperature(forecast),
                  imageSrc: _getChildImageSrc(forecast, isDayTime ?? false),
                ),
              )
              .toList(),
        ),
      ],
    ).paddingBySide(
      left: context.k_16,
      right: context.k_16,
    );
  }

  String _getDisplayTemperature(CurrentConditionForecast? todayWeather) {
    if (todayWeather == null) {
      return '';
    }
    return '${todayWeather.temperature?.metric?.value?.removeTrailingZeros ?? ''}°${todayWeather.temperature?.metric?.unit}';
  }

  String _getImageSrc(CurrentConditionForecast? todayWeather) {
    if (todayWeather == null) {
      return '';
    }
    final imageNum = todayWeather.weatherIcon?.appendZeroIfReq;
    final imageString =
        '${Environment.instance.configuration.cmsImageBaseUrl}${WeatherUtils.weatherImageUrlPath}$imageNum-s.jpg';
    return imageString;
  }

  String _getChildDisplayMinTemperature(DailyForecast? todayWeather) {
    if (todayWeather == null) {
      return '';
    }
    return '${todayWeather.temperature?.minimum?.value?.removeTrailingZeros ?? ''}°';
  }

  String _getChildDisplayMaxTemperature(DailyForecast? todayWeather) {
    if (todayWeather == null) {
      return '';
    }
    return '${todayWeather.temperature?.maximum?.value?.removeTrailingZeros ?? ''}°';
  }

  String _getChildImageSrc(DailyForecast? todayWeather, bool isDayTime) {
    if (todayWeather == null) {
      return '';
    }
    final imageString = isDayTime
        ? todayWeather.day?.icon?.appendZeroIfReq
        : todayWeather.night?.icon?.appendZeroIfReq;
    return '${Environment.instance.configuration.cmsImageBaseUrl}${WeatherUtils.weatherImageUrlPath}$imageString-s.jpg';
  }
}

class _WeatherDayDetails extends StatelessWidget {
  const _WeatherDayDetails({
    Key? key,
    required this.day,
    required this.minimum,
    required this.maximum,
    required this.imageSrc,
  }) : super(key: key);

  final String day;
  final String minimum;
  final String maximum;
  final String imageSrc;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          WeatherUtils.dayMap[DateTime.parse(day).weekday] ?? '',
          style: ADTextStyle400.size10.setTextColor(
            context.adColors.darkGreyTextColor,
          ),
        ).paddingBySide(
          right: context.k_4,
        ),
        SizedBox(
          height: context.k_6,
        ),
        Image.network(
          imageSrc,
          height: context.k_30,
          fit: BoxFit.fill,
        ).paddingBySide(
          right: context.k_2,
        ),
        SizedBox(
          height: context.k_6,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              maximum,
              style: ADTextStyle700.size10.setTextColor(
                context.adColors.black,
              ),
            ),
            SizedBox(
              width: context.k_2,
            ),
            Text(
              minimum,
              style: ADTextStyle400.size10.setTextColor(
                context.adColors.darkGreyTextColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
