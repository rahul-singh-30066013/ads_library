/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/ga_analytics/flight_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/request/flight_booking_cancel_request_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_book/data_model/flight_view_trip_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/pax_info_list.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/display_model/flight_review_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_cancel/label_check_box.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_cancel/source_to_origin.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_cancel_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class SelectFlightTraveller extends StatefulWidget {
  final FlightViewTripResponseModel flightBookingResponseModel;

  const SelectFlightTraveller({
    Key? key,
    required this.flightBookingResponseModel,
  }) : super(key: key);

  @override
  _SelectFlightTravellerState createState() => _SelectFlightTravellerState();
}

class _SelectFlightTravellerState extends State<SelectFlightTraveller> {
  FlightCancelState? flightCancelState;
  bool isInternational = false;

  @override
  void initState() {
    super.initState();
    flightCancelState = FlightCancelState(
      flightReviewDetailModel: widget.flightBookingResponseModel
          .flightReviewDetailModel?.flightReviewDetailInfo,
    );
    isInternational =
        widget.flightBookingResponseModel.isInternational ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return ADSelectorStateLessWidget<FlightCancelState>(
      viewModel: flightCancelState ?? FlightCancelState(),
      child: PaxListing(
        orderReferenceId: widget.flightBookingResponseModel.orderReferenceId ?? '',
        isInternational: isInternational,
      ),
    );
  }
}

class PaxListing extends StatelessWidget {
  final String orderReferenceId;
  final bool isInternational;
  PaxListing({required this.orderReferenceId, required this.isInternational, Key? key})
      : super(key: key);

  final double _heightOfSubmitButton = 54.sp;
  static const double opacityOfPage = 0.7;

  void _continueButtonAction(BuildContext context) {
    final stateObject = context.read<FlightCancelState>();
    final PaxTuple tuple = stateObject.isSelectionValid();
    if (tuple.isEmpty) {
      SnackBarUtil.showSnackBar(
        context,
        'select_one_traveller_to_cancel'.localize(context),
      );
    } else if (!tuple.isAdultChildCaseValid) {
      SnackBarUtil.showSnackBar(
        context,
        'child_cannot_travel_alone'.localize(context),
      );
    } else if (!tuple.isAdultInfantCaseValid) {
      SnackBarUtil.showSnackBar(
        context,
        'infant_cannot_travel_alone'.localize(context),
      );
    } else {
      final totalPax =
          getTotalPaxForGA(stateObject.flightReviewDetailModel ?? []);
      final selectedPaxCount = getSelectedPaxForGA(
        getPassengerListJourney(
          stateObject.flightReviewDetailModel ?? [],
        ),
      );
      FlightBookingGaAnalytics()
          .selectPaxOnBookingCancelAnalyticsData(selectedPaxCount, totalPax);
      navigateToScreenUsingNamedRouteWithArguments(
        context,
        selectReasonScreen,
        argumentObject: SelectedPaxTripToCancel(
          orderReferenceId: orderReferenceId,
          passengerListInJourneyList: getPassengerListJourney(
            stateObject.flightReviewDetailModel ?? [],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final stateObject = context.read<FlightCancelState>();
    final siteCore = context.read<SiteCoreStateManagement>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.adColors.whiteTextColor,
        elevation: 0,
        title: Text(
          'select_flight_traveller'.localize(context),
          style: ADTextStyle700.size22.setTextColor(context.adColors.black),
        ),
      ),
      body: Selector<FlightCancelState, bool>(
        selector: (context, model) =>
            model.cancelTravellerResponse.viewStatus == Status.loading,
        builder: (context, value, child) => value
            ? AbsorbPointer(
                child: Opacity(
                  opacity: opacityOfPage,
                  child: child,
                ),
              )
            : child ?? const ADSizedBox(),
        child: ListView(
          children: [
            if (isInternational)
              Container(
                padding: EdgeInsets.all(
                  context.k_10,
                ),
                width: context.widthOfScreen,
                decoration: BoxDecoration(
                  // color: DutyFreeRefundScreen.lightBlueColor,
                  color: context.adColors.cardBlueBg,
                  borderRadius: BorderRadius.all(Radius.circular(context.k_8)),
                ),
                child: Text(
                  'partially_cancellation_not_allowed'.localize(context),
                  style: ADTextStyle400.size16.setTextColor(
                    context.adColors.blackTextColor,
                  ),
                  textAlign: TextAlign.left,
                ),
              ).paddingBySide(
                left: context.k_10,
                right: context.k_10,
              ),
            MediaQuery.removePadding(
              context: context,
              removeBottom: true,
              removeTop: true,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: stateObject.flightReviewDetailModel?.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final listData = stateObject.flightReviewDetailModel?[index];
                  final bool isCancellableJourney =
                      listData?.isJourneyCancelable ?? false;
                  // final List<JourneyFlightDetails> journeyFlightDetails =
                  //     listData?.journeyFlightDetails ?? [];
                  // final JourneyFlightDetails journeyFlightObj =
                  //     journeyFlightDetails.first;
                  final int paxLengthOfCurrentJourney = listData
                          ?.passengerListInJourney
                          ?.cancellablePaxInfoList
                          ?.length ??
                      0;
                  return paxLengthOfCurrentJourney > 0 && isCancellableJourney
                      /*checkEligibility(
                            journeyFlightObj.flightDepartureDate,
                            journeyFlightObj.flightDepartureTime,
                          )*/
                      ? Column(
                          children: [
                            if (index > 0)
                              Divider(
                                thickness: 1.sp,
                                indent: context.k_16,
                                endIndent: context.k_16,
                                height: 1.sp,
                                color: context.adColors.tileBorderColor,
                              ).paddingBySide(top: context.k_20),
                            SourceToOrigin(
                              source: siteCore
                                      .airportCityMap[listData
                                          ?.passengerListInJourney
                                          ?.fromLocation
                                          ?.locationCode]
                                      ?.cityName ??
                                  listData?.passengerListInJourney?.fromLocation
                                      ?.city ??
                                  ''
                              /*listData?.passengerListInJourney
                                      ?.fromLocation?.city ??
                                  ''*/
                              ,
                              destination: siteCore
                                      .airportCityMap[listData
                                          ?.passengerListInJourney
                                          ?.toLocation
                                          ?.locationCode]
                                      ?.cityName ??
                                  listData?.passengerListInJourney?.toLocation
                                      ?.city ??
                                  '',
                            ).paddingBySide(
                              left: context.k_16,
                              top: context.k_30,
                            ),
                            MediaQuery.removePadding(
                              context: context,
                              removeLeft: true,
                              removeBottom: true,
                              removeTop: true,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: listData?.passengerListInJourney
                                    ?.cancellablePaxInfoList?.length,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, subIndex) {
                                  final paxData = listData
                                      ?.passengerListInJourney
                                      ?.cancellablePaxInfoList?[subIndex];
                                  return Consumer<FlightCancelState>(
                                    builder: (context, model, child) {
                                      final personName = paxData
                                          ?.cancellablePaxInfoList?.personName;
                                      return LabelCheckbox(
                                        title: personName?.namePrefix != null
                                            ? '${personName?.namePrefix}.'
                                            : '',
                                        travellerFirstName:
                                            personName?.firstName ?? '',
                                        travellerLastName:
                                            personName?.lastName ?? '',
                                        value: paxData?.cancellablePaxInfoList
                                                ?.status ??
                                            false,
                                        activeColor: Colors.black,
                                        gap: isInternational
                                            ? context.k_10
                                            : context.k_6,
                                        typeOfTraveller: paxData
                                                ?.cancellablePaxInfoList
                                                ?.passengerTypeCode ??
                                            '',
                                        onTap: (value) => isInternational
                                            ? null
                                            : context
                                                .read<FlightCancelState>()
                                                .updateTravellerSelection(
                                                  paxData,
                                                  value: value,
                                                ),
                                        isInternational: isInternational,
                                      );
                                    },
                                  );
                                },
                              ).paddingBySide(
                                top: context.k_12,
                                left: context.k_6,
                                right: context.k_10,
                              ),
                            ),
                          ],
                        )
                      : const ADSizedBox.shrink();
                },
              ),
            ),
            ADSizedBox(
              height: context.k_30,
            ),
            Selector<FlightCancelState, PaxTuple>(
              selector: (context, viewModel) => viewModel.tuple,
              builder: (context, value, Widget? child) {
                return ElevatedButton(
                  onPressed: value.isEmpty
                      ? null
                      : () => _continueButtonAction(context),
                  style: ElevatedButton.styleFrom(
                    primary: context.adColors.blueColor,
                    // elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(context.k_28),
                    ),
                    minimumSize: Size(
                      double.infinity,
                      _heightOfSubmitButton,
                    ), //////// HERE
                  ),
                  child: Text(
                    'continue'.localize(context),
                    style: ADTextStyle700.size18.setTextColor(
                      context.adColors.whiteTextColor,
                    ),
                  ),
                ).paddingBySide(
                  top: context.k_16,
                  bottom: context.k_36,
                  left: context.k_14,
                  right: context.k_16,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  //to get passenger list journey
  List<PassengerListInJourney> getPassengerListJourney(
    List<FlightReviewDetailInfo> flightReviewDetailModel,
  ) {
    final List<PassengerListInJourney> passengerListInJourneyList = [];
    if (flightReviewDetailModel.isNotEmpty) {
      for (int index = 0; index < flightReviewDetailModel.length; index++) {
        // final List<JourneyFlightDetails> journeyFlightDetails =
        //     flightReviewDetailModel[reviewList].journeyFlightDetails ?? [];
        // final JourneyFlightDetails journeyFlightObj =
        //     journeyFlightDetails.first;
        final bool isCancellableJourney =
            flightReviewDetailModel[index].isJourneyCancelable ?? false;
        /*if (checkEligibility(
          journeyFlightObj.flightDepartureDate,
          journeyFlightObj.flightDepartureTime,
        ))*/
        if (isCancellableJourney) {
          final PassengerListInJourney passengerListInJourneyObj =
              flightReviewDetailModel[index].passengerListInJourney ??
                  PassengerListInJourney();
          final List<PassengerTicketInfo> paxInfoList =
              passengerListInJourneyObj.cancellablePaxInfoList ?? [];
          for (int review = 0; review < paxInfoList.length; review++) {
            final PassengerTicketInfo passengerTicketInfo = paxInfoList[review];
            if (passengerTicketInfo.cancellablePaxInfoList?.status == true &&
                !passengerListInJourneyList
                    .contains(passengerListInJourneyObj)) {
              passengerListInJourneyList.add(passengerListInJourneyObj);
            }
          }
        }
      }
    }
    return passengerListInJourneyList;
  }

// to check eligibility to show segment and pax -pax and journey will not visible, if departure date is less than today
  /* bool checkEligibility(
    String flightDepartureDate,
    String departureTime,
  ) {
    bool isEligible = false;
    if (flightDepartureDate.isNotEmpty) {
      final currentDate = DateTime.now();
      final parseDepartureDate =
          DateTime.parse(FlightUtils.changeDateFormat(flightDepartureDate));
      //to check hr
      final bookedTimeArray = departureTime.split(':');
      final selectedDateTime = DateTime(
        parseDepartureDate.year,
        parseDepartureDate.month,
        parseDepartureDate.day,
        int.parse(bookedTimeArray.first),
        int.parse(bookedTimeArray.last),
        parseDepartureDate.second,
        parseDepartureDate.millisecond,
        parseDepartureDate.microsecond,
      );
      final int difference = DateTime(
        parseDepartureDate.year,
        parseDepartureDate.month,
        parseDepartureDate.day,
      )
          .difference(
            DateTime(
              currentDate.year,
              currentDate.month,
              currentDate.day,
            ),
          )
          .inDays;
      if (difference >= 0) {
        if (selectedDateTime.isAfter(DateTime.now())) {
          if (selectedDateTime.difference(DateTime.now()).inMinutes >=
              minimumTimeRequiredToCancel) {
            isEligible = true;
          }
        }
      }
    } else {
      isEligible = false;
    }
    return isEligible;
  }
*/
//to get total pax in journey
  int getTotalPaxForGA(List<FlightReviewDetailInfo> listJourney) {
    int paxCount = 0;
    if (listJourney.isNotEmpty) {
      for (int index = 0; index < listJourney.length; index++) {
        final listData = listJourney[index];
        paxCount =
            listData.passengerListInJourney?.cancellablePaxInfoList?.length ??
                0;
      }
    }
    return paxCount;
  }

  //to get selected pax to cancel
  int getSelectedPaxForGA(List<PassengerListInJourney> passengerListJourney) {
    int paxCount = 0;
    if (passengerListJourney.isNotEmpty) {
      for (int index = 0; index < passengerListJourney.length; index++) {
        final PassengerListInJourney passengerListJourneyObj =
            passengerListJourney[index];
        final cancellableList =
            passengerListJourneyObj.cancellablePaxInfoList ?? [];
        for (int indexSelected = 0;
            indexSelected < cancellableList.length;
            indexSelected++) {
          final PassengerTicketInfo? passengerTktInfo =
              cancellableList[indexSelected];
          final PaxInfoList paxInfoListItem =
              passengerTktInfo?.cancellablePaxInfoList ?? PaxInfoList();
          if (paxInfoListItem.status == true) {
            paxCount = paxCount + 1;
          }
        }
      }
    }
    return paxCount;
  }
}
