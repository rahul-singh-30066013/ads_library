/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/Views/duty_free_refund_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_cancel/flight_fare_info_response_model.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class WidgetFareBreakUpNull extends StatelessWidget {
  final FlightFareInfoResponseModel? flightFareInfoResponseModel;
  const WidgetFareBreakUpNull({
    this.flightFareInfoResponseModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.widthOfScreen,
      decoration: BoxDecoration(
        color: DutyFreeRefundScreen.lightBlueColor,
        borderRadius: BorderRadius.all(
          Radius.circular(
            context.k_4,
          ),
        ),
      ),
      child: Column(
        children: [
          ADSizedBox(
            height: context.k_20,
          ),
          SvgPicture.asset(
            SvgAssets.refundNullIcon,
          ),
          Text(
            'refund_null_case_title'.localize(context),
            style: ADTextStyle700.size16,
            textAlign: TextAlign.center,
          ).paddingBySide(
            top: context.k_16,
            left: context.k_20,
            right: context.k_20,
            bottom: context.k_10,
          ),
          if (!(flightFareInfoResponseModel?.isZeroCancellation ?? true))
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: context.k_4,
                  height: context.k_4,
                  decoration: BoxDecoration(
                    color: context.adColors.darkGreyTextColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        context.k_4,
                      ),
                    ),
                  ),
                ).paddingBySide(
                  left: context.k_20,
                  right: context.k_10,
                  top: context.k_4,
                ),
                Expanded(
                  child: Text(
                    'refund_null_case_description_1'.localize(context),
                    style: ADTextStyle400.size14,
                  ).paddingBySide(
                    right: context.k_20,
                  ),
                ),
              ],
            ),
          if ((flightFareInfoResponseModel?.isZeroCancellation ?? false) &&
              !(flightFareInfoResponseModel?.isInfantCancelOnly ?? false))
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: context.k_4,
                  height: context.k_4,
                  decoration: BoxDecoration(
                    color: context.adColors.darkGreyTextColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        context.k_4,
                      ),
                    ),
                  ),
                ).paddingBySide(
                  left: context.k_20,
                  right: context.k_10,
                  top: context.k_4,
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: '',
                      style: ADTextStyle400.size14,
                      children: [
                        TextSpan(
                          text: 'dont_worry'.localize(context),
                          style: ADTextStyle400.size14,
                        ),
                        TextSpan(
                          text: 'you_are_covered'.localize(context),
                          style: ADTextStyle700.size14,
                        ),
                        TextSpan(
                          text:
                              'proceed_with_cancellation_amp'.localize(context),
                          style: ADTextStyle400.size14,
                        ),
                      ],
                    ),
                  ).paddingBySide(
                    right: context.k_20,
                  ),
                ),
              ],
            ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: context.k_4,
                height: context.k_4,
                decoration: BoxDecoration(
                  color: context.adColors.darkGreyTextColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      context.k_4,
                    ),
                  ),
                ),
              ).paddingBySide(
                left: context.k_20,
                right: context.k_10,
                top: context.k_4,
              ),
              Expanded(
                /* child: Text(
                  'refund_null_case_description_2'.localize(context),
                  style: ADTextStyle400.size14,
                ).paddingBySide(
                  right: context.k_20,
                ),*/
                child: RichText(
                  text: TextSpan(
                    text: '',
                    style: ADTextStyle400.size14,
                    children: [
                      TextSpan(
                        text:
                            'refund_null_case_description_2'.localize(context),
                        style: ADTextStyle600.size14,
                      ),
                      TextSpan(
                        text: 'support_email'.localize(context),
                        style: ADTextStyle500.size14.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Utils.email(
                                'support_email'.localize(context),
                                context,
                                isPopTrue: true,
                              ),
                      ),
                      TextSpan(
                        text: '.',
                        style: ADTextStyle400.size14,
                      ),
                    ],
                  ),
                ).paddingBySide(
                  right: context.k_20,
                ),
              ),
            ],
          ).paddingBySide(
            top: context.k_10,
            bottom: context.k_20,
          ),
          if ((flightFareInfoResponseModel?.isZeroCancellation ?? false) &&
              !(flightFareInfoResponseModel?.isInfantCancelOnly ?? false))
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      'zero_cancellation'.localize(context),
                      style: ADTextStyle700.size16
                          .setTextColor(context.adColors.black),
                    ).paddingBySide(
                      right: context.k_4,
                    ),
                    SvgPicture.asset(
                      SvgAssets.zeroCancellationIcon,
                      height: context.k_20,
                      width: context.k_22,
                    ),
                  ],
                ),
                Text(
                  'adani_one_will_process_refund'.localize(context),
                  style: ADTextStyle400.size14
                      .setTextColor(context.adColors.black),
                ).paddingBySide(
                  top: context.k_10,
                ),
              ],
            ).paddingBySide(
              left: context.k_28,
              right: context.k_10,
              bottom: context.k_20,
            ),
        ],
      ),
    );
  }
}
