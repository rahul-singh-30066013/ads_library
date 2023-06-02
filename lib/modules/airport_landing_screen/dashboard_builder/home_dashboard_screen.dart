/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/home_screen_dashboard_builder.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/dashboard_view_model.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

///this class is used to represent Home Screen DashBoard
/// from  this  class we call DashBoardBuilder class constructor
class HomeDashBoardScreen extends StatefulWidget {
  const HomeDashBoardScreen({
    Key? key,
    this.onTapHandler,
    this.shimmerWidget,
    this.isPaddingNeeded = true,
    this.postFix,
  }) : super(key: key);

  final bool isPaddingNeeded;

  /// this is used to handle tab callback
  final ADTapCallbackWithValue? onTapHandler;

  /// this is used to handle shimmer widget
  final Widget? shimmerWidget;

  final String? postFix;

  @override
  State<HomeDashBoardScreen> createState() => _HomeDashBoardScreenState();
}

class _HomeDashBoardScreenState extends State<HomeDashBoardScreen> {
  DashBoardViewModel _dashBoardViewModel = DashBoardViewModel();

  @override
  void initState() {
    super.initState();
    _dashBoardViewModel = context.read<DashBoardViewModel>();
    if (lastSelectedAirport != selectedAirportsData?.city) {
      _dashBoardViewModel.homeDashBoardState = ADResponseState.loading();
      //   updateDashBoard();
      lastSelectedAirport = selectedAirportsData?.city ?? '';
    }
    _dashBoardViewModel.getDashBoardData(
      selectedAirportNotifier.value,
      postFix: widget.postFix,
    );
  }

  Future<void> updateDashBoard() async {
    // _dashBoardViewModel.notifyListeners();
    //await _dashBoardViewModel.getDashBoardDataFromLocalJson(JsonAssets.dashBoardJson,); //For Local Data
    await _dashBoardViewModel.getDashBoardData(
      selectedAirportNotifier.value,
      postFix: widget.postFix,
    ); // For Site core Data
  }

  @override
  Widget build(BuildContext context) {
    adLog('DashBoardScreen build Called');
    // if (lastSelectedAirport != selectedAirportsData?.city) {
    //   updateDashBoard();
    //   lastSelectedAirport = selectedAirportsData?.city ?? '';
    // }
    return _BuildPage(
      dashBoardViewModel: _dashBoardViewModel,
      shimmerWidget: widget.shimmerWidget,
      onTapHandler: widget.onTapHandler,
      isPaddingNeeded: widget.isPaddingNeeded,
      postFix: widget.postFix ?? '',
    );
  }
}

/// this method is used to create DashBoard page
class _BuildPage extends StatelessWidget {
  final DashBoardViewModel? dashBoardViewModel;
  final Widget? shimmerWidget;
  final ADTapCallbackWithValue? onTapHandler;
  final bool isPaddingNeeded;
  final String postFix;

  const _BuildPage({
    Key? key,
    this.dashBoardViewModel,
    this.shimmerWidget,
    this.onTapHandler,
    this.isPaddingNeeded = true,
    required this.postFix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (context.read<DashBoardViewModel>().homeDashBoardState.viewStatus) {
      case Status.loading:
        return shimmerWidget ??
            Center(
              child: ADDotProgressView(
                color: context.adColors.black,
              ),
            );
      case Status.error:
        return Center(child: Text(context.read<DashBoardViewModel>().homeDashBoardState.message.toString()));
      case Status.complete:
        return VerticalList(
          data: context.read<DashBoardViewModel>().homeDashBoardState.data,
          onTapHandler: onTapHandler,
          isPaddingNeeded: isPaddingNeeded,
          dashBoardViewModel: dashBoardViewModel,
        );
      default:
    }
    return Container();
  }
}

/// this method is used to create verticalList of DashBoard page
class VerticalList extends StatefulWidget {
  final List<DutyFreeDashboardItem> data;

  /// this is used to handle tab callback
  final ADTapCallbackWithValue? onTapHandler;
  final bool isPaddingNeeded;
  final DashBoardViewModel? dashBoardViewModel;

  const VerticalList({
    Key? key,
    required this.data,
    required this.onTapHandler,
    this.isPaddingNeeded = true,
    this.dashBoardViewModel,
  }) : super(key: key);

  @override
  State<VerticalList> createState() => _VerticalListState();
}

class _VerticalListState extends State<VerticalList> {

  @override
  Widget build(BuildContext context) {
    adLog('Widget Length ${widget.data.length}');
    return ListView.builder(
      controller: PrimaryScrollController.of(context),
      shrinkWrap: true,
      itemCount: widget.data.length,
      padding: widget.isPaddingNeeded
          ? EdgeInsets.only(bottom: context.k_60)
          : EdgeInsets.zero,
      itemBuilder: (context, index) => HomeScreenDashBoardBuilder(
        dashBoardViewModel: widget.dashBoardViewModel,
        onTapHandler: widget.onTapHandler,
        dashBoardItem: widget.data[index],
      ),
    );
  }
}
