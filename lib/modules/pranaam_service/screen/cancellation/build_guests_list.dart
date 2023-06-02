/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/common_order_detail/pranaam_detail.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/booking_and_cancellation_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/service_booking/service_booking_details.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class BuildGuestsList extends StatelessWidget {
  final PranaamDetail pranaamDetail;
  final bool isRoundTrip;
  final SiteCoreStateManagement? siteCoreStateManagement;
  const BuildGuestsList({
    Key? key,
    required this.pranaamDetail,
    required this.isRoundTrip,
    required this.siteCoreStateManagement,
  }) : super(key: key);

  // List<TravellersModel>? travellersModel = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (pranaamDetail.tripDetails?.serviceTypeId == id_3)
          Row(
            children: [
              Text(
                getCityName(
                  isRoundTrip
                      ? pranaamDetail.roundTripDetail?.originAirport ?? ''
                      : pranaamDetail.tripDetails?.originAirport ?? '',
                  context.read<SiteCoreStateManagement>(),
                ),
                style: ADTextStyle500.size16
                    .setTextColor(context.adColors.blackTextColor),
              ),
              Icon(
                Icons.arrow_forward,
                color: context.adColors.blackTextColor,
                size: context.k_18,
              ).paddingBySide(left: context.k_8, right: context.k_8),
              Text(
                getCityName(
                  isRoundTrip
                      ? pranaamDetail.roundTripDetail?.destinationAirport ?? ''
                      : pranaamDetail.tripDetails?.destinationAirport ?? '',
                  context.read<SiteCoreStateManagement>(),
                ),
                style: ADTextStyle500.size16
                    .setTextColor(context.adColors.blackTextColor),
              ),
            ],
          )
        else
          Text(
            'Guests',
            style: ADTextStyle500.size18
                .setTextColor(context.adColors.blackTextColor),
          ),
        ADSizedBox(
          height: context.k_16,
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: pranaamDetail.travelers?.length,
          itemBuilder: (context, index) {
            return Consumer<BookingAndCancellationState>(
              builder: (context, value, _) => CheckboxListTile(
                side: BorderSide(
                  color: context.adColors.black,
                ),
                checkboxShape: RoundedRectangleBorder(
                  side: BorderSide(color: context.adColors.black),
                  borderRadius: BorderRadius.circular(context.k_4),
                ),
                visualDensity: const VisualDensity(horizontal: -4),
                dense: true,
                contentPadding: EdgeInsets.zero,
                controlAffinity: ListTileControlAffinity.leading,
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${getSalutationsTitleById(
                        pranaamDetail.travelers?[index].salutationId
                                .toString() ??
                            '',
                        siteCoreStateManagement?.salutation ?? [],
                      )} ${pranaamDetail.travelers?[index].firstName} '
                      '${pranaamDetail.travelers?[index].lastName}',
                      style: ADTextStyle400.size16
                          .setTextColor(context.adColors.blackTextColor),
                    ),
                    ADSizedBox(
                      width: context.k_8,
                    ),
                    Text(
                      ServiceBookingDetails.getInstance().getPassengerType[
                              pranaamDetail
                                  .travelers?[index].passengerTypeId] ??
                          '',
                      style: ADTextStyle400.size12
                          .setTextColor(context.adColors.greyTextColor),
                    ),
                  ],
                ),
                activeColor: context.adColors.black,
                checkColor: context.adColors.whiteTextColor,
                selected: value.guestsSelected
                    .contains(pranaamDetail.travelers?[index]),
                value: value.guestsSelected
                    .contains(pranaamDetail.travelers?[index]),
                onChanged: (context
                            .read<BookingAndCancellationState>()
                            .bookingDetailsResponse
                            ?.orderDetail
                            ?.pranaamDetail
                            ?.packageDetail
                            ?.isGroupPackage ??
                        false)
                    ? null
                    : (bool? checkBoxValue) => {
                          context
                              .read<BookingAndCancellationState>()
                              .toggleGuestSelection(
                                pranaamDetail.travelers?[index] ??
                                    const Traveler(),
                                context,
                              ),
                          // if (value == true && (travellersModel ?? []).isNotEmpty)
                          //   travellersModel?.add(booking.travelers[index])
                          // else if (value == false && (travellersModel ?? []).isNotEmpty)
                          //   travellersModel?.removeAt(
                          //     index,
                          //   )
                          // else if (value == true && (travellersModel ?? []).isEmpty)
                          //   {
                          //     travellersModel?.add(booking.travelers[index]),
                          //   },
                          // if((travellersModel ?? []).contains(booking.travelers[index])){
                          //   (travellersModel ?? []).remove(booking.travelers[index]),
                          // }else{
                          //   (travellersModel ?? []).add(booking.travelers[index]),
                          // },
                          adLog(
                            'after ${value.guestsSelected.length}',
                          ),
                          adLog(
                            'list ${value.guestsSelected}',
                          ),
                        },
              ),
            );
          },
        ),
      ],
    );
  }
}
