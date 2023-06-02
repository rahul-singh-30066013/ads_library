import 'package:adani_airport_mobile/modules/common_order_detail/common_order_detail_base_response.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/pranaam_detail.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/reschedule/widgets/reschedule_bottom_bar.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/reschedule/widgets/reschedule_review_info.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/reschedule/widgets/trip_info_card.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_reschedule_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/service_booking/service_booking_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class PranaamRescheduleReviewPage extends StatelessWidget {
  const PranaamRescheduleReviewPage({
    Key? key,
    required this.bookingDetailsResponseModel,
  }) : super(key: key);
  final CommonOrderDetailBaseResponse bookingDetailsResponseModel;

  @override
  Widget build(BuildContext context) {
    final tripDetails =
        bookingDetailsResponseModel.orderDetail?.pranaamDetail?.tripDetails;
    final orderDetails = bookingDetailsResponseModel.orderDetail?.pranaamDetail;
    final bool isRoundTrip = tripDetails?.serviceTypeId == id_3 ||
        tripDetails?.serviceTypeId == id_2;
    final PranaamRescheduleStateManagement pranaamRescheduleStateManagement =
        context.read<PranaamRescheduleStateManagement>();
    return Scaffold(
      bottomNavigationBar: RescheduleBottomBar(
        isFreeReschedule: getReschedulePrice(
              orderDetails?.packageDetail?.rescheduleCharges ??
                  const RescheduleCharges(),
            ) ==
            0,
        buttonString: getReschedulePrice(
                  orderDetails?.packageDetail?.rescheduleCharges ??
                      const RescheduleCharges(),
                ) ==
                0
            ? 'Confirm'
            : 'Continue',
        onTap: () => {
          pranaamRescheduleStateManagement.rescheduleBooking(
            context,
            isRoundTrip: isRoundTrip,
            isFree: getReschedulePrice(
                  orderDetails?.packageDetail?.rescheduleCharges ??
                      const RescheduleCharges(),
                ) ==
                0,
          ),
        },
        reschedulePrice:
            pranaamRescheduleStateManagement.getTotalRescheduleCharges(
          orderDetails?.packageDetail?.rescheduleCharges ??
              const RescheduleCharges(),
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Review & Details',
          style: ADTextStyle700.size22,
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ADSizedBox(
              height: context.k_10,
            ),
            Text(
              'Travel details for rescheduled Pranaam \n services',
              style: ADTextStyle400.size16,
            ),
            ADSizedBox(
              height: context.k_4,
            ),
            TripInfoCard(
              pranaamDetail:
                  bookingDetailsResponseModel.orderDetail?.pranaamDetail,
              tripDetails: bookingDetailsResponseModel
                  .orderDetail?.pranaamDetail?.tripDetails,
              isForReview: true,
            ),
            ADSizedBox(
              height: context.k_12,
            ),
            RescheduleReviewInfo(
              pranaamDetail:
                  bookingDetailsResponseModel.orderDetail?.pranaamDetail,
              isRoundTrip: false,
            ),
            ADSizedBox(
              height: context.k_20,
            ),
            if (isRoundTrip)
              Divider(
                height: 1,
                color: context.adColors.tileBorderColor,
              ),
            ADSizedBox(
              height: context.k_40,
            ),
            if (isRoundTrip)
              RescheduleReviewInfo(
                pranaamDetail:
                    bookingDetailsResponseModel.orderDetail?.pranaamDetail,
                isRoundTrip: isRoundTrip,
              ),
            if (isRoundTrip)
              ADSizedBox(
                height: context.k_60,
              ),
            Text(
              'Note: Reschedule (full/partial) can only be done once.',
              style: ADTextStyle400.size12
                  .setTextColor(context.adColors.greyTextColor),
            ).paddingBySide(left: context.k_4),
            ADSizedBox(
              height: context.k_30,
            ),
          ],
        ).paddingBySide(right: context.k_16, left: context.k_16),
      ),
    );
  }
}
