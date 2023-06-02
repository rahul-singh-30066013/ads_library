/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/tap_detail.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/duty_free_dashboard_builder.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/dashboard_view_model.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

///this class is used to represent Home Screen DashBoard
/// from  this  class we call DashBoardBuilder class constructor
const int maximumLine = 3;

const kGridCircleTile = 'gridCircleTile';

class DutyFreeDashBoardScreen extends StatefulWidget {
  const DutyFreeDashBoardScreen({
    Key? key,
    this.onTapHandler,
    this.shimmerWidget,
    this.isPaddingNeeded = true,
    this.updateDashboardBasedOnCallback,
  }) : super(key: key);

  final bool isPaddingNeeded;

  /// this is used to handle tab callback
  final ADTapCallbackWithValue? onTapHandler;
  final Function(DashBoardViewModel dashBoardViewModel)?
      updateDashboardBasedOnCallback;

  /// this is used to handle shimmer widget
  final Widget? shimmerWidget;
  static const String kReusableWidgetKey = 'ReuseWidgetKey';

  @override
  State<DutyFreeDashBoardScreen> createState() =>
      _DutyFreeDashBoardScreenState();
}

class _DutyFreeDashBoardScreenState extends State<DutyFreeDashBoardScreen> {
  final DashBoardViewModel _dashBoardViewModel = DashBoardViewModel();
  final ValueNotifier<String> dynamicTitle = ValueNotifier<String>('');
  final ValueNotifier<Color> dynamicTextColor =
      ValueNotifier<Color>(Colors.white);
  final double leadingWidth_42 = 42.w;
  final double expandedHeight_180 = 180.h;

  @override
  void dispose() {
    dynamicTitle.dispose();
    dynamicTextColor.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    updateDashBoard();
  }

  Future<void> updateDashBoard() async {
    await _dashBoardViewModel.getDutyFreeDashBoardData(
      isAgeAbove25: context.read<DutyFreeState>().ageAbove25,
      storeType:
          context.read<DutyFreeState>().terminalModel.value.code.toLowerCase(),
      // airportItemModel: selectedAirportsData,
    );
    final value =
        widget.updateDashboardBasedOnCallback?.call(_dashBoardViewModel);
    adLog(value != null ? 'value' : value.toString());
  }

  @override
  Widget build(BuildContext context) {
    adLog('DashBoardScreen build Called');
    return ADSelectorStateLessWidget<DashBoardViewModel>(
      key: const Key('DashBoard'),
      viewModel: _dashBoardViewModel,
      child: Scaffold(
        appBar: Utils.getGenericAppBar(context),
        body: _BuildPage(
          dashBoardViewModel: _dashBoardViewModel,
          shimmerWidget: widget.shimmerWidget,
          onTapHandler: widget.onTapHandler,
          isPaddingNeeded: widget.isPaddingNeeded,
          pullRefresh: updateDashBoard,
        ),
      ),
    );
  }
}

/// this method is used to create DashBoard page
class _BuildPage extends StatelessWidget {
  final DashBoardViewModel? dashBoardViewModel;
  final Widget? shimmerWidget;
  final ADTapCallbackWithValue? onTapHandler;
  final bool isPaddingNeeded;
  final Future<void> Function() pullRefresh;

  const _BuildPage({
    Key? key,
    this.dashBoardViewModel,
    this.shimmerWidget,
    this.onTapHandler,
    this.isPaddingNeeded = true,
    required this.pullRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<DashBoardViewModel, ADResponseState>(
      selector: (context, viewModel) => viewModel.dashBoardState,
      builder: (context, value, Widget? child) {
        switch (value.viewStatus) {
          case Status.loading:
            return shimmerWidget ??
                Center(
                  child: ADDotProgressView(
                    color: context.adColors.black,
                  ),
                );
          case Status.error:
            return Center(child: Text(value.message.toString()));
          case Status.complete:
            return VerticalList(
              data: value.data,
              onTapHandler: onTapHandler,
              isPaddingNeeded: isPaddingNeeded,
              dashBoardViewModel: dashBoardViewModel,
              pullRefresh: pullRefresh,
            );
          default:
        }
        return Container();
      },
    );
  }
}

/// this method is used to create verticalList of DashBoard page
class VerticalList extends StatefulWidget {
  final List<DutyFreeDashboardItem> data;

  /// this is used to handle tab callback
  final ADTapCallbackWithValue? onTapHandler;

  final bool isPaddingNeeded;

  final DashBoardViewModel? dashBoardViewModel;
  final Future<void> Function() pullRefresh;

  const VerticalList({
    Key? key,
    required this.data,
    required this.onTapHandler,
    this.isPaddingNeeded = true,
    this.dashBoardViewModel,
    required this.pullRefresh,
  }) : super(key: key);

  @override
  State<VerticalList> createState() => _VerticalListState();
}

class _VerticalListState extends State<VerticalList> {
  /// this method is used to handle click listener
  void _onTapHandler(
    dynamic tapDetail,
  ) {
    if (tapDetail is TapDetail) {
      if (tapDetail.name == kGridCircleTile) {
        handleVerticalTap(tapDetail.objectID, context);
      }
    }
  }

  /// this method is used to perform click listener on circle grid view
  void handleVerticalTap(int? objectID, BuildContext context) {
    const int switchValue = 4;
    const int shopId = 2;
    const int foodId = 5;

    switch (objectID) {
      case 0:
        // fetchList();
        navigateToScreenUsingNamedRoute(context, flightBooking);
        break;
      case 1:
        navigateToScreenUsingNamedRoute(context, dutyFreeScreen);
        break;
      case shopId:
        navigateToScreenUsingNamedRoute(context, airportShopList);
        break;
      case foodId:
        navigateToScreenUsingNamedRoute(context, airportFoodList);
        break;
      case switchValue:
        navigateToScreenUsingNamedRoute(context, otp);
        // navigateToScreenUsingNamedRoute(context, reviewFlightDetails);
        break;
      default:
        adLog('Item Not Found');
    }
  }

  @override
  Widget build(BuildContext context) {
    adLog('Widget Length ${widget.data.length}');
    return /* RefreshIndicator(
      onRefresh: widget.pullRefresh,
      color: context.adColors.neutralInfoMsg,
      child:*/
        ListView.builder(
      controller: PrimaryScrollController.of(context),
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: widget.data.length,
      padding: widget.isPaddingNeeded
          ? EdgeInsets.only(top: context.k_6, bottom: context.k_60)
          : EdgeInsets.zero,
      itemBuilder: (context, index) => DutyFreeDashBoardBuilder(
        dashBoardViewModel: widget.dashBoardViewModel,
        onTapHandler: widget.onTapHandler ??
            (value) {
              _onTapHandler(value);
            },
        dashBoardItem: widget.data[index],
      ),
    ) /*,
    )*/
        ;
  }
}
