import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/common_order_detail_base_response.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/pranaam_detail.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/ga_analytics/pranaam_reschedule_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/reschedule/widgets/reschedule_bottom_bar.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/reschedule/widgets/select_reschedule_details.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/reschedule/widgets/trip_info_card.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/booking_and_cancellation_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_reschedule_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/service_booking/service_booking_details.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class PranaamReschedulePage extends StatefulWidget {
  final CommonOrderDetailBaseResponse bookingDetailsResponseModel;

  const PranaamReschedulePage({
    Key? key,
    required this.bookingDetailsResponseModel,
  }) : super(key: key);

  @override
  State<PranaamReschedulePage> createState() => _PranaamReschedulePageState();
}

class _PranaamReschedulePageState extends State<PranaamReschedulePage> {
  PranaamRescheduleStateManagement? pranaamRescheduleStateManagement;

  @override
  void initState() {
    pranaamRescheduleStateManagement =
        context.read<PranaamRescheduleStateManagement>()
          ..initData(widget.bookingDetailsResponseModel)
          ..initControllersForRoundTrip(context)
          ..getAllPassengerId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tripDetails = widget
        .bookingDetailsResponseModel.orderDetail?.pranaamDetail?.tripDetails;
    final orderDetails =
        widget.bookingDetailsResponseModel.orderDetail?.pranaamDetail;
    return Scaffold(
      bottomNavigationBar: ValueListenableBuilder<bool>(
        valueListenable: context
            .read<PranaamRescheduleStateManagement>()
            .isRescheduleEnabled,
        builder: (context, bool value, _) {
          return RescheduleBottomBar(
            isFreeReschedule: getReschedulePrice(
                  orderDetails?.packageDetail?.rescheduleCharges ??
                      const RescheduleCharges(),
                ) ==
                0,
            onTap: value
                ? () => {
                      navigateToScreenUsingNamedRouteWithArguments(
                        context,
                        pranaamRescheduleReviewPage,
                        argumentObject: widget.bookingDetailsResponseModel,
                      ),
                      PranaamRescheduleGaAnalytics().rescheduleEvent(
                        ClickEvents.book_pranaam_reschedule_submit,
                        context.read<BookingAndCancellationState>(),
                        pranaamRescheduleStateManagement:
                            context.read<PranaamRescheduleStateManagement>(),
                      ),
                    }
                : null,
            reschedulePrice:
                pranaamRescheduleStateManagement?.getTotalRescheduleCharges(
                      orderDetails?.packageDetail?.rescheduleCharges ??
                          const RescheduleCharges(),
                    ) ??
                    0,
          );
        },
      ),
      appBar: AppBar(
        title: Text(
          'Reschedule',
          style: ADTextStyle700.size22,
        ),
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: context.k_16),
        children: [
          TripInfoCard(
            pranaamDetail:
                widget.bookingDetailsResponseModel.orderDetail?.pranaamDetail,
            tripDetails: widget.bookingDetailsResponseModel.orderDetail
                ?.pranaamDetail?.tripDetails,
          ),
          Text(
            'Update details to reschedule Pranaam services',
            style: ADTextStyle700.size20,
          ).paddingBySide(bottom: context.k_30, top: context.k_14),
          SelectRescheduleDetails(
            pranaamDetail: orderDetails,
            isRoundTrip: false,
            showNote: tripDetails?.serviceTypeId != id_3 &&
                tripDetails?.serviceTypeId != id_2,
          ),
          ADSizedBox(
            height: context.k_40,
          ),
          if (tripDetails?.serviceTypeId == id_3 ||
              tripDetails?.serviceTypeId == id_2)
            SelectRescheduleDetails(
              pranaamDetail: orderDetails,
              isRoundTrip: true,
              showNote: true,
            ),
          ADSizedBox(
            height: context.k_32,
          ),
        ],
      ),
    );
  }
}
