/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_book/data_model/flight_view_trip_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_book/data_model/ticket_info.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/itinerary_contact_detail.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/pax_info_list.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/display_model/flight_review_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/booking_detail_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_search/header_dialog.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/review_screen_type.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

//this class will used to show flight related details below stepper - will call from review and payment screen
class ShowFlightBookingDetails extends StatelessWidget {
  final FlightViewTripResponseModel flightBookingResponseModel;
  final BookingConfirmationScreenType bookingConfirmationScreenType;
  const ShowFlightBookingDetails({
    Key? key,
    required this.flightBookingResponseModel,
    required this.bookingConfirmationScreenType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FlightReviewDetailModel? flightReviewDetailModel =
        flightBookingResponseModel.flightReviewDetailModel;
    final List<FlightReviewDetailInfo> flightReviewDetailInfo =
        flightReviewDetailModel?.flightReviewDetailInfo ?? [];
    final isInternational = flightBookingResponseModel.isInternational ?? false;
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: flightReviewDetailInfo.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final FlightReviewDetailInfo flightReviewDetailInfoItem =
            flightReviewDetailInfo[index];
        return Column(
          children: [
            BookingDetailView(
              tripType:
                  flightBookingResponseModel.tripType == ItineraryTripType.O
                      ? TripType.oneWay
                      : TripType.roundTrip,
              flightReviewDetailInfoItem: flightReviewDetailInfoItem,
              listIndex: index,
              screenType:
                  BookingConfirmationScreenType.flightBookingConfirmation.name,
              isInternational: isInternational,
              flightReviewDetailModel: flightReviewDetailModel,
              orderStatus: flightBookingResponseModel.orderStatus,
            ),
            TravellersList(
              flightReviewDetailInfoItem: flightReviewDetailInfoItem,
              bookingConfirmationScreenType: bookingConfirmationScreenType,
              isInternational:
                  flightBookingResponseModel.isInternational ?? false,
              orderStatus: flightBookingResponseModel.orderStatus,
              // flightBookingResponseModel: flightBookingResponseModel,
            ).paddingBySide(
              bottom: flightBookingResponseModel.tripType == ItineraryTripType.O
                  ? context.k_20
                  : context.k_40,
              top: context.k_20,
            ),
            /* if (flightBookingResponseModel.tripType == ItineraryTripType.R)
              Divider(
                height: context.k_8,
                thickness: context.k_8,
                color: context.adColors.containerGreyBg,
              ).paddingBySide(
                top: context.k_40,
                bottom: context.k_40,
              ),*/
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          height: context.k_8,
          thickness: context.k_8,
          color: context.adColors.containerGreyBg,
        ).paddingBySide(
          bottom: context.k_40,
        );
      },
    );
  }
}

// this will show traveller list for which booking created
class TravellersList extends StatelessWidget {
  final FlightReviewDetailInfo flightReviewDetailInfoItem;
  final BookingConfirmationScreenType bookingConfirmationScreenType;
  final bool isInternational;
  final String? orderStatus;
  const TravellersList({
    required this.flightReviewDetailInfoItem,
    required this.bookingConfirmationScreenType,
    required this.isInternational,
    this.orderStatus,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PassengerListInJourney? passengerListInJourney =
        flightReviewDetailInfoItem.passengerListInJourney;
    final List<PassengerTicketInfo> passengerTicketInoList =
        passengerListInJourney?.allPaxInfoList ?? [];
    // final List<PaxInfoList> passengerTicketInoList =
    //     passengerListInJourney?.journeyWisePaxInfoList ?? [];
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            passengerTicketInoList.length > 1
                ? 'travellers'.localize(context)
                : 'traveller'.localize(context),
            style: ADTextStyle500.size14
                .setTextColor(context.adColors.greyTextColor),
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
          ),
        ),
        MediaQuery.removePadding(
          context: context,
          removeTop: true,
          removeBottom: true,
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: passengerTicketInoList.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final PassengerTicketInfo paxInfoListObj =
                  passengerTicketInoList[index];
              final PaxInfoList? paxInfoObj = paxInfoListObj.allPaxInfoList;
              final PersonName? personName = paxInfoObj?.personName;
              final String namePrefix = personName?.namePrefix ?? '';
              final isContainsDot = namePrefix.endsWith('.');
              final String passengerName = isContainsDot
                  ? '$namePrefix'
                      ' ${personName?.firstName ?? ''}'
                      ' ${personName?.lastName ?? ''}'
                  : '${personName?.namePrefix ?? ''}.'
                      ' ${personName?.firstName ?? ''}'
                      ' ${personName?.lastName ?? ''}';
              return PassengerDetail(
                passengerName: passengerName,
                passengerType: FlightUtils.getTravellerType(
                  paxInfoObj?.passengerTypeCode ?? '',
                ),
                ticketNo: ((paxInfoListObj.allTicketInfo?.length ?? 0) > 0)
                    ? paxInfoListObj.allTicketInfo?.first.ticketNumber ?? ''
                    : '',
                status: bookingConfirmationScreenType ==
                            BookingConfirmationScreenType.flightBookingOrder ||
                        bookingConfirmationScreenType ==
                            BookingConfirmationScreenType
                                .flightBookingConfirmation
                    ? getBookingStatus(
                        paxInfoListObj.allTicketInfo ?? [],
                        orderStatus,
                      )
                    : null,
                isInternational: isInternational,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: context.k_20,
              );
            },
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
            top: context.k_16,
          ),
        ),
      ],
    );
  }

//to get passenger ticket info status
  String getBookingStatus(
    List<TicketInfo?> ticketInfo,
    String? orderStatus,
  ) {
    String bookingStatus = 'H';
    if (orderStatus?.toUpperCase() == 'FAILED') {
      bookingStatus = BookingStatusType.F.name;
    } else if (orderStatus?.toUpperCase() == 'CANCELLED') {
      bookingStatus = BookingStatusType.Q.name;
    } else if (orderStatus?.toUpperCase() == 'PARTIALLY_CANCELLED') {
      bookingStatus = BookingStatusType.PQ.name;
    } else {
      if (ticketInfo.isNotEmpty) {
        for (final ticket in ticketInfo) {
          if (ticket?.bookingStatus == BookingStatusType.Q.name) {
            bookingStatus = ticket?.bookingStatus ?? '';
            break;
          } else if (ticket?.bookingStatus == BookingStatusType.K.name) {
            bookingStatus = BookingStatusType.Q.name;
            break;
          } else if (ticket?.bookingStatus == BookingStatusType.H.name ||
              ticket?.bookingStatus == 'PI') {
            bookingStatus = orderStatus?.toUpperCase() == 'CONFIRMED'
                ? BookingStatusType.P.name
                : BookingStatusType.H.name;
            break;
          } else if (ticket?.bookingStatus == BookingStatusType.F.name) {
            bookingStatus = BookingStatusType.F.name;
            break;
          } else {
            bookingStatus = BookingStatusType.P.name;
          }
        }
      }
    }
    return bookingStatus;
  }
}
