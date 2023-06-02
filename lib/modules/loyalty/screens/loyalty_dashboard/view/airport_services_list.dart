/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/custom_tab_scaffold.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/home_bottom_assets.dart';
import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/home_screen/home_screen.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_dashboard_site_core_response.dart';
import 'package:adani_airport_mobile/modules/loyalty/utils/constants/widget_type_enum.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class AirportServicesList extends StatelessWidget {
  final DashboardItem dashboardItem;
  final double? widgetHeight;
  final String? subTitle;

  const AirportServicesList({
    Key? key,
    required this.dashboardItem,
    this.widgetHeight,
    this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int titleMaxLine = 2;
    final double containerHeight = 306.sp;
    final double containerWidth = 270.sp;
    final double widgetHeight = 414.sp;
    final List<WidgetItem> customWidgetItem = [];
    for (int size = 0; size < dashboardItem.widgetItems.length; size++) {
      if (dashboardItem.widgetItems.isNotEmpty) {
        customWidgetItem.add(dashboardItem.widgetItems[size]);
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ADSizedBox(
          height: context.k_26,
        ),
        Text(
          dashboardItem.title,
          maxLines: titleMaxLine,
          overflow: TextOverflow.ellipsis,
          style: ADTextStyle700.size22,
          textAlign: TextAlign.left,
        ).paddingBySide(
          left: context.k_20,
          right: context.k_20,
        ),
        Container(
          // height: itemWidth * (dashboardItem.aspectRatio) +
          //     (widgetHeight ?? defaultHeight).sp,
          height: widgetHeight,
          //   color: Colors.lightBlue,
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: context.k_20,
              );
            },
            padding: EdgeInsets.only(
              top: context.k_20,
              left: context.k_18,
              right: context.k_18,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: customWidgetItem.length,
            itemBuilder: (context, index) {
              return TouchableOpacity(
                onTap: () => goToNextScreen(index, customWidgetItem, context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                        context.scaled(
                          context.k_6,
                        ),
                      ),
                      child: Container(
                        height: containerHeight,
                        width: containerWidth,
                        color: context.adColors.containerGreyBg,
                        child: ADCachedImage(
                          height: containerHeight,
                          width: containerWidth,
                          imageUrl: customWidgetItem[index].mobileImageSrc,
                        ),
                      ),
                    ),
                    Text(
                      customWidgetItem[index].descriptionApp,
                      style: ADTextStyle400.size12
                          .setTextColor(context.adColors.blackTextColor),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ).paddingBySide(top: context.k_24),

                    Container(
                      width: containerWidth,
                      child: Text(
                        customWidgetItem[index].title,
                        style: ADTextStyle500.size16
                            .setTextColor(context.adColors.blackTextColor),
                      ).paddingBySide(
                        top: context.k_12,
                      ),
                    ),
                    // Text(
                    //   customWidgetItem[index].description,
                    //   style: ADTextStyle400.size16
                    //       .setTextColor(context.adColors.blackTextColor),
                    //   overflow: TextOverflow.ellipsis,
                    //   maxLines: 1,
                    // ).paddingBySide(top: context.k_6),
                    // ADSizedBox(height: context.k_10),
                    // Text(
                    //   customWidgetItem[index].ctaText,
                    //   overflow: TextOverflow.ellipsis,
                    //   style: ADTextStyle500.size16.copyWith(
                    //     color: context.adColors.blackTextColor,
                    //     decoration: TextDecoration.underline,
                    //     fontSize: context.k_16,
                    //   ),
                    // ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void goToNextScreen(
    int index,
    List<WidgetItem> customWidgetItem,
    BuildContext context,
  ) {
    // if (ProfileSingleton.profileSingleton.isLoggedIn) {
    // if (customWidgetItem[index].rewardType.toLowerCase() ==
    //     ServicesEnum.flights.name) {
    //   navigateToScreenUsingNamedRoute(
    //     context,
    //     flightBooking,
    //   );
    // }
    navigateToScreenUsingNamedRouteWithArguments(
      context,
      offerDetail,
      rootNavigator: false,
      argumentObject: OfferKeyModel(
        id: customWidgetItem[index].rewardUniqueId,
        title: customWidgetItem[index].descriptionApp,
      ),
    );

    // else if (customWidgetItem[index].rewardType.toLowerCase() ==
    //     ServicesEnum.pranaam.name) {
    //   if (selectedAirportsData?.city?.toLowerCase() == 'other') {
    //     openAirportBottomSheet();
    //   } else {
    //     navigateToScreenUsingNamedRoute(
    //       context,
    //       pranaamService,
    //     );
    //   }
    // }
    // else if (customWidgetItem[index].rewardType.toLowerCase() ==
    //     ServicesEnum.dutyfree.name) {
    //   // if (selectedAirportsData?.airportCode?.toUpperCase() == 'BOM') {
    //   //   navigateToScreenUsingNamedRoute(
    //   //     context,
    //   //     dutyFreeScreen,
    //   //   );
    //   // }
    //   // else {
    //   //   final AirportListStateManagement airportListStateManagement =
    //   //       context.read<AirportListStateManagement>();
    //   //   final List<AirportItemModel> adaniAirportsList =
    //   //       context.read<SiteCoreStateManagement>().adaniAirportsList;
    //   //   selectedAirportsData = adaniAirportsList
    //   //       .where((element) => element.airportCode?.toUpperCase() == 'BOM')
    //   //       .first;
    //   //   context.read<DutyFreeState>().airportData = selectedAirportsData;
    //   //   SharedPrefsUtils()
    //   //       .putVarValueInPrefs(keySelectedAirport, selectedAirportsData);
    //   //   //selectedAirportsData = airportData;
    //   //   selectedAirportNotifier.value = selectedAirportsData?.city ?? '';
    //   //   airportListStateManagement.updateData(
    //   //     selectedAirportsData ?? AirportItemModel(),
    //   //     context,
    //   //   );
    //   //
    //   //   context.read<DashBoardViewModel>().getDashBoardData(
    //   //         selectedAirportsData?.city ?? '',
    //   //         notify: true,
    //   //         postFix: selectedAirportsData?.postFix,
    //   //       );
    //   //   navigateToScreenUsingNamedRoute(
    //   //     context,
    //   //     dutyFreeScreen,
    //   //   );
    //   // }
    //   adLog('no');
    // }

    //   else if (customWidgetItem[index].ctaLink.isNotEmpty &&
    //       customWidgetItem[index].ctaLink.contains('http')) {
    //     final WebViewModel model = WebViewModel(
    //       title: 'services'.localize(context),
    //       url: '${customWidgetItem[index].ctaLink}?isapp=true',
    //     );
    //     if (model.url.isNotEmpty) {
    //       navigateToScreenUsingNamedRouteWithArguments(
    //         context,
    //         webViewContainer,
    //         argumentObject: model,
    //       );
    //     }
    //   }
    // }
  }

  void openAirportBottomSheet() {
    homeScreenKey.currentState?.handlePressed((value) {
      // if (value != null &&
      //     selectedAirportsData?.city?.toLowerCase() != 'other') {
      final CustomTabScaffold scaffold =
          BottomBarState.key.currentWidget as CustomTabScaffold;

      final GlobalKey<NavigatorState> navigatorState =
          HomeBottomAssets.homeBottomPages.keys.toList().first;

      //    navigatorState.currentState?.popUntil((route) => route.isFirst);
      BottomBarState.currentIndex = 0;
      scaffold.controller?.index = 0;
      navigatorState.currentState?.popUntil(
        (route) => route.isFirst,
      );
      //   }
    });
  }
}
