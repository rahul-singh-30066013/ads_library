/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_balance_model.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_dashboard_site_core_response.dart';
import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_dashboard/view/animated_view.dart';
import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_dashboard/view/value_change_animation_view.dart';
import 'package:adani_airport_mobile/modules/loyalty/screens/loyalty_dialog/dialog_view.dart';
import 'package:adani_airport_mobile/modules/loyalty/state_management/loyalty_state_management.dart';
import 'package:adani_airport_mobile/modules/loyalty/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/play_sound.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///this class is used to provide faq section view on loyalty dashboard
class RewardPointsView extends StatefulWidget {
  const RewardPointsView({
    Key? key,
    required this.widgetItems,
    required this.loyaltyHistoryProvider,
  }) : super(key: key);

  final WidgetItem widgetItems;
  final LoyaltyStateManagement loyaltyHistoryProvider;

  @override
  State<RewardPointsView> createState() => _RewardPointsViewState();
}

class _RewardPointsViewState extends State<RewardPointsView>
    with TickerProviderStateMixin {
  ///Local varibales
  LoyaltyBalanceModel loyaltyBalanceModel = const LoyaltyBalanceModel();
  final int maxLines = 1;
  final double _k_42 = 42.sp;
  final double _k_80 = 80.sp;
  final double balanceTextSize = 42.sp;
  final double _k_124 = 124.sp;

  ///Todo add to styles
  static const _purpleShadeDark = Color(0xff371967);
  static const _purpleShadelight = Color(0xffa55cce);
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Selector<LoyaltyStateManagement, ADResponseState>(
      selector: (context, viewModel) =>
          widget.loyaltyHistoryProvider.loyaltyStatusState,
      builder: (context, value, Widget? child) {
        switch (value.viewStatus) {
          case Status.complete:
            loyaltyBalanceModel = value.data;
            widget.loyaltyHistoryProvider.balance =
                loyaltyBalanceModel.availableBalancePoints;
            widget.loyaltyHistoryProvider.pending =
                loyaltyBalanceModel.totalPendingPoints;
            if (loyaltyBalanceModel.availableBalancePoints > 0) {
              PlaySound.playAudioSound('adani_point_rewards.mp3');
            }
            context
                .read<AppSessionState>()
                .updateLoyalty(loyaltyBalanceModel.availableBalancePoints);
            return Column(
              children: [
                ADSizedBox(
                  height: _k_124,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      AnimatedView(
                        animationType: Constants.animationTypeLeft,
                        path: SvgAssets.zigzagIcon,
                        height: context.k_8,
                        color: _purpleShadeDark,
                      ),
                      AnimatedView(
                        animationType: Constants.animationTypeTop,
                        path: SvgAssets.ractangleDotIcon,
                        height: _k_80,
                        right: -context.k_38,
                        color: _purpleShadeDark,
                      ),
                      Column(
                        children: [
                          ///TODO Size 42 to add in style
                          ValueChangeAnimationView(
                            point: widget.loyaltyHistoryProvider.balance,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: balanceTextSize,
                            ),
                          ),
                          ADSizedBox(
                            height: context.k_4,
                          ),
                          Text(
                            widget.widgetItems.title,
                            style: ADTextStyle500.size22,
                            textAlign: TextAlign.center,
                          ),
                          ADSizedBox(
                            height: context.k_14,
                          ),
                          GestureDetector(
                            onTap: () => {
                              gaEvents(),
                              navigateToScreenUsingNamedRouteWithArguments(
                                context,
                                loyaltyHistoryScreen,
                                argumentObject: [
                                  widget.loyaltyHistoryProvider.balance
                                      .toString(),
                                  widget.loyaltyHistoryProvider.pending
                                      .toString(),
                                ],
                              ),
                            },
                            child: ADSizedBox(
                              height: context.k_30,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.widgetItems.ctaText,
                                    style: ADTextStyle500.size16.copyWith(
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  ADSizedBox(
                                    width: context.k_4,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ADSizedBox(
                  height: context.k_16,
                ),
                Container(
                  width: double.infinity,
                  height: _k_42,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        context.k_8,
                      ),
                    ),
                    gradient: const LinearGradient(
                      colors: [
                        _purpleShadeDark,
                        _purpleShadelight,
                      ],
                    ),
                  ),
                  child: GestureDetector(
                    //  onTap: () => showDialogScreen(context),
                    onTap: () => adLog(''),

                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                //TODO to be added in CMS
                                loyaltyBalanceModel.lifetimeBurnedPoints > 0
                                    ? "You've saved ₹${loyaltyBalanceModel.lifetimeBurnedPoints} with Reward Points!"
                                    : 'time_to_save_big'.localize(context),
                                style: ADTextStyle400.size14.setTextColor(
                                  context.adColors.whiteTextColor,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: maxLines,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        // VerticalDivider(
                        //   color: context.adColors.whiteTextColor,
                        // ),
                        // Expanded(
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       SvgPicture.asset(
                        //         SvgAssets.coinIcon,
                        //         height: context.k_16,
                        //         width: context.k_16,
                        //       ),
                        //       ADSizedBox(
                        //         width: context.k_4,
                        //       ),
                        //       // Text(
                        //       //   '1_point_1'.localize(context),
                        //       //   style: ADTextStyle400.size14.setTextColor(
                        //       //     context.adColors.whiteTextColor,
                        //       //   ),
                        //       //   textAlign: TextAlign.center,
                        //       //   maxLines: maxLines,
                        //       //   overflow: TextOverflow.ellipsis,
                        //       // ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ).paddingBySide(
                      left: context.k_16,
                      right: context.k_16,
                    ),
                  ),
                ).paddingBySide(
                  left: context.k_16,
                  right: context.k_16,
                ),
              ],
            );
          case Status.loading:
            return const ADSizedBox();
          case Status.error:
            return const ADSizedBox.shrink();
          default:
            return const ADSizedBox.shrink();
        }
      },
    );
  }

  ///this widget is used to open alert dialog
  Future showDialogScreen(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return const DialogView(
          buttonRequired: true,
        );
      },
    );
  }

  /// GA event method
  void gaEvents() {
    final map = {
      Parameters.category.name: 'rewards',
      Parameters.sub_category.name: 'view_rewards',
      Parameters.rewards_earned.name:
          widget.loyaltyHistoryProvider.balance.toString(),
    };
    ClickEvents.view_all_loyalty_rewards.logEvent(parameters: map);
  }
}
