/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/airport_item_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/dashboard/airports_list_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/flight_automation_keys.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/airport_list_state_management.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/error_page/ad_error_page.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_layout_builder.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

const six = 6;
const int four = 4;
const int two = 2;
const int three = 3;

///this class is used to handle new Electronic Type View
class OurAirports extends StatelessWidget {
  const OurAirports({
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
      item: item,
      onTapHandler: onTapHandler,
    );
  }
}

class CreateList extends StatefulWidget {
  final DutyFreeDashboardItem item;
  final ADTapCallbackWithValue? onTapHandler;

  ///this is used to main
  final bool shouldBeKeptAlive;

  const CreateList({
    Key? key,
    required this.item,
    this.onTapHandler,
    this.shouldBeKeptAlive = true,
  }) : super(key: key);

  @override
  State<CreateList> createState() => _CreateListState();
}

class _CreateListState extends State<CreateList>
    with AutomaticKeepAliveClientMixin {
  final AirportListStateManagement _airportListViewModel =
      AirportListStateManagement(
    isLoggedIn: ProfileSingleton.profileSingleton.isLoggedIn,
  );

  @override
  bool get wantKeepAlive => widget.shouldBeKeptAlive;

  @override
  void initState() {
    _airportListViewModel
        .getAirportList(context.read<SiteCoreStateManagement>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Widget superBuild = super.build(context);
    adLog('$superBuild');
    const int maxLine = 2;
    const double contentHeight = 129;
    final itemWidth = (widget.item.subItemWidth ?? 1) * context.widthOfScreen;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ADSizedBox(
          height: widget.item.itemMargin?.top.sp ?? 0,
        ),
        if (widget.item.title?.isNotEmpty ?? false)
          Text(
            widget.item.title ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: ADTextStyle700.size22,
            textAlign: TextAlign.left,
          ).paddingBySide(
            left: widget.item.itemMargin?.left.sp ?? 0,
            right: widget.item.itemMargin?.right.sp ?? 0,
          ),
        Container(
          height: itemWidth * (widget.item.aspectRatio ?? 1) +
              (contentHeight + (widget.item.subItemMargin?.top ?? 0)).sp,
          width: context.widthOfScreen,
          child: ADSelectorStateLessWidget<AirportListStateManagement>(
            key: const Key(FlightAutomationKeys.airportListParent),
            viewModel: _airportListViewModel,
            child: Consumer<AirportListStateManagement>(
              builder: (context, value, child) {
                final ADResponseState<dynamic> adResponseState =
                    value.airportListState;
                switch (adResponseState.viewStatus) {
                  case Status.loading:
                    return AirportsShimmerWidget(
                      height: itemWidth * (widget.item.aspectRatio ?? 1) +
                          (contentHeight +
                                  (widget.item.subItemMargin?.top ?? 0))
                              .sp,
                      width: itemWidth,
                      itemCount: six,
                    );
                  case Status.error:
                    return ADErrorPage(
                      message: _airportListViewModel.error,
                      onPress: () => {
                        _airportListViewModel.getAirportList(
                          context.read<SiteCoreStateManagement>(),
                        ),
                      },
                    );
                  case Status.complete:
                    final List<AirportItemModel> airportsDataList =
                        <AirportItemModel>[];
                    airportsDataList.addAll(adResponseState.data);
                    airportsDataList.removeWhere(
                      (item) =>
                          (item.isNonAdaniAirport ?? false) ||
                          item.city == selectedAirportsData?.city,
                    );
                    return ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: context
                              .scaled(widget.item.subItemMargin?.left ?? 0),
                        );
                      },
                      padding: EdgeInsets.only(
                        top: widget.item.subItemMargin?.top.sp ?? 0,
                        left: widget.item.itemMargin?.left.sp ?? 0,
                        right: widget.item.itemMargin?.right.sp ?? 0,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemCount: airportsDataList.length,
                      itemBuilder: (context, index) {
                        return TouchableOpacity(
                          onTap: () => widget.onTapHandler
                              ?.call(airportsDataList[index]),
                          child: Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              color: context.adColors.containerGreyBg,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  (widget.item.subItemRadius ?? 0).sp,
                                ),
                              ),
                            ),
                            width: itemWidth,
                            child: Column(
                              children: [
                                Container(
                                  height: itemWidth *
                                      (widget.item.aspectRatio ?? 1),
                                  child: ADCachedImage(
                                    imageUrl: airportsDataList[index]
                                            .airportImage
                                            ?.validateWithDefaultValue() ??
                                        '',
                                    boxFit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  height: contentHeight.sp,
                                  width: double.infinity,
                                  color: Color(
                                    int.parse(
                                      airportsDataList[index].colorCode ??
                                          getAirportColor(index),
                                    ),
                                  ),
                                  padding: EdgeInsets.only(
                                    top: context.k_30,
                                    left: context.k_20,
                                    right: context.k_20,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        airportsDataList[index]
                                            .city
                                            .validateWithDefaultValue(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: ADTextStyle700.size18.copyWith(
                                          color:
                                              context.adColors.whiteTextColor,
                                        ),
                                      ),
                                      ADSizedBox(height: context.k_10),
                                      Text(
                                        airportsDataList[index]
                                            .airportName
                                            .validateWithDefaultValue(),
                                        maxLines: maxLine,
                                        overflow: TextOverflow.ellipsis,
                                        style: ADTextStyle400.size16.copyWith(
                                          color:
                                              context.adColors.whiteTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  default:
                }
                return const ADSizedBox.shrink();
              },
            ),
          ),
        ),
        ADSizedBox(
          height: widget.item.itemMargin?.bottom.sp ?? 0,
        ),
      ],
    );
  }
}

class AirportsShimmerWidget extends StatelessWidget {
  const AirportsShimmerWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.itemCount,
  }) : super(key: key);
  final double height;
  final double width;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ADShimmerBuilder(
        shimmerBuilderType: ShimmerBuilderType.listHorizontal,
        shimmerWidget: ADShimmerWidget.shimmerShape(
          type: ShimmerType.rectangleBox,
          height: height,
          width: width,
        ),
        itemCount: itemCount,
      ),
    ).paddingAllSide(context.k_10);
  }
}
