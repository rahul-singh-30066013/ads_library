/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/car_parking/models/parking_rate_figures.dart';
import 'package:adani_airport_mobile/modules/car_parking/state_management/parking_rates_view_model.dart';
import 'package:adani_airport_mobile/modules/car_parking/utilities/enums/vehicle_type.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

class ParkingRatesDetails extends StatelessWidget {
  final int totalLength = 2;
  final int defaultIndex = 1;

  final Map<String, Map<VehicleType, List<ParkingRateFigures>>>
      parkingRatesTally = {
    'Terminal 1': {
      VehicleType.fourWheeler: [
        ParkingRateFigures(
          departure: '0 to 30 mins',
          standartAmount: 160,
          premiumAmount: 250,
        ),
        ParkingRateFigures(
          departure: '31 to 120 mins',
          standartAmount: 250,
          premiumAmount: 340,
        ),
        ParkingRateFigures(
          departure: '121 to 180 mins',
          standartAmount: 300,
          premiumAmount: 400,
        ),
        ParkingRateFigures(
          departure: '181 to 240 mins',
          standartAmount: 380,
          premiumAmount: 480,
        ),
        ParkingRateFigures(
          departure: 'Each additional 60 minutes upto 8 hrs',
          standartAmount: 150,
          premiumAmount: 170,
        ),
        ParkingRateFigures(
          departure: '8 hrs to 24 hrs',
          standartAmount: 1000,
          premiumAmount: 1200,
        ),
      ],
      VehicleType.twoWheeler: [
        ParkingRateFigures(
          departure: '0 to 240 mins',
          standartAmount: 150,
          premiumAmount: 180,
        ),
        ParkingRateFigures(
          departure: 'Each additional 60 minutes upto 8 hrs',
          standartAmount: 250,
          premiumAmount: 300,
        ),
        ParkingRateFigures(
          departure: '8 hours to 24 hrs',
          standartAmount: 300,
          premiumAmount: 400,
        ),
      ],
    },
    'Terminal 2': {
      VehicleType.fourWheeler: [
        ParkingRateFigures(
          departure: '0 to 30 mins',
          standartAmount: 160,
          premiumAmount: 300,
        ),
        ParkingRateFigures(
          departure: '31 to 120 mins',
          standartAmount: 250,
          premiumAmount: 340,
        ),
        ParkingRateFigures(
          departure: '121 to 180 mins',
          standartAmount: 300,
          premiumAmount: 400,
        ),
        ParkingRateFigures(
          departure: '181 to 240 mins',
          standartAmount: 380,
          premiumAmount: 480,
        ),
        ParkingRateFigures(
          departure: 'Each additional 60 minutes upto 8 hrs',
          standartAmount: 150,
          premiumAmount: 170,
        ),
        ParkingRateFigures(
          departure: '8 hrs to 24 hrs',
          standartAmount: 1000,
          premiumAmount: 1200,
        ),
      ],
      VehicleType.twoWheeler: [
        ParkingRateFigures(
          departure: '0 to 240 mins',
          standartAmount: 150,
          premiumAmount: 180,
        ),
        ParkingRateFigures(
          departure: 'Each additional 60 minutes upto 8 hrs',
          standartAmount: 250,
          premiumAmount: 300,
        ),
        ParkingRateFigures(
          departure: '8 hours to 24 hrs',
          standartAmount: 300,
          premiumAmount: 400,
        ),
      ],
    },
  };

  ParkingRatesDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ADSelectorStateLessWidget<ParkingRatesViewModel>(
      viewModel: ParkingRatesViewModel(),
      child: Consumer<ParkingRatesViewModel>(
        builder: (context, viewModel, child) {
          return Column(
            children: [
              // Terminal selection
              SizedBox(
                height: context.k_20,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () =>
                          viewModel.updateSelectedTerminalWith('Terminal 1'),
                      child: Column(
                        children: [
                          Text(
                            'Terminal 1',
                            style: ADTextStyle500.size16.setTextColor(
                              context.adColors.neutralInfoMsg,
                            ),
                          ),
                          SizedBox(
                            height: context.k_16,
                          ),
                          Container(
                            height: context.k_2,
                            color: viewModel.selectedTerminal == 'Terminal 1'
                                ? context.adColors.blackTextColor
                                : const Color(0xffEAEAEA),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () =>
                          viewModel.updateSelectedTerminalWith('Terminal 2'),
                      child: Column(
                        children: [
                          Text(
                            'Terminal 2',
                            style: ADTextStyle500.size16.setTextColor(
                              context.adColors.neutralInfoMsg,
                            ),
                          ),
                          SizedBox(
                            height: context.k_16,
                          ),
                          Container(
                            height: context.k_2,
                            color: viewModel.selectedTerminal == 'Terminal 2'
                                ? context.adColors.blackTextColor
                                : const Color(0xffEAEAEA),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Terminal 2',
                          style: ADTextStyle500.size16.setTextColor(
                            context.adColors.transparentColor,
                          ),
                        ),
                        SizedBox(
                          height: context.k_16,
                        ),
                        Container(
                          height: context.k_2,
                          color: const Color(0xffEAEAEA),
                        ),
                      ],
                    ),
                  ),
                ],
              ).paddingBySide(
                left: context.k_16,
                right: context.k_16,
              ),
              // list of parking fares
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(0),
                  children:
                      // rates
                      [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: parkingRatesTally[viewModel.selectedTerminal]!
                          .entries
                          .map(
                            (parkingData) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                    SizedBox(
                                      height: context.k_40,
                                    ),
                                    Text(
                                      parkingData.key
                                          .toString()
                                          .split('.')
                                          .last
                                          .localize(context),
                                      style: ADTextStyle700.size18.setTextColor(
                                        context.adColors.neutralInfoMsg,
                                      ),
                                    ).paddingBySide(
                                      left: context.k_16,
                                      right: context.k_16,
                                    ),
                                    SizedBox(
                                      height: context.k_30,
                                    ),
                                  ] +
                                  parkingData.value
                                      .map(
                                        (figure) => Column(
                                          children: [
                                            Row(
                                              children: [
                                                ParkingRateDetail(
                                                  title: 'departure'
                                                      .localize(context),
                                                  value: figure.departure,
                                                ),
                                              ],
                                            ).paddingBySide(
                                              left: context.k_16,
                                              right: context.k_16,
                                            ),
                                            SizedBox(
                                              height: context.k_20,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ParkingRateDetail(
                                                  title: 'standard_amount'
                                                      .localize(context),
                                                  value: figure.standartAmount
                                                      .toStringAsFixed(0),
                                                ),
                                                ParkingRateDetail(
                                                  title: 'premium_amount'
                                                      .localize(context),
                                                  value: figure.premiumAmount
                                                      .toStringAsFixed(0),
                                                ),
                                              ],
                                            ).paddingBySide(
                                              left: context.k_16,
                                              right: context.k_16,
                                            ),
                                            if (figure ==
                                                parkingData.value.last)
                                              parkingData.key ==
                                                      parkingRatesTally[viewModel
                                                              .selectedTerminal]!
                                                          .keys
                                                          .last
                                                  ? const SizedBox()
                                                  : Container(
                                                      color: context.adColors
                                                          .containerGreyBg,
                                                      height: context.k_8,
                                                    ).paddingBySide(
                                                      top: context.k_40,
                                                    )
                                            else
                                              Divider(
                                                color: context
                                                    .adColors.dividerColor,
                                              ).paddingBySide(
                                                top: context.k_24,
                                                bottom: context.k_24,
                                                left: context.k_16,
                                                right: context.k_16,
                                              ),
                                          ],
                                        ),
                                      )
                                      .toList(),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ParkingRateDetail extends StatelessWidget {
  final String title;
  final String value;

  const ParkingRateDetail({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: ADTextStyle500.size14.setTextColor(
              context.adColors.darkGreyTextColor,
            ),
          ),
          Text(
            value,
            maxLines: 1,
            style: ADTextStyle600.size16.setTextColor(
              context.adColors.neutralInfoMsg,
            ),
          ).paddingBySide(
            top: context.k_4,
          ),
        ],
      ),
    );
  }
}

// DefaultTabController.of(context).index
