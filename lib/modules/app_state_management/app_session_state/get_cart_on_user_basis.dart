/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';
import 'dart:convert';

import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_cart_utils.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/deep_link_manager/deep_link_manager.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// Class is used to get active cart on basis of user id.
class GetCartOnUserBasis {
  Future<void> getCartData(BuildContext context, {String? oldAgentId}) async {
    /// Check Shared preferences if any cart present or not
    /// first we will fetch active cart from API on that basis we will hit API
    final AppSessionState appSessionState = context.read<AppSessionState>();
    final String activeCartName = await appSessionState.getActiveCart();
    final appCartUtils = AppCartUtils();
    adLog('activeCartName : $activeCartName', className: this);
    adLog('oldAgentId : $oldAgentId', className: this);
    final DutyFreeState dutyFreeState = context.read<DutyFreeState>();
    final localCartName = await appCartUtils.readCartName();
    if (oldAgentId?.isEmpty ?? true) {
      if (activeCartName == 'dutyFree' || activeCartName == 'Dutyfree') {
        /// Hit DutyFree Cart Api
        final ADResponseState responseState =
            await dutyFreeState.getCartDetails(
          context,
          oldAgentId: oldAgentId,
        );
        adLog('responseState ${responseState.toString()} ', className: this);
        appCartUtils.updateBottomTabCartScreen(const ADSizedBox.shrink());
        // TODO if error comes handle that scenario
      } else if (activeCartName == 'Pranaam') {
        /// Hit Pranaam Cart Api
        await appSessionState.getPranaamCartItemDetails(
          oldAgentId: oldAgentId,
        );
        appCartUtils.updateBottomTabCartScreen(const ADSizedBox.shrink());
      } else {
        final ADResponseState responseState =
            await dutyFreeState.getCartDetails(
          context,
          oldAgentId: oldAgentId,
        );
        adLog('responseState ${responseState.toString()} ', className: this);
        // avoid hit getCart api for pranaam if cart is exist for duty free
        if (responseState.viewStatus == Status.error) {
          await appSessionState.getPranaamCartItemDetails(
            oldAgentId: oldAgentId,
          );
        }
        appCartUtils.updateBottomTabCartScreen(const ADSizedBox.shrink());
      }
    } else {
      if (localCartName == CartType.dutyFree.name) {
        final ADResponseState responseState =
            await dutyFreeState.getCartDetails(
          context,
          oldAgentId: oldAgentId,
        );
        final deepLinkManage = DeepLinkManager();
        if (deepLinkManage.hasDeepLink) {
          final params = deepLinkManage.deepLink ?? {};
          final data = jsonDecode(params['data']) as Map<String, dynamic>;
          final deepLinkData = DutyFreeDeepLinkDataModel.fromJson(data);
          unawaited(
            dutyFreeState.getDutyFreeTerminalList(
              storeType: deepLinkData.storeType,
            ),
          );
        }
        adLog('responseState ${responseState.toString()} ', className: this);
        appCartUtils.updateBottomTabCartScreen(const ADSizedBox.shrink());
      } else if (localCartName == CartType.pranaam.name) {
        await appSessionState.getPranaamCartItemDetails(
          oldAgentId: oldAgentId,
        );
        appCartUtils.updateBottomTabCartScreen(const ADSizedBox.shrink());
      }
    }
  }

  Future<void> clearActiveCart(BuildContext context) async {
    final appCartUtils = AppCartUtils();
    final String activeCartName = await appCartUtils.readCartName() ?? '';
    adLog('activeCartName clearActiveCart : $activeCartName', className: this);
    if (activeCartName == CartType.dutyFree.name) {
      context.read<AppSessionState>().clearDutyFreeCart(context);
    } else if (activeCartName == CartType.pranaam.name) {
      context.read<AppSessionState>().clearPranaamCartLocally();
    }
  }

  Future<void> showDialogOnBasisOfActiveCart(BuildContext context) async {
    final appCartUtils = AppCartUtils();
    final String activeCartName = await appCartUtils.readCartName() ?? '';
    adLog('activeCartName : $activeCartName', className: this);

    /// means nothing add in either cart
    if (activeCartName == CartType.noDataInCart.name) {
      return;
    }

    /// means items add in either duty free or pranaam cart, need to show
    /// dialog to remove other cart items.

    appCartUtils.showDialogOnBasisOfActiveCart(
      context,
      isDutyFreeCart: activeCartName == CartType.dutyFree.name,
    );
  }
}
