/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/common_order_detail/common_order_detail_base_response.dart';
import 'package:adani_airport_mobile/modules/duty_free/screen_helper/automation_keys/duty_free_order_confirmation_automation_keys.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/order_confirmation/views/generate_content_row.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class OrderConfirmationHeader extends StatelessWidget {
  final CommonOrderDetailBaseResponse item;
  const OrderConfirmationHeader({Key? key, required this.item})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double height80 = 80.sp;
    final double bottomMargin = 124.sp;
    final double positionedTopPadding = -16.sp;
    final double imageWidth = 110.sp;
    final double imageHeight = 110.sp;
    final double qrImageWidth = 142.sp;
    final double qrImageHeight = 142.sp;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottomMargin),
          padding: EdgeInsets.only(
            left: context.k_10,
            right: height80,
            bottom: context.k_10,
          ),
          width: double.infinity,
          color: context.adColors.greenColor,
          child: GenerateContentRow(
            titleText: 'thank_you_for_shopping'.localize(context),
            subTitleText:
                "${'confirmation_email_msg'.localize(context)} ${item.orderDetail?.dutyfreeDetail?.passengerDetail != null ? item.orderDetail?.dutyfreeDetail?.passengerDetail.first.emailId : ''} and ${'sms_sent_to'.localize(context)}",
            mobile:
                '${item.orderDetail?.dutyfreeDetail?.passengerDetail != null ? '${item.orderDetail?.dutyfreeDetail?.passengerDetail.first.countryDialCode}-' : ''}${item.orderDetail?.dutyfreeDetail?.passengerDetail != null ? item.orderDetail?.dutyfreeDetail?.passengerDetail.first.mobile : ''}',
            color: context.adColors.whiteTextColor,
          ),
        ),
        Container(
          padding: EdgeInsets.all(context.k_4),
          decoration: BoxDecoration(
            color: context.adColors.whiteTextColor,
            borderRadius: BorderRadius.circular(context.k_4),
            border: Border.all(
              color: context.adColors.greyCircleColor,
            ),
          ),
          width: qrImageWidth,
          height: qrImageHeight,
          child: QrImage(
            data: item.id ?? '',
            key: const Key(
              DutyFreeOrderConfirmationAutomationKeys.qrCode,
            ),
            size: double.infinity,
            errorStateBuilder: (cxt, err) {
              return Center(
                child: Text(
                  'somethingWentWrong'.localize(context),
                  key: const Key(
                    DutyFreeOrderConfirmationAutomationKeys.somethingWentWrong,
                  ),
                  style: ADTextStyle400.size18,
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: bottomMargin - context.k_24,
          right: context.k_10,
          top: positionedTopPadding,
          child: Lottie.asset(
            'lib/assets/gif/lottie/booking_confirnation_duty_free.json',
            width: imageWidth,
            height: imageHeight,
            repeat: true,
          ),
        ),
      ],
    );

    //   Column(
    //   children: [
    //     Container(
    //       // margin: EdgeInsets.only(bottom: bottomMargin),
    //       padding: EdgeInsets.only(
    //         left: context.k_10,
    //         right: height80,
    //         bottom: context.k_10,
    //       ),
    //       width: double.infinity,
    //       decoration: BoxDecoration(
    //         color: context.adColors.greenColor,
    //       ),
    //       child: Row(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Container(
    //             width: containerWidth,
    //             child: GenerateContentRow(
    //               titleText: 'thank_you_for_shopping'.localize(context),
    //               subTitleText:
    //                   "${'confirmation_email_msg'.localize(context)} ${item.orderDetail?.dutyfreeDetail?.passengerDetail != null ? item.orderDetail?.dutyfreeDetail?.passengerDetail.first.emailId : ''} and ${'sms_sent_to'.localize(context)}",
    //               mobile:
    //                   '${item.orderDetail?.dutyfreeDetail?.passengerDetail != null ? '${item.orderDetail?.dutyfreeDetail?.passengerDetail.first.countryDialCode}-' : ''}${item.orderDetail?.dutyfreeDetail?.passengerDetail != null ? item.orderDetail?.dutyfreeDetail?.passengerDetail.first.mobile : ''}',
    //               color: context.adColors.whiteTextColor,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //     Container(
    //       padding: EdgeInsets.all(context.k_4),
    //       decoration: BoxDecoration(
    //         color: context.adColors.whiteTextColor,
    //         borderRadius: BorderRadius.circular(context.k_4),
    //         border: Border.all(
    //           color: context.adColors.greyCircleColor,
    //         ),
    //       ),
    //       width: qrImageWidth,
    //       height: qrImageHeight,
    //       child: QrImage(
    //         data: item.id ?? '',
    //         key: const Key(
    //           DutyFreeOrderConfirmationAutomationKeys.qrCode,
    //         ),
    //         size: double.infinity,
    //         errorStateBuilder: (cxt, err) {
    //           return Center(
    //             child: Text(
    //               'somethingWentWrong'.localize(context),
    //               key: const Key(
    //                 DutyFreeOrderConfirmationAutomationKeys.somethingWentWrong,
    //               ),
    //               style: ADTextStyle400.size18,
    //             ),
    //           );
    //         },
    //       ),
    //     ),
    //     Positioned(
    //       bottom: bottomMargin - context.k_24,
    //       right: context.k_10,
    //       top: positionedTopPadding,
    //       child: Lottie.asset(
    //         'lib/assets/gif/lottie/booking_confirnation_duty_free.json',
    //         width: imageWidth,
    //         height: imageHeight,
    //         repeat: true,
    //       ),
    //     ),
    //     ADSizedBox(
    //       height: context.k_10,
    //     ),
    //     Text(
    //       'qr_text_duty_free_thank_you'.localize(context),
    //       key: const Key(
    //         DutyFreeOrderConfirmationAutomationKeys.showQrCodeText,
    //       ),
    //       style: ADTextStyle400.size14
    //           .copyWith(color: context.adColors.blackTextColor),
    //       textAlign: TextAlign.center,
    //     ).paddingBySide(left: context.k_30, right: context.k_30),
    //   ],
    // );
  }
}
// if (widget.item.status == 'PENDING')
// OrderPendingScreen(
// item: widget.item,
// ),
