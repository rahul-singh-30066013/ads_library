/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io';

import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_refer_and_earn_model.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_retrieve_member_model.dart';
import 'package:adani_airport_mobile/modules/loyalty/screen_helper/automation_keys/loyalty_automation_keys.dart';
import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_dashboard/view/custom_timeline.dart';
import 'package:adani_airport_mobile/modules/loyalty/state_management/loyalty_state_management.dart';
import 'package:adani_airport_mobile/modules/more/ga_analytics_profile/profile_ga_analytics.dart';
import 'package:adani_airport_mobile/utils/debounce.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class ReferAndEarn extends StatefulWidget {
  const ReferAndEarn({Key? key}) : super(key: key);

  @override
  State<ReferAndEarn> createState() => _ReferAndEarnState();
}

class _ReferAndEarnState extends State<ReferAndEarn> {
  final LoyaltyStateManagement _referAndEarnViewModel =
      LoyaltyStateManagement();
  final _oragngeTextColor = const Color(0xfffbcf42);
  final titleTopMargin = 80.sp;
  final listBottomMargin = 100.sp;
  final double lineSpacing = 1.4;
  final double _k_100 = 100.sp;
  String referUrl = '';
  bool clicked = false;

  ///TODO add to styles
  static const Color _timelinePathColor = Color(0xff3761b5);
  @override
  void initState() {
    super.initState();
    _referAndEarnViewModel
      ..getReferUrl()
      ..fetchReferAndEarn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => navigatorPopScreen(context),
          icon: Icon(
            Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back_outlined,
            size: context.k_20,
            color: context.adColors.whiteTextColor,
          ),
        ),
      ),
      body: ADSelectorStateLessWidget(
        viewModel: _referAndEarnViewModel,
        child: Selector<LoyaltyStateManagement, ADResponseState>(
          selector: (context, viewModel) => viewModel.loyaltySiteCoreState,
          builder: (context, value, Widget? child) {
            switch (value.viewStatus) {
              case Status.loading:
                return Center(
                  child: ADDotProgressView(
                    color: context.adColors.black,
                  ),
                );
              case Status.error:
                return Center(child: Text(value.message.toString()));
              case Status.complete:
                final List<ReferAndEarnItem> referAndEarnSiteCoreResponse =
                    value.data as List<ReferAndEarnItem>;
                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ListView(
                      padding: EdgeInsets.zero,
                      physics: const ClampingScrollPhysics(),
                      children: [
                        Stack(
                          children: [
                            Image.network(
                              referAndEarnSiteCoreResponse
                                  .first.widgetItems.first.mobileImage,
                              width: double.infinity,
                              //   height: 360.sp,
                              fit: BoxFit.fill,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ADSizedBox(
                                  height: _k_100,
                                ),
                                Text(
                                  referAndEarnSiteCoreResponse
                                      .first.widgetItems.first.title
                                      .replaceAll(r'\n', '\n'),
                                  style: ADTextStyle700.size22.setTextColor(
                                    _oragngeTextColor,
                                  ),
                                ),
                                ADSizedBox(
                                  height: context.k_6,
                                ),
                                Text(
                                  referAndEarnSiteCoreResponse
                                      .first.widgetItems.first.descriptionApp
                                      .replaceAll(r'\n', '\n'),
                                  style: ADTextStyle500.size16
                                      .setTextColor(
                                        context.adColors.whiteTextColor,
                                      )
                                      .copyWith(
                                        height: lineSpacing,
                                      ),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ).paddingBySide(
                              left: context.k_16,
                            ),
                          ],
                        ),
                        ADSizedBox(
                          height: context.k_32,
                        ),
                        Text(
                          referAndEarnSiteCoreResponse[1]
                              .widgetItems
                              .first
                              .title,
                          style: ADTextStyle600.size18,
                        ).paddingBySide(left: context.k_16),
                        ADSizedBox(
                          height: context.k_32,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: referAndEarnSiteCoreResponse[1]
                              .widgetItems
                              .first
                              .rewardStepList
                              .length,
                          padding: EdgeInsets.zero,
                          itemBuilder: (BuildContext context, int index) {
                            return CustomTimeline(
                              isDashedLine: false,
                              timelineSize: referAndEarnSiteCoreResponse[1]
                                  .widgetItems
                                  .first
                                  .rewardStepList
                                  .length,
                              status: true,
                              index: index,
                              nodeColor: _timelinePathColor,
                              pathColor: _timelinePathColor,
                              mainTextStyle: ADTextStyle400.size16.setTextColor(
                                context.adColors.blackColor,
                              ),
                              mainText: referAndEarnSiteCoreResponse[1]
                                  .widgetItems
                                  .first
                                  .rewardStepList[index]
                                  .rewardsSteps,
                            ).paddingBySide(
                              left: context.k_32,
                              right: context.k_32,
                            );
                          },
                        ),
                        ADSizedBox(
                          height: listBottomMargin,
                        ),
                      ],
                    ),
                    Selector<LoyaltyStateManagement, ADResponseState>(
                      selector: (context, viewModel) =>
                          viewModel.loyaltyStatusState,
                      builder: (context, value, Widget? child) {
                        switch (value.viewStatus) {
                          case Status.complete:
                            final LoyaltyRetrieveMemberModel
                                loyaltyRetrieveMemberModel = value.data;

                            referUrl = loyaltyRetrieveMemberModel.referralLink;
                            if (clicked) {
                              Share.share(
                                referAndEarnSiteCoreResponse[2]
                                        .widgetItems
                                        .first
                                        .media
                                        .first
                                        .mediaText +
                                    referUrl,
                                subject: '',
                              );
                              clicked = false;
                            }
                            return ElevatedButton(
                              key: const Key(
                                LoyaltyAutomationKeys.sendInviteKey,
                              ),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(context.k_28),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                  Size(double.infinity, context.k_56),
                                ),
                              ),
                              onPressed: () => {
                                ProfileGaAnalytics()
                                    .selectReferAndInviteAnalyticsData(''),
                                if (!DeBounce.isRedundantClick())
                                  {
                                    Share.share(
                                      referAndEarnSiteCoreResponse[2]
                                              .widgetItems
                                              .first
                                              .media
                                              .first
                                              .mediaText +
                                          referUrl,
                                      subject: '',
                                    ),
                                  },
                              },
                              child: Text(
                                referAndEarnSiteCoreResponse[2]
                                    .widgetItems
                                    .first
                                    .ctaText,
                                style: ADTextStyle700.size18.setTextColor(
                                  context.adColors.whiteTextColor,
                                ),
                              ),
                            ).paddingBySide(
                              top: context.k_64,
                              left: context.k_16,
                              right: context.k_16,
                              bottom: context.k_24,
                            );
                          case Status.loading:
                            return ElevatedButton(
                              key: const Key(
                                LoyaltyAutomationKeys.sendInviteKey,
                              ),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(context.k_28),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                  Size(double.infinity, context.k_56),
                                ),
                              ),
                              onPressed: () => {
                                clicked = true,
                              },
                              child: Text(
                                referAndEarnSiteCoreResponse[2]
                                    .widgetItems
                                    .first
                                    .ctaText,
                                style: ADTextStyle700.size18.setTextColor(
                                  context.adColors.whiteTextColor,
                                ),
                              ),
                            ).paddingBySide(
                              top: context.k_64,
                              left: context.k_16,
                              right: context.k_16,
                              bottom: context.k_24,
                            ); //   return Container(
                          //     decoration: BoxDecoration(
                          //       borderRadius: const BorderRadius.all(
                          //         Radius.circular(28),
                          //       ),
                          //       color:
                          //           context.adColors.blueColor.withOpacity(1),
                          //     ),
                          //     height: context.k_56,
                          //     width: double.infinity,
                          //     child: ADDotProgressView(
                          //       color: context.adColors.whiteTextColor,
                          //     ),
                          //   ).paddingBySide(
                          //     top: context.k_64,
                          //     left: context.k_16,
                          //     right: context.k_16,
                          //     bottom: context.k_24,
                          //   );
                          case Status.error:
                            return const ADSizedBox.shrink();
                          default:
                            return const Center(
                              child: Text(
                                '',
                              ),
                            );
                        }
                      },
                    ),
                  ],
                );
              default:
            }
            return Container();
          },
        ),
      ),
    );
  }
}
