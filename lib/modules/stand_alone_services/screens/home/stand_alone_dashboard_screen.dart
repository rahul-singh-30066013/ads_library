import 'dart:io';

import 'package:adani_airport_mobile/modules/components/primary_scroll_to_top/scrolls_to_top.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/airport_item_model.dart';
import 'package:adani_airport_mobile/modules/food_and_shop/views/common_views/icon_inside_circle.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/pranaam_dashboard_site_core/pranaam_dashboard_site_core_response.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/home/stand_alone_dashboard_builder.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/home/views/stand_alone_dashboard_animation.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/state_management/stand_alone_dashboard_state_management.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/state_management/stand_alone_service_booking_state_management.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/state_management/stand_alone_state_management.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

class StandAloneDashBoardScreen extends StatefulWidget {
  const StandAloneDashBoardScreen({Key? key, this.standAloneServiceType})
      : super(key: key);
  final StandAloneServiceType? standAloneServiceType;

  @override
  State<StandAloneDashBoardScreen> createState() =>
      _StandAloneDashBoardScreenState();
}

class _StandAloneDashBoardScreenState extends State<StandAloneDashBoardScreen> {
  @override
  void initState() {
    context
        .read<StandAloneStateManagement>()
        .updateService(widget.standAloneServiceType);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<StandAloneDashboardStateManagement>().getDashboard();
    });
    context.read<StandAloneServiceBookingStateManagement>().setIntialValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _BuildPage(
      serviceAirport: selectedAirportsData,
    );
  }
}

/// this method is used to create DashBoard page
class _BuildPage extends StatelessWidget {
  final AirportItemModel? serviceAirport;

  const _BuildPage({
    Key? key,
    this.serviceAirport,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StandAloneDashboardStateManagement>(
      builder: (context, value, Widget? child) {
        switch (value.state) {
          case ViewState.loading:
            return _ShimmerWidget();
          case ViewState.error:
            return Center(child: Text(value.error.toString()));
          case ViewState.success:
            // return Selector<PranaamAppDataStateManagement, bool>(
            //   selector: (context, model) => model.isAnimationLoading,
            //   builder: (context, value, child) {
            //     return Stack(
            //       children: [
            //         VerticalList(
            //           data: pranaamDashboardSiteCoreResponse,
            //           onTapHandler: onTapHandler,
            //           serviceAirport: serviceAirport,
            //         ),
            //         if (value) const PranaamDashboardAnimation(),
            //       ],
            //     );
            //   },
            // );
            return Selector<StandAloneServiceBookingStateManagement, bool>(
              builder: (_, showLoader, __) => Stack(
                children: [
                  _VerticalList(
                    data: value.dashBoardItems,
                    serviceAirport: serviceAirport,
                  ),
                  if (showLoader) const StandAloneDashboardAnimation(),
                ],
              ),
              selector: (_, model) => model.showBuggyLoader,
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
    return Scaffold(
      body: ListView(
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
      ),
    );
  }
}

/// this method is used to create verticalList of DashBoard page
class _VerticalList extends StatefulWidget {
  final List<DashboardItem> data;

  final AirportItemModel? serviceAirport;

  const _VerticalList({
    Key? key,
    required this.data,
    required this.serviceAirport,
  }) : super(key: key);

  @override
  State<_VerticalList> createState() => _VerticalListState();
}

class _VerticalListState extends State<_VerticalList> {
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
                              'porter_title'.localize(context),
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
                    background: StandAloneDashboardBuilder(
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
              child: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    final dashboardItem = widget.data[index];
                    final widgetObj = StandAloneDashboardBuilder(
                      ///
                      dashBoardItem: dashboardItem,
                    );
                    return index != 0 ? widgetObj : const SizedBox.shrink();
                  },
                  childCount: widget.data.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
