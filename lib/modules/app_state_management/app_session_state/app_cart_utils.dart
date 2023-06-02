/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_tab_nav_keys.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/home_bottom_assets.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/views/duty_free_remove_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';

const String keyActiveCart = 'keyActiveCart';

class AppCartUtils {
  //to write data to data store
  Future<void> saveCartName(
    String cartName,
  ) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final cartValue = await sharedPreferences.setString(
      keyActiveCart,
      cartName,
    );
    adLog(cartValue.toString());
  }

  //to read data from data store
  Future<String?> readCartName() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final value = sharedPreferences.getString(
      keyActiveCart,
    );
    // final value = await SharedPrefsUtils().getVarValueFromPrefs(keyActiveCart);
    return value.toString().isNotEmpty ? value : CartType.noDataInCart.name;
  }

  /// Show dialog if item present in Duty free cart or pranaam Cart, bool flag
  /// determine which cart have active item,if dutyFreCart value is true means
  /// items add in duty free cart in that case need to call, duty freeCart items
  void showDialogOnBasisOfActiveCart(
    BuildContext context, {
    bool isDutyFreeCart = false,
  }) {
    showModalBottomSheet(
      useRootNavigator: true,
      backgroundColor: context.adColors.whiteTextColor,
      elevation: context.k_8,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(context.k_22),
        ),
      ),
      context: context,
      builder: (dialogContext) {
        return DutyFreeRemoveItem(
          detailString: 'remove_cart_item_pranaam'.localize(context),
          titleString: 'cart_confirmation'.localize(context),
          yesCallBack: () =>
              //TODO as of now same is API call else part change with pranaam API
              isDutyFreeCart
                  ? clearDutyFreeCartApi(
                      context: context,
                      dialogContext: dialogContext,
                    )
                  : clearDutyFreeCartApi(
                      context: context,
                      dialogContext: dialogContext,
                    ),
          noCallBack: () => navigatorPopScreen(dialogContext),
        );
      },
    ).then((value) => adLog('showDialogOnBasisOfActiveCart : $value'));
  }

  void clearDutyFreeCartApi({
    required BuildContext context,
    required BuildContext dialogContext,
  }) {
    context
        .read<DutyFreeState>()
        .removeDutyFreeCart()
        .then((value) => _clearCart(context));
    navigatorPopScreen(dialogContext);
  }

  void _clearCart(BuildContext context) {
    final dutyFreeState = context.read<DutyFreeState>();
    dutyFreeState.dutyFreeCartResponse?.itemDetails.clear();
    //TODO will change after discussion
    /* dutyFreeState.updateCartMap(context);
    dutyFreeState.notifyListeners();
    dutyFreeState.dutyFreeCartResponse = null;*/
  }

  void updateBottomTabCartScreen(Widget cartWidget) {
    HomeBottomAssets.homeBottomPages[BottomTabNavKeys.cartTabItemKey] =
        cartWidget;
  }
}
