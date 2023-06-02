/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io';

import 'package:adani_airport_mobile/modules/components/primary_scroll_to_top/scrolls_to_top.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/airport_item_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_booking_state.dart';
import 'package:adani_airport_mobile/modules/food_and_shop/views/common_views/icon_inside_circle.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/pranaam_dashboard_site_core/pranaam_dashboard_site_core_response.dart'
    as pranaam_dashboard;
import 'package:adani_airport_mobile/modules/pranaam_service/model/pranaam_dashboard_site_core/pranaam_dashboard_site_core_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/home/pranaam_dashboard_builder.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/home/views/pranaam_dashboard_animation.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_sitecore_state_management.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

///this class is used to represent Home Screen DashBoard
/// from  this  class we call DashBoardBuilder class constructor

class PranaamDashBoardScreen extends StatefulWidget {
  const PranaamDashBoardScreen({
    Key? key,
    this.onTapHandler,
    this.shimmerWidget,
  }) : super(key: key);

  /// this is used to handle tab callback
  final ADTapCallbackWithValue? onTapHandler;

  /// this is used to handle shimmer widget
  final Widget? shimmerWidget;
  static const String kReusableWidgetKey = 'ReuseWidgetKey';

  @override
  State<PranaamDashBoardScreen> createState() => _PranaamDashBoardScreenState();
}

class _PranaamDashBoardScreenState extends State<PranaamDashBoardScreen> {
  final PranaamSitecoreStateManagement _dashBoardViewModel =
      PranaamSitecoreStateManagement();
  SiteCoreStateManagement? _siteCoreStateManagement;
  FlightBookingState flightViewModel = FlightBookingState();
  AirportItemModel? serviceAirport;

  @override
  void initState() {
    super.initState();
    serviceAirport = context
        .read<PranaamAppDataStateManagement>()
        .getServiceAirport(context);
    _siteCoreStateManagement = context.read<SiteCoreStateManagement>();
    _dashBoardViewModel.fetchDashBoardHome(
      _siteCoreStateManagement ?? SiteCoreStateManagement(),
      serviceAirport,
    );
    // _dashBoardViewModel.getPackages(requestJson);
  }

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    adLog('DashBoardScreen build Called');
    return ADSelectorStateLessWidget<PranaamSitecoreStateManagement>(
      key: const Key('DashBoard'),
      viewModel: _dashBoardViewModel,
      child: _BuildPage(
        dashBoardViewModel: _dashBoardViewModel,
        shimmerWidget: widget.shimmerWidget,
        onTapHandler: widget.onTapHandler,
        serviceAirport: serviceAirport,
      ),
    );
  }

  @override
  void dispose() {
    final bool? isCleared = _siteCoreStateManagement?.clearPranaamAirportData();
    adLog('isCleared $isCleared');
    super.dispose();
  }
}

/// this method is used to create DashBoard page
class _BuildPage extends StatelessWidget {
  final PranaamSitecoreStateManagement? dashBoardViewModel;
  final Widget? shimmerWidget;
  final ADTapCallbackWithValue? onTapHandler;
  final AirportItemModel? serviceAirport;

  const _BuildPage({
    Key? key,
    this.dashBoardViewModel,
    this.shimmerWidget,
    this.onTapHandler,
    this.serviceAirport,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<PranaamSitecoreStateManagement, ADResponseState>(
      selector: (context, viewModel) => viewModel.pranaamDashboardState,
      builder: (context, value, Widget? child) {
        switch (value.viewStatus) {
          case Status.loading:
            return _ShimmerWidget();
          case Status.error:
            return Center(child: Text(value.message.toString()));
          case Status.complete:
            final List<DashboardItem> pranaamDashboardSiteCoreResponse =
                value.data as List<DashboardItem>;
            return Selector<PranaamAppDataStateManagement, bool>(
              selector: (context, model) => model.isAnimationLoading,
              builder: (context, value, child) {
                return Stack(
                  children: [
                    VerticalList(
                      data: pranaamDashboardSiteCoreResponse,
                      onTapHandler: onTapHandler,
                      serviceAirport: serviceAirport,
                    ),
                    if (value) const PranaamDashboardAnimation(),
                  ],
                );
              },
            );
          default:
        }
        return Container();
      },
    );
  }
}

class _ShimmerWidget extends StatelessWidget {
  final double aspectRatio = 1.33;
  final double aspectRatioHalf = 0.5;
  final double shimmer_8 = 8.sp;
  final double shimmer_60 = 60.sp;
  final double shimmer_100 = 100.sp;

  _ShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        ADShimmerWidget.shimmerShape(
          rectanglePadding: EdgeInsets.zero,
          type: ShimmerType.rectangleBox,
          width: context.widthOfScreen,
          height: context.widthOfScreen * aspectRatio,
        ),
        ADShimmerWidget.shimmerShape(
          rectanglePadding: EdgeInsets.only(
            left: context.k_10,
            right: context.widthOfScreen * aspectRatioHalf,
            top: context.k_20,
          ),
          type: ShimmerType.rectangleBox,
          height: context.k_40,
        ),
        ADShimmerWidget.shimmerShape(
          type: ShimmerType.rectangleBox,
          width: context.widthOfScreen,
          height: shimmer_60,
          rectanglePadding: EdgeInsets.only(
            left: context.k_10,
            right: context.k_10,
            top: context.k_10,
          ),
        ),
        ADSizedBox(
          height: context.k_2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ADShimmerWidget.shimmerShape(
                type: ShimmerType.rectangleBox,
                //width: context.widthOfScreen * ,
                height: shimmer_60,
                rectanglePadding: EdgeInsets.only(
                  left: context.k_10,
                  top: context.k_10,
                ),
              ),
            ),
            SizedBox(
              width: context.k_10,
            ),
            Expanded(
              child: ADShimmerWidget.shimmerShape(
                type: ShimmerType.rectangleBox,
                //width: shimmerWidth_100,
                height: shimmer_60,
                rectanglePadding: EdgeInsets.only(
                  right: context.k_10,
                  top: context.k_10,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// this method is used to create verticalList of DashBoard page
class VerticalList extends StatefulWidget {
  final List<pranaam_dashboard.DashboardItem> data;

  /// this is used to handle tab callback
  final ADTapCallbackWithValue? onTapHandler;
  final AirportItemModel? serviceAirport;

  const VerticalList({
    Key? key,
    required this.data,
    required this.onTapHandler,
    required this.serviceAirport,
  }) : super(key: key);

  @override
  State<VerticalList> createState() => _VerticalListState();
}

class _VerticalListState extends State<VerticalList> {
  final ScrollController _scrollController = ScrollController();

  double expandedHeight = 520;

  final ValueNotifier<bool> isCollapsed = ValueNotifier(false);

  void _scrollListener() {
    isCollapsed.value =
        _scrollController.offset > (expandedHeight - kToolbarHeight);
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  Future<void> _onScrollsToTop(ScrollsToTopEvent event) async {
    adLog(event.toString());
    Utils.scrollTabScreensToTop(
      scrollController: _scrollController,
      isFromPranaamHome: true,
    );
  }

  /// this method is used to handle click listener
  @override
  Widget build(BuildContext context) {
    final dashboardItem = widget.data.first;
    expandedHeight = widget.data.first.aspectRatio * context.widthOfScreen;
    final airportCity =
        widget.serviceAirport?.city ?? selectedAirportsData?.city ?? '';
    return ScrollsToTop(
      onScrollsToTop: _onScrollsToTop,
      child: Scaffold(
        body: CustomScrollView(
          controller: _scrollController,
          physics: const ClampingScrollPhysics(),
          slivers: [
            ValueListenableBuilder<bool>(
              valueListenable: isCollapsed,
              builder: (context, val, child) {
                return SliverAppBar(
                  pinned: true,
                  elevation: 0,
                  leadingWidth: 0,
                  automaticallyImplyLeading: false,
                  systemOverlayStyle: val
                      ? SystemUiOverlayStyle.dark
                      : SystemUiOverlayStyle.light,
                  actions: [
                    IconInsideCircle(
                      iconData: Platform.isIOS
                          ? Icons.arrow_back_ios_outlined
                          : Icons.arrow_back_outlined,
                      onPressed: () => navigatorPopScreen(context),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          airportCity,
                          style: ADTextStyle700.size22.setTextColor(
                            !val
                                ? context.adColors.whiteTextColor
                                : context.adColors.blackTextColor,
                          ),
                        ),
                        Visibility(
                          visible: val,
                          child: Center(
                            child: Text(
                              'pranaam_title'.localize(context),
                              style: ADTextStyle500.size12
                                  .setTextColor(context.adColors.blackColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                  expandedHeight:
                      expandedHeight - MediaQuery.of(context).padding.top,
                  flexibleSpace: FlexibleSpaceBar(
                    background: PranaamDashboardBuilder(
                      dashBoardItem: dashboardItem,
                    ),
                  ),
                );
              },
            ),
            MediaQuery.removePadding(
              removeTop: true,
              removeBottom: true,
              context: context,
              child: Selector<PranaamAppDataStateManagement, bool>(
                selector: (context, viewModel) => viewModel.howItWorksTap,
                builder: (context, value, Widget? child) {
                  if (context
                      .read<PranaamAppDataStateManagement>()
                      .isNeedToScroll) {
                    const double end = 950;
                    _scrollController.animateTo(
                      end,
                      curve: Curves.easeOut,
                      duration: const Duration(milliseconds: 200),
                    );
                  }
                  context.read<PranaamAppDataStateManagement>().isNeedToScroll =
                      false;
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        final dashboardItem = widget.data[index];
                        final widgetObj = PranaamDashboardBuilder(
                          ///
                          dashBoardItem: dashboardItem,
                        );
                        return index != 0 ? widgetObj : const SizedBox.shrink();
                      },
                      childCount: widget.data.length,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
