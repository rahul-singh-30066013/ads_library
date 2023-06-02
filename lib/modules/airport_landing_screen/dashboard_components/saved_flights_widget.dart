/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/airport_list_state_management.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_common_state.dart';
import 'package:adani_airport_mobile/modules/flight_status/screens/saved_flights/views/saved_flight_tile.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:visibility_detector/visibility_detector.dart';

///this class is used to handle new Electronic Type View
class SavedFlightsWidget extends StatelessWidget {
  const SavedFlightsWidget({
    Key? key,
    required this.item,
    this.onTapHandler,
  }) : super(key: key);

  ///*[item] this is reference of DashboardItem
  ///*[onTapHandler] this is click listener on tab
  final DutyFreeDashboardItem item;
  final ADTapCallbackWithValue? onTapHandler;

  @override
  Widget build(BuildContext context) {
    return CreateList(
      itemData: item.widgetItems,
      item: item,
      onTapHandler: onTapHandler,
    );
  }
}

class CreateList extends StatefulWidget {
  final DutyFreeDashboardItem item;
  final List<DutyFreeItem>? itemData;
  final ADTapCallbackWithValue? onTapHandler;
  final bool shouldBeKeptAlive;

  const CreateList({
    Key? key,
    required this.item,
    required this.itemData,
    this.onTapHandler,
    this.shouldBeKeptAlive = true,
  }) : super(key: key);

  @override
  State<CreateList> createState() => _CreateListState();
}

class _CreateListState extends State<CreateList>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => widget.shouldBeKeptAlive;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    context.read<FlightCommonState>().callSavedFlightApi();
  }

  void startTimer() {
    cancelTimer();
    timer = Timer.periodic(
      const Duration(milliseconds: 2500),
      (timer) => {
        context.read<FlightCommonState>().callSavedFlightApi(),
      },
    );
  }

  void cancelTimer() {
    if (timer?.isActive ?? false) {
      timer?.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    const int _hundred = 100;
    const int _fifty = 50;
    const int _twoHundredOne = 201;
    const int _sixty = 60;
    bool isCall = true;
    final Widget superBuild = super.build(context);
    adLog('$superBuild');
    return VisibilityDetector(
      key: const Key('my-widget-key'),
      onVisibilityChanged: (visibilityInfo) => {
        if ((visibilityInfo.visibleFraction * _hundred) > _fifty)
          {
            if (ProfileSingleton.profileSingleton.isLoggedIn)
              {
                if (isCall)
                  {
                    isCall = false,
                    startTimer(),
                  },
              }
            else
              {
                isCall = true,
                cancelTimer(),
              },
            context.read<FlightCommonState>().callSavedFlightApi(),
          }
        else
          {
            isCall = true,
            cancelTimer(),
          },
      },
      child: Consumer<FlightCommonState>(
        builder: (context, savedFlightsData, child) {
          if (savedFlightsData.savedFlights?.flights.isEmpty ?? true) {
            cancelTimer();
          }
          return SizedBox(
            child: savedFlightsData.savedFlights?.flights.isNotEmpty ?? false
                ? ProfileSingleton.profileSingleton.isLoggedIn
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ADSizedBox(
                            height: widget.item.itemMargin?.top.sp ?? 0,
                          ),
                          Text(
                            widget.item.title ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: ADTextStyle700.size22.copyWith(
                              color: (context
                                              .read<
                                                  AirportListStateManagement>()
                                              .airportData
                                              ?.isTheme ??
                                          false) &&
                                      widget.item.subItemColors.titleColor
                                          .isNotEmpty
                                  ? Color(
                                      int.tryParse(
                                            widget
                                                .item.subItemColors.titleColor,
                                          ) ??
                                          context.adColors.whiteTextColor.value,
                                    )
                                  : ADColors.black.shade900,
                            ),
                            textAlign: TextAlign.left,
                          ).paddingBySide(
                            left: widget.item.itemMargin?.left.sp ?? 0,
                            right: widget.item.itemMargin?.right.sp ?? 0,
                          ),
                          Container(
                            height: _twoHundredOne.sp,
                            margin: EdgeInsets.only(
                              top: widget.item.subItemMargin?.top.sp ?? 0,
                              bottom: widget.item.itemMargin?.bottom.sp ?? 0,
                            ),
                            width: context.widthOfScreen,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      width: context.scaled(
                                        widget.item.itemMargin?.left ?? 0,
                                      ),
                                    );
                                  },
                                  padding: EdgeInsets.only(
                                    left: widget.item.itemMargin?.left.sp ?? 0,
                                    right:
                                        widget.item.itemMargin?.right.sp ?? 0,
                                  ),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: savedFlightsData
                                          .savedFlights?.flights.length ??
                                      0,
                                  itemBuilder: (context, index) {
                                    final bool isPadding;
                                    isPadding = (savedFlightsData
                                                .savedFlights?.flights.length ??
                                            0) >
                                        1;
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: Color(
                                          int.tryParse(
                                                widget.item.backgroundColor,
                                              ) ??
                                              Colors.transparent.value,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(context.k_8),
                                        ),
                                      ),
                                      child: SavedFlightTileWidget(
                                        onResetTap: () =>
                                            adLog('saved flight tapped'),
                                        index: index,
                                        leftRightPadding: (widget
                                                    .item.itemMargin?.left.sp ??
                                                0) +
                                            (widget.item.itemMargin?.right.sp ??
                                                0),
                                        flights: savedFlightsData
                                                .savedFlights?.flights ??
                                            [],
                                        isFromHome: isPadding,
                                      ),
                                    );
                                  },
                                ),
                                if ((savedFlightsData
                                            .savedFlights?.totalRecords ??
                                        0) >
                                    1)
                                  Center(
                                    child: TouchableOpacity(
                                      onTap: () => {
                                        navigateToScreenUsingNamedRoute(
                                          context,
                                          savedFlights,
                                        ),
                                      },
                                      child: Container(
                                        height: _hundred.sp,
                                        child: Column(
                                          children: [
                                            Container(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: (context
                                                              .read<
                                                                  AirportListStateManagement>()
                                                              .airportData
                                                              ?.isTheme ??
                                                          false)
                                                      ? Color(
                                                          int.tryParse(
                                                                widget
                                                                    .item
                                                                    .subItemColors
                                                                    .ctaColor,
                                                              ) ??
                                                              context
                                                                  .adColors
                                                                  .dividerColor
                                                                  .value,
                                                        )
                                                      : context.adColors
                                                          .dividerColor,
                                                ),
                                              ),
                                              height: _sixty.sp,
                                              width: _sixty.sp,
                                              child: Center(
                                                child: SvgPicture.asset(
                                                  SvgAssets.arrowRight,
                                                  height: context.k_14,
                                                  color: (context
                                                              .read<
                                                                  AirportListStateManagement>()
                                                              .airportData
                                                              ?.isTheme ??
                                                          false)
                                                      ? Color(
                                                          int.tryParse(
                                                                widget
                                                                    .item
                                                                    .subItemColors
                                                                    .ctaColor,
                                                              ) ??
                                                              context
                                                                  .adColors
                                                                  .darkGreyTextColor
                                                                  .value,
                                                        )
                                                      : context.adColors
                                                          .darkGreyTextColor,
                                                ),
                                              ),
                                            ),
                                            ADSizedBox(
                                              height: context.k_8,
                                            ),
                                            Text(
                                              widget.item.actionTitle?.name ??
                                                  '',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: ADTextStyle400.size14
                                                  .copyWith(
                                                    decoration: TextDecoration
                                                        .underline,
                                                  )
                                                  .copyWith(
                                                    color: (context
                                                                .read<
                                                                    AirportListStateManagement>()
                                                                .airportData
                                                                ?.isTheme ??
                                                            false)
                                                        ? Color(
                                                            int.tryParse(
                                                                  widget
                                                                      .item
                                                                      .subItemColors
                                                                      .ctaColor,
                                                                ) ??
                                                                ADColors
                                                                    .black
                                                                    .shade900
                                                                    .value,
                                                          )
                                                        : ADColors
                                                            .black.shade900,
                                                  ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ).paddingBySide(
                                    left: widget.item.itemMargin?.left ?? 0,
                                    right: widget.item.itemMargin?.right ?? 0,
                                  ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(
                        height: 1,
                      )
                : const SizedBox(
                    height: 1,
                  ),
          );
        },
      ),
    );
  }
}
