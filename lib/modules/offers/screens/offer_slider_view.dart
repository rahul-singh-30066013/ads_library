/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/coupon_response/coupon_list_response.dart';
import 'package:adani_airport_mobile/modules/offers/model/offer_dashboard_response.dart';
import 'package:adani_airport_mobile/modules/offers/state_management/offers_state_management.dart';
import 'package:adani_airport_mobile/utils/debounce.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

const double subItemWidth = 0.96;
const int two = 2;
const double viewPagerViewportFraction = 0.9;

class OfferSliderView extends StatefulWidget {
  const OfferSliderView({
    Key? key,
    required this.dashBoardItem,
  }) : super(key: key);
  final DashboardItem dashBoardItem;

  static double calculateItemWidth(
    DashboardItem? sizeData,
    BuildContext context,
  ) {
    final totalMarginWidth = (sizeData?.itemMargin.left.sp ?? 0) +
        (sizeData?.itemMargin.right.sp ?? 0);
    return (context.widthOfScreen - totalMarginWidth) *
        (sizeData?.subItemWidth ?? subItemWidth);
  }

  @override
  State<OfferSliderView> createState() => _OfferSliderViewState();
}

class _OfferSliderViewState extends State<OfferSliderView> {
  @override
  Widget build(BuildContext context) {
    final sliderWidth = context.widthOfScreen;
    final itemWidth = OfferSliderView.calculateItemWidth(
      widget.dashBoardItem,
      context,
    );
    final sliderHeight = itemWidth * widget.dashBoardItem.aspectRatio;

    return SizedBox(
      width: sliderWidth.toDouble(),
      height: sliderHeight.toDouble(),
      child: PageView.builder(
        controller: PageController(
          viewportFraction: viewPagerViewportFraction,
        ),
        itemCount: widget.dashBoardItem.widgetItems.length,
        itemBuilder: (BuildContext context, int index) {
          return ImageWidget(
            item: widget.dashBoardItem.widgetItems[index],
            itemWidth: itemWidth * viewPagerViewportFraction,
            subItemMargin: widget.dashBoardItem.subItemMargin,
            radius: widget.dashBoardItem.subItemRadius,
          ).paddingBySide(
            left: index != 0
                ? ((widget.dashBoardItem.subItemMargin.left.sp) / two)
                : 0,
            right: index != ((widget.dashBoardItem.widgetItems.length) - 1)
                ? ((widget.dashBoardItem.subItemMargin.left.sp) / two)
                : 0,
          );
        },
      ),
    ).paddingBySide(top: context.k_16);
  }
}

class ImageWidget extends StatelessWidget {
  final WidgetItem item;
  final double itemWidth;
  final ItemMargin? subItemMargin;
  final double? radius;
  final OffersStateManagement _offersStateManagement = OffersStateManagement();

  ImageWidget({
    Key? key,
    required this.item,
    required this.itemWidth,
    required this.subItemMargin,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: () => {
        if (!DeBounce.isRedundantClick())
          {
            _offersStateManagement.fileGAEvent(
              item,
              const CouponDetails(),
            ),
            _offersStateManagement.redirection(context, item),
          },
        FocusScope.of(context).unfocus(),
      },
      child: Container(
        width: itemWidth,
        child: ClipRRect(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          borderRadius: BorderRadius.circular(
            context.k_14,
          ),
          child: Container(
            color: context.adColors.transparentColor,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ADCachedImage(
                  imageUrl:
                      item.extraImageSrc.isNotEmpty ? item.extraImageSrc : '',
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
