/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/itinerary_contact_detail.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/pax_info_list.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_search/header_dialog.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/review/views/ad_row.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/review_screen_type.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///this class will used to show traveller list for current journey
class ShowTravellersForCurrentItineraryView extends StatelessWidget {
  const ShowTravellersForCurrentItineraryView({
    Key? key,
    required this.reviewScreenType,
    required this.travellerList,
    required this.isInternational,
  }) : super(key: key);
  final ReviewScreenType reviewScreenType;
  final List<PaxInfoList> travellerList;
  final bool isInternational;

  @override
  Widget build(BuildContext context) {
    const double fontSize15 = 15;
    return reviewScreenType == ReviewScreenType.flightPayment
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ADRow(
                leftText: travellerList.length > 1
                    ? 'travellers'.localize(context)
                    : 'traveller'.localize(context),
                rightText: '',
                leftTextStyle: ADTextStyle600.size14
                    .setTextColor(context.adColors.blackTextColor)
                    .copyWith(fontSize: fontSize15),
                rightTextStyle: ADTextStyle700.size16,
              ).paddingBySide(top: context.k_8),
              ListView.separated(
                shrinkWrap: true,
                itemCount: travellerList.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final PaxInfoList paxInfoListItem = travellerList[index];
                  final PersonName? personName = paxInfoListItem.personName;
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
                    ticketNo:
                        paxInfoListItem.ticketInfo?.first.ticketNumber ?? '',
                    passengerName: passengerName,
                    passengerType: FlightUtils.getTravellerType(
                      paxInfoListItem.passengerTypeCode ?? '',
                    ),
                    isInternational: isInternational,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: context.k_20,
                  );
                },
              ).paddingBySide(
                top: context.k_20,
              ),
              if (reviewScreenType == ReviewScreenType.flightPayment)
                ADSizedBox(
                  height: context.k_30,
                ),
              if (reviewScreenType == ReviewScreenType.flightList)
                Divider(
                  thickness: 1.sp,
                  height: context.k_30,
                ),
            ],
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
          )
        : const SizedBox.shrink();
  }
}
