/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/trip_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/flight_booking_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_list/views/action_button_with_icon.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

/// Flight Listing page
// /// current selected FliterButton one way trip
// FilterButtonType selectedButton = FilterButtonType.price;
//
// /// current selected FilterButton two way trip
// FilterButtonType selectedButton2 = FilterButtonType.price;
//
// /// current selected Ascending/Descending one way trip
// bool _isAscending = true;
//
// /// storing true value in constant for making ascending true
// const bool tempAscending = true;
//
// /// current selected Ascending/Descending two way trip
// bool _isAscending2 = true;

class TwoWayTripHeader extends StatefulWidget {
  final FlightBookingModel flightBookingModel;
  final void Function(FlightSort value) outBoundFilterTapCallBack;
  final void Function(FlightSort value) inBoundFilterTapCallBack;
  final FlightSort outBoundSelectedFilterButtonType;
  final SortType outBoundSelectedSortType;
  final FlightSort inBoundSelectedFilterButtonType;
  final SortType inBoundSelectedSortType;

  const TwoWayTripHeader({
    Key? key,
    required this.flightBookingModel,
    required this.outBoundFilterTapCallBack,
    required this.inBoundFilterTapCallBack,
    required this.outBoundSelectedFilterButtonType,
    required this.outBoundSelectedSortType,
    required this.inBoundSelectedFilterButtonType,
    required this.inBoundSelectedSortType,
  }) : super(key: key);

  @override
  State<TwoWayTripHeader> createState() => _TwoWayTripHeaderState();
}

/// Two way stateful header
class _TwoWayTripHeaderState extends State<TwoWayTripHeader> {
  final double dividerHeight = 68.sp;

  @override
  Widget build(BuildContext context) {
    final TripDetailModel? tripDetailModel =
        widget.flightBookingModel.roundTrip;
    return Container(
      width: double.infinity,
      color: context.adColors.containerGreyBg,
      child: Material(
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ///TODO: Fix using validateDefaultValue method
                        tripDetailModel?.toCity?.cityCode ?? '',
                        textAlign: TextAlign.center,
                        style: ADTextStyle600.size14
                            .setTextColor(context.adColors.black),
                      ),
                      SvgPicture.asset(
                        'lib/assets/images/svg/icons/flight/one way.svg',
                        width: context.k_10,
                        color: context.adColors.darkGreyTextColor,
                      ).paddingBySide(
                        left: context.k_8,
                        right: context.k_8,
                      ),
                      Text(
                        tripDetailModel?.fromCity?.cityCode ?? '',
                        textAlign: TextAlign.center,
                        style: ADTextStyle600.size14
                            .setTextColor(context.adColors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => widget
                              .outBoundFilterTapCallBack(FlightSort.byTime),
                          child: ActionButtonWithIcon(
                            type: FlightSort.byTime,
                            paddingBetweenTextAndIcon: context.k_4,
                            showIcon: widget.outBoundSelectedFilterButtonType ==
                                FlightSort.byTime,
                            isAscendingOrder:
                                widget.outBoundSelectedSortType == SortType.des,
                          ).paddingBySide(
                            bottom: context.k_14,
                            top: context.k_8,
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => widget
                              .outBoundFilterTapCallBack(FlightSort.byPrice),
                          child: ActionButtonWithIcon(
                            showIcon: widget.outBoundSelectedFilterButtonType ==
                                FlightSort.byPrice,
                            isAscendingOrder:
                                widget.outBoundSelectedSortType == SortType.des,
                            paddingBetweenTextAndIcon: context.k_4,
                            type: FlightSort.byPrice,
                          ).paddingBySide(
                            bottom: context.k_12,
                            top: context.k_8,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ).paddingBySide(
                top: context.k_14,
              ),
            ),
            Container(
              width: 1,
              height: dividerHeight,
              color: context.adColors.tileBorderColor,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        tripDetailModel?.fromCity?.cityCode ?? '',
                        textAlign: TextAlign.center,
                        style: ADTextStyle600.size14
                            .setTextColor(context.adColors.black),
                      ),
                      SvgPicture.asset(
                        'lib/assets/images/svg/icons/flight/one way.svg',
                        width: context.k_10,
                        color: context.adColors.darkGreyTextColor,
                      ).paddingBySide(
                        left: context.k_8,
                        right: context.k_8,
                      ),
                      Text(
                        tripDetailModel?.toCity?.cityCode ?? '',
                        textAlign: TextAlign.center,
                        style: ADTextStyle600.size14
                            .setTextColor(context.adColors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => widget
                              .inBoundFilterTapCallBack(FlightSort.byTime),
                          child: ActionButtonWithIcon(
                            type: FlightSort.byTime,
                            paddingBetweenTextAndIcon: context.k_4,
                            showIcon: widget.inBoundSelectedFilterButtonType ==
                                FlightSort.byTime,
                            isAscendingOrder:
                                widget.inBoundSelectedSortType == SortType.des,
                          ).paddingBySide(
                            bottom: context.k_12,
                            top: context.k_8,
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => widget
                              .inBoundFilterTapCallBack(FlightSort.byPrice),
                          child: ActionButtonWithIcon(
                            showIcon: widget.inBoundSelectedFilterButtonType ==
                                FlightSort.byPrice,
                            isAscendingOrder:
                                widget.inBoundSelectedSortType == SortType.des,
                            paddingBetweenTextAndIcon: context.k_4,
                            type: FlightSort.byPrice,
                          ).paddingBySide(
                            bottom: context.k_12,
                            top: context.k_8,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ).paddingBySide(
                top: context.k_14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
