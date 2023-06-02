/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/airport_landing_screen/dashboard_components/adani_mission_container.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/dashboard_components/airport_dashboard_story_view.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/dashboard_components/container_image_widget.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/dashboard_components/dashboard_covid_banner_view.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/dashboard_components/exclusive_partners_widget.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/dashboard_components/experience_airport_widget.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/dashboard_components/grid_services_tile_widget.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/dashboard_components/help_us_improve_widget.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/dashboard_components/home_tiles_item.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/dashboard_components/horizontal_product_slider.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/dashboard_components/image_with_text_list.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/dashboard_components/length_adjustable_widget.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/dashboard_components/more_services.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/dashboard_components/our_airports.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/dashboard_components/saved_flights_widget.dart';
import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/dashboard_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/deal_product_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/gradient_configuration.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/grid_configuration.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/duty_free_ad_banner_view.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/duty_free_ad_slider_view.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/duty_free_grid_view.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/duty_free_how_to_shop.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/duty_free_illustration.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/duty_free_new_in_electronics.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/duty_free_scroll_grid_view.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/views/duty_free_bags_card.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/views/duty_free_category_slider_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/views/duty_free_exclusive.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/views/image_with_text.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/views/tab_slider.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/views/tab_slider_background.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_age_confirmation.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/airport_item_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/dashboard/dynamic_video_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/dashboard/flight_banner_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/dashboard/widget_type.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/dashboard_view_model.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

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

const imageBackgroundColor = Color(0xffbebebe);

///TODO need to define in AdText
const double fifteenFontSize = 15;
const exclusiveOfferWidgetId = 11;

///this class is used to handle view of different type on dashboard
class HomeScreenDashBoardBuilder extends StatelessWidget {
  const HomeScreenDashBoardBuilder({
    Key? key,
    required this.dashBoardItem,
    this.onTapHandler,
    this.dashBoardViewModel,
  }) : super(key: key);
  final ADTapCallbackWithValue? onTapHandler;
  final DutyFreeDashboardItem dashBoardItem;
  final DashBoardViewModel? dashBoardViewModel;

  WidgetType getWidgetType(String value) {
    adLog('Widget typessss $value');
    switch (value) {
      case kOurAirports:
        return WidgetType.ourAirports;
      case kVideoView:
        return WidgetType.videoView;
      case kGridCircleTile:
        return WidgetType.gridCircleTile;
      case kGridScrollTile:
        return WidgetType.gridScrollTile;
      case kGridScrollTileWithBorder:
        return WidgetType.gridScrollTileWithBorder;
      case kNewInElectronics:
        return WidgetType.newInElectronics;
      case kHowToShop:
        return WidgetType.howToShop;
      case kSliderBanner_1dot2:
        return WidgetType.sliderBanner_1dot2;
      case kSliderBanner_2dot2:
        return WidgetType.sliderBanner_2dot2;
      case kSliderBanner_3dot2:
        return WidgetType.sliderBanner_3dot2;
      case kSliderBanner_4dot2:
        return WidgetType.sliderBanner_4dot2;
      case kSliderBanner_1dot2Text:
        return WidgetType.sliderBanner_1dot2Text;
      case kSliderBanner_1dot2WithBorder:
        return WidgetType.sliderBanner_1dot2WithBorder;
      case kSliderBanner_1dot2Pager:
        return WidgetType.sliderBanner_1dot2Pager;
      case kImageText:
        return WidgetType.imageWithText;
      case kBanner:
        return WidgetType.banner_1;
      case kBags:
        return WidgetType.bags;
      case kExclusiveProducts:
        return WidgetType.ExclusiveProducts;
      case kTabsSlider:
        return WidgetType.tabsSlider;
      case kTabsSliderBackground:
        return WidgetType.tabsSliderBackground;
      case kStoryView:
        return WidgetType.storyView;
      case kAdaniMissionBanner:
        return WidgetType.adaniMissionBanner;
      case kFlightBanner:
        return WidgetType.flightBanner;
      case kCovidBanner:
        return WidgetType.covidBanner;
      case kMoreServices:
        return WidgetType.moreServices;
      case kImageTextList:
        return WidgetType.imageTextList;
      case kExperienceAirportWidget:
        return WidgetType.experienceAirportWidget;
      case kExclusivePartnersWidget:
        return WidgetType.exclusivePartnersWidget;
      case kHorizontalProductSlider:
        return WidgetType.horizontalProductSlider;
      case kGridServicesTile:
        return WidgetType.gridServicesTile;
      case kHelpUsImproveWidget:
        return WidgetType.helpUsImproveWidget;
      case kSavedFlightWidget:
        return WidgetType.savedFlightWidget;
      case kHomeTileWidget:
        return WidgetType.homeTileWidget;
      case kGrid:
        return WidgetType.grid;
      case kImage:
        return WidgetType.image;
      case kDutyFreeIllustration:
        return WidgetType.dutyFreeIllustration;
      case kWeather:
        return WidgetType.weather;
      default:
        return WidgetType.pranaamPackage;
    }
  }

  @override
  Widget build(BuildContext context) {
    final widgetType = getWidgetType(dashBoardItem.widgetType ?? '');
    adLog('Dashboard Rebuild');
    switch (widgetType) {
      case WidgetType.savedFlightWidget:
        return SavedFlightsWidget(
          item: dashBoardItem,
          onTapHandler: (value) => _gridScrollTileAction(value, context),
        );
      case WidgetType.ourAirports:
        return OurAirports(
          item: dashBoardItem,
          onTapHandler: (value) => {
            (value as AirportItemModel).widgetType =
                dashBoardItem.widgetType.toString(),
            if (onTapHandler != null)
              onTapHandler?.call(value)
            else
              _onTapHandler(),
          },
        );
      case WidgetType.videoView:
        return DynamicVideoView(
          contentData: dashBoardItem,
          onTapHandler: (value) => _gridScrollTileAction(value, context),
        );
      case WidgetType.homeTileWidget:
        return HomeTilesItem(
          data: dashBoardItem,
          onTapHandler: (value) => _gridScrollTileAction(value, context),
        );
      case WidgetType.experienceAirportWidget:
        return ExperienceAirportWidget(
          item: dashBoardItem,
          onTapHandler: (value) => _gridScrollTileAction(value, context),
        );

      case WidgetType.exclusivePartnersWidget:
        return ExclusivePartnersWidget(
          item: dashBoardItem,
          onTapHandler: (value) => _gridScrollTileAction(value, context),
        );

      case WidgetType.moreServices:
        return MoreServices(
          item: dashBoardItem,
          onTapHandler: (value) => _gridScrollTileAction(value, context),
          themeEnabled:
              context.read<DutyFreeState>().airportData?.isTheme ?? false,
        );
      case WidgetType.covidBanner:
        return DashboardCovidBannerView(
          contentData: dashBoardItem,
          onTapHandler: (value) => _gridScrollTileAction(value, context),
        );
      case WidgetType.storyView:
        return AirportDashboardStoryView(dashboardItem: dashBoardItem);

      case WidgetType.adaniMissionBanner:
        return AdaniMissionContainer(
          onTapHandler: () => onTapHandler,
          titleText: dashBoardItem.widgetItems?.first.title ?? '',
          descriptionText: dashBoardItem.widgetItems?.first.description ?? '',
        ).paddingBySide(
          top: dashBoardItem.itemMargin?.top ?? context.k_26,
          bottom: dashBoardItem.itemMargin?.bottom ?? context.k_26,
        );
      case WidgetType.gridCircleTile:
        return DutyFreeGridView(
          contentData: dashBoardItem,
          children: (context, index) => DutyFreeCategorySliderItem(
            enableCircle: dashBoardItem.enableCircle,
            key: ValueKey(dashBoardItem.widgetItems?[index].title ?? ''),
            productImageUrl: dashBoardItem.widgetItems?[index].imageSrc,
            spaceBetweenIconAndText: context.k_8,
            categoryText: dashBoardItem.widgetItems?[index].title ?? '',
            onTapHandler: (key) => _gridCircleTileAction(
              dashBoardItem.widgetItems?[index],
              context,
            ),
          ),
        ); //Brand View
      case WidgetType.gridServicesTile:
        return GridServicesTileWidget(
          dashBoardItem: dashBoardItem,
          onTapHandler: (value) => _gridScrollTileAction(
            value,
            context,
          ),
        );
      case WidgetType.image:
        return GestureDetector(
          onTap: (dashBoardItem.widgetItems?.isNotEmpty ?? false)
              ? () => _onServiceTapHandler(dashBoardItem.widgetItems?.first)
              : null,
          child: ContainerImageWidget(dashBoardItem: dashBoardItem),
        );
      case WidgetType.grid:
        final GradientConfiguration? gradientConfiguration =
            dashBoardItem.gradientConfiguration;
        final GridConfiguration? gridConfiguration =
            dashBoardItem.gridConfiguration;
        return Container(
          decoration: Utils.getGradientBoxDecoration(
            gradientConfiguration,
            dashBoardItem.backgroundColor,
            ADColors.white,
          ),
          height: (gridConfiguration?.horizontalGrid ?? false)
              ? (((context.widthOfScreen /
                              (gridConfiguration?.itemVisibility ?? 1))
                          .floorToDouble() *
                      (dashBoardItem.aspectRatio ?? 1)) *
                  (dashBoardItem.gridColumn ?? 1))
              : null,
          child: GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.only(
              left: dashBoardItem.itemMargin?.left.sp ?? 0,
              top: dashBoardItem.itemMargin?.top.sp ?? 0,
              bottom: dashBoardItem.itemMargin?.bottom.sp ?? 0,
              right: dashBoardItem.itemMargin?.right.sp ?? 0,
            ),
            itemCount: dashBoardItem.widgetItems?.length ?? 0,
            scrollDirection: (gridConfiguration?.horizontalGrid ?? false)
                ? Axis.horizontal
                : Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: dashBoardItem.gridColumn ?? 1,
              childAspectRatio: dashBoardItem.aspectRatio ?? 1,
              crossAxisSpacing: (gridConfiguration?.crossAxisSpacing ?? 0).sp,
              mainAxisSpacing: (gridConfiguration?.mainAxisSpacing ?? 0).sp,
            ),
            itemBuilder: (context, index) => TouchableOpacity(
              onTap: () =>
                  onTapHandler?.call(dashBoardItem.widgetItems?[index]),
              child: ADCachedImage(
                // width: context.swidthOfScreen,
                // height: context.widthOfScreen * (dashBoardItem.aspectRatio ?? 1),
                imageUrl: dashBoardItem.widgetItems?[index].imageSrc ?? '',
                boxFit: BoxFit.contain,
              ),
            ),
          ),
        );
      case WidgetType.gridScrollTile:
      case WidgetType.gridScrollTileWithBorder:
        final width = 95.sp;
        const maxLines = 2;
        return Selector<DutyFreeState, bool>(
          selector: (_, dutyFreeState) => dutyFreeState.ageAbove25,
          builder: (_, isAgeAbove25, child) {
            final totalHeight = width +
                45.sp +
                (!isAgeAbove25 && dashBoardItem.widgetId != brandWidgetId
                    ? context.k_6
                    : (dashBoardItem.widgetId == brandWidgetId ? 10 : 0));
            return DutyFreeScrollGridView(
              content: dashBoardItem.copyWith(
                aspectRatio: totalHeight / width,
              ),
              containerHeight: (dashBoardItem.gridColumn ?? 1) * totalHeight +
                  ((dashBoardItem.gridColumn ?? 1) *
                      (dashBoardItem.subItemMargin?.top.sp ?? 0)),
              children: (context, index) {
                adLog('DutyFreeScrollGridView Build');
                return TouchableOpacity(
                  onTap: () => {
                    if (!(dashBoardItem.widgetItems?[index].disableForAirport ??
                        false))
                      {
                        if (dashBoardItem.widgetId == brandWidgetId)
                          _gridCircleTileAction(
                            dashBoardItem.widgetItems?[index],
                            context,
                          )
                        else
                          _gridScrollTileAction(
                            dashBoardItem.widgetItems?[index],
                            context,
                          ),
                      },
                  },
                  child: Column(
                    children: [
                      Container(
                        height: width +
                            ((dashBoardItem.widgetItems?[index].restricted ??
                                        false) &&
                                    !isAgeAbove25 &&
                                    dashBoardItem.widgetId != brandWidgetId
                                ? context.k_6
                                : 0),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Positioned(
                              top: 0,
                              child: Container(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                  shape: dashBoardItem.enableCircle
                                      ? BoxShape.circle
                                      : BoxShape.rectangle,
                                  border: widgetType ==
                                          WidgetType.gridScrollTileWithBorder
                                      ? Border.all(
                                          color: context.adColors
                                              .lightGreyGridSeparatorColor,
                                        )
                                      : null,
                                ),
                                height: width,
                                width: width,
                                child: dashBoardItem.enableCircle
                                    ? ClipOval(
                                        child: Opacity(
                                          opacity: (dashBoardItem
                                                      .widgetItems?[index]
                                                      .disableForAirport ??
                                                  false)
                                              ? opacity
                                              : 1,
                                          child: ColorFiltered(
                                            colorFilter: ColorFilter.mode(
                                              dashBoardItem.widgetItems?[index]
                                                          .disableForAirport ??
                                                      false
                                                  ? const Color(greyBorder)
                                                      .withOpacity(1)
                                                  : Colors.transparent,
                                              // 0 = Colored, 1 = Black & White
                                              BlendMode.saturation,
                                            ),
                                            child: ADCachedImage(
                                              height: width,
                                              width: width,
                                              imageUrl: dashBoardItem
                                                      .widgetItems?[index]
                                                      .imageSrc ??
                                                  '',
                                            ),
                                          ),
                                        ),
                                      )
                                    : Opacity(
                                        opacity: (dashBoardItem
                                                    .widgetItems?[index]
                                                    .disableForAirport ??
                                                false)
                                            ? opacity
                                            : 1,
                                        child: ColorFiltered(
                                          colorFilter: ColorFilter.mode(
                                            dashBoardItem.widgetItems?[index]
                                                        .disableForAirport ??
                                                    false
                                                ? const Color(greyBorder)
                                                    .withOpacity(1)
                                                : Colors.transparent,
                                            // 0 = Colored, 1 = Black & White
                                            BlendMode.saturation,
                                          ),
                                          child: ADCachedImage(
                                            height: width,
                                            width: width,
                                            imageUrl: dashBoardItem
                                                    .widgetItems?[index]
                                                    .imageSrc ??
                                                '',
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                            if ((dashBoardItem.widgetItems?[index].restricted ??
                                    false) &&
                                !isAgeAbove25 &&
                                dashBoardItem.widgetId != brandWidgetId)
                              Positioned(
                                bottom: -circleHeight,
                                child: Container(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    color: context.adColors.whiteTextColor,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: context
                                          .adColors.lightGreyGridSeparatorColor,
                                    ),
                                  ),
                                  padding: EdgeInsets.all(context.k_6),
                                  child: Container(
                                    height: context.k_16,
                                    width: context.k_16,
                                    child: SvgPicture.asset(
                                      'lib/assets/images/svg/icons/duty_free/Lock.svg',
                                      color: context.adColors.blackShade700,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      if (dashBoardItem.widgetItems?[index].title != null &&
                          (!(dashBoardItem.widgetItems?[index].restricted ??
                                  false) ||
                              isAgeAbove25 ||
                              dashBoardItem.widgetId == brandWidgetId))
                        const SizedBox(
                          height: 10,
                        ),
                      if (dashBoardItem.widgetItems?[index].title != null)
                        Text(
                          dashBoardItem.widgetItems?[index].title ?? '',
                          maxLines: maxLines,
                          overflow: TextOverflow.ellipsis,
                          style: ADTextStyle400.size14.copyWith(
                            color: const Color(0xff222222).withOpacity(
                              (dashBoardItem.widgetItems?[index]
                                          .disableForAirport ??
                                      false)
                                  ? opacity
                                  : 1,
                            ),
                            fontSize: fifteenFontSize,
                          ),
                          textAlign: TextAlign.center,
                        ).paddingBySide(top: context.k_4),
                    ],
                  ),
                );
              },
            );
          },
        );
      //Category View
      case WidgetType.newInElectronics:
        return DutyFreeNewInElectronics(
          // widgetHeight: dashBoardItem.widgetId == offersDiscountsWidgetId ||
          //         dashBoardItem.widgetId == exclusiveOfferWidgetId
          //     ? offersHeight
          //     : otherHeight,
          item: dashBoardItem,
          subTitle: dashBoardItem.widgetId == exclusiveOfferWidgetId
              ? 'book_now'.localize(context)
              : null,
          onTap: (value) => newInElectronicsClick(value, context),
          themeEnabled:
              context.read<DutyFreeState>().airportData?.isTheme ?? false,
        );
      case WidgetType.howToShop:
        return DutyFreeHowToShop(
          item: dashBoardItem,
          onTapHandler: onTapHandler,
        );
      case WidgetType.imageTextList:
        return ImageWithTextList(
          dutyFreeDashboardItem: dashBoardItem,
          onTapHandler: (value) => _gridScrollTileAction(value, context),
          themeEnabled:
              context.read<DutyFreeState>().airportData?.isTheme ?? false,
        );
      case WidgetType.imageWithText:
        return Container(
          decoration: Utils.getGradientBoxDecoration(
            dashBoardItem.gradientConfiguration,
            dashBoardItem.backgroundColor,
            ADColors.white,
          ),
          child: TouchableOpacity(
            onTap: () => _gridScrollTileAction(
              dashBoardItem.widgetItems?.first,
              context,
            ),
            child: ImageWithText(
              decoration: Utils.getGradientBoxDecoration(
                dashBoardItem.gradientConfiguration,
                dashBoardItem.backgroundColor,
                ADColors.white,
              ),
              titleColor: Color(
                int.tryParse(
                      dashBoardItem.subItemColors.titleColor,
                    ) ??
                    context.adColors.blackTextColor.value,
              ),
              backgroundColor: Color(
                int.tryParse(
                      dashBoardItem.subItemColors.backGroundColor,
                    ) ??
                    ADColors.white.value,
              ),
              descriptionColor: Color(
                int.tryParse(
                      dashBoardItem.subItemColors.descriptionColor,
                    ) ??
                    context.adColors.blackTextColor.value,
              ),
              ctaColor: Color(
                int.tryParse(
                      dashBoardItem.subItemColors.ctaColor,
                    ) ??
                    context.adColors.blackTextColor.value,
              ),
              tagName: dashBoardItem.widgetItems?.first.tagName,
              uniqueId: dashBoardItem.widgetItems?.first.uniqueId,
              ctaUrl: dashBoardItem.widgetItems?.first.ctaUrl,
              productImageUrl: dashBoardItem.widgetItems?.first.imageSrc ?? '',
              titleText: dashBoardItem.widgetItems?.first.title ?? '',
              descriptionText:
                  dashBoardItem.widgetItems?.first.description ?? '',
              aspectRatio: dashBoardItem.aspectRatio,
              paddingForTextContent: EdgeInsets.only(
                left: dashBoardItem.subItemMargin?.left.sp ?? 0,
                right: dashBoardItem.subItemMargin?.right.sp ?? 0,
                bottom: dashBoardItem.subItemMargin?.bottom.sp ?? 0,
              ),
              innerBorderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  context.scaled(
                    dashBoardItem.subItemRadius ?? 0,
                  ),
                ),
                topRight: Radius.circular(
                  context.scaled(
                    dashBoardItem.subItemRadius ?? 0,
                  ),
                ),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  context.scaled(
                    dashBoardItem.subItemRadius ?? 0,
                  ),
                ),
              ),
              outsidePadding: EdgeInsets.only(
                left: (dashBoardItem.itemMargin?.left.sp ?? 0) == 0
                    ? context.k_16
                    : dashBoardItem.itemMargin?.left.sp ?? 0,
                right: (dashBoardItem.itemMargin?.right.sp ?? 0) == 0
                    ? context.k_16
                    : dashBoardItem.itemMargin?.right.sp ?? 0,
                top: dashBoardItem.itemMargin?.top ?? 0.sp,
                bottom: dashBoardItem.itemMargin?.bottom ?? 0.sp,
              ),
            ),
          ),
        );
      case WidgetType.sliderBanner_1dot2:
      case WidgetType.sliderBanner_2dot2:
      case WidgetType.sliderBanner_3dot2:
      case WidgetType.sliderBanner_4dot2:
      case WidgetType.sliderBanner_1dot2Text:
      case WidgetType.sliderBanner_1dot2WithBorder:
      case WidgetType.sliderBanner_1dot2Pager:
        return DutyFreeADSliderView(
          contentData: dashBoardItem,
          sliderType: widgetType,
          itemBuilder: (BuildContext context, int index) {
            final data = (dashBoardItem.widgetItems ?? [])[index];
            final itemWidth = DutyFreeADSliderView.itemWidthBasedOnType(
              widgetType,
              dashBoardItem,
              context,
            );
            return /*widgetType == WidgetType.slider
                ? ImageWidget(
                    item: data,
                    itemWidth: itemWidth,
                    subItemMargin: dashBoardItem.subItemMargin,
                    radius: dashBoardItem.subItemRadius,
                  )
                :*/
                ImageWidget(
              aspectRatio: dashBoardItem.aspectRatio ?? 0,
              onTapHandler: (value) => _gridScrollTileAction(value, context),
              isCenterText: widgetType == WidgetType.sliderBanner_1dot2Text,
              isBorder: widgetType == WidgetType.sliderBanner_1dot2WithBorder,
              item: data,
              fit: BoxFit.fill,
              itemWidth: widgetType == WidgetType.sliderBanner_1dot2Pager
                  ? itemWidth * viewPagerViewportFraction
                  : itemWidth,
              subItemMargin: dashBoardItem.subItemMargin,
              radius: dashBoardItem.subItemRadius,
            ).paddingBySide(
              left:
                  index != 0 && widgetType == WidgetType.sliderBanner_1dot2Pager
                      ? ((dashBoardItem.subItemMargin?.left.sp ?? 0) / two)
                      : 0,
              right: index != ((dashBoardItem.widgetItems?.length ?? 0) - 1) &&
                      widgetType == WidgetType.sliderBanner_1dot2Pager
                  ? ((dashBoardItem.subItemMargin?.left.sp ?? 0) / two)
                  : 0,
            );
          },
        );
      // case WidgetType.slider:
      //   return DutyFreeADSliderView(
      //     contentData: dashBoardItem,
      //     sliderType: widgetType,
      //     itemBuilder: (BuildContext context, int index) {
      //       final data = (dashBoardItem.widgetItems ?? [])[index];
      //       return ImageWidget(
      //         item: data,
      //         itemWidth: context.widthOfScreen,
      //         subItemMargin: dashBoardItem.subItemMargin,
      //         radius: dashBoardItem.subItemRadius,
      //       );
      //     },
      //   );
      case WidgetType.banner_1:
        return DutyFreeADBannerView(
          bannerType: WidgetType.banner_1,
          contentData: dashBoardItem,
          onTapHandler: (value) =>
              _gridScrollTileAction(dashBoardItem.widgetItems?.first, context),
        );
      case WidgetType.horizontalProductSlider:
        return HorizontalProductSlider(dutyFreeDashboardItem: dashBoardItem);
      case WidgetType.tabsSlider:
        return TabSlider(dutyFreeDashboardItem: dashBoardItem);
      case WidgetType.tabsSliderBackground:
        return TabSliderBackground(dutyFreeDashboardItem: dashBoardItem);
      case WidgetType.bags:
        return DutyFreeBagsCard(
          dutyFreeDashboardItem: dashBoardItem,
        );
      case WidgetType.ExclusiveProducts:
        return DutyFreeExclusive(
          dutyFreeDashboardItem: dashBoardItem,
        );
      case WidgetType.flightBanner:
        return FlightBannerView(
          contentData: dashBoardItem,
          onTapHandler: (value) =>
              _gridScrollTileAction(dashBoardItem.widgetItems?.first, context),
        );
      case WidgetType.dutyFreeIllustration:
        return DutyFreeIllustration(
          contentData: dashBoardItem,
        );
      case WidgetType.helpUsImproveWidget:
        return HelpUsImproveWidget(
          contentData: dashBoardItem,
          onTapHandler: (value) => _gridScrollTileAction(value, context),
        );
      case WidgetType.weather:
        return LengthAdjustableWidget(
          dutyFreeDashboardItem: dashBoardItem,
          onTapHandler: _gridScrollTileAction,
        );
      default:
        return const SizedBox.shrink();
    }
  }

// void _onCategoryTapHandler(DutyFreeItem? data) {
//   print('brands you love');
//   final detail = TapDetail(
//     objectID: 0,
//     name: dashBoardItem.widgetType ?? '',
//     code: data?.code,
//     subItem: data,
//   );
//   print(detail.name);
//   onTapHandler != null ? onTapHandler?.call(detail) : _onTapHandler();
// }

  void _gridScrollTileAction(DutyFreeItem? data, BuildContext context) {
    if ((data?.uniqueId ?? '').isNotEmpty || (data?.ctaUrl ?? '').isNotEmpty) {
      _onServiceTapHandler(data);
    } else {
      /// first index item
      if ((data?.restricted ?? false) &&
          !context.read<DutyFreeState>().ageAbove25) {
        if ((selectedAirportsData?.dutyFreeAgeLimit ?? 0) > 0) {
          final bottomSheet = showModalBottomSheet(
            useRootNavigator: true,
            backgroundColor: context.adColors.whiteTextColor,
            elevation: context.k_8,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(context.k_22),
              ),
            ),
            context: context,
            builder: (dialogContext) {
              return DutyFreeAgeConfirmation(
                detailString: 'age_confirmation_message'
                    .localize(context)
                    .replaceAll(
                      '#1',
                      (selectedAirportsData?.dutyFreeAgeLimit ?? 0).toString(),
                    ),
                titleString: 'age_confirmation'.localize(context),
                yesCallBack: () => reloadDashboard(
                  context,
                  dialogContext,
                  dashBoardViewModel ?? DashBoardViewModel(),
                  isAgeAbove25: true,
                  data: data,
                ),
                noCallBack: () => reloadDashboard(
                  context,
                  dialogContext,
                  dashBoardViewModel ?? DashBoardViewModel(),
                  isAgeAbove25: false,
                  data: data,
                ),
              );
            },
          );
          adLog(bottomSheet.toString());
        } else {
          navigateToCatalogListPage(
            context,
            args: [data?.code ?? '', data?.deepLink ?? ''],
          );
        }
      } else {
        context.read<DutyFreeState>()
          ..setFilters(
            data: data?.copyWith(
              materialGroup: data.code,
            ),
          )
          ..catalogListTitle = data?.title ?? '';
        if (_isRequiredParamsNotEmpty(data)) {
          navigateToCatalogListPage(
            context,
            args: [data?.code ?? '', data?.deepLink ?? ''],
          );
        }
      }
      context
          .read<DutyFreeState>()
          .dutyFreeEventState
          .dashBoardCategoryItemEvent(data?.code ?? '');
    }
  }

  void newInElectronicsClick(int value, BuildContext context) {
    if (((dashBoardItem.widgetItems?[value].uniqueId.isNotEmpty ?? false) ||
            (dashBoardItem.widgetItems?[value].ctaUrl.isNotEmpty ?? false)) &&
        (dashBoardItem.widgetItems?[value].materialGroup.isEmpty ?? true) &&
        (dashBoardItem.widgetItems?[value].skuCode.isEmpty ?? true) &&
        (dashBoardItem.widgetItems?[value].deepLink.isEmpty ?? true)) {
      _gridScrollTileAction(
        dashBoardItem.widgetItems?[value],
        context,
      );
    } else {
      if ((dashBoardItem.widgetItems?[value].skuCode.isNotEmpty ?? false) ||
          (dashBoardItem.widgetItems?[value].deepLink.isNotEmpty ?? false)) {
        if (dashBoardItem.widgetItems?[value].deepLink.isNotEmpty ?? false) {
          context.read<DutyFreeState>().catalogListTitle =
              dashBoardItem.widgetItems?[value].title ?? '';
          navigateToScreenUsingNamedRouteWithArguments(
            context,
            dutyFreeCatalogScreen,
            rootNavigator: false,
            argumentObject: [
              dashBoardItem.widgetItems?[value].materialGroup ?? '',
              dashBoardItem.widgetItems?[value].deepLink ?? '',
            ],
          );
        } else {
          navigateToScreenUsingNamedRouteWithArguments(
            context,
            productDetailDutyFreeScreen,
            rootNavigator: false,
            argumentObject: DealProductModel(
              catalogType: dashBoardItem.widgetItems?[value].materialGroup,
              skuCode: dashBoardItem.widgetItems?[value].skuCode,
              timeStamp: '',
              deepLink: dashBoardItem.widgetItems?[value].deepLink,
            ),
          );
        }
      } else {
        _actionCatSubCat(dashBoardItem.widgetItems?[value], context);
      }
    }
  }

  void _onServiceTapHandler(DutyFreeItem? data) {
    /*  final detail = TapDetail(
      objectID: data?.uniqueId.isNotEmpty == true
          ? int.parse(data?.uniqueId ?? '0')
          : 1000,
      name: dashBoardItem.widgetType ?? '',
      subItem: data,
    );*/
    onTapHandler != null
        ? onTapHandler?.call(
            data?.copyWith(
              widgetType: dashBoardItem.widgetType.toString(),
            ),
          )
        : _onTapHandler();
  }

  void _onTapHandler() {
    ///TODO
  }
}

bool _isRequiredParamsNotEmpty(DutyFreeItem? data) {
  return (data?.materialGroup.isNotEmpty ?? false) ||
      (data?.subCategory.isNotEmpty ?? false) ||
      (data?.category.isNotEmpty ?? false) ||
      (data?.brand.isNotEmpty ?? false) ||
      (data?.code.isNotEmpty ?? false) ||
      (data?.deepLink.isNotEmpty ?? false);
}

void navigateToCatalogListPage(BuildContext context, {List<String>? args}) {
  navigateToScreenUsingNamedRouteWithArguments(
    context,
    dutyFreeCatalogScreen,
    rootNavigator: false,
    argumentObject: args,
  );
}

void navigateToCatalogListPageViaDeeplink(
  BuildContext context, {
  List<String>? args,
}) {
  navigateToScreenUsingNamedRouteWithArguments(
    context,
    dutyFreeCatalogScreen,
    rootNavigator: false,
    argumentObject: args,
  );
}

/// common action passing cateogory, Subcategory,
void _actionCatSubCat(DutyFreeItem? data, BuildContext context) {
  context.read<DutyFreeState>()
    ..materialGroupCode = data?.materialGroup ?? ''
    ..setFilters(
      data: data,
    )
    ..catalogListTitle = data?.title ?? ''
    ..dutyFreeEventState.viewBannerEvent(data ?? DutyFreeItem());

  // if ((data?.category ?? '').isNotEmpty) {
  //   final Map<String, List<String>> categoryMap = {};
  //   if ((data?.category ?? '').isNotEmpty) {
  //     categoryMap[data?.category ?? ''] = List.empty(growable: true)
  //       ..add(data?.subCategory ?? '')
  //       ..removeWhere((element) => element.isEmpty);
  //   }
  //   dutyFreeState.appliedFilterMap['category'] = categoryMap;
  //   // context.read<DutyFreeState>().appliedFilterMap[(data?.category ?? '')] =
  //   //     (data?.subCategory ?? '').isNotEmpty
  //   //         ? [
  //   //             (data?.subCategory ?? ''),
  //   //           ]
  //   //         : [];
  //   // context.read<DutyFreeState>().addedCategoryMap[(data?.category ?? '')] =
  //   //     (data?.subCategory ?? '').isNotEmpty
  //   //         ? [
  //   //             (data?.subCategory ?? ''),
  //   //           ]
  //   //         : [];
  // }
  if (_isRequiredParamsNotEmpty(data)) {
    navigateToCatalogListPage(
      context,
      args: [data?.materialGroup ?? '', data?.deepLink ?? ''],
    );
  } else if (data?.skuCode.isNotEmpty ?? false) {
    navigateToScreenUsingNamedRouteWithArguments(
      context,
      productDetailDutyFreeScreen,
      argumentObject: DealProductModel(
        catalogType: data?.materialGroup,
        skuCode: data?.skuCode,
        timeStamp: '',
        deepLink: data?.deepLink,
      ),
    );
  }
}

/// Brands you love Action
void _gridCircleTileAction(DutyFreeItem? data, BuildContext context) {
  context.read<DutyFreeState>().setFilters(
        data: data?.copyWith(brand: data.code),
      );
  context.read<DutyFreeState>().catalogListTitle = data?.title ?? '';
  if (_isRequiredParamsNotEmpty(data)) {
    navigateToCatalogListPage(
      context,
      args: [data?.materialGroup ?? '', data?.deepLink ?? ''],
    );
  }
}

void reloadDashboard(
  BuildContext context,
  BuildContext dialogContext,
  DashBoardViewModel dashBoardViewModel, {
  required bool isAgeAbove25,
  required DutyFreeItem? data,
}) {
  context.read<DutyFreeState>().ageAbove25 = isAgeAbove25;
  navigatorPopScreen(
    dialogContext,
  );
  if (isAgeAbove25) {
    dashBoardViewModel
      ..dashBoardState = ADResponseState.loading()
      ..notifyListeners()
      ..getDutyFreeDashBoardData(
        isAgeAbove25: context.read<DutyFreeState>().ageAbove25,
        storeType: context
            .read<DutyFreeState>()
            .terminalModel
            .value
            .code
            .toLowerCase(),
      );
    context.read<DutyFreeState>()
      ..resetParams()
      ..materialGroupCode = data?.code ?? ''
      ..catalogListTitle = data?.title ?? ''
      ..dutyFreeEventState.ageConfirmationEvent(isAgeAbove: isAgeAbove25);

    if (_isRequiredParamsNotEmpty(data)) {
      navigateToCatalogListPage(
        context,
        args: [data?.code ?? '', data?.deepLink ?? ''],
      );
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

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: () => {
        if (!item.disableForAirport)
          {
            if ((item.uniqueId).isNotEmpty || (item.ctaUrl).isNotEmpty)
              {
                onTapHandler?.call(item),
              }
            else
              {
                _actionCatSubCat(
                  item,
                  context,
                ),
              },
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

class GradientAlignment {
  static const topLeft = 'topLeft';
  static const topCenter = 'topCenter';
  static const topRight = 'topRight';
  static const centerLeft = 'centerLeft';
  static const center = 'center';
  static const centerRight = 'centerRight';
  static const bottomLeft = 'bottomLeft';
  static const bottomCenter = 'bottomCenter';
  static const bottomRight = 'bottomRight';
}
