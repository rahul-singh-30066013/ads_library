/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/sticky_price_bar.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/state_management/stand_alone_review_detail_state_management.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class ReviewDetailBottomBar extends StatelessWidget {
  const ReviewDetailBottomBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double continueButtonHeight = 52.sp;
    final double continueButtonWidth = 172.sp;
    final state = context.read<StandAloneReviewDetailStateManagement>();
    final PranaamAppDataStateManagement pranaamAppDataStateManagement =
        context.read<PranaamAppDataStateManagement>();
    final cartData = pranaamAppDataStateManagement.cartDataResponse;
    return SafeArea(
      child: StickyPriceBar(
        price: FlightUtils.getPriceFormatWithSymbol(
          price:
              cartData?.standaloneProductDetails.pricingInfo.totalFare.amount ??
                  0,
        ),
        customButton: ADSizedBox(
          width: continueButtonWidth,
          child: ValueListenableBuilder<bool>(
            valueListenable: state.buttonLoading,
            builder: (context, bool value, _) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent,
                  backgroundColor: context.adColors.blueColor,
                  shape: const StadiumBorder(),
                  minimumSize: Size(
                    continueButtonWidth,
                    continueButtonHeight,
                  ),
                  elevation: 0,
                  padding: EdgeInsets.symmetric(
                    horizontal: context.k_20,
                    vertical: context.k_16,
                  ),
                ),

                ///todo: Continue button onPressed method to be implemented here
                ///And button text and loader management
                onPressed: () => state.onContinueTap(context),
                child: value
                    ? ADSizedBox(
                        height: context.k_20,
                        child: ADDotProgressView(
                          color: context.adColors.whiteTextColor,
                        ),
                      )
                    : Text(
                        'continue'.localize(context),
                        style: ADTextStyle700.size16.setTextColor(
                          context.adColors.whiteTextColor,
                        ),
                      ),
              );
            },
          ),
        ),
        subtitleText: 'viewDetails'.localize(context),
        onSubtitleTap: () => context
            .read<StandAloneReviewDetailStateManagement>()
            .scrollToDown(),
      ),
    );
  }
}
