/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/coupon_response/coupon_list_response.dart';
import 'package:adani_airport_mobile/modules/loyalty/utils/constants/widget_type_enum.dart';
import 'package:adani_airport_mobile/modules/offers/model/offer_dashboard_response.dart';
import 'package:adani_airport_mobile/modules/offers/state_management/offers_state_management.dart';
import 'package:adani_airport_mobile/utils/debounce.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

const int two = 2;
const double viewPagerViewportFraction = 0.9;
const double itemLeftRightMargin = 16;
const double aspectRatio = 0.44;

class FlightBookingOfferSliderView extends StatefulWidget {
  const FlightBookingOfferSliderView({
    Key? key,
    required this.flightBookingOfferItems,
  }) : super(key: key);
  final List<WidgetItem> flightBookingOfferItems;

  static double calculateItemWidth(
    BuildContext context,
  ) {
    final totalMarginWidth =
        (itemLeftRightMargin.sp) + (itemLeftRightMargin.sp);
    return context.widthOfScreen - totalMarginWidth;
  }

  @override
  State<FlightBookingOfferSliderView> createState() =>
      _FlightBookingOfferSliderViewState();
}

class _FlightBookingOfferSliderViewState
    extends State<FlightBookingOfferSliderView> {
  @override
  Widget build(BuildContext context) {
    final sliderWidth = context.widthOfScreen;
    final itemWidth = FlightBookingOfferSliderView.calculateItemWidth(
      context,
    );
    final sliderHeight = itemWidth * aspectRatio;
    return SizedBox(
      width: sliderWidth.toDouble(),
      height: sliderHeight.toDouble(),
      child: PageView.builder(
        controller: PageController(
          viewportFraction: viewPagerViewportFraction,
        ),
        itemCount: widget.flightBookingOfferItems.length,
        itemBuilder: (BuildContext context, int index) {
          return ImageWidget(
            item: widget.flightBookingOfferItems[index],
            itemWidth: itemWidth * viewPagerViewportFraction,
          ).paddingBySide(
            left: index != 0 ? ((itemLeftRightMargin.sp) / two) : 0,
            right: index != ((widget.flightBookingOfferItems.length) - 1)
                ? ((itemLeftRightMargin.sp) / two)
                : 0,
          );
        },
      ),
    ).paddingBySide(
      top: context.k_20,
    );
  }
}

class ImageWidget extends StatelessWidget {
  final WidgetItem item;
  final double itemWidth;
  final OffersStateManagement _offersStateManagement = OffersStateManagement();

  ImageWidget({
    Key? key,
    required this.item,
    required this.itemWidth,
    // required this.subItemMargin,
    // required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imageUrl = '';
    if (item.bannerImageMobSrc.isNotEmpty) {
      String url = item.bannerImageMobSrc;
      if (item.bannerImageMobSrc.contains('/sitecore/shell')) {
        url = item.bannerImageMobSrc.replaceAll('/sitecore/shell', '');
      }
      imageUrl = '${Environment.instance.configuration.cmsImageBaseUrl}$url';
    }
    return TouchableOpacity(
      onTap: () => item.offerUniqueID.isNotEmpty
          ? {
              if (!DeBounce.isRedundantClick())
                {
                  navigateToScreenUsingNamedRouteWithArguments(
                    context,
                    offerDetail,
                    rootNavigator: false,
                    argumentObject: OfferKeyModel(
                      id: item.offerUniqueID,
                      title: item.offerTitle,
                      showBookNowButton: false,
                    ),
                  ),
                  _offersStateManagement.fileGAEvent(
                    item,
                    const CouponDetails(),
                  ),
                },
              FocusScope.of(context).unfocus(),
            }
          : null,
      child: Container(
        width: itemWidth,
        child: ClipRRect(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          borderRadius: BorderRadius.circular(
            context.k_14,
          ),
          child: Container(
            color: context.adColors.containerGreyBg,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ADCachedImage(
                  imageUrl: imageUrl,
                  boxFit: BoxFit.fill,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
