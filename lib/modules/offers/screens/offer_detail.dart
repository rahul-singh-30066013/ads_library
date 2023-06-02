/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:math';

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/models/web_view_model.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/custom_tab_scaffold.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/home_bottom_assets.dart';
import 'package:adani_airport_mobile/modules/components/sliver_app_bar_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/airport_item_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/dashboard/airports_list_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/airport_list_state_management.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/bottom_sheet_utils.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/loyalty/utils/constants/widget_type_enum.dart';
import 'package:adani_airport_mobile/modules/offers/model/offer_dashboard_response.dart';
import 'package:adani_airport_mobile/modules/offers/screens/offer_item_detail.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/ga_helper/ga_event.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_draggable_scrollable_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

const double bannerHeight = 170;
const Color containerBackgroundColor = Color(0xff0D67CA);
const double opacity = 0.07;
const double spacing = 1.6;
const double topPadding = 5;
const double zeroPoint44 = 0.44;

class OfferDetail extends StatefulWidget {
  final WidgetItem item;
  final bool isComingFromSheet;
  final bool showBookNowButton;
  final bool fetchDataFromPromoCode;

  const OfferDetail({
    Key? key,
    required this.item,
    this.isComingFromSheet = false,
    this.showBookNowButton = true,
    this.fetchDataFromPromoCode = false,
  }) : super(key: key);

  @override
  State<OfferDetail> createState() => _OfferDetailState();
}

class _OfferDetailState extends State<OfferDetail> {
  bool isShowEnabled = false;
  bool isShowRedeemed = false;
  final maxItems = 3;

  @override
  void initState() {
    super.initState();
  }

  bool isCouponExpired(String date) {
    final newDateTimeObj2 = DateFormat(Constant.dateFormat16).parse(date);
    return newDateTimeObj2.isAfter(DateTime.now());
  }

  String dateFormatter(String dateTime) {
    final newDateTimeObj2 = DateFormat(Constant.dateFormat16).parse(dateTime);
    return DateFormat(Constant.dateFormat20).format(newDateTimeObj2).toString();
  }

  void navigateRouteBasedOnType(WidgetItem widgetItem, BuildContext context) {
    ///GA event when user click on book now
    final map = GaEvent.getInstance().parameterMap;
    map[Parameters.category.name] = widgetItem.promotionType;
    map[Parameters.label.name] = widgetItem.title;
    map[Parameters.date.name] = !widgetItem.isExpired
        ? dateFormatter(widgetItem.effectiveTo)
        : 'Expired';
    map[Parameters.coupon.name] = widgetItem.promotionCode;
    ClickEvents.offers_book_now_select.logEvent(parameters: map);

    switch (PromotionTypeEnum.values
        .byName(widgetItem.promotionType.toLowerCase().replaceAll(' ', ''))) {
      case PromotionTypeEnum.flightbooking:
        navigateToScreenUsingNamedRoute(
          context,
          flightBooking,
        );
        break;
      case PromotionTypeEnum.dutyfree:
        if (selectedAirportsData?.airportPrefixName?.isNullOrEmpty ?? false) {
          selectAirport(
            context,
            PromotionTypeEnum.dutyfree,
          );
        } else {
          if (widget.item.offerServicesRedirectionLink.isNotEmpty) {
            redirectToServices(widget.item.offerServicesRedirectionLink);
          } else {
            navigateToScreenUsingNamedRoute(
              context,
              dutyFreeScreen,
              rootNavigator: false,
            );
          }
        }
        break;
      case PromotionTypeEnum.pranaam:
        if (selectedAirportsData?.airportPrefixName?.isNullOrEmpty ?? false) {
          selectAirport(
            context,
            PromotionTypeEnum.pranaam,
          );
        } else {
          if (widget.item.offerServicesRedirectionLink.isNotEmpty) {
            redirectToServices(widget.item.offerServicesRedirectionLink);
          } else {
            navigateToScreenUsingNamedRoute(
              context,
              pranaamService,
              rootNavigator: false,
            );
          }
        }
        break;
      case PromotionTypeEnum.instoreoffer:
        break;
      case PromotionTypeEnum.cabbooking:
        if (selectedAirportsData?.airportPrefixName?.isNullOrEmpty ?? false) {
          selectAirport(
            context,
            PromotionTypeEnum.cabbooking,
          );
        } else {
          if (widget.item.offerServicesRedirectionLink.isNotEmpty) {
            redirectToServices(widget.item.offerServicesRedirectionLink);
          } else {
            navigateToScreenUsingNamedRoute(
              context,
              cabBookingHomeScreen,
              rootNavigator: false,
            );
          }
        }
        break;
    }
  }

  void navigateToOfferDashboardScreen() {
    Navigator.pop(context);
    final CustomTabScaffold customTabScaffold =
        BottomBarState.key.currentWidget as CustomTabScaffold;
    final GlobalKey<NavigatorState> navigatorState =
        HomeBottomAssets.homeBottomPages.keys.toList()[4];
    customTabScaffold.controller?.index = context.k_4.toInt();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        navigatorState.currentState
            ?.pushNamedAndRemoveUntil(
              offersDashboard,
              (route) => route.isFirst,
            )
            .then(
              (value) => adLog(
                value?.toString(),
              ),
            );
      },
    );
  }

  void redirectToServices(String ctaUrl) {
    String url = ctaUrl;
    if (!url.contains('http')) {
      url = url.substring(1, url.length);
      url = '${Environment.instance.configuration.webBaseUrl}$url?isapp=true';
    }
    final WebViewModel model = WebViewModel(
      title: 'services'.localize(context),
      url: url,
    );
    if (model.url.isNotEmpty) {
      navigateToScreenUsingNamedRouteWithArguments(
        context,
        webViewContainer,
        argumentObject: model,
      );
    }
  }

  ///Select airport fist in case of Adani one for dutyfree or pranaam flow
  void selectAirport(
    BuildContext context,
    PromotionTypeEnum byName,
  ) {
    BottomSheetUtils.showBottomSheetDialog(
      context,
      ADDraggableScrollableBottomSheet(
        initialChildSize: BottomSheetUtils.getBottomSheetHeightRatio(context),
        childWidget: SliverAppBarBottomSheet(
          body: AirportsListScreen(
            airportsData:
                context.read<AirportListStateManagement>().airportData,
            availableAirportsBasedOnLob: byName == PromotionTypeEnum.pranaam
                ? ServicesEnum.pranaam.name.toString()
                : (byName == PromotionTypeEnum.dutyfree
                    ? ServicesEnum.dutyfree.name.toString()
                    : ServicesEnum.cabbooking.name.toString()),
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

        navigateToScreenUsingNamedRoute(
          context,
          byName == PromotionTypeEnum.pranaam
              ? pranaamService
              : (byName == PromotionTypeEnum.dutyfree
                  ? dutyFreeScreen
                  : cabBookingHomeScreen),
          rootNavigator: false,
        );
      }
    });
  }

  void showMoreButtonAction() {
    setState(() {
      isShowEnabled = !isShowEnabled;

      ///GA event when user click on view all t&c
      if (isShowEnabled) {
        final map = GaEvent.getInstance().parameterMap;
        map[Parameters.category.name] = widget.item.promotionType;
        map[Parameters.source.name] = 'offer_dashboard_main_screen';
        ClickEvents.view_offers_tnc.logEvent(parameters: map);
      }
    });
  }

  void showMoreRemmedButtonAction() {
    setState(() {
      isShowRedeemed = !isShowRedeemed;
    });
  }

  @override
  Widget build(BuildContext context) {
    String imageUrl = '';
    if (widget.item.bannerImageMobSrc.isNotEmpty) {
      if (!widget.item.bannerImageMobSrc.contains('https')) {
        String url = widget.item.bannerImageMobSrc;
        if (widget.item.bannerImageMobSrc.contains('/sitecore/shell')) {
          url = widget.item.bannerImageMobSrc.replaceAll('/sitecore/shell', '');
        }
        imageUrl = '${Environment.instance.configuration.cmsImageBaseUrl}$url';
      } else {
        imageUrl = widget.item.bannerImageMobSrc;
      }
    }

    String buttonText = widget.item.linkText;
    if (widget.item.linkText.isNullOrEmpty) {
      buttonText = widget.item.deepLinkAlt;
    }
    final List<String> rewardText =
        widget.item.promotionDescription.isNotEmpty &&
                widget.item.promotionDescription.contains('#')
            ? widget.item.promotionDescription.split('#')
            : [];

    String tncViewAllLink = widget.item.tncViewAllLink;

    return Scaffold(
      body: ListView(
        children: [
          if (widget.item.bannerImageMobSrc.isNotEmpty)
            Container(
              height: context.widthOfScreen * zeroPoint44,
              width: context.widthOfScreen,
              color: context.adColors.containerGreyBg,
              child: ADCachedImage(
                imageUrl: imageUrl,
              ),
            ).paddingBySide(
              bottom: context.k_16,
              top: widget.isComingFromSheet ? context.k_20 : 0,
            ),
          Text(
            'about_the_offer'.localize(context),
            style: ADTextStyle700.size22.setTextColor(context.adColors.black),
            maxLines: 1,
          ).paddingBySide(left: context.k_16, top: context.k_14),
          if (!widget.item.isInstoreOffer && widget.item.similarOffers.isEmpty)
            Container(
              decoration: BoxDecoration(
                color: containerBackgroundColor.withOpacity(opacity),
                borderRadius: BorderRadius.circular(
                  context.k_10,
                ),
              ),
              margin: EdgeInsets.only(
                left: context.k_16,
                right: context.k_16,
                top: context.k_20,
              ),
              width: context.widthOfScreen,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.item.promotionCode.isNotEmpty)
                    OfferItemDetail(
                      item: widget.item.promotionCode,
                      headerValue: 'Coupon Code',
                      image: SvgAssets.couponCode,
                      isCouponView: true,
                    ).paddingBySide(top: context.k_10, bottom: context.k_10),
                  if (widget.item.savings.isNotEmpty)
                    OfferItemDetail(
                      item: widget.item.savings,
                      image: SvgAssets.savings,
                      headerValue: 'Savings',
                    ).paddingBySide(top: context.k_10, bottom: context.k_10),
                  OfferItemDetail(
                    item: (!widget.item.isExpired &&
                            isCouponExpired(widget.item.effectiveTo))
                        ? dateFormatter(widget.item.effectiveTo)
                        : 'Expired',
                    image: SvgAssets.validUpto,
                    headerValue: 'Valid Upto',
                  ),
                  const Divider(
                    height: 1,
                  ).paddingBySide(
                    top: widget.item.promotionCode.isEmpty ||
                            widget.item.savings.isEmpty
                        ? context.k_20
                        : context.k_10,
                    left: context.k_16,
                    right: context.k_16,
                    bottom: context.k_10,
                  ),
                  if (rewardText.isNotEmpty)
                    Text.rich(
                      TextSpan(
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                        text: rewardText.first,
                        // default text style
                        children: <TextSpan>[
                          TextSpan(
                            text: rewardText[1],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: rewardText.last,
                            style:
                                const TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ).paddingBySide(
                      top: context.k_10,
                      left: context.k_16,
                      right: context.k_16,
                      bottom: widget.item.isExpired ||
                              isCouponExpired(widget.item.effectiveTo)
                          ? context.k_10
                          : context.k_20,
                    ),
                  if (rewardText.isEmpty &&
                      widget.item.promotionDescription.isNotEmpty)
                    Text(
                      widget.isComingFromSheet
                          ? widget.item.bookingConfirmedOfferDescription
                          : widget.item.promotionDescription,
                      style: ADTextStyle400.size16
                          .setTextColor(context.adColors.black),
                    ).paddingBySide(
                      top: context.k_10,
                      left: context.k_16,
                      right: context.k_16,
                      bottom: widget.item.isExpired ||
                              isCouponExpired(widget.item.effectiveTo)
                          ? context.k_10
                          : context.k_20,
                    ),
                  if (!buttonText.isNullOrEmpty && widget.showBookNowButton)
                    ElevatedButton(
                      onPressed: () => !widget.isComingFromSheet
                          ? widget.item.isExpired
                              ? navigateToOfferDashboardScreen()
                              : navigateRouteBasedOnType(widget.item, context)
                          : redirectToServices(
                              widget.item.unlockOfferCTAVisitWesiteLink,
                            ),
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        padding: EdgeInsets.only(
                          left: context.k_32,
                          right: context.k_32,
                          top: context.k_12,
                          bottom: context.k_12,
                        ),
                      ),
                      child: Text(
                        widget.isComingFromSheet
                            ? widget.item.unlockOfferCTAVisitWesiteText
                            : buttonText,
                        style: ADTextStyle600.size16
                            .setTextColor(context.adColors.whiteTextColor),
                      ),
                    ).paddingBySide(
                      top: context.k_10,
                      left: context.k_16,
                      bottom: context.k_20,
                    ),
                ],
              ),
            ),
          if (widget.item.isInstoreOffer &&
              widget.item.similarOffers.isNotEmpty)
            Container(
              decoration: BoxDecoration(
                color: containerBackgroundColor.withOpacity(opacity),
                borderRadius: BorderRadius.circular(
                  context.k_10,
                ),
              ),
              margin: EdgeInsets.only(
                left: context.k_16,
                right: context.k_16,
                top: context.k_20,
              ),
              width: context.widthOfScreen,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: widget.item.similarOffers.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(
                    widget.item.similarOffers[index],
                    style: ADTextStyle400.size16
                        .setTextColor(context.adColors.black)
                        .copyWith(height: spacing),
                  ).paddingBySide(right: context.k_8, top: topPadding);
                },
              ).paddingBySide(
                left: context.k_16,
                right: context.k_16,
                top: context.k_16,
                bottom: context.k_16,
              ),
            ),
          if (widget.item.howToUse.isNotEmpty)
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: isShowRedeemed
                  ? widget.item.howToUse.length
                  : min(
                      widget.item.howToUse.length,
                      maxItems,
                    ),
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${index + 1}.',
                      style: ADTextStyle500.size16
                          .setTextColor(context.adColors.black),
                    ).paddingBySide(right: context.k_8, top: topPadding),
                    Expanded(
                      child: Text(
                        widget.item.howToUse[index],
                        style: ADTextStyle400.size16
                            .setTextColor(context.adColors.black)
                            .copyWith(height: spacing),
                      ),
                    ),
                  ],
                ).paddingBySide(
                  bottom: context.k_10,
                );
              },
            ).paddingBySide(
              left: context.k_16,
              right: context.k_16,
            ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: isShowRedeemed
                ? widget.item.howToUse.length
                : min(
                    widget.item.howToUse.length,
                    maxItems,
                  ),
            itemBuilder: (BuildContext context, int index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${index + 1}.',
                    style: ADTextStyle500.size16
                        .setTextColor(context.adColors.black),
                  ).paddingBySide(right: context.k_8, top: topPadding),
                  Expanded(
                    child: Text(
                      widget.item.howToUse[index],
                      style: ADTextStyle400.size16
                          .setTextColor(context.adColors.black)
                          .copyWith(height: spacing),
                    ),
                  ),
                ],
              ).paddingBySide(
                bottom: context.k_10,
              );
            },
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
          ),
          if (widget.item.howToUse.length > maxItems)
            InkWell(
              onTap: () => {
                showMoreRemmedButtonAction(),
              },
              child: Text(
                isShowRedeemed
                    ? 'view_less'.localize(context)
                    : 'view_all'.localize(context),
                style: ADTextStyle500.size16
                    .setTextColor(context.adColors.black)
                    .copyWith(
                      decoration: TextDecoration.underline,
                    ),
              ).paddingBySide(
                top: context.k_12,
                left: context.k_16,
                bottom: context.k_16,
              ),
            ),
          if (widget.item.termCondition.isNotEmpty)
            Text(
              't_and_cs'.localize(context),
              style: ADTextStyle700.size22.setTextColor(context.adColors.black),
              maxLines: 1,
            ).paddingBySide(
              left: context.k_16,
              top: context.k_48,
              bottom: context.k_20,
            ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: isShowEnabled
                ? widget.item.termCondition.length
                : min(
                    widget.item.termCondition.length,
                    maxItems,
                  ),
            itemBuilder: (BuildContext context, int index) {
              final item = widget.item.termCondition[index];
              return GestureDetector(
                onTap: () => {
                  if (item == 'For more details, click here')
                    {
                      navigateToScreenUsingNamedRouteWithArguments(
                        context,
                        webViewContainer,
                        argumentObject: WebViewModel(
                          title: 'Term and Conditions',
                          url: widget.item.tcLinkUrl,
                        ),
                      ),
                    },
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${index + 1}.',
                      style: ADTextStyle500.size16
                          .setTextColor(context.adColors.black),
                    ).paddingBySide(right: context.k_8, top: topPadding),
                    Expanded(
                      child: item == 'For more details, click here'
                          ? RichText(
                              text: TextSpan(
                                text: 'For more details ',
                                style: ADTextStyle400.size16
                                    .setTextColor(context.adColors.black),
                                children: [
                                  TextSpan(
                                    text: 'click here',
                                    style: ADTextStyle500.size16
                                        .setTextColor(context.adColors.blue),
                                  ),
                                ],
                              ),
                            ).paddingBySide(top: topPadding)
                          : Text(
                              item,
                              style: ADTextStyle400.size16
                                  .setTextColor(context.adColors.black)
                                  .copyWith(height: spacing),
                            ),
                    ),
                  ],
                ).paddingBySide(
                  bottom: context.k_10,
                ),
              );
            },
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
          ),
          if (widget.item.termCondition.length > maxItems)
            InkWell(
              onTap: () => {
                if (widget.item.isInstoreOffer &&
                    widget.item.similarOffers.isNotEmpty)
                  {
                    if (tncViewAllLink.contains('/sitecore/shell'))
                      {
                        tncViewAllLink = widget.item.tncViewAllLink
                            .replaceAll('/sitecore/shell', ''),
                      },
                    Utils.launchAppUrl(
                      Uri.parse(
                        '${Environment.instance.configuration.webBaseUrl}$tncViewAllLink',
                      ),
                    ),
                  }
                else
                  {
                    showMoreButtonAction(),
                  },
              },
              child: Text(
                isShowEnabled
                    ? 'view_less'.localize(context)
                    : 'view_all'.localize(context),
                style: ADTextStyle500.size16
                    .setTextColor(context.adColors.black)
                    .copyWith(
                      decoration: TextDecoration.underline,
                    ),
              ).paddingBySide(
                top: context.k_12,
                left: context.k_16,
                bottom: context.k_16,
              ),
            ),
        ],
      ),
    );
  }
}
