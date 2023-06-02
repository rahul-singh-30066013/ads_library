/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/service_booking_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/service_booking/service_booking_details.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

double circleRadius = 8;
Color iconColor = const Color(0xffbbbbbb);
Color borderColor = const Color(0xffeeeeee);
Color textColor = const Color(0xff666666);

class PackageDetails extends StatefulWidget {
  const PackageDetails({Key? key, required this.value}) : super(key: key);
  final ServiceBookingModel value;

  @override
  State<PackageDetails> createState() => _PackageDetailsState();
}

class _PackageDetailsState extends State<PackageDetails> {
  PranaamAppDataStateManagement? pranaamAppDataStateManagement;
  int travellerCount = 1;
  int totalNumberGuest = 1;

  @override
  void initState() {
    pranaamAppDataStateManagement =
        context.read<PranaamAppDataStateManagement>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    travellerCount = pranaamAppDataStateManagement
            ?.serviceBookingData.travellers?.totalSeatTravellers ??
        1;

    totalNumberGuest = pranaamAppDataStateManagement
            ?.serviceBookingData.travellers?.totalTravellers ??
        1;
    return GestureDetector(
      onTap: () => navigate(context),
      child: Container(
        margin: EdgeInsets.only(
          left: context.k_12,
          right: context.k_12,
          top: context.k_22,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: context.k_20,
          vertical: context.k_18,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(context.k_6),
          ),
          border: Border.all(
            color: borderColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  pranaamAppDataStateManagement
                          ?.serviceBookingData.serviceAirport ??
                      '',
                  style: ADTextStyle700.size18,
                ),
                ADSizedBox(
                  width: context.k_10,
                ),
                Text(
                  travellerCount > 1
                      ? '($totalNumberGuest ${'guests'.localize(context)})'
                      : '($totalNumberGuest ${'guest'.localize(context)}' ')',
                  style: ADTextStyle500.size14.setTextColor(
                    context.adColors.blackTextColor,
                  ),
                ),
                const Spacer(),
                Text(
                  'edit_new'.localize(context),
                  style: ADTextStyle500.size16
                      .setTextColor(
                        context.adColors.blackTextColor,
                      )
                      .copyWith(
                        decoration: TextDecoration.underline,
                      ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            FittedBox(
              child: Row(
                children: [
                  Text(
                    widget.value.selectedService?.serviceId == id_3
                        ? 'Departure'
                        : '${widget.value.selectedService?.serviceTitle}',
                    style: ADTextStyle400.size14.setTextColor(
                      textColor,
                    ),
                  ),
                  SizedBox(
                    width: context.k_8,
                  ),
                  Icon(
                    Icons.circle,
                    size: circleRadius,
                    color: iconColor,
                  ),
                  SizedBox(
                    width: context.k_8,
                  ),
                  Text(
                    '${formatCouponDate(widget.value.selectedFlightDetailModel?.serviceDateTime ?? '')}, ${reviewArrivalTime(widget.value.selectedFlightDetailModel?.serviceTime ?? '')}',
                    style: ADTextStyle400.size14.setTextColor(textColor),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    width: context.k_8,
                  ),
                  Icon(
                    Icons.circle,
                    size: circleRadius,
                    color: iconColor,
                  ),
                  SizedBox(
                    width: context.k_8,
                  ),
                  Text(
                    '${widget.value.selectedFlightDetailModel?.flightFinalNumber}',
                    style: ADTextStyle400.size14.setTextColor(textColor),
                  ),
                ],
              ),
            ),
            if (widget.value.selectedService?.serviceId == id_3)
              ADSizedBox(
                height: context.k_8,
              ),
            if (widget.value.selectedService?.serviceId == id_3)
              Row(
                children: [
                  Text(
                    'Arrival',
                    style: ADTextStyle400.size14.setTextColor(textColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    width: context.k_8,
                  ),
                  Icon(
                    Icons.circle,
                    size: circleRadius,
                    color: iconColor,
                  ),
                  SizedBox(
                    width: context.k_8,
                  ),
                  Text(
                    '${widget.value.roundTripTransitDate?.dayMonth} ${widget.value.roundTripTransitDate?.dateOfJourney.year}, ${reviewArrivalTime(widget.value.roundTripTransitFlights?.flightTime ?? '')}',
                    style: ADTextStyle400.size14.setTextColor(textColor),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    width: context.k_8,
                  ),
                  Icon(
                    Icons.circle,
                    size: circleRadius,
                    color: iconColor,
                  ),
                  SizedBox(
                    width: context.k_8,
                  ),
                  Text(
                    '${widget.value.roundTripTransitFlights?.flightFinalNumber}',
                    style: ADTextStyle400.size14.setTextColor(textColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              )
            else
              const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  void navigate(
    BuildContext context,
  ) {
    pranaamAppDataStateManagement?.isAnimationLoading = false;
    pranaamAppDataStateManagement?.notifyListeners();

    adLog('edit Click ${pranaamAppDataStateManagement?.isFormFilled}');
    // pranaamAppDataStateManagement?.editForm(value: true);
    navigateToScreenUsingNamedRouteWithArguments(
      context,
      serviceBookingScreen,
      argumentObject: [true, false],
    );
  }
}
