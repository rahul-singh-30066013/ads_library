/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/utils/constant/svg_assets.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/promo_coupon.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/review_flight_details_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

/// This class will used to Create Apply Coupon Row.
///

class FlightBookingApplyCoupon extends StatelessWidget {
  final String? leftHeader;
  final ADTapCallback? onTap;
  final PromoCoupon? promoCoupon;
  final ADTapCallback? onTapHandler;
  final double containerHeight = 70.sp;

  FlightBookingApplyCoupon({
    Key? key,
    this.leftHeader,
    this.onTap,
    this.promoCoupon,
    this.onTapHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      child: Row(
        children: [
          SvgPicture.asset(
            SvgAssets.icTag,
            color: context.adColors.darkGreyTextColor,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: context.k_12,
                        ),
                        // if (promoCoupon != null && promoCoupon?.offerValue != 0)
                        if (promoCoupon != null)
                          Row(
                            children: [
                              Text(
                                "'${promoCoupon?.promoCode}' ",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: ADTextStyle700.size18,
                              ),
                              Text(
                                'applied'.localize(context),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: ADTextStyle700.size18,
                              ),
                            ],
                          )
                        else
                          Text(
                            leftHeader ?? '',
                            style: ADTextStyle600.size18,
                          ),
                      ],
                    ),
                  ],
                ),
                if (!ProfileSingleton.profileSingleton.isLoggedIn)
                  Row(
                    children: [
                      SizedBox(
                        width: context.k_12,
                      ),
                      Expanded(
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            style: ADTextStyle400.size14,
                            children: [
                              TextSpan(
                                text: 'Login',
                                style: ADTextStyle400.size14.copyWith(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              const TextSpan(
                                text: ' to see best coupons for you',
                              ),
                            ],
                          ),
                        ).paddingBySide(top: context.k_6),
                      ),
                    ],
                  )
                // else if (promoCoupon != null && promoCoupon?.offerValue != 0)
                else if (promoCoupon != null)
                  Text(
                    promoCoupon?.appliedMsgShort ??
                        '${'you_saved'.localize(context)} ${FlightUtils.getPriceFormatWithSymbol(
                          price: promoCoupon?.offerValue ?? 0,
                        )}',
                    style: ADTextStyle500.size14
                        .copyWith(color: context.adColors.greenTextColor),
                  ).paddingBySide(
                    top: context.k_6,
                    left: context.k_14,
                  ),
              ],
            ),
          ),
          // if (promoCoupon == null || promoCoupon?.offerValue == 0)
          if (promoCoupon == null)
            Icon(
              Icons.chevron_right,
              color: context.adColors.darkGreyTextColor,
              size: context.k_30,
            )
          else
            Selector<ReviewFlightDetailsState, ADResponseState>(
              selector: (context, viewModel) => viewModel.removeCouponState,
              builder: (context, value, Widget? child) {
                return value.viewStatus == Status.loading
                    ? ADDotProgressView(
                        color: context.adColors.blackColor,
                        size: context.k_4,
                      )
                    : InkWell(
                        onTap: () => onTapHandler?.call(),
                        child: Text.rich(
                          TextSpan(
                            text: 'remove'.localize(context),
                            style: ADTextStyle400.size14.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      );
              },
            ),
        ],
      ),
    );
  }
}
