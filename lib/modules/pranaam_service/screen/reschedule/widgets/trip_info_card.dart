import 'package:adani_airport_mobile/modules/common_order_detail/pranaam_detail.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/package_service/package_details.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/service_booking/service_booking_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class TripInfoCard extends StatelessWidget {
  final bool isForReview;
  const TripInfoCard({
    Key? key,
    required this.tripDetails,
    required this.pranaamDetail,
    this.isForReview = false,
  }) : super(key: key);
  final TripDetails? tripDetails;
  final PranaamDetail? pranaamDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        vertical: context.k_16,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: context.k_24,
        vertical: context.k_28,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.k_8),
        color: const Color(0xfff4f9ff),
      ),
      child: isForReview
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getCityName(
                    tripDetails?.serviceAirport ?? '',
                    context.read<SiteCoreStateManagement>(),
                  ),
                  style: ADTextStyle700.size22,
                ).paddingBySide(bottom: context.k_10),
                Wrap(
                  children: [
                    Text(
                      tripDetails?.serviceTypeId == id_3
                          ? 'Departure (${ServiceBookingDetails.getInstance().getTravelSectorName(tripDetails?.travelSectorId ?? 0)})'
                          : '${ServiceBookingDetails.getInstance().getServiceName(tripDetails?.serviceTypeId ?? 0)} (${ServiceBookingDetails.getInstance().getTravelSectorName(tripDetails?.travelSectorId ?? 0)})',
                      style: ADTextStyle400.size18
                          .setTextColor(context.adColors.blackTextColor),
                    ).paddingBySide(right: context.k_12),
                  ],
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getCityName(
                    tripDetails?.serviceAirport ?? '',
                    context.read<SiteCoreStateManagement>(),
                  ),
                  style: ADTextStyle700.size22,
                ).paddingBySide(bottom: context.k_10),
                Wrap(
                  children: [
                    Text(
                      tripDetails?.serviceTypeId == id_3
                          ? 'Departure (${ServiceBookingDetails.getInstance().getTravelSectorName(tripDetails?.travelSectorId ?? 0)})'
                          : '${ServiceBookingDetails.getInstance().getServiceName(tripDetails?.serviceTypeId ?? 0)} (${ServiceBookingDetails.getInstance().getTravelSectorName(tripDetails?.travelSectorId ?? 0)})',
                      style: ADTextStyle400.size18
                          .setTextColor(context.adColors.blackTextColor),
                    ).paddingBySide(right: context.k_12),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.circle,
                          size: circleRadius,
                          color: iconColor,
                        ),
                        Text(
                          tripDetails?.flightName ?? '',
                          style: ADTextStyle400.size16
                              .setTextColor(context.adColors.blackTextColor),
                        ).paddingBySide(left: context.k_12),
                      ],
                    ),
                  ],
                ).paddingBySide(bottom: context.k_10),
                Text(
                  '${formatDateTimeFlightServiceDate(
                    tripDetails?.serviceDateTime,
                  )}, ${formatDateTimeFlightService12Time(
                    tripDetails?.serviceDateTime,
                  )}',
                  style: ADTextStyle400.size16
                      .setTextColor(context.adColors.blackTextColor),
                ),
                if (tripDetails?.serviceTypeId == id_3)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Arrival (${ServiceBookingDetails.getInstance().getTravelSectorName(tripDetails?.travelSectorId ?? 0)})',
                            style: ADTextStyle400.size18.setTextColor(
                              context.adColors.blackTextColor,
                            ),
                          ).paddingBySide(right: context.k_12),
                          Icon(
                            Icons.circle,
                            size: circleRadius,
                            color: iconColor,
                          ),
                          Text(
                            pranaamDetail?.roundTripDetail?.flightName ?? '',
                            style: ADTextStyle400.size16.setTextColor(
                              context.adColors.blackTextColor,
                            ),
                          ).paddingBySide(left: context.k_12),
                        ],
                      ).paddingBySide(bottom: context.k_10),
                      Text(
                        '${formatDateTimeFlightServiceDate(
                          pranaamDetail?.roundTripDetail?.serviceDateTime,
                        )} , ${formatDateTimeFlightService12Time(
                          pranaamDetail?.roundTripDetail?.serviceDateTime,
                        )}',
                        style: ADTextStyle400.size16
                            .setTextColor(context.adColors.blackTextColor),
                      ),
                    ],
                  ).paddingBySide(top: context.k_10)
                else
                  const SizedBox.shrink(),
              ],
            ),
    );
  }
}
