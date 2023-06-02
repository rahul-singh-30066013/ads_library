/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/sticky_price_bar.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/cart_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_cart/get_cart_response_model/get_cart_response_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/cart_screen_controller.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/view/cart_screen_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class CartScreenBottomBar extends StatelessWidget {
  const CartScreenBottomBar({Key? key, required this.state}) : super(key: key);
  final CartScreenController state;
  @override
  Widget build(BuildContext context) {
    final double continueButtonHeight = 52.sp;
    final double continueButtonWidth = 172.sp;
    return Selector<PranaamAppDataStateManagement, ADResponseState>(
      selector: (context, value) => value.responseState,
      builder: (context, value, child) {
        if (value.viewStatus == Status.complete && value.data != null) {
          final GetCartResponseModel getCartResponseModel = value.data;
          final CartResponse cartResponse = getCartResponseModel.cartResponse;
          return cartResponse.pranaamBookingType.toLowerCase() ==
                  'reschedulebooking'
              ? const ADSizedBox()
              : SafeArea(
                  child: StickyPriceBar(
                    price: FlightUtils.getPriceFormatWithSymbol(
                      price:
                          isStandAloneService(cartResponse.pranaamBookingType)
                              ? cartResponse.standaloneProductDetails
                                  .pricingInfo.totalFare.amount
                              : getCartTotalPrice(
                                  cartResponse,
                                ),
                    ),
                    customButton: ADSizedBox(
                      width: continueButtonWidth,
                      child: Selector<PranaamAppDataStateManagement, bool>(
                        selector: (context, model) => state
                            .pranaamAppDataStateManagement.isCartProceedClick,
                        builder: (context, value, child) => AbsorbPointer(
                          absorbing: value,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shadowColor: context.adColors.transparentColor, backgroundColor: context.adColors.blueColor,
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
                            onPressed: () => state.onPressed(context),
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
                          ),
                        ),
                      ),
                    ),
                    subtitleText: 'viewDetails'.localize(context),
                    onSubtitleTap: () => state.scrollToDown(shakeKey),
                  ),
                );
        } else {
          return const ADSizedBox();
        }
      },
    );
  }
}
