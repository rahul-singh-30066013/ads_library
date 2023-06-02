/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_balance_model.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_history_model.dart';
import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_history/views/history_tab_view.dart';
import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_history/views/reward_balance_list_item.dart';
import 'package:adani_airport_mobile/modules/loyalty/state_management/loyalty_state_management.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class LoyaltyHistoryScreen extends StatefulWidget {
  final String rewardBalance;
  final String pendingBalance;
  const LoyaltyHistoryScreen({
    Key? key,
    required this.rewardBalance,
    required this.pendingBalance,
  }) : super(key: key);

  @override
  _LoyaltyHistoryScreenState createState() => _LoyaltyHistoryScreenState();
}

class _LoyaltyHistoryScreenState extends State<LoyaltyHistoryScreen> {
  LoyaltyStateManagement loyaltyHistoryProvider = LoyaltyStateManagement();
  LoyaltyStateManagement loyaltyPendingProvider = LoyaltyStateManagement();
  int selectedIndex = 0;
  LoyaltyBalanceModel? loyaltyBalanceModel;
  @override
  void initState() {
    updateList();
    super.initState();
  }

  void updateList() {
    loyaltyHistoryProvider = loyaltyHistoryProvider
      ..updateState(ADResponseState.loading())
      ..getTransactionList();
  }

  void updatePendingList() {
    loyaltyHistoryProvider = loyaltyHistoryProvider
      ..updateState(ADResponseState.loading())
      ..getPendingTransactionList();
  }

  @override
  Widget build(BuildContext context) {
    const Color selectedTabLineColor = Color(0xff5b00bc);
    const Color tabDividerLineColor = Color(0xfff4f4f4);
    const Color greyBackColor = Color(0xfff2f3f4);
    final double tabBaRHeight = 70.sp;
    final double bottomMargin = 78.sp;
    const int tabBarLength = 2;
    const double lineHeight = 1.5;
    final contentWidth = context.widthOfScreen * 0.68;
    final contentHeight = 224.sp;
    loyaltyBalanceModel = LoyaltyStateManagement.loyaltyPendingState.data ??
        const LoyaltyBalanceModel();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'reward_history'.localize(context),
          style: ADTextStyle700.size22.setTextColor(context.adColors.black),
        ),
      ),
      body: SafeArea(
        child: ADSelectorStateLessWidget<LoyaltyStateManagement>(
          viewModel: loyaltyHistoryProvider,
          child: Selector<LoyaltyStateManagement, bool>(
            selector: (context, viewModel) => viewModel.isAbsorbing,
            builder: (context, isAbsorbing, Widget? child) {
              return DefaultTabController(
                length: tabBarLength,
                child: AbsorbPointer(
                  absorbing: isAbsorbing,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Divider(
                            height: 1,
                            color: context.adColors.widgetDividerLine,
                            thickness: 1,
                          ),
                          ADSizedBox(
                            height: tabBaRHeight,
                            child: TabBar(
                              labelPadding: const EdgeInsets.all(0),
                              indicatorColor: selectedTabLineColor,
                              onTap: (index) => {
                                gaEvents(),
                                setState(() {
                                  selectedIndex = index;
                                  selectedIndex == 0
                                      ? updateList()
                                      : updatePendingList();
                                }),
                              },
                              tabs: [
                                Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                        color: tabDividerLineColor,
                                      ),
                                    ),
                                  ),
                                  child: HistoryTabView(
                                    rewardPoints: widget.rewardBalance,
                                    rewardTitle:
                                        'reward_points'.localize(context),
                                    selected: selectedIndex == 0,
                                  ),
                                ),
                                HistoryTabView(
                                  rewardPoints: loyaltyBalanceModel
                                          ?.totalPendingPoints
                                          .toString() ??
                                      '',
                                  rewardTitle:
                                      'pending_rewards'.localize(context),
                                  selected: selectedIndex == 1,
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 1,
                            color: context.adColors.widgetDividerLine,
                            thickness: 1,
                          ),
                          //  const DateAndFilterView(),
                          Expanded(
                            child: Selector<LoyaltyStateManagement,
                                ADResponseState>(
                              selector: (context, viewModel) =>
                                  viewModel.loyaltyStatusState,
                              builder: (context, value, Widget? child) {
                                switch (value.viewStatus) {
                                  case Status.complete:
                                    final List<LoyaltyHistoryData>
                                        loyaltyHistoryModel = value.data;

                                    return loyaltyHistoryModel.isNotEmpty
                                        ? TabBarView(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            children: [
                                              ListView.builder(
                                                itemBuilder: (context, index) {
                                                  return InkWell(
                                                    onTap: () => adLog('dd'),
                                                    child:
                                                        RewardBalanceListItem(
                                                      loyaltyHistoryModelList:
                                                          loyaltyHistoryModel[
                                                              index],
                                                      position: false,
                                                      selected: false,
                                                    ),
                                                  );
                                                },
                                                itemCount:
                                                    loyaltyHistoryModel.length,
                                              ),
                                              ListView.builder(
                                                itemBuilder: (context, index) {
                                                  return InkWell(
                                                    onTap: () => adLog('dd'),
                                                    child: loyaltyHistoryModel[
                                                                    index]
                                                                .loyaltyPoints !=
                                                            0
                                                        ? RewardBalanceListItem(
                                                            loyaltyHistoryModelList:
                                                                loyaltyHistoryModel[
                                                                    index],
                                                            position: true,
                                                            selected: true,
                                                          )
                                                        : const ADSizedBox
                                                            .shrink(),
                                                  );
                                                },
                                                itemCount:
                                                    loyaltyHistoryModel.length,
                                                padding: EdgeInsets.only(
                                                  bottom: bottomMargin,
                                                ),
                                              ),
                                            ],
                                          )
                                        : SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                ADSizedBox(
                                                  height: context.k_6,
                                                ),
                                                Image.asset(
                                                  'lib/assets/gif/no_rewards.gif',
                                                  width: contentWidth,
                                                  height: contentHeight,
                                                  fit: BoxFit.cover,
                                                ),
                                                // SvgPicture.asset(
                                                //   SvgAssets.noRewards,
                                                // ).paddingBySide(
                                                //   top: context.k_30,
                                                // ),
                                                Text(
                                                  'uh_oh_msg'.localize(context),
                                                  maxLines: tabBarLength,
                                                  style: ADTextStyle700.size16
                                                      .setTextColor(
                                                        context.adColors
                                                            .blackTextColor,
                                                      )
                                                      .copyWith(
                                                        height: lineHeight,
                                                      ),
                                                  textAlign: TextAlign.center,
                                                ).paddingBySide(
                                                  top: context.k_6,
                                                ),
                                                ADSizedBox(
                                                  height: context.k_30,
                                                ),
                                                OutlinedButton(
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                  style:
                                                      OutlinedButton.styleFrom(
                                                    side: BorderSide(
                                                      color: context.adColors
                                                          .blackTextColor,
                                                    ),
                                                    minimumSize:
                                                        Size.zero, // Set this
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: context.k_34,
                                                      vertical: context.k_14,
                                                    ), //
                                                  ),
                                                  child: Text(
                                                    'Start shopping',
                                                    style: ADTextStyle500.size14
                                                        .setTextColor(
                                                      context.adColors
                                                          .blackTextColor,
                                                    ),
                                                  ),
                                                ),
                                                ADSizedBox(
                                                  height: context.k_48,
                                                ),
                                              ],
                                            ),
                                          );
                                  case Status.loading:
                                    return const ADSizedBox();
                                  case Status.error:
                                    return Center(
                                      child: Text(
                                        value.message ??
                                            'SETPY02'.localize(context),
                                      ),
                                    );
                                  default:
                                    return Center(
                                      child: Text(
                                        'Process'.localize(context),
                                      ),
                                    );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      if (selectedIndex == 1)
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            color: context.adColors.whiteTextColor,
                            padding: EdgeInsets.all(
                              context.k_16,
                            ),
                            child: Container(
                              height: context.k_48,
                              padding: EdgeInsets.all(
                                context.k_6,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    context.k_8,
                                  ),
                                ),
                                color: greyBackColor,
                              ),
                              child: Flex(
                                direction: Axis.horizontal,
                                children: [
                                  Column(
                                    children: [
                                      ADSizedBox(
                                        height: context.k_10,
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        width: context.k_4,
                                        height: context.k_4,
                                        decoration: BoxDecoration(
                                          color: context
                                              .adColors.darkGreyTextColor,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ADSizedBox(
                                    width: context.k_8,
                                  ),
                                  Flexible(
                                    child: Text(
                                      'pending_reward_points_msg'
                                          .localize(context),
                                      style: ADTextStyle400.size12.setTextColor(
                                        context.adColors.darkGreyTextColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if (isAbsorbing)
                        ADDotProgressView(
                          loaderText: 'please_wait_while_msg'.localize(context),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  /// GA event method
  void gaEvents() {
    final map = {
      Parameters.category.name: 'rewards',
      Parameters.sub_category.name: 'view_rewards',
      Parameters.rewards_earned.name: selectedIndex == 1
          ? widget.rewardBalance
          : loyaltyBalanceModel?.availableBalancePoints,
    };
    selectedIndex == 1
        ? ClickEvents.view_reward_points_tab.logEvent(parameters: map)
        : ClickEvents.view_pending_rewards_tab.logEvent(parameters: map);
  }
}
