/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io';

import 'package:adani_airport_mobile/modules/components/primary_scroll_to_top/scrolls_to_top.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_balance_model.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_dashboard_site_core_response.dart';
import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_dashboard/loyalty_dashboard_builder.dart';
import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_dashboard/view/reward_balance_view.dart';
import 'package:adani_airport_mobile/modules/loyalty/state_management/loyalty_state_management.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///this class is used to show loyalty dashboard
class LoyaltyDashboardScreen extends StatefulWidget {
  final List<Elements> data;
  final LoyaltyStateManagement loyaltyStateManagement;

  const LoyaltyDashboardScreen({
    Key? key,
    required this.data,
    required this.loyaltyStateManagement,
  }) : super(key: key);

  @override
  State<LoyaltyDashboardScreen> createState() => _LoyaltyDashboardScreenState();
}

///animation global variables used within the sub view/classes
Animation<double>? wAnimation;
AnimationController? wAnimationController;

class _LoyaltyDashboardScreenState extends State<LoyaltyDashboardScreen>
    with TickerProviderStateMixin {
  /// local variables for size,count etc
  final double beginPosition = -2;
  final double endPosition = 14;
  final double _expansionHeight = 350.sp;

  ///TODO add in style
  static const _appBarColor = Color(0xff230046);

  LoyaltyStateManagement? loyaltyHistoryProvider;
  final ValueNotifier<double> _notifier = ValueNotifier<double>(0);
  final ScrollController _scrollController = ScrollController();
  LoyaltyBalanceModel loyaltyBalanceModel = const LoyaltyBalanceModel();

  void _scrollListener() {
    _notifier.value = _scrollController.position.pixels;
  }

  @override
  void initState() {
    super.initState();
    loyaltyHistoryProvider = context.read<LoyaltyStateManagement>();

    balanceScreen();
  }

  void balanceScreen() {
    _scrollController.addListener(_scrollListener);
    wAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    );
    wAnimation = Tween<double>(begin: beginPosition, end: endPosition).animate(
      CurvedAnimation(
        parent: wAnimationController ?? AnimationController(vsync: this),
        curve: Curves.easeInOut,
      ),
    );
    wAnimationController
        ?.repeat(reverse: true)
        .then((value) => adLog('animation controller repeating'));
  }

  @override
  void dispose() {
    wAnimationController?.dispose();
    _scrollController.dispose();
    _notifier.dispose();
    super.dispose();
  }

  Future<void> _onScrollsToTop(ScrollsToTopEvent event) async {
    adLog(event.toString());
    Utils.scrollTabScreensToTop(
      scrollController: _scrollController,
      isFromPranaamHome: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScrollsToTop(
      onScrollsToTop: _onScrollsToTop,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: _appBarColor,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          actions: [
            ValueListenableBuilder<double>(
              valueListenable: _notifier,
              builder: (context, value, child) {
                return _notifier.value > _expansionHeight
                    ? GestureDetector(
                        onTap: () =>
                            navigateToScreenUsingNamedRouteWithArguments(
                          context,
                          loyaltyHistoryScreen,
                          argumentObject: [
                            widget.loyaltyStateManagement.balance.toString(),
                            widget.loyaltyStateManagement.pending.toString(),
                          ],
                        ),
                        child: RewardBalanceView(
                          balance: widget.loyaltyStateManagement.balance,
                          pending: widget.loyaltyStateManagement.pending,
                        ),
                      )
                    : const ADSizedBox.shrink();
              },
            ),
          ],
          title: ValueListenableBuilder<double>(
            valueListenable: _notifier,
            builder: (context, value, child) {
              return Text(
                (_notifier.value > _expansionHeight)
                    ? 'adani_rewards'.localize(context)
                    : '',
                style: ADTextStyle700.size22.setTextColor(
                  context.adColors.whiteTextColor,
                ),
              );
            },
          ),
          leading: IconButton(
            onPressed: () => navigatorPopScreen(context),
            icon: Icon(
              Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back_outlined,
              size: context.k_20,
              color: context.adColors.whiteTextColor,
            ),
          ),
        ),
        body: SafeArea(
          top: false,
          bottom: false,
          child: ADSelectorStateLessWidget<LoyaltyStateManagement>(
            viewModel: widget.loyaltyStateManagement,
            child: Selector<LoyaltyStateManagement, bool>(
              selector: (context, viewModel) => viewModel.isAbsorbing,
              builder: (context, isAbsorbing, Widget? child) {
                return ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: widget.data.length,
                  controller: _scrollController,
                  itemBuilder: (BuildContext context, int index) {
                    final dashboardItem = widget.data[index].fields;
                    final String title = widget.data[index].params.widgetName;
                    final widgetObj = LoyaltyDashboardBuilder(
                      dashBoardItem: dashboardItem,
                      title: title,
                      loyaltyHistoryProvider: widget.loyaltyStateManagement,
                    );
                    return widgetObj;
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
