/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/screens/components/header_dialog.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/common_order_detail_base_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///This will show the user's information.

class UpdatesSentToView extends StatelessWidget {
  const UpdatesSentToView({
    Key? key,
    this.bookingDetailsResponseModel,
    this.pranaamUpdateSent,
  }) : super(key: key);
  final CommonOrderDetailBaseResponse? bookingDetailsResponseModel;
  final String? pranaamUpdateSent;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderText(title: pranaamUpdateSent ?? 'updates_sent_to').paddingBySide(
          bottom: context.k_20,
        ),
        Row(
          children: [
            Icon(
              Icons.call_outlined,
              size: context.k_20,
            ),
            ADSizedBox(
              width: context.k_12,
            ),
            Text(
              getPhoneNumberOnTheBasisOfBookingType(
                bookingType: bookingDetailsResponseModel
                        ?.orderDetail?.pranaamDetail?.pranaamBookingType ??
                    '',
                bookingDetailsResponseModel: bookingDetailsResponseModel,
              ),
              style: ADTextStyle400.size16.setTextColor(
                context.adColors.blackTextColor,
              ),
            ),
          ],
        ),
        ADSizedBox(
          height: context.k_10,
        ),
        Row(
          children: [
            Icon(
              Icons.mail_outline_sharp,
              size: context.k_20,
            ),
            ADSizedBox(
              width: context.k_12,
            ),
            Text(
              getEmailOnTheBasisOfBookingType(
                bookingType: bookingDetailsResponseModel
                        ?.orderDetail?.pranaamDetail?.pranaamBookingType ??
                    '',
                bookingDetailsResponseModel: bookingDetailsResponseModel,
              ),
              style: ADTextStyle400.size16.setTextColor(
                context.adColors.blackTextColor,
              ),
            ),
          ],
        ),
      ],
    ).paddingBySide(left: context.k_16, right: context.k_16);
  }
}
