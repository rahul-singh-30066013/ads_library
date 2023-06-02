import 'package:adani_airport_mobile/modules/common_order_detail/pranaam_detail.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_reschedule_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/service_booking/service_booking_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class RescheduleReviewInfo extends StatelessWidget {
  const RescheduleReviewInfo({
    Key? key,
    required this.pranaamDetail,
    required this.isRoundTrip,
  }) : super(key: key);
  final PranaamDetail? pranaamDetail;
  final bool isRoundTrip;

  @override
  Widget build(BuildContext context) {
    final SiteCoreStateManagement siteCoreStateManagement =
        context.read<SiteCoreStateManagement>();
    final PranaamRescheduleStateManagement pranaamRescheduleStateManagement =
        context.read<PranaamRescheduleStateManagement>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              getCityName(
                isRoundTrip
                    ? pranaamRescheduleStateManagement
                            .getOriginAirportCodeForTransitAndRoundTrip(
                          pranaamDetail,
                        ) ??
                        ''
                    : pranaamDetail?.tripDetails?.originAirport ?? '',
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
                    ? pranaamRescheduleStateManagement
                            .getDestAirportCodeForTransitAndRoundTrip(
                          context,
                          pranaamDetail,
                        ) ??
                        ''
                    : pranaamDetail?.tripDetails?.destinationAirport ?? '',
                context.read<SiteCoreStateManagement>(),
              ),
              style: ADTextStyle500.size16
                  .setTextColor(context.adColors.blackTextColor),
            ),
          ],
        ),
        ADSizedBox(
          height: context.k_20,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Date',
                  style: ADTextStyle400.size14,
                ),
                ADSizedBox(
                  height: context.k_8,
                ),
                Text(
                  isRoundTrip
                      ? pranaamRescheduleStateManagement.selectedDepartureDate
                      : pranaamRescheduleStateManagement.selectedArrivalDate,
                  // formatFlightServiceDate(
                  //   isRoundTrip
                  //       ? booking.roundTripDetail.serviceDateTime
                  //       : booking.tripDetail.serviceDateTime,
                  // ),
                  style: ADTextStyle500.size16,
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Flight Number',
                  style: ADTextStyle400.size14,
                ),
                ADSizedBox(
                  height: context.k_8,
                ),
                Text(
                  isRoundTrip
                      ? pranaamRescheduleStateManagement
                          .selectedDepartureFlightNumber
                      : pranaamRescheduleStateManagement
                          .selectedArrivalFlightNumber,
                  // isRoundTrip
                  //     ? booking.roundTripDetail.flightNumber
                  //     : booking.tripDetail.flightNumber,
                  style: ADTextStyle500.size16,
                ),
              ],
            ),
            // ADSizedBox(width: context.k_60 + context.k_30,),
            const Spacer(),
          ],
        ),
        ADSizedBox(
          height: context.k_30,
        ),
        Text(
          'Service time',
          style: ADTextStyle400.size14,
        ),
        ADSizedBox(
          height: context.k_8,
        ),
        Text(
          isRoundTrip
              ? pranaamRescheduleStateManagement.selectedDepartureTime
              : pranaamRescheduleStateManagement.selectedArrivalTime,
          // formatFlightService12Time(
          //   isRoundTrip ?booking.roundTripDetail.serviceDateTime :booking.tripDetail.serviceDateTime,
          // ),
          style: ADTextStyle500.size16.copyWith(color: Colors.black),
        ),
        ADSizedBox(
          height: context.k_32,
        ),
        Text(
          'Guests',
          style: ADTextStyle400.size14,
        ),
        ADSizedBox(
          height: context.k_8,
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: pranaamDetail?.travelers?.length,
          itemBuilder: (context, index) => (pranaamDetail
                      ?.travelers?[index].passengerStatus
                      ?.toLowerCase() !=
                  'cancelled')
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${getSalutationsTitleById(
                        pranaamDetail?.travelers?[index].salutationId
                                .toString() ??
                            '',
                        siteCoreStateManagement.salutation,
                      )} ${pranaamDetail?.travelers?[index].firstName} '
                      '${pranaamDetail?.travelers?[index].lastName}',
                      style: ADTextStyle500.size16
                          .setTextColor(context.adColors.blackTextColor),
                    ),
                    ADSizedBox(
                      width: context.k_8,
                    ),
                    Text(
                      ServiceBookingDetails.getInstance().getPassengerType[
                              pranaamDetail
                                  ?.travelers?[index].passengerTypeId] ??
                          '',
                      style: ADTextStyle400.size12
                          .setTextColor(context.adColors.greyTextColor),
                    ),
                  ],
                ).paddingBySide(bottom: context.k_20)
              : const SizedBox(),
        ),
      ],
    );
  }
}
