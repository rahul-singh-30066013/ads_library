/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/common_order_detail/common_order_detail_base_response.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/booking_and_cancellation_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/service_booking/service_booking_details.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///This will show the guest details.
double cancelWidth = 80;
double cancelHeight = 22;
double containerOpacity = 0.1;

class GuestDetailsViewOnMyOrders extends StatelessWidget {
  const GuestDetailsViewOnMyOrders({
    Key? key,
    this.bookingDetailsResponseModel,
    this.siteCoreStateManagement,
    required this.getBookingDetailsState,
  }) : super(key: key);
  final CommonOrderDetailBaseResponse? bookingDetailsResponseModel;
  final SiteCoreStateManagement? siteCoreStateManagement;
  final BookingAndCancellationState getBookingDetailsState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.k_16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'guests'.localize(context),
            style: ADTextStyle700.size22,
          ),
          ADSizedBox(
            height: context.k_10,
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: bookingDetailsResponseModel
                ?.orderDetail?.pranaamDetail?.travelers?.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  vertical: context.k_10,
                ),
                child: Row(
                  children: [
                    Text(
                      '${getSalutationsTitleById(
                        bookingDetailsResponseModel?.orderDetail?.pranaamDetail
                                ?.travelers?[index].salutationId
                                .toString() ??
                            '0',
                        siteCoreStateManagement?.salutation ?? [],
                      )} ${bookingDetailsResponseModel?.orderDetail?.pranaamDetail?.travelers?[index].firstName} '
                      '${bookingDetailsResponseModel?.orderDetail?.pranaamDetail?.travelers?[index].lastName}',
                      style: ADTextStyle500.size16.setTextColor(
                        context.adColors.blackTextColor,
                      ),
                    ),
                    ADSizedBox(
                      width: context.k_6,
                    ),
                    Text(
                      ServiceBookingDetails.getInstance().getPassengerType[
                              bookingDetailsResponseModel
                                  ?.orderDetail
                                  ?.pranaamDetail
                                  ?.travelers?[index]
                                  .passengerTypeId] ??
                          '',
                      style: ADTextStyle400.size12.setTextColor(
                        context.adColors.greyTextColor,
                      ),
                    ),
                    const Spacer(),
                    ValueListenableBuilder(
                      valueListenable:
                          getBookingDetailsState.bookingCancelledStatus,
                      builder: (BuildContext context, bool bookStatus, child) {
                        return bookStatus
                            ? Container(
                                width: cancelWidth,
                                height: cancelHeight,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  color: context.adColors.lightRedColor
                                      .withOpacity(containerOpacity),
                                ),
                                child: Center(
                                  child: Text(
                                    'cancelled_pranaam'.localize(context),
                                    style: ADTextStyle700.size10.setTextColor(
                                      context.adColors.lightRedColor,
                                    ),
                                  ),
                                ),
                              )
                            : const ADSizedBox();
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
