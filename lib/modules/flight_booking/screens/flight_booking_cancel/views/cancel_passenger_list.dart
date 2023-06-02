/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/itinerary_contact_detail.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/pax_info_list.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/display_model/flight_review_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_search/header_dialog.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class CancelPassengerList extends StatelessWidget {
  final PassengerListInJourney passengerListJourney;
  final bool? isEnableZeroCancellation;
  final bool? isInfantCancelOnly;

  const CancelPassengerList({
    required this.passengerListJourney,
    this.isEnableZeroCancellation,
    this.isInfantCancelOnly,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final siteCore = context.read<SiteCoreStateManagement>();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  siteCore
                          .airportCityMap[
                              passengerListJourney.fromLocation?.locationCode]
                          ?.cityName ??
                      passengerListJourney.fromLocation?.city ??
                      '',
                  style: ADTextStyle700.size16.setTextColor(
                    context.adColors.blackTextColor,
                  ),
                ),
                SvgPicture.asset(
                  'lib/assets/images/svg/icons/flight/one way.svg',
                  height: context.k_8,
                  color: context.adColors.greyCircleColor,
                ).paddingAllSide(
                  context.k_4,
                ),
                Text(
                  siteCore
                          .airportCityMap[
                              passengerListJourney.toLocation?.locationCode]
                          ?.cityName ??
                      passengerListJourney.toLocation?.city ??
                      '',
                  style: ADTextStyle700.size16.setTextColor(
                    context.adColors.blackTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            if ((isEnableZeroCancellation ?? false) &&
                !(isInfantCancelOnly ?? false))
              Row(
                children: [
                  SvgPicture.asset(
                    SvgAssets.zeroCancellationIcon,
                    height: context.k_20,
                    width: context.k_22,
                  ).paddingBySide(
                    right: context.k_6,
                  ),
                  Text(
                    'zero_cancellation_next_line'.localize(context),
                    style: ADTextStyle400.size10.setTextColor(
                      context.adColors.darkGreyTextColor,
                    ),
                  ),
                ],
              ),
          ],
        ),
        ADSizedBox(
          height: context.k_10,
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: passengerListJourney.cancellablePaxInfoList?.length ?? 0,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final PassengerTicketInfo? passengerTktInfo =
                passengerListJourney.cancellablePaxInfoList?[index];
            final PaxInfoList paxInfoListItem =
                passengerTktInfo?.cancellablePaxInfoList ?? PaxInfoList();
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
            return paxInfoListItem.status == true
                ? PassengerDetail(
                    passengerName: passengerName,
                    passengerType: FlightUtils.getTravellerType(
                      paxInfoListItem.passengerTypeCode ?? '',
                    ),
                  ).paddingBySide(
                    bottom: context.k_8,
                  )
                : const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
