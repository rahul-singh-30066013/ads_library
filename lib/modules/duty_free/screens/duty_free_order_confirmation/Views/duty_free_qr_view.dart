/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:math' as math;

import 'package:adani_airport_mobile/modules/duty_free/state_management/duty_free_order_cancellation_state/duty_free_order_state.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// [DutyFreeQRView] is user for show QR in duty free order details page.
class DutyFreeQRView extends StatelessWidget {
  const DutyFreeQRView({Key? key}) : super(key: key);

  /// QR image Width
  static double qrImageWidth = 142.sp;

  /// QR image Height
  static double qrImageHeight = 142.sp;

  /// Cancel Text Color
  static const Color cancelledQrRed = Color(0xffc96d6d);

  /// Rotation value for cancel
  static const int rotationValue = 6;

  /// Cancel section display
  static const isCancel = true;
  @override
  Widget build(BuildContext context) {
    // final Map map = {};

    return Consumer<DutyFreeOrderState>(
      builder: (BuildContext context, dutyFreeOrderState, Widget? child) {
        // map['id'] =
        //     dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel?.id ??
        //         '';
        // final String encodedString = jsonEncode(map);
        return Align(
          child: Column(
            children: [
              Container(
                width: qrImageWidth,
                height: qrImageHeight,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
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
                        foregroundColor: dutyFreeOrderState.orderCancelled
                            ? context.adColors.dashedDividerColor
                            : context.adColors.blackTextColor,
                        data: dutyFreeOrderState
                                .dutyFreeCancelOrderDetailsResponseModel
                                ?.orderDetail
                                ?.bookingId ??
                            '',
                        size: double.infinity,
                        errorStateBuilder: (cxt, err) {
                          return Center(
                            child: Text(
                              'somethingWentWrong'.localize(context),
                              style: ADTextStyle400.size18,
                            ),
                          );
                        },
                      ),
                    ),
                    if (dutyFreeOrderState.orderCancelled)
                      Transform.rotate(
                        angle: -math.pi / rotationValue,
                        child: Container(
                          height: context.k_48,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: cancelledQrRed,
                              width: context.k_4,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(context.k_6),
                            ),
                            color: context.adColors.whiteTextColor,
                          ),
                          child: Center(
                            child: Text(
                              'cancelled'.localize(context).toUpperCase(),
                              style: ADTextStyle700.size20
                                  .setTextColor(cancelledQrRed),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              if (!dutyFreeOrderState.orderCancelled)
                Text(
                  'dutyFreeQRCodeText'.localize(context),
                  style: ADTextStyle400.size14
                      .setTextColor(context.adColors.blackTextColor),
                  textAlign: TextAlign.center,
                ).paddingBySide(
                  left: context.k_30,
                  right: context.k_30,
                  bottom: context.k_12,
                  top: context.k_10,
                ),
              if (!dutyFreeOrderState.orderCancelled)
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${'reference_id'.localize(context)} -',
                        style: ADTextStyle400.size14
                            .setTextColor(context.adColors.blackTextColor),
                      ),
                      WidgetSpan(
                        child: ADSizedBox(
                          width: context.k_4,
                        ),
                      ),
                      TextSpan(
                        text: dutyFreeOrderState
                            .dutyFreeCancelOrderDetailsResponseModel
                            ?.orderDetail
                            ?.bookingId,
                        style: ADTextStyle400.size14
                            .setTextColor(context.adColors.blackTextColor),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        );
      },
    );
  }
}
