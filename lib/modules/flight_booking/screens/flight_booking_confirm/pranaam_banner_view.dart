/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/custom_tab_scaffold.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/home_bottom_assets.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/pranaam_banner_model.dart';
import 'package:adani_airport_mobile/modules/loyalty/utils/constants/widget_type_enum.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/ga_helper/ga_event.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/debounce.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/cached_image/ad_cached_image.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

const int two = 2;
const double containerHeight = 120;

const double aspectRatio = 0.66;
const double viewPagerViewportFraction = 0.9;
const double zeroPoint3 = 0.35;

class PranaamBannerView extends StatelessWidget {
  final List<UpSellLink> item;

  const PranaamBannerView({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.widthOfScreen - context.k_32,
      height: (context.widthOfScreen - context.k_32) * zeroPoint3,
      child: item.length == 1
          ? ImageWidget(
              item: item.first,
            ).paddingBySide(left: context.k_16, right: context.k_16)
          : PageView.builder(
              controller: PageController(
                viewportFraction: viewPagerViewportFraction,
              ),
              itemCount: item.length,
              itemBuilder: (BuildContext context, int index) {
                return ImageWidget(
                  item: item[index],
                ).paddingBySide(
                  left: index != 0 ? ((context.k_12) / two) : 0,
                  right:
                      index != ((item.length) - 1) ? ((context.k_12) / two) : 0,
                );
              },
            ),
    ).paddingBySide(top: context.k_16);
  }
}

class ImageWidget extends StatelessWidget {
  final UpSellLink item;

  const ImageWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        if (!DeBounce.isRedundantClick())
          {
            GaEvent.getInstance().pranaamUpCellBanner(),
            ClickEvents.cross_sell_banner_select
                .logEvent(parameters: GaEvent.getInstance().parameterMap),
            if (item.offerUniqueID.isNotEmpty)
              {
                navigateToScreenUsingNamedRouteWithArguments(
                  context,
                  offerDetail,
                  rootNavigator: false,
                  argumentObject: OfferKeyModel(
                    id: item.offerUniqueID,
                    title: 'Offer Details',
                    showBookNowButton: false,
                  ),
                ),
              }
            else
              {
                Navigator.of(context).popUntil((route) => route.isFirst),
                navigateToPranaamDashboard(item),
              },
          },
        FocusScope.of(context).unfocus(),
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              context.scaled(
                context.k_8,
              ),
            ),
          ),
        ),
        child: ADCachedImage(
          imageUrl: item.appBannerURL,
        ),
      ),
    );
  }

  void navigateToPranaamDashboard(UpSellLink item) {
    final CustomTabScaffold customTabScaffold =
        BottomBarState.key.currentWidget as CustomTabScaffold;
    final GlobalKey<NavigatorState> navigatorState =
        HomeBottomAssets.homeBottomPages.keys.toList().first;
    customTabScaffold.controller?.index = 0;
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        navigatorState.currentState
            ?.pushNamed(
              pranaamService,
              arguments: item,
            )
            .then(
              (value) => adLog(''),
            );
      },
    );
  }
}
