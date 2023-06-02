/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/dashboard_components/home_tiles_item.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/models/web_view_model.dart';
import 'package:adani_airport_mobile/modules/components/sliver_app_bar_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/dashboard_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/duty_free_ad_slider_view.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/airport_item_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/dashboard/airports_list_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/dashboard/widget_type.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/airport_list_state_management.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/dashboard_view_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/bottom_sheet_utils.dart';
import 'package:adani_airport_mobile/modules/loyalty/utils/constants/widget_type_enum.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/republic_reward/adani_reward_republic_image_view.dart';
import 'package:adani_airport_mobile/modules/republic_reward/offer_and_discount_view.dart';
import 'package:adani_airport_mobile/modules/republic_reward/our_services.dart';
import 'package:adani_airport_mobile/modules/republic_reward/republic_image_with_text.dart';
import 'package:adani_airport_mobile/modules/republic_reward/republic_t_and_c.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_draggable_scrollable_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

final double imageHeight_84 = 84.sp;
final double imageWidth_84 = 84.sp;
const int brandWidgetId = 8;
const int two = 2;
const double offersHeight = 156;
const double otherHeight = 115;
const double offersDiscountsWidgetId = 6;
const double circleHeight = 0.2;
const int greyBorder = 0xd8d8d8;
const double opacity = 0.3;
List<RepublicRewardTAndC> rewardTerms = [];

const imageBackgroundColor = Color(0xffbebebe);

const double fifteenFontSize = 15;

class RepublicScreenDashboardBuilder extends StatelessWidget {
  const RepublicScreenDashboardBuilder({
    Key? key,
    required this.dashBoardItem,
    this.onTapHandler,
    this.dashBoardViewModel,
  }) : super(key: key);
  final ADTapCallbackWithValue? onTapHandler;
  final DutyFreeDashboardItem dashBoardItem;
  final DashBoardViewModel? dashBoardViewModel;

  WidgetType getWidgetType(String value) {
    switch (value) {
      case kIllustration:
        return WidgetType.illustration;
      case kRewardBanner:
        return WidgetType.rewardBanner;
      case kMoreServices:
        return WidgetType.moreServices;
      case kNewInElectronics:
        return WidgetType.newInElectronics;
      case kSliderBanner_1dot2:
        return WidgetType.sliderBanner_1dot2;
      case kHomeTileWidget:
        return WidgetType.homeTileWidget;
      case kExploreServices:
        return WidgetType.exploreServices;
      case kRewardTerms:
        return WidgetType.rewardTerms;
      default:
        return WidgetType.pranaamPackage;
    }
  }

  @override
  Widget build(BuildContext context) {
    final widgetType = getWidgetType(dashBoardItem.widgetType ?? '');

    switch (widgetType) {
      case WidgetType.rewardTerms:
        rewardTerms = dashBoardItem.widgetItems?.first.webDescription ?? [];
        return const SizedBox.shrink();
      case WidgetType.illustration:
        return AdaniRewardRepublicImageView(
          item: dashBoardItem,
        ).paddingBySide(
          top: context.k_48,
          left: context.k_16,
          right: context.k_16,
        );
      case WidgetType.newInElectronics:
        return OfferAndDiscountView(
          item: dashBoardItem,
          onTap: (value) => {},
          themeEnabled:
              context.read<DutyFreeState>().airportData?.isTheme ?? false,
        ).paddingBySide(
          top: context.k_40,
        );

      case WidgetType.sliderBanner_1dot2:
        return Column(
          children: [
            DutyFreeADSliderView(
              contentData: dashBoardItem,
              sliderType: widgetType,
              itemBuilder: (BuildContext context, int index) {
                final data = (dashBoardItem.widgetItems ?? [])[index];
                final itemWidth = DutyFreeADSliderView.itemWidthBasedOnType(
                  widgetType,
                  dashBoardItem,
                  context,
                );
                return ImageWidget(
                  aspectRatio: dashBoardItem.aspectRatio ?? 0,
                  onTapHandler: (value) => {},
                  isCenterText: widgetType == WidgetType.sliderBanner_1dot2Text,
                  isBorder:
                      widgetType == WidgetType.sliderBanner_1dot2WithBorder,
                  item: data,
                  fit: BoxFit.fill,
                  itemWidth: widgetType == WidgetType.sliderBanner_1dot2Pager
                      ? itemWidth * viewPagerViewportFraction
                      : itemWidth,
                  subItemMargin: dashBoardItem.subItemMargin,
                  radius: dashBoardItem.subItemRadius,
                ).paddingBySide(
                  left: index != 0 &&
                          widgetType == WidgetType.sliderBanner_1dot2Pager
                      ? ((dashBoardItem.subItemMargin?.left.sp ?? 0) / two)
                      : 0,
                  right:
                      index != ((dashBoardItem.widgetItems?.length ?? 0) - 1) &&
                              widgetType == WidgetType.sliderBanner_1dot2Pager
                          ? ((dashBoardItem.subItemMargin?.left.sp ?? 0) / two)
                          : 0,
                );
              },
            ),
            ADSizedBox(
              width: context.widthOfScreen,
              height: context.k_56,
              child: ElevatedButton(
                onPressed: () => {
                  navigateToScreenUsingNamedRoute(
                    context,
                    flightBooking,
                  ),
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide.none,
                  primary: context.adColors.blueColor,
                  shape: const StadiumBorder(),
                  maximumSize: Size(double.infinity, context.k_64),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        SvgAssets.bookFlight,
                        height: context.k_18,
                        width: context.k_18,
                        color: context.adColors.whiteTextColor,
                      ).paddingBySide(
                        right: context.k_10,
                      ),
                    ),
                    Text(
                      'Book Flight',
                      style: ADTextStyle500.size18.setTextColor(
                        context.adColors.whiteTextColor,
                      ),
                    ),
                  ],
                ).paddingBySide(
                  right: context.k_12,
                ),
              ),
            ).paddingBySide(
              left: context.k_16,
              right: context.k_16,
              top: context.k_30,
            ),
          ],
        );

      case WidgetType.moreServices:
        return OurServices(
          item: dashBoardItem,
        ).paddingBySide(
          top: context.k_48,
        );

      case WidgetType.rewardBanner:
        return RepublicImageWithText(
          item: dashBoardItem,
        );
      case WidgetType.homeTileWidget:
        return HomeTilesItem(
          data: dashBoardItem,
          onTapHandler: (value) => adShowBottomSheet(
            childWidget: RepublicTAndC(rewardTAndC: rewardTerms),
            context: context,
            headerTitle: 'Term and Conditions',
          ),
        ).paddingBySide(
          top: context.k_20,
        );
      case WidgetType.exploreServices:
        return ADSizedBox(
          width: context.widthOfScreen,
          height: context.k_48,
          child: ElevatedButton(
            onPressed: () => {
              Navigator.pop(context),
            },
            style: ElevatedButton.styleFrom(
              primary: context.adColors.blueColor,
              shape: const StadiumBorder(),
            ),
            child: Text(
              'explore_services'.localize(context),
              style: ADTextStyle700.size18.setTextColor(
                context.adColors.whiteTextColor,
              ),
            ),
          ),
        ).paddingBySide(
          left: context.k_16,
          right: context.k_16,
          top: context.k_30,
        );

      default:
        return const SizedBox.shrink();
    }
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.onTapHandler,
    required this.isCenterText,
    required this.isBorder,
    required this.item,
    required this.itemWidth,
    required this.subItemMargin,
    required this.radius,
    required this.aspectRatio,
    this.fit,
  }) : super(key: key);

  final ADTapCallbackWithValue? onTapHandler;

  final bool isCenterText;
  final bool isBorder;
  final BoxFit? fit;
  final DutyFreeItem item;
  final double itemWidth;
  final ItemMargin? subItemMargin;
  final double? radius;
  final double aspectRatio;

  ///Select airport fist in case of Adani one for dutyfree or pranaam flow
  void selectAirport(BuildContext context) {
    BottomSheetUtils.showBottomSheetDialog(
      context,
      ADDraggableScrollableBottomSheet(
        initialChildSize: BottomSheetUtils.getBottomSheetHeightRatio(context),
        childWidget: SliverAppBarBottomSheet(
          body: AirportsListScreen(
            airportsData:
                context.read<AirportListStateManagement>().airportData,
          ),
          title: 'select_airport'.localize(context),
          flexibleTitleBottomPadding: context.k_2,
        ),
      ),
    ).then((value) {
      if (value != null) {
        final AirportItemModel selectedAirportsData = value;
        context
            .read<AirportListStateManagement>()
            .updateData(selectedAirportsData, context);
      }
    });
  }

  void navigateRouteBasedOnType(int? objectID, BuildContext context) {
    switch (objectID) {
      case flightBookingFlag:
        navigateToScreenUsingNamedRoute(
          context,
          flightBooking,
        );
        break;
      case dutyFree:
        if (selectedAirportsData?.airportPrefixName?.isNullOrEmpty ?? false) {
          selectAirport(context);
        } else {
          navigateToScreenUsingNamedRoute(
            context,
            dutyFreeScreen,
            rootNavigator: false,
          );
        }
        break;
      case pranaamServiceId:
        if (selectedAirportsData?.airportPrefixName?.isNullOrEmpty ?? false) {
          selectAirport(context);
        } else {
          navigateToScreenUsingNamedRoute(
            context,
            pranaamService,
            rootNavigator: false,
          );
        }
        break;
      case cabBookingFlag:
        navigateToScreenUsingNamedRoute(
          context,
          cabBookingHomeScreen,
          rootNavigator: false,
        );
        break;
    }
  }

  void navigateToStaticSPage(
    BuildContext context,
    DutyFreeItem? item,
  ) {
    final WebViewModel model = WebViewModel(
      title: (item?.title.isNotEmpty ?? false) &&
              item?.widgetType != WidgetType.moreServices.name
          ? item?.title ?? ''
          : 'services'.localize(context),
      url:
          '${item?.ctaUrl ?? ''}&app_id=${ProfileSingleton.profileSingleton.appInstanceId}',
    );
    if (model.url.isNotEmpty) {
      navigateToScreenUsingNamedRouteWithArguments(
        context,
        webViewContainer,
        argumentObject: model,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: () => {
        if (item.promoCode.isNotEmpty)
          {
            navigateToScreenUsingNamedRouteWithArguments(
              context,
              offerDetail,
              rootNavigator: false,
              argumentObject: OfferKeyModel(
                id: item.promoCode,
                title: item.title,
              ),
            ),
          }
        else if (item.uniqueId.isNotEmpty)
          {
            navigateRouteBasedOnType(int.parse(item.uniqueId), context),
          }
        else
          {
            navigateToStaticSPage(
              context,
              item,
            ),
          },
      },
      child: Container(
        width: itemWidth,
        decoration: isBorder
            ? BoxDecoration(
                border: Border.all(
                  color: context.adColors.boxShadowColor,
                ),
                borderRadius: BorderRadius.circular(
                  radius?.sp ?? 0,
                ),
              )
            : null,
        child: ClipRRect(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          borderRadius: BorderRadius.circular(
            radius?.sp ?? 0,
          ),
          child: Opacity(
            opacity: (item.disableForAirport) ? opacity : 1,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                item.disableForAirport
                    ? const Color(greyBorder).withOpacity(1)
                    : Colors.transparent, // 0 = Colored, 1 = Black & White
                BlendMode.saturation,
              ),
              child: Container(
                color: context.adColors.transparentColor,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ADCachedImage(
                      imageUrl: item.imageSrc,
                      boxFit: fit ?? BoxFit.fill,
                    ),
                    if (isCenterText)
                      Center(
                        child: Container(
                          padding: EdgeInsets.only(
                            left: context.k_24,
                            right: context.k_24,
                            top: context.k_16,
                            bottom: context.k_16,
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                            color: context.adColors.whiteTextColor,
                          ),
                          child: Text(
                            item.title,
                            style: ADTextStyle500.size14
                                .setTextColor(
                                  context.adColors.blackTextColor,
                                )
                                .copyWith(fontSize: fifteenFontSize),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
