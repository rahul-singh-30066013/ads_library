/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/components/get_profile_icon/get_profile_icon.dart';
import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/more/ga_analytics_profile/profile_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/more/screens/more_screen.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_draggable_scrollable_sheet_body.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

///This is common widget for opening bottom sheet for more screen with ad profile widget.
class AdProfileWithAction extends StatelessWidget {
  final bool isFromOrderAndBooking;
  final bool openBottomSheetOnTap;
  final double? circleSize;
  final double? iconSize;
  final TextStyle? textStyle;

  const AdProfileWithAction({
    Key? key,
    this.isFromOrderAndBooking = false,
    this.openBottomSheetOnTap = true,
    this.circleSize,
    this.iconSize,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppSessionState>(
      builder: (context, appState, _) {
        final personInfo = appState.profileModel.personInfo;
        return TouchableOpacity(
          onTap: openBottomSheetOnTap ? () => callMoreWidget(context) : null,
          child: Padding(
            padding: EdgeInsets.only(right: context.k_16, left: context.k_8),
            child: GetProfileIcon(
              circleSize: circleSize ?? context.k_34,
              isLoggedIn: appState.isLoggedIn,
              iconSize: iconSize ?? context.k_14,
              namePrefix:
                  '${personInfo?.firstName ?? ''}${personInfo?.lastName ?? ''}',
              imageFile: appState.profileImageFile,
              textStyle: textStyle ??
                  ADTextStyle600.size12
                      .setTextColor(context.adColors.darkGreyTextColor),
            ),
          ),
        );
      },
    );
  }

  void callMoreWidget(BuildContext context) {
    showDraggableListBottomSheet(
      context: context,
      isFromOrderAndBooking: isFromOrderAndBooking,
    );
    ProfileGaAnalytics().viewProfileAnalyticsData();
  }

  Future<void> showDraggableListBottomSheet({
    required BuildContext context,
    required bool isFromOrderAndBooking,
  }) =>
      ADDraggableScrollableSheetBody.showDraggableScrollableBottomSheet(
        context: context,
        child: DraggableScrollableSheet(
          initialChildSize: ADDraggableScrollableSheetBody.minChildSize,
          maxChildSize: ADDraggableScrollableSheetBody.maxChildSize,
          minChildSize: ADDraggableScrollableSheetBody.minChildSize,
          expand: false,
          builder: (BuildContext context, ScrollController scrollController) {
            return ADDraggableScrollableSheetBody(
              headerTitle: 'account',
              childWidget: MoreScreen(
                openBottomSheet: true,
                isFromOrderAndBooking: isFromOrderAndBooking,
                scrollController: scrollController,
              ),
            );
          },
        ),
      ).then(
        (value) {
          if (value == 0) {
            navigateToScreenUsingNamedRoute(
              context,
              loyaltyDashboard,
              rootNavigator: false,
            );
          }
        },
      );
}
