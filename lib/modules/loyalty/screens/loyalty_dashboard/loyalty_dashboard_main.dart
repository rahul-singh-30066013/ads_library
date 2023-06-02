/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */


import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_dashboard_site_core_response.dart';
import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_dashboard/loyalty_dashboard_screen.dart';
import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_dashboard/view/dashboard_shimmer_widget.dart';
import 'package:adani_airport_mobile/modules/loyalty/state_management/loyalty_state_management.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///this class is used to represent Home Screen DashBoard
/// from  this  class we call DashBoardBuilder class constructor

class LoyaltyDashboardMain extends StatefulWidget {
  const LoyaltyDashboardMain({
    Key? key,
  }) : super(key: key);

  @override
  State<LoyaltyDashboardMain> createState() => _LoyaltyDashboardMainState();
}

class _LoyaltyDashboardMainState extends State<LoyaltyDashboardMain> {
  final LoyaltyStateManagement _dashBoardViewModel = LoyaltyStateManagement();
  final LoyaltyStateManagement _loyaltyStateManagement =
      LoyaltyStateManagement();

  @override
  void initState() {
    _dashBoardViewModel
      ..updateState(ADResponseState.loading())
      ..fetchDashBoardHome(
        context.read<DutyFreeState>().terminalModel.value.code,
      );
    if (ProfileSingleton.profileSingleton.isLoggedIn) {
      _loyaltyStateManagement
        ..updateState(ADResponseState.loading())
        ..getBalance();
    }
    adLog(context.read<DutyFreeState>().terminalModel.value.code);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);

    adLog('DashBoardScreen build Called');
    return ADSelectorStateLessWidget<LoyaltyStateManagement>(
      key: const Key('DashBoard'),
      viewModel: _dashBoardViewModel,
      child: _BuildPage(
        dashBoardViewModel: _dashBoardViewModel,
        loyaltyStateManagement: _loyaltyStateManagement,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

/// this method is used to create DashBoard page
class _BuildPage extends StatelessWidget {
  final LoyaltyStateManagement? dashBoardViewModel;
  final LoyaltyStateManagement loyaltyStateManagement;

  const _BuildPage({
    Key? key,
    this.dashBoardViewModel,
    required this.loyaltyStateManagement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<LoyaltyStateManagement, ADResponseState>(
      selector: (context, viewModel) => viewModel.loyaltySiteCoreState,
      builder: (context, value, Widget? child) {
        switch (value.viewStatus) {
          case Status.loading:
            return DashboardShimmerWidget();
          case Status.error:
            return Center(child: Text(value.message.toString()));
          case Status.complete:
            final List<Elements> loyaltyDashboardSiteCoreResponse =
                value.data as List<Elements>;
            return LoyaltyDashboardScreen(
              data: loyaltyDashboardSiteCoreResponse,
              loyaltyStateManagement: loyaltyStateManagement,
            );
          default:
            return Container();
        }
        // return Container();
      },
    );
  }
}
