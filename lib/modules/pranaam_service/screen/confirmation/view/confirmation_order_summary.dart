/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/common_order_detail/common_order_detail_base_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/confirmation/view/product_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class ConfirmationOrderSummary extends StatelessWidget {
  const ConfirmationOrderSummary({
    Key? key,
    required this.bookingDetailsResponseModel,
  }) : super(key: key);
  final CommonOrderDetailBaseResponse bookingDetailsResponseModel;
  @override
  Widget build(BuildContext context) {
    final bool isRescheduleBooking = isReschedule(
      bookingDetailsResponseModel.orderDetail?.pranaamDetail?.pranaamBookingType
              ?.toLowerCase() ??
          '',
    );
    final standAloneImage = bookingDetailsResponseModel
        .orderDetail?.pranaamDetail?.standaloneProductDetails?.packageImageUrl;
    final imageURL = bookingDetailsResponseModel
        .orderDetail?.pranaamDetail?.packageDetail?.packageImageUrl;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.k_16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ADSizedBox(
            height: context.k_20,
          ),
          Text(
            'order_summary'.localize(context),
            style: ADTextStyle700.size22,
          ),
          ADSizedBox(
            height: context.k_20,
          ),
          ProductView(
            standAloneImage: ((standAloneImage ?? '').isNotEmpty)
                ? standAloneImage ?? ''
                : 'lib/assets/images/pranaam/porter2.png',
            isAddOn: false,
            image: imageURL != '' && imageURL != null
                ? imageURL
                : 'lib/assets/images/pranaam/pranaam_logo.png',
            packagePrice: isRescheduleBooking
                ? bookingDetailsResponseModel.orderDetail?.pranaamDetail
                        ?.packageDetail?.oldPricingInfo?.totalFare?.amount
                        .toString() ??
                    ''
                : bookingDetailsResponseModel.orderDetail?.pranaamDetail
                        ?.packageDetail?.pricingInfo?.totalFare?.amount
                        .toString() ??
                    '',
            packageType: bookingDetailsResponseModel
                    .orderDetail?.pranaamDetail?.packageDetail?.name ??
                '',
            quantity: '1',
          ),
          if (!isUpgradeBooking(
            bookingDetailsResponseModel
                    .orderDetail?.pranaamDetail?.pranaamBookingType ??
                '',
          ))
            ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: bookingDetailsResponseModel
                  .orderDetail?.pranaamDetail?.addOnServices?.length,
              itemBuilder: (context, index) {
                final addOnData = bookingDetailsResponseModel
                    .orderDetail?.pranaamDetail?.addOnServices?[index];
                return ProductView(
                  isAddOn: true,
                  image: (addOnData?.addOnImage ?? '') != ''
                      ? addOnData?.addOnImage ?? ''
                      : 'lib/assets/images/pranaam/porter2.png',
                  packagePrice: addOnData?.totalPrice?.toString() ?? '0',
                  packageType: addOnData?.serviceName ?? '',
                  quantity: addOnData?.quantity.toString() ?? '',
                );
              },
            ),
        ],
      ),
    );
  }
}
