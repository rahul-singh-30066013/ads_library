/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/more/ga_analytics_profile/profile_ga_analytics.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class LogoutScreen extends StatefulWidget {
  final ADTapCallback logoutTap;
  final ValueNotifier<bool> logoutNotifier;

  const LogoutScreen({
    Key? key,
    required this.logoutTap,
    required this.logoutNotifier,
  }) : super(key: key);

  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  bool loggedOut = false;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, bool value, child) => AbsorbPointer(
        absorbing: value,
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'stay_logged_in_to_proceed'.localize(context),
                style: ADTextStyle400.size16.setTextColor(
                  context.adColors.neutralInfoMsg,
                ),
              ),
              ADSizedBox(
                height: context.k_30,
              ),
              Row(
                children: [
                  Expanded(
                    child: ADSizedBox(
                      height: context.k_48,
                      child: ElevatedButton(
                        onPressed: () => clickOnCancel(),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(context.k_24),
                            ),
                            side: BorderSide(
                              color: context.adColors.blackTextColor,
                            ),
                          ),
                          primary: context.adColors.whiteTextColor,
                          onPrimary: context.adColors.lightGreyTextColor,
                        ),
                        child: Text(
                          'cancel'.localize(context),
                          style: ADTextStyle400.size16
                              .setTextColor(context.adColors.blackTextColor),
                        ),
                      ),
                    ),
                  ),
                  ADSizedBox(
                    width: context.k_10,
                  ),
                  Expanded(
                    child: ADSizedBox(
                      height: context.k_48,
                      child: ElevatedButton(
                        onPressed: () => logoutClick(context: context),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(context.k_24),
                            ),
                          ),
                          primary: context.adColors.blackTextColor,
                          onPrimary: context.adColors.lightGreyTextColor,
                        ),
                        child: value
                            ? ADDotProgressView(
                                color: context.adColors.whiteTextColor,
                              )
                            : Text(
                                'logout'.localize(context),
                                style: ADTextStyle700.size16.setTextColor(
                                  context.adColors.whiteTextColor,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
          ),
        ),
      ),
      valueListenable: widget.logoutNotifier,
    );
  }

  Future<void> logoutClick({required BuildContext context}) async {
    widget.logoutTap();
    ProfileGaAnalytics().logOutPopUpAnalyticsData(label: 'sign_out');
    ProfileGaAnalytics().logOutAnalyticsData();
    navigatorPopScreen(context);
  }

  void clickOnCancel() {
    ProfileGaAnalytics().logOutPopUpAnalyticsData(label: 'cancel');
    Navigator.pop(context);
  }
}
