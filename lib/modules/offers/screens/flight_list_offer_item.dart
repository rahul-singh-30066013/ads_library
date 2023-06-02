/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/coupon_response/coupon_list_response.dart';
import 'package:adani_airport_mobile/modules/loyalty/utils/constants/widget_type_enum.dart';
import 'package:adani_airport_mobile/modules/offers/model/offer_dashboard_response.dart';
import 'package:adani_airport_mobile/modules/offers/state_management/offers_state_management.dart';
import 'package:adani_airport_mobile/utils/debounce.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class FlightListOfferItem extends StatelessWidget {
  final CouponDetails item;
  final bool isEnableClick;
  final double? bannerWidth;

  const FlightListOfferItem({
    Key? key,
    required this.item,
    required this.isEnableClick,
    this.bannerWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int offerMAxLine = 3;
    return InkWell(
      onTap: isEnableClick && (item.promoCode).isNotEmpty
          ? () => {
                if (!DeBounce.isRedundantClick())
                  {
                    navigateToScreenUsingNamedRouteWithArguments(
                      context,
                      offerDetail,
                      rootNavigator: false,
                      argumentObject: OfferKeyModel(
                        id: item.promoCode,
                        title: item.promoName,
                        showBookNowButton: false,
                        fetchDataFromPromoCode: true,
                      ),
                    ),
                    OffersStateManagement().fileGAEvent(
                      const WidgetItem(),
                      item,
                    ),
                  },
                FocusScope.of(
                  context,
                ).unfocus(),
              }
          : null,
      child: Container(
        alignment: Alignment.center,
        width: bannerWidth,
        padding: EdgeInsets.all(
          context.k_10,
        ),
        decoration: BoxDecoration(
          color: const Color(0xffFEF6EA),
          borderRadius: BorderRadius.circular(
            context.k_10,
          ),
          // border: Border.all(
          //   color: context.adColors.tileBorderColor,
          // ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              item.promoType.isEmpty || item.promoType == '0'
                  ? SvgAssets.srpCouponCode
                  : SvgAssets.coinIcon,
              // color: item.promoType == 0 ? null : null,
              width: context.k_16,
              height: context.k_16,
            ),
            SizedBox(
              width: context.k_12,
            ),
            Expanded(
              child: RichText(
                maxLines: offerMAxLine,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  style: ADTextStyle400.size12.setTextColor(
                    context.adColors.blackTextColor,
                  ),
                  children: [
                    TextSpan(
                      text: item.promoCode,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (item.promoCode.isNotEmpty)
                      const TextSpan(
                        text: ' | ',
                      ),
                    TextSpan(
                      text: item.promoDescription,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
