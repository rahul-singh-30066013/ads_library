/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/insurance.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/pax_info_list.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/priced_itinerary.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/zero_cancellation_summary.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/city_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/fare_sheet_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/route_name_container_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/review/views/ad_row.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/flight_automation_keys.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_constants.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_draggable_sheet_header.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/tooltip_view/tooltip_screen.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// bottom sheet widget that opens when "view fare details" is tapped
///TODO:Need to refactor this in case of special fare
const lineHeight = 1.5;

class FareDetailsSheet extends StatelessWidget {
  final List<PricedItinerary>? pricedItineraryList;
  final List<PaxInfoList> paxInfoList;
  final double? discountApplied;
  final double? rewardsApplied;
  final ScrollController? scrollController;
  final double? discountedCCFFee;
  final double? convenienceFee;
  final Insurance? insurance;
  final ZeroCancellationSummary? zeroCancellationSummary;
  final bool? isCcfToShow;

  const FareDetailsSheet({
    Key? key,
    required this.pricedItineraryList,
    required this.paxInfoList,
    this.discountApplied,
    this.rewardsApplied,
    this.scrollController,
    this.discountedCCFFee = 0,
    this.convenienceFee = 0,
    this.insurance,
    this.zeroCancellationSummary,
    this.isCcfToShow = false,
  }) : super(key: key);

  List<PricedItinerary> get _pricedList =>
      pricedItineraryList ?? [PricedItinerary()];

  @override
  Widget build(BuildContext context) {
    /*final double totalBaseFare = _getTotalBaseFare();
    final double totalTaxes = _getTotalTax();*/
    // final double totalTax = _getTotalTax();
    final double totalAmount = _getAmountPayable();
    final double totalAirfare = _getCalculatedAirfare();
    final Map<String, CityDetailModel> airportMap =
        context.read<SiteCoreStateManagement>().airportCityMap;
    final isInterNationalRoundTrip = _pricedList.first.isInternationRoundTrip;
    return pricedItineraryList != null
        ? ListView(
            controller: scrollController,
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
                  ADSizedBox(
                    height: context.k_6,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      key: const Key(FlightAutomationKeys.headerIconKey),
                      iconSize: context.k_48,
                      visualDensity: VisualDensity.compact,
                      splashRadius: context.k_20,
                      padding: EdgeInsets.zero,
                      onPressed: () => navigatorPopScreen(context),
                      icon: SvgPicture.asset(
                        SvgAssets.closeIcon,
                        height: context.k_14,
                        width: context.k_14,
                        color: closeIconColor,
                      ),
                    ),
                  ),
                  ADSizedBox(
                    height: context.k_6,
                  ),
                  ADRow(
                    leftText: 'fare_details'.localize(context),
                    rightText: paxInfoList.isNotEmpty
                        ? getPassengerCount(
                            paxInfoList,
                            context,
                          ) /*'${'adult'.localize(context)} ${paxInfoList.length}'*/
                        : '',
                    leftTextStyle: ADTextStyle700.size22,
                    rightTextStyle: ADTextStyle400.size14
                        .copyWith(color: context.adColors.greyTextColor),
                  ).paddingBySide(
                    left: context.k_16,
                    right: context.k_20,
                    bottom: context.k_20,
                  ),
                ] +
                _pricedList.map(
                  (element) {
                    final Map<String, double> taxesMap =
                        element.airItineraryPricingInfo?.getPriceSummary() ??
                            {};
                    return Column(
                      children: [
                        RouteNameContainerView(
                          isRoundTrip: isInterNationalRoundTrip,
                          source: airportMap[element
                                      .airItinerary
                                      ?.firstFlightDetails
                                      .flightDepartureCityCode]
                                  ?.cityName ??
                              element.airItinerary?.firstFlightDetails
                                  .flightDepartureCityName ??
                              '',
                          destination: airportMap[element
                                      .airItinerary
                                      ?.firstFlightDetails
                                      .flightArrivalCityCode]
                                  ?.cityName ??
                              element.airItinerary?.firstFlightDetails
                                  .flightArrivalCityName ??
                              '',
                        ),
                        ADSizedBox(
                          height: context.k_20,
                        ),
                        FareSheetView(
                          title: 'base_fare'.localize(context),
                          price: FlightUtils.getPriceFormatWithSymbol(
                            price: element.priceInfo.calculatedBaseFare,
                          ),
                        ),
                        MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          removeBottom: true,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: taxesMap.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final String taxKey =
                                  taxesMap.keys.elementAt(index);
                              return FareSheetView(
                                title: taxKey.localize(context),
                                price: FlightUtils.getPriceFormatWithSymbol(
                                  price: taxesMap[taxKey] ?? 0,
                                ),
                              );
                            },
                          ),
                        ),
                        /* Divider(
                            indent: context.k_16,
                            endIndent: context.k_16,
                          ),*/
                        if (_pricedList.length > 1)
                          FareSheetView(
                            title: element.directionInd == 'O'
                                ? 'total_onward_airfare'.localize(context)
                                : element.directionInd == 'I'
                                    ? 'total_return_airfare'.localize(context)
                                    : 'total_fare'.localize(context),
                            price: FlightUtils.getPriceFormatWithSymbol(
                              price: element.priceInfo.calculatedFareWithoutCCF,
                            ),
                          ).paddingBySide(
                            bottom: context.k_14,
                          ),
                        /*Divider(
                          indent: context.k_16,
                          endIndent: context.k_16,
                        ),*/
                      ],
                    );
                  },
                ).toList() +
                [
                  Divider(
                    indent: context.k_16,
                    endIndent: context.k_16,
                  ),
                  FareSheetView(
                    title: 'total_airfare'.localize(context),
                    price: FlightUtils.getPriceFormatWithSymbol(
                      price: totalAirfare,
                    ),
                  ).paddingBySide(top: context.k_12),
                  if (insurance?.insured ?? false)
                    FareSheetView(
                      title: 'travel_insurance'.localize(context),
                      price: FlightUtils.getPriceFormatWithSymbol(
                        price: (insurance?.netAmt)?.toDouble() ?? 0,
                      ),
                    ),
                  if (zeroCancellationSummary?.isActive ?? false)
                    FareSheetView(
                      title: 'zero_cancellation'.localize(context),
                      price: FlightUtils.getPriceFormatWithSymbol(
                        price:
                            (zeroCancellationSummary?.netAmt)?.toDouble() ?? 0,
                      ),
                    ),
                  /* FareSheetView(
                    title: 'taxes_and_fees'.localize(context),
                    price: FlightUtils.getPriceFormatWithSymbol(
                      price: totalTax,
                    ),
                  ),*/
                  if ((discountApplied ?? 0) == 0 &&
                      (rewardsApplied ?? 0) == 0 &&
                      (convenienceFee ?? 0) == 0 &&
                      !(isCcfToShow ?? false))
                    Divider(
                      indent: context.k_16,
                      endIndent: context.k_16,
                      height: 1,
                    ),
                  if ((discountApplied ?? 0) > 0)
                    ADRow(
                      leftText: 'coupon_discount'.localize(context),
                      rightText: '-${FlightUtils.getPriceFormatWithSymbol(
                        price: discountApplied ?? 0,
                      )}',
                      leftTextStyle: ADTextStyle400.size16,
                      rightTextStyle: ADTextStyle400.size16
                          .setTextColor(context.adColors.greenTextColor),
                    ).paddingBySide(
                      // top: context.k_16,
                      left: context.k_16,
                      right: context.k_20,
                      bottom: context.k_16,
                    ),
                  if ((discountApplied ?? 0) > 0 &&
                      (rewardsApplied ?? 0) <= 0 &&
                      (convenienceFee ?? 0) <= 0 &&
                      !(isCcfToShow ?? false))
                    Divider(
                      indent: context.k_16,
                      endIndent: context.k_16,
                      height: 1,
                    ),
                  if ((rewardsApplied ?? 0) > 0)
                    ADRow(
                      leftText: 'rewards_points'.localize(context),
                      rightText: '-${FlightUtils.getPriceFormatWithSymbol(
                        price: rewardsApplied ?? 0,
                      )}',
                      leftTextStyle: ADTextStyle400.size16,
                      rightTextStyle: ADTextStyle400.size16
                          .setTextColor(context.adColors.greenTextColor),
                    ).paddingBySide(
                      //top: (discountApplied ?? 0) > 0 ? 0 : context.k_16,
                      left: context.k_16,
                      right: context.k_20,
                      bottom: context.k_16,
                    ),
                  if ((rewardsApplied ?? 0) > 0 &&
                      (convenienceFee ?? 0) <= 0 &&
                      !(isCcfToShow ?? false))
                    Divider(
                      indent: context.k_16,
                      endIndent: context.k_16,
                      height: context.k_16,
                    ),
                  if (isCcfToShow ?? false)
                    (discountedCCFFee ?? 0) > 0
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'convenienceFee'.localize(context),
                                style: ADTextStyle400.size16,
                              ),
                              SizedBox(
                                width: context.k_4,
                              ),
                              TooltipScreen(
                                richTextHeader:
                                    '${'offer_allied_title'.localize(context)}\n',
                                richTextMessage:
                                    '${'offer_allied_desc'.localize(context)} ${FlightUtils.getPriceFormatWithSymbol(
                                  price: discountedCCFFee?.toDouble() ?? 0,
                                )}',
                                textStyleMessage:
                                    ADTextStyle400.size12.setTextColor(
                                  context.adColors.blackTextColor,
                                ),
                                textStyleHeader: ADTextStyle400.size12
                                    .setTextColor(
                                      context.adColors.blackTextColor,
                                    )
                                    .copyWith(
                                      height: lineHeight,
                                    ),
                                tooltipColor: context.adColors.whiteTextColor,
                                padding: -context.k_32,
                              ),
                              const Spacer(),
                              Text(
                                FlightUtils.getPriceFormatWithSymbol(
                                  price: convenienceFee ?? 0,
                                ),
                                style: ADTextStyle400.size16
                                    .setTextColor(
                                      context.adColors.blackTextColor,
                                    )
                                    .copyWith(
                                      decoration: TextDecoration.lineThrough,
                                    ),
                              ),
                              SizedBox(
                                width: context.k_2,
                              ),
                              Text(
                                FlightUtils.getPriceFormatWithSymbol(
                                  price: (convenienceFee ?? 0) -
                                      (discountedCCFFee ?? 0),
                                ),
                                style: ADTextStyle400.size16.setTextColor(
                                  context.adColors.blackTextColor,
                                ),
                              ),
                            ],
                          ).paddingBySide(
                            left: context.k_16,
                            right: context.k_20,
                            bottom: context.k_16,
                          )
                        : ADRow(
                            leftText: 'convenienceFee'.localize(context),
                            rightText: FlightUtils.getPriceFormatWithSymbol(
                              price: convenienceFee ?? 0,
                            ),
                            leftTextStyle: ADTextStyle400.size16,
                            rightTextStyle: ADTextStyle400.size16
                                .setTextColor(context.adColors.blackTextColor),
                          ).paddingBySide(
                            left: context.k_16,
                            right: context.k_20,
                            bottom: context.k_16,
                          ),
                  if (isCcfToShow ?? false)
                    Divider(
                      indent: context.k_16,
                      endIndent: context.k_16,
                      height: context.k_16,
                    ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: context.k_4,
                      horizontal: context.k_16,
                    ),
                    title: Text(
                      'total_amount'.localize(context),
                      style: ADTextStyle500.size20,
                    ),
                    trailing: Text(
                      FlightUtils.getPriceFormatWithSymbol(
                        price: (totalAmount - (rewardsApplied ?? 0)) < 1
                            ? 0
                            : totalAmount - (rewardsApplied ?? 0),
                      ),
                      style: ADTextStyle500.size20,
                    ),
                  ),
                  Divider(
                    indent: context.k_16,
                    endIndent: context.k_16,
                    height: 1,
                  ),
                  ADSizedBox(
                    height: context.k_20,
                  ),
                ],
          )
        : const ADSizedBox.shrink();
  }

  /*double _getTotalBaseFare() {
    double total = 0;
    for (final element in _pricedList) {
      total = total + (element.priceInfo.totalBaseFare?.amount ?? 0).toDouble();
    }
    return total;
  }

  double _getTotalTax() {
    double total = 0;
    for (final element in _pricedList) {
      total = total + (element.priceInfo.totalTax?.amount ?? 0).toDouble();
    }
    return total;
  }*/

  // double _getTotalTax() {
  //   double total = 0;
  //   for (final element in _pricedList) {
  //     total = total + (element.priceInfo.calculatedTax).toDouble();
  //   }
  //   return total;
  // }

  double _getCalculatedAirfare() {
    double total = 0;
    for (final element in _pricedList) {
      total = total + (element.priceInfo.calculatedFareWithoutCCF).toDouble();
    }
    return total;
  }

  double _getAmountPayable() {
    double total = 0;
    for (final element in _pricedList) {
      total = total + (element.priceInfo.totalFare?.amount ?? 0).toDouble();
    }
    // if (insurance != null && (insurance?.netAmt ?? 0) > 0) {
    //   total = total + (insurance?.netAmt ?? 0);
    // }
    return total;
  }

//to get pax count category wise and show on fare detail row
  String getPassengerCount(
    List<PaxInfoList> paxInfoList,
    BuildContext context,
  ) {
    int adtCount = 0;
    int chdCount = 0;
    int infCount = 0;

    String paxItem = '';

    for (int index = 0; index < paxInfoList.length; index++) {
      final PaxInfoList paxObj = paxInfoList[index];
      if (paxObj.passengerTypeCode == kAdultCode) {
        adtCount = adtCount + 1;
      } else if (paxObj.passengerTypeCode == kChildCode) {
        chdCount = chdCount + 1;
      } else if (paxObj.passengerTypeCode == kInfantCode) {
        infCount = infCount + 1;
      }
    }
    paxItem = '$adtCount ${kAdult.localize(context)}';
    if (chdCount > 0) {
      paxItem = '$paxItem, $chdCount ${kChild.localize(context)}';
    }
    if (infCount > 0) {
      paxItem = '$paxItem, $infCount ${kInfant.localize(context)}';
    }
    return paxItem;
  }
}
