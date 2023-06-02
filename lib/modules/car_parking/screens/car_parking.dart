/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/car_parking/screens/components/generic_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/car_parking/screens/parking_rates_details.dart';
import 'package:adani_airport_mobile/modules/car_parking/state_management/car_parking_view_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

class CarParking extends StatelessWidget {
  final double spaceBetweenHeaders = 20.sp;
  final double listViewSmallTileHeight = 200.sp;
  final double listViewLargeTileHeight = 450.sp;
  final double radiusForIconsWidget = 71.sp;
  final double radiusForBulletPoints = 4.sp;
  final double radiusForNavigationButtons = 16.sp;
  final double standardBorderRadius = 8;
  final double terminalImageHeight = 150.sp;
  final double iconSizeForSafeHands = 80.sp;
  final double videoHeightForGuide = 400.sp;
  final double imageHeightForGuide = 230.sp;
  final double imageHeightForMoreServices = 270.sp;
  final int maximumLinesForSmallText = 2;
  final int maximumLinesForLargeText = 3;
  final double aspectRatioForBanner = (375 / 609).sp;

  final double amount = 750;

  CarParking({Key? key}) : super(key: key);

  final CarParkingViewModel carParkingState = CarParkingViewModel();

  @override
  Widget build(BuildContext context) {
    return ADSelectorStateLessWidget<CarParkingViewModel>(
      viewModel: carParkingState,
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(0),
          children:
              // banner image
              <Widget>[
                    Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: aspectRatioForBanner,
                          child: Container(
                            color: Colors.black12,
                          ),
                        ),
                        SafeArea(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: radiusForNavigationButtons,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: context.adColors.neutralInfoMsg,
                                ).paddingBySide(
                                  left: context.k_10,
                                  right: context.k_10,
                                ),
                              ),
                              CircleAvatar(
                                radius: radiusForNavigationButtons,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.search,
                                  color: context.adColors.neutralInfoMsg,
                                ),
                              ),
                            ],
                          ).paddingAllSide(
                            context.k_16,
                          ),
                        ),
                      ],
                    ),
                  ] +
                  // park & fly
                  [
                    const HeaderText(
                      title: 'park_and_fly',
                    ).paddingBySide(left: context.k_18, right: context.k_18),
                    Row(
                      children: [
                        Expanded(
                          child: Selector<CarParkingViewModel, String>(
                            selector: (_, viewModel) =>
                                viewModel.locationValue ?? '',
                            builder: (context, value, child) => GenericDropdown(
                              title: 'location',
                              valueText: value,
                              valuesDomain: carParkingState.locationDoamin,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: context.k_14,
                        ),
                        Expanded(
                          child: Selector<CarParkingViewModel, String>(
                            selector: (_, viewModel) =>
                                viewModel.vehicleTypeValue ?? '',
                            builder: (context, value, child) => GenericDropdown(
                              title: 'vehicle_type',
                              valueText: value,
                              valuesDomain: carParkingState.vehiclesDomain,
                            ),
                          ),
                        ),
                      ],
                    ).paddingBySide(left: context.k_18, right: context.k_18),
                    Selector<CarParkingViewModel, String>(
                      selector: (_, viewModel) =>
                          viewModel.entryDateValue ?? '',
                      builder: (context, value, child) => GenericDropdown(
                        title: 'entry_date',
                        valueText: value,
                        valuesDomain: carParkingState.entryDateDomain,
                      ),
                    ).paddingBySide(
                      left: context.k_18,
                      right: context.k_18,
                    ),
                    Selector<CarParkingViewModel, String>(
                      selector: (_, viewModel) =>
                          viewModel.estimatedTimeValue ?? '',
                      builder: (context, value, child) => GenericDropdown(
                        title: 'estimated_time',
                        valueText: value,
                        valuesDomain: carParkingState.estimatedTimeDomain,
                      ),
                    ).paddingBySide(left: context.k_18, right: context.k_18),
                    Selector<CarParkingViewModel, String>(
                      selector: (_, viewModel) =>
                          viewModel.durationAndPriceValue ?? '',
                      builder: (context, value, child) => GenericDropdown(
                        title: 'duration_and_price',
                        valueText: value,
                        valuesDomain: carParkingState.durationAndPriceDomain,
                      ),
                    ).paddingBySide(left: context.k_18, right: context.k_18),
                    ElevatedButton(
                      onPressed: () => navigateToScreenUsingNamedRoute(
                        context,
                        carParkingOwnerDetails,
                      ),
                      child: Text(
                        'book_at_amount'.localize(context) +
                            amount.toStringAsFixed(0),
                        style: ADTextStyle700.size18
                            .setTextColor(context.adColors.whiteTextColor),
                      ).paddingBySide(top: context.k_14, bottom: context.k_14),
                    ).paddingBySide(
                      top: context.k_30,
                      left: context.k_18,
                      right: context.k_18,
                    ),
                  ] +
                  // how it works
                  [
                    SizedBox(
                      height: spaceBetweenHeaders,
                    ),
                    const HeaderText(title: 'how_it_works').paddingBySide(
                      left: context.k_18,
                      right: context.k_18,
                    ),
                    Container(
                      height: listViewSmallTileHeight,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          'enter_your_details',
                          'pay_and_get_qr',
                          'show_qr_at_parking',
                        ]
                            .map(
                              (element) => Column(
                                children: [
                                  CircleAvatar(
                                    radius: radiusForIconsWidget,
                                    backgroundColor: const Color(0xffF9F9F9),
                                  ),
                                  SizedBox(
                                    height: context.k_20,
                                  ),
                                  Text(
                                    element.localize(context),
                                    style: ADTextStyle600.size16.setTextColor(
                                      context.adColors.blackTextColor,
                                    ),
                                    maxLines: maximumLinesForSmallText,
                                  ),
                                ],
                              ).paddingBySide(
                                right: context.k_24,
                              ),
                            )
                            .toList(),
                      ),
                    ).paddingBySide(
                      top: context.k_20,
                      left: context.k_18,
                      right: context.k_18,
                    ),
                  ] +
                  // parking facility
                  [
                    SizedBox(
                      height: spaceBetweenHeaders,
                    ),
                    const HeaderText(title: 'parking_facility').paddingBySide(
                      left: context.k_18,
                      right: context.k_18,
                    ),
                    Text(
                      'parking_facility_description'.localize(context),
                      style: ADTextStyle400.size16
                          .setTextColor(context.adColors.neutralInfoMsg),
                      maxLines: maximumLinesForLargeText,
                      overflow: TextOverflow.ellipsis,
                    ).paddingBySide(
                      top: context.k_20,
                      left: context.k_18,
                      right: context.k_18,
                    ),
                    Text(
                      'read_more'.localize(context).toLowerCase(),
                      style: ADTextStyle600.size16
                          .setTextColor(context.adColors.neutralInfoMsg)
                          .copyWith(
                            decoration: TextDecoration.underline,
                          ),
                    ).paddingBySide(
                      top: context.k_10,
                      left: context.k_18,
                      right: context.k_18,
                    ),
                    GestureDetector(
                      onTap: () => adShowBottomSheet(
                        context: context,
                        childWidget: ParkingRatesDetails(),
                        headerTitle: 'parking_rates'.localize(context),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(standardBorderRadius),
                          ),
                          border: Border.all(
                            color: context.adColors.widgetDividerLine,
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: terminalImageHeight,
                              decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.only(
                                  topLeft:
                                      Radius.circular(standardBorderRadius),
                                  topRight:
                                      Radius.circular(standardBorderRadius),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Terminal 1',
                                      maxLines: 1,
                                      style: ADTextStyle600.size20.setTextColor(
                                        context.adColors.blackTextColor,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      'starting_from'.localize(context),
                                      maxLines: 1,
                                      style: ADTextStyle500.size16.setTextColor(
                                        context.adColors.blackTextColor,
                                      ),
                                    ),
                                    Text(
                                      ' ₹120/-',
                                      style: ADTextStyle700.size16.setTextColor(
                                        context.adColors.blackTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: context.k_8,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        'Working hours: 24 hours',
                                        'Parking Floors: 5',
                                        'Capacity: 750',
                                      ]
                                          .map(
                                            (element) => Row(
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor: context
                                                      .adColors
                                                      .contentBulletColor,
                                                  radius: radiusForBulletPoints,
                                                ),
                                                SizedBox(
                                                  width: context.k_16,
                                                ),
                                                Text(
                                                  element,
                                                  maxLines: 1,
                                                  style: ADTextStyle500.size16
                                                      .setTextColor(
                                                    context.adColors
                                                        .blackTextColor,
                                                  ),
                                                ),
                                              ],
                                            ).paddingBySide(top: context.k_12),
                                          )
                                          .toList(),
                                    ),
                                    const Spacer(),
                                    Text(
                                      'details'.localize(context),
                                      style: ADTextStyle600.size16
                                          .setTextColor(
                                            context.adColors.neutralInfoMsg,
                                          )
                                          .copyWith(
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                    ).paddingBySide(top: context.k_12),
                                  ],
                                ),
                              ],
                            ).paddingAllSide(context.k_16),
                          ],
                        ),
                      ).paddingBySide(
                        top: context.k_20,
                        left: context.k_18,
                        right: context.k_18,
                      ),
                    ),
                  ] +
                  // safe hands
                  [
                    SizedBox(
                      height: spaceBetweenHeaders,
                    ),
                    const HeaderText(title: 'safe_hands_title').paddingBySide(
                      left: context.k_18,
                      right: context.k_18,
                    ),
                    Column(
                      children: {
                        'security_title': 'security_message',
                        'access_title': 'access_message',
                        'official_parking_title': 'official_parking_message',
                      }
                          .entries
                          .map(
                            (element) => Row(
                              children: [
                                Container(
                                  height: iconSizeForSafeHands,
                                  width: iconSizeForSafeHands,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffF6F6F6),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(standardBorderRadius),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: context.k_20,
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        element.key.localize(context),
                                        style:
                                            ADTextStyle600.size16.setTextColor(
                                          context.adColors.blackTextColor,
                                        ),
                                      ),
                                      SizedBox(
                                        height: context.k_6,
                                      ),
                                      Text(
                                        element.value.localize(context),
                                        style:
                                            ADTextStyle400.size16.setTextColor(
                                          context.adColors.neutralInfoMsg,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ).paddingBySide(
                              top: context.k_30,
                            ),
                          )
                          .toList(),
                    ).paddingBySide(
                      left: context.k_18,
                      right: context.k_18,
                    ),
                  ] +
                  // guide
                  [
                    SizedBox(
                      height: spaceBetweenHeaders,
                    ),
                    const HeaderText(title: 'guide').paddingBySide(
                      left: context.k_18,
                      right: context.k_18,
                    ),
                    // video
                    Container(
                      height: videoHeightForGuide,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.all(
                          Radius.circular(standardBorderRadius),
                        ),
                      ),
                    ).paddingBySide(
                      top: context.k_20,
                      left: context.k_18,
                      right: context.k_18,
                    ),
                    SizedBox(
                      height: spaceBetweenHeaders,
                    ),
                    // image
                    Container(
                      height: imageHeightForGuide,
                      decoration: BoxDecoration(
                        color: const Color(0xffF6F6F6),
                        borderRadius: BorderRadius.all(
                          Radius.circular(standardBorderRadius),
                        ),
                      ),
                    ).paddingBySide(
                      top: context.k_32,
                      left: context.k_18,
                      right: context.k_18,
                    ),
                    Text(
                      'free_parking_cancellations'.localize(context),
                      style: ADTextStyle700.size18
                          .setTextColor(context.adColors.blackTextColor),
                    ).paddingBySide(
                      top: context.k_20,
                      left: context.k_18,
                      right: context.k_18,
                    ),
                    Text(
                      'free_parking_cancellations_description'
                          .localize(context),
                      style: ADTextStyle400.size16
                          .setTextColor(context.adColors.blackTextColor),
                    ).paddingBySide(
                      top: context.k_14,
                      left: context.k_18,
                      right: context.k_18,
                    ),
                  ] +
                  // more services
                  [
                    SizedBox(
                      height: spaceBetweenHeaders,
                    ),
                    const HeaderText(
                      title: 'more_services',
                      showSeeAllOption: true,
                    ).paddingBySide(
                      left: context.k_18,
                      right: context.k_18,
                    ),
                    Container(
                      height: listViewLargeTileHeight,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: {
                          'Pranaam':
                              'Pranaam is our state-of-the-art guest relation service delivering goodness to arriving, departing, and trans…',
                          'Valet Parking':
                              'You can now avail Valet parking services when at the International Terminal.',
                        }
                        .entries
                            .map(
                              (element) => Container(
                                width: imageHeightForMoreServices,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: imageHeightForMoreServices,
                                      decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(standardBorderRadius),
                                        ),
                                      ),
                                    ).paddingBySide(top: context.k_20),
                                    Text(
                                      element.key,
                                      style: ADTextStyle600.size16.setTextColor(
                                        context.adColors.blackTextColor,
                                      ),
                                    ).paddingBySide(
                                      top: context.k_20,
                                    ),
                                    Expanded(
                                      child: Text(
                                        element.value,
                                        style:
                                            ADTextStyle400.size16.setTextColor(
                                          context.adColors.blackTextColor,
                                        ),
                                      ).paddingBySide(
                                        top: context.k_12,
                                      ),
                                    ),
                                    Text(
                                      'book_now_label'.localize(context),
                                      style: ADTextStyle600.size16
                                          .setTextColor(
                                            context.adColors.neutralInfoMsg,
                                          )
                                          .copyWith(
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                    ).paddingBySide(
                                      top: context.k_14,
                                    ),
                                  ],
                                ),
                              ).paddingBySide(
                                right: context.k_20,
                              ),
                            )
                            .toList(),
                      ),
                    ).paddingBySide(
                      left: context.k_18,
                      right: context.k_18,
                    ),
                    SizedBox(
                      height: context.k_20,
                    ),
                  ],
        ),
      ),
    );
  }
}

class HeaderText extends StatelessWidget {
  final String title;
  final bool showSeeAllOption;

  const HeaderText({
    Key? key,
    required this.title,
    this.showSeeAllOption = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title.localize(context),
          style: ADTextStyle700.size22.setTextColor(
            context.adColors.blackTextColor,
          ),
        ).paddingBySide(top: context.k_32),
        const Spacer(),
        // ignore: prefer_if_elements_to_conditional_expressions
        showSeeAllOption
            ? Text(
                'seeAll'.localize(context),
                style: ADTextStyle500.size18
                    .setTextColor(
                      context.adColors.blackColor,
                    )
                    .copyWith(
                      decoration: TextDecoration.underline,
                    ),
              ).paddingBySide(top: context.k_32)
            : const SizedBox(),
      ],
    );
  }
}

// ignore: must_be_immutable
class GenericDropdown extends StatelessWidget {
  final double radiusForBorder = 8.sp;

  final String title;
  final String valueText;
  final Icon? leadingIcon;

  final List<String> valuesDomain;

  CarParkingViewModel? carParkingState;

  GenericDropdown({
    Key? key,
    required this.title,
    required this.valueText,
    this.leadingIcon,
    required this.valuesDomain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    carParkingState = Provider.of<CarParkingViewModel>(context);
    return GestureDetector(
      onTap: () => adShowBottomSheet(
        context: context,
        childWidget: GenericBottomSheet(
          valuesDomain: valuesDomain,
          selectedValue: valueText,
          onBottomSheetItemSelect: (value) => updateParameter(value),
        ),
        headerTitle: title.localize(context),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radiusForBorder)),
          border: Border.all(
            color: const Color(0xffCACACA),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.localize(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: ADTextStyle500.size12.setTextColor(
                      context.adColors.greyTextColor,
                    ),
                  ),
                  SizedBox(
                    height: context.k_4,
                  ),
                  Text(
                    valueText,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: ADTextStyle600.size16.setTextColor(
                      context.adColors.blackTextColor,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: leadingIcon ??
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: context.adColors.blackTextColor,
                  ),
            ),
          ],
        ).paddingBySide(
          left: context.k_16,
          right: context.k_16,
          top: context.k_10,
          bottom: context.k_10,
        ),
      ).paddingBySide(top: context.k_20),
    );
  }

  void updateParameter(String? value) {
    if (value == null) {
      return;
    } else {
      switch (title) {
        case 'location':
          carParkingState?.updateLocationWith(location: value);
          break;
        case 'vehicle_type':
          carParkingState?.updateVehicleTypeWith(vehicleType: value);
          break;
        case 'entry_date':
          carParkingState?.updateEntryDateWith(entryDate: value);
          break;
        case 'estimated_time':
          carParkingState?.updateEstimatedTimeWith(estimatedTime: value);
          break;
        case 'duration_and_price':
          carParkingState?.updateDurationAndPriceWith(
            durationAndPrice: value,
          );
          break;
        default:
      }
    }
  }
}
