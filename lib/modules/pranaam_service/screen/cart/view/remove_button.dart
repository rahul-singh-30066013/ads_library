import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/package_service/pranaam_remove_item.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/screen_helper/process_dialog.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/ga_analytics/stand_alone_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/ga_analytics/stand_alone_ga_name.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class RemoveButton extends StatelessWidget {
  const RemoveButton({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _removeCart(context),
      child: Text(
        'remove'.localize(context),
        style: ADTextStyle400.size14
            .setTextColor(
              context.adColors.blackTextColor,
            )
            .copyWith(
              decoration: TextDecoration.underline,
            ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  void _removeCart(BuildContext context) {
    StandAloneGaAnalytics()
        .removeCartEvent(context, ClickEvents.remove_from_cart_start);
    StandAloneGaAnalytics()
        .addToCartEvent(context, ClickEvents.remove_from_cart);
    final bottomSheet = showModalBottomSheet(
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
        return PranaamRemoveItem(
          noCallBack: () => navigatorPopScreen(dialogContext),
          detailString: 'sure_want_to_remove_package'.localize(context),
          titleString: 'remove_package'.localize(context),
          yesCallBack: () => {
            StandAloneGaAnalytics().removeCartEvent(
              context,
              StandAloneGaName(context).removeCartName(),
            ),
            navigatorPopScreen(dialogContext),
            context
                .read<PranaamAppDataStateManagement>()
                .callDeleteCart(
                  appSessionState: context.read<AppSessionState>(),
                )
                .then(
                  (value) => closeProgressAndValidateDeleteItem(value, context),
                ),
          },
        );
      },
    );
    adLog('$bottomSheet');
  }

  void closeProgressAndValidateDeleteItem(
    ADResponseState state,
    BuildContext context,
  ) {
    ProcessDialog.closeLoadingDialog(context);
    if (state.viewStatus == Status.complete) {
      adLog('message');
      // save pranaam cart name in preferences
      context.read<AppSessionState>().saveCart(CartType.noDataInCart.name);
    } else {
      SnackBarUtil.showSnackBar(
        context,
        state.message ?? 'something_went_wrong_try_again'.localize(context),
      );
    }
  }
}
