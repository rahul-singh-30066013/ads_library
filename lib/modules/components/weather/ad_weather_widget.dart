/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/common_service/models/weather_data_model.dart';
import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/components/weather/ad_weather_sheet.dart';
import 'package:adani_airport_mobile/modules/components/weather/weather_state.dart';
import 'package:adani_airport_mobile/modules/components/weather/weather_utils.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

class ADWeatherWidget extends StatefulWidget {
  const ADWeatherWidget({
    Key? key,
    required this.compact,
    required this.itemWidth,
    required this.onErrorCallback,
    required this.url,
    required this.itemHeight,
    required this.borderRadius,
  }) : super(key: key);

  final bool compact;
  final double itemWidth;
  final double itemHeight;
  final double borderRadius;
  final ADTapCallback onErrorCallback;
  final String url;

  @override
  State<ADWeatherWidget> createState() => _ADWeatherWidgetState();
}

class _ADWeatherWidgetState extends State<ADWeatherWidget>
    with AutomaticKeepAliveClientMixin {
  final WeatherState weatherState = WeatherState();

  bool stateError = false;

  @override
  bool get wantKeepAlive => !stateError;

  void _updateKeepAlive() {
    setState(() {
      stateError = !stateError;
    });
  }

  @override
  Widget build(BuildContext context) {
    final noUseWidget = super.build(context);
    //added to avoid the warning
    adLog(noUseWidget.toString());
    return stateError
        ? const SizedBox.shrink()
        : ADSelectorStateLessWidget<WeatherState>(
            viewModel: weatherState
              ..path = widget.url
              ..fetchWeatherData(),
            child: Selector<WeatherState, ADResponseState>(
              selector: (_, viewModel) => viewModel.weatherDataModel,
              builder: (context, weatherResponse, _) {
                final selectedAirport = selectedAirportNotifier.value;
                final loading = weatherResponse.viewStatus != Status.complete &&
                    weatherResponse.viewStatus != Status.error;
                final error = weatherResponse.viewStatus == Status.error;
                if (error) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _updateKeepAlive();
                    widget.onErrorCallback();
                  });
                }
                return error
                    ? const SizedBox.shrink()
                    : TouchableOpacity(
                        onTap: loading
                            ? null
                            : () => _openWeatherSheet(
                                  context,
                                  weatherResponse.data ??
                                      const WeatherDataModel(),
                                ),
                        child: SizedBox(
                          width: widget.itemWidth,
                          height: widget.itemHeight,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  widget.borderRadius,
                                ),
                              ),
                              border: Border.all(
                                color: context
                                    .adColors.lightGreyGridSeparatorColor,
                              ),
                            ),
                            child: widget.compact
                                ? loading
                                    ? const _SmallSizeTemplateShimmer()
                                    : _SmallSizeTemplate(
                                        weatherDisplayModel:
                                            _WeatherDisplayModel(
                                          selectedAirport: selectedAirport,
                                          displayTemperature:
                                              _getDisplayTemperature(
                                            weatherResponse.data,
                                          ),
                                          imageSrc: _getImageSrc(
                                            weatherResponse.data,
                                          ),
                                        ),
                                      )
                                : loading
                                    ? const _NormalSizeTemplateShimmer()
                                    : _NormalSizeTemplate(
                                        weatherDisplayModel:
                                            _WeatherDisplayModel(
                                          selectedAirport: selectedAirport,
                                          displayTemperature:
                                              _getDisplayTemperature(
                                            weatherResponse.data,
                                          ),
                                          imageSrc: _getImageSrc(
                                            weatherResponse.data,
                                          ),
                                        ),
                                      ),
                          ),
                        ),
                      );
              },
            ),
          );
  }

  void _openWeatherSheet(
    BuildContext context,
    WeatherDataModel weatherDataModel,
  ) {
    adShowBottomSheetWithWrap(
      context: context,
      childWidget: ADWeatherSheet(
        weatherDataModel: weatherDataModel,
      ).paddingBySide(
        bottom: context.k_40,
      ),
      headerTitle: '',
    );
  }

  String _getDisplayTemperature(WeatherDataModel weatherDataModel) {
    final todayWeather = weatherDataModel.currentConditionForecast.first;
    if (todayWeather == null) {
      return '';
    }
    return '${todayWeather.temperature?.metric?.value?.removeTrailingZeros ?? ''}°${todayWeather.temperature?.metric?.unit}';
  }

  String _getImageSrc(WeatherDataModel weatherDataModel) {
    final todayWeather = weatherDataModel.currentConditionForecast.first;
    if (todayWeather == null) {
      return '';
    }
    final imageNum = todayWeather.weatherIcon?.appendZeroIfReq;
    final imageString =
        '${Environment.instance.configuration.cmsImageBaseUrl}${WeatherUtils.weatherImageUrlPath}$imageNum-s.jpg';
    return imageString;
  }
}

class _SmallSizeTemplate extends StatelessWidget {
  const _SmallSizeTemplate({
    Key? key,
    required this.weatherDisplayModel,
  }) : super(key: key);

  final _WeatherDisplayModel weatherDisplayModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weatherDisplayModel.displayTemperature,
                style: ADTextStyle500.size16.setTextColor(
                  context.adColors.black,
                ),
              ),
              SizedBox(
                height: context.k_2,
              ),
              Text(
                weatherDisplayModel.selectedAirport,
                style: ADTextStyle400.size12.setTextColor(
                  context.adColors.greyTextColor,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ).paddingBySide(
            left: context.k_12,
          ),
        ),
        SizedBox(
          width: context.k_4,
        ),
        Image.network(
          weatherDisplayModel.imageSrc,
          width: context.k_24,
          fit: BoxFit.fill,
        ).paddingBySide(
          right: context.k_12,
        ),
      ],
    );
  }
}

class _SmallSizeTemplateShimmer extends StatelessWidget {
  const _SmallSizeTemplateShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ADShimmerWidget.shimmerShape(
                type: ShimmerType.rectangleBox,
                height: context.k_10,
                width: context.k_40,
                rectanglePadding: EdgeInsets.zero,
              ),
              SizedBox(
                height: context.k_4,
              ),
              ADShimmerWidget.shimmerShape(
                type: ShimmerType.rectangleBox,
                height: context.k_10,
                width: context.k_40,
                rectanglePadding: EdgeInsets.zero,
              ),
            ],
          ).paddingBySide(
            left: context.k_12,
          ),
        ),
        SizedBox(
          width: context.k_4,
        ),
        ADShimmerWidget.shimmerShape(
          type: ShimmerType.circle,
          height: context.k_28,
          width: context.k_28,
          rectanglePadding: EdgeInsets.zero,
        ).paddingBySide(
          right: context.k_8,
        ),
      ],
    );
  }
}

class _NormalSizeTemplate extends StatelessWidget {
  const _NormalSizeTemplate({
    Key? key,
    required this.weatherDisplayModel,
  }) : super(key: key);

  final _WeatherDisplayModel weatherDisplayModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          weatherDisplayModel.selectedAirport,
          style: ADTextStyle500.size16.setTextColor(
            context.adColors.black,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              weatherDisplayModel.displayTemperature,
              style: ADTextStyle500.size22.setTextColor(
                context.adColors.black,
              ),
            ),
            SizedBox(
              width: context.k_6,
            ),
            Image.network(
              weatherDisplayModel.imageSrc,
              height: context.k_28,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ],
    ).paddingBySide(
      left: context.k_12,
      right: context.k_12,
    );
  }
}

class _NormalSizeTemplateShimmer extends StatelessWidget {
  const _NormalSizeTemplateShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ADShimmerWidget.shimmerShape(
          type: ShimmerType.rectangleBox,
          height: context.k_10,
          width: context.k_40,
          rectanglePadding: EdgeInsets.zero,
        ),
        Row(
          children: [
            ADShimmerWidget.shimmerShape(
              type: ShimmerType.rectangleBox,
              height: context.k_10,
              width: context.k_40,
              rectanglePadding: EdgeInsets.zero,
            ),
            SizedBox(
              width: context.k_6,
            ),
            ADShimmerWidget.shimmerShape(
              type: ShimmerType.circle,
              height: context.k_28,
              width: context.k_28,
              rectanglePadding: EdgeInsets.zero,
            ),
          ],
        ),
      ],
    ).paddingBySide(
      left: context.k_12,
      right: context.k_12,
    );
  }
}

class _WeatherDisplayModel {
  final String selectedAirport;
  final String displayTemperature;
  final String imageSrc;

  _WeatherDisplayModel({
    required this.selectedAirport,
    required this.displayTemperature,
    required this.imageSrc,
  });
}
