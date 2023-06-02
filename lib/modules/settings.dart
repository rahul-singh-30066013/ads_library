/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_tab_nav_keys.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/custom_tab_scaffold.dart';
import 'package:adani_airport_mobile/modules/delete_account.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/more/screens/more_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  ValueNotifier<bool> deleteAccountNotifier = ValueNotifier(false);

  void showConfirmationBottomSheet({required BuildContext context}) {
    //Utils.deleteAccountEmailHandling()
    //deleteAccountTap(context: context),
    adShowBottomSheet(
      context: context,
      childWidget: DeleteAccount(
        deleteAccountTap: () => Utils.deleteAccountEmailHandling(),
        deleteAccountNotifier: deleteAccountNotifier,
      ),
      headerTitle: 'delete_my_account'.localize(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(''),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'settings'.localize(context),
              style: ADTextStyle700.size32
                  .setTextColor(context.adColors.blackColor),
            ),
          ).paddingBySide(
            left: context.k_16,
            top: context.k_10,
          ),
          ListTile(
            onTap: () => showConfirmationBottomSheet(context: context),
            minLeadingWidth: context.k_10,
            title: Row(
              children: [
                Text(
                  'delete_my_account'.localize(context),
                  style: ADTextStyle400.size18
                      .setTextColor(context.adColors.blackColor),
                ),
                ADSizedBox(
                  width: context.k_10,
                ),
              ],
            ),
            subtitle: Text(
              'account_delete_message'.localize(context),
              style: ADTextStyle400.size14
                  .setTextColor(context.adColors.darkGreyTextColor),
              // .copyWith(fontWeight: FontWeight.w300),
            ).paddingBySide(top: context.k_6),
            leading: SizedBox(
              height: ProfileListTile.kRowHeight,
              child: SvgPicture.asset(
                SvgAssets.deleteIcon,
                height: context.k_20,
                width: context.k_20,
                color: context.adColors.darkGreyTextColor,
              ),
            ),
          ).paddingBySide(
            top: context.k_10,
          ),
        ],
      ),
    );
  }

  Future<void> deleteAccountTap({required BuildContext context}) async {
    deleteAccountNotifier.value = true;
    final bool deleteAccount =
        await context.read<AppSessionState>().serviceCallForDeleteAccount();
    if (deleteAccount) {
      await Utils.logOutTap(context: context);
      adLog('logoutTap');

      ///Show delete Account message
      SnackBarUtil.showSnackBar(
        context,
        'account_delete_success_message'.localize(context),
      );
      navigatorPopScreen(context);
      navigatorPopScreen(context);
      final CustomTabScaffold scaffold =
          BottomBarState.key.currentWidget as CustomTabScaffold;
      scaffold.controller?.index = 0;
      (BottomTabNavKeys.homeTabItemKey.currentState ?? NavigatorState())
          .popUntil((route) => route.isFirst);
    } else {
      navigatorPopScreen(context);
      // ///Show delete Account message
      // SnackBarUtil.showSnackBar(
      //   context,
      //   'something_went_wrong_try_again'.localize(context),
      // );
    }
    deleteAccountNotifier.value = false;
  }
}
