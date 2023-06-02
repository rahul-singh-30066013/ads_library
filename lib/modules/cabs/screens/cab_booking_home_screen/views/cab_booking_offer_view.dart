/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/cab_booking_state.dart';
import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/coupon_response/coupon_list_response.dart';
import 'package:adani_airport_mobile/modules/loyalty/utils/constants/widget_type_enum.dart';
import 'package:adani_airport_mobile/modules/offers/model/offer_dashboard_response.dart';
import 'package:adani_airport_mobile/modules/offers/state_management/offers_state_management.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/debounce.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

const double viewPagerViewportFraction = 0.9;
const double subItemWidth = 0.96;
const double aspectRatio = 0.4417;

class CabBookingOfferView extends StatefulWidget {
  final CabBookingState cabBookingState;
  final DutyFreeDashboardItem dutyFreeDashboardItem;

  const CabBookingOfferView({
    Key? key,
    required this.cabBookingState,
    required this.dutyFreeDashboardItem,
  }) : super(key: key);

  @override
  State<CabBookingOfferView> createState() => _CabBookingOfferViewState();
}

class _CabBookingOfferViewState extends State<CabBookingOfferView>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    if (widget.cabBookingState.cabOffersResponseState.viewStatus !=
        Status.complete) {
      widget.cabBookingState.getAllOffers();
    }
  }

  double calculateItemWidth(
    BuildContext context,
  ) {
    final totalMarginWidth =
        (widget.dutyFreeDashboardItem.itemMargin?.left.sp ?? 0) +
            (widget.dutyFreeDashboardItem.itemMargin?.right.sp ?? 0);
    return (context.widthOfScreen - totalMarginWidth) *
        (widget.dutyFreeDashboardItem.subItemWidth ?? subItemWidth);
  }

  @override
  Widget build(BuildContext context) {
    final noUseWidget = super.build(context);
    adLog(noUseWidget.toString());
    return Selector<CabBookingState, ADResponseState>(
      selector: (context, cabBookingState) =>
          cabBookingState.cabOffersResponseState,
      builder: (
        context,
        cabOffersResponseState,
        Widget? child,
      ) {
        switch (cabOffersResponseState.viewStatus) {
          case Status.loading:
            return ADShimmerWidget.shimmerShape(
              type: ShimmerType.squareBox,
              height: calculateItemWidth(context) *
                  (widget.dutyFreeDashboardItem.aspectRatio ?? aspectRatio),
              width: context.widthOfScreen,
            ).paddingBySide(
              left: widget.dutyFreeDashboardItem.itemMargin?.left.sp ?? 0,
              right: widget.dutyFreeDashboardItem.itemMargin?.right.sp ?? 0,
              top: widget.dutyFreeDashboardItem.itemMargin?.top.sp ?? 0,
              bottom: widget.dutyFreeDashboardItem.itemMargin?.bottom.sp ?? 0,
            );
          case Status.error:
            return const SizedBox.shrink();
          case Status.complete:
            return ((cabOffersResponseState.data as OfferItems?)?.result !=
                        null &&
                    (cabOffersResponseState.data as OfferItems)
                        .result
                        .isNotEmpty)
                ? CabBookingOfferSliderView(
                    dutyFreeDashboardItem: widget.dutyFreeDashboardItem,
                    cabBookingOfferItems:
                        (cabOffersResponseState.data as OfferItems).result,
                  ).paddingBySide(
                    top: widget.dutyFreeDashboardItem.itemMargin?.top.sp ?? 0,
                    bottom:
                        widget.dutyFreeDashboardItem.itemMargin?.bottom.sp ?? 0,
                  )
                : const SizedBox.shrink();

          default:
            return const SizedBox.shrink();
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class CabBookingOfferSliderView extends StatefulWidget {
  const CabBookingOfferSliderView({
    Key? key,
    required this.dutyFreeDashboardItem,
    required this.cabBookingOfferItems,
  }) : super(key: key);
  final DutyFreeDashboardItem dutyFreeDashboardItem;
  final List<WidgetItem> cabBookingOfferItems;

  @override
  State<CabBookingOfferSliderView> createState() =>
      _CabBookingOfferSliderViewState();
}

class _CabBookingOfferSliderViewState extends State<CabBookingOfferSliderView> {
  double calculateItemWidth(
    BuildContext context,
  ) {
    final totalMarginWidth =
        (widget.dutyFreeDashboardItem.itemMargin?.left.sp ?? 0) +
            (widget.dutyFreeDashboardItem.itemMargin?.right.sp ?? 0);
    return (context.widthOfScreen - totalMarginWidth) *
        (widget.dutyFreeDashboardItem.subItemWidth ?? subItemWidth);
  }

  @override
  Widget build(BuildContext context) {
    final sliderWidth = context.widthOfScreen;
    final itemWidth = calculateItemWidth(context);
    final sliderHeight =
        itemWidth * (widget.dutyFreeDashboardItem.aspectRatio ?? aspectRatio);
    return SizedBox(
      width: sliderWidth.toDouble(),
      height: sliderHeight.toDouble(),
      child: PageView.builder(
        controller: PageController(
          viewportFraction: viewPagerViewportFraction,
        ),
        itemCount: widget.cabBookingOfferItems.length,
        itemBuilder: (BuildContext context, int index) {
          return ImageWidget(
            item: widget.cabBookingOfferItems[index],
            itemWidth: itemWidth * viewPagerViewportFraction,
            itemRadius: widget.dutyFreeDashboardItem.subItemRadius,
          ).paddingBySide(
            left: index != 0
                ? (widget.dutyFreeDashboardItem.subItemMargin?.left.sp ??
                    context.k_8)
                : 0,
            right: index != ((widget.cabBookingOfferItems.length) - 1)
                ? (widget.dutyFreeDashboardItem.subItemMargin?.right.sp ??
                    context.k_8)
                : 0,
          );
        },
      ),
    );
  }
}

class ImageWidget extends StatefulWidget {
  final WidgetItem item;
  final double itemWidth;
  final double? itemRadius;

  const ImageWidget({
    Key? key,
    required this.item,
    required this.itemWidth,
    required this.itemRadius,
  }) : super(key: key);

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  final OffersStateManagement _offersStateManagement = OffersStateManagement();

  @override
  Widget build(BuildContext context) {
    String imageUrl = '';
    if (widget.item.bannerImageMobSrc.isNotEmpty) {
      String url = widget.item.bannerImageMobSrc;
      if (widget.item.bannerImageMobSrc.contains('/sitecore/shell')) {
        url = widget.item.bannerImageMobSrc.replaceAll('/sitecore/shell', '');
      }
      imageUrl = '${Environment.instance.configuration.cmsImageBaseUrl}$url';
    }
    return TouchableOpacity(
      onTap: () => {
        if (!DeBounce.isRedundantClick())
          {
            if (!widget.item.promotionCode.isNullOrEmpty)
              navigateToScreenUsingNamedRouteWithArguments(
                context,
                offerDetail,
                rootNavigator: false,
                argumentObject: OfferKeyModel(
                  id: widget.item.offerUniqueID,
                  title: widget.item.title,
                  airportPrefixName: 'adani-one-airport',
                  showBookNowButton: false,
                ),
              ),
            _offersStateManagement.fileGAEvent(
              widget.item,
              const CouponDetails(),
            ),
          },
        FocusScope.of(context).unfocus(),
      },
      child: Container(
        width: widget.itemWidth,
        child: ClipRRect(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          borderRadius: BorderRadius.circular(
            widget.itemRadius?.sp ?? context.k_14,
          ),
          child: Container(
            color: context.adColors.containerGreyBg,
            child: imageUrl.contains('.svg')
                ? SvgPicture.network(
                    imageUrl,
                    fit: BoxFit.fill,
                  )
                : ADCachedImage(
                    imageUrl: imageUrl,
                    boxFit: BoxFit.fill,
                  ),
          ),
        ),
      ),
    );
  }
}
