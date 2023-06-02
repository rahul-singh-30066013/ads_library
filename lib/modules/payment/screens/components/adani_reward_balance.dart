/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/analytics.dart';
import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cab_googleanalytics.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/payment_method_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/tooltip_view/tooltip_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class AdaniRewardBalance extends StatefulWidget {
  const AdaniRewardBalance({
    Key? key,
    required this.totalAmount,
    this.excludedAmount = 0,
  }) : super(key: key);

  final double totalAmount;
  final double excludedAmount;

  @override
  State<AdaniRewardBalance> createState() => _AdaniRewardBalanceState();
}

class _AdaniRewardBalanceState extends State<AdaniRewardBalance> {
  PaymentMethodState? _paymentMethodViewModel;
  double loyaltyBalance = 0;
  final lineHeight = 1.5;

  @override
  void initState() {
    _paymentMethodViewModel = context.read<PaymentMethodState>();
    Analytics.flightBookingGAObject?[Parameters.rewards_burned.name] =
        double.parse(getBalance());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    loyaltyBalance = double.parse(getBalance());

    return Padding(
      padding: EdgeInsets.only(left: context.k_4, right: context.k_16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ADSizedBox(
            width: context.k_48,
            height: context.k_26,
            child: Checkbox(
              value: loyaltyBalance > 0
                  ? _paymentMethodViewModel?.isRedeemPointsChecked
                  : false,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              splashRadius: context.k_30,
              checkColor: context.adColors.whiteTextColor,
              fillColor: MaterialStateProperty.resolveWith(
                _getColor,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              side: BorderSide(
                color: context.adColors.greyTextColor,
              ),
              onChanged: (bool? value) => setState(() {
                adLog(
                  'onChanged value $value',
                  className: this,
                );
                if (_paymentMethodViewModel?.paymentModule ==
                    PaymentModule.cabBooking) {
                  CabGoogleAnalytics()
                      .sendGAParametersRewards(_paymentMethodViewModel);
                }
                if (value == true) {
                  Analytics.flightBookingGAObject?[
                      Parameters.rewards_burned.name] = loyaltyBalance;
                } else {
                  Analytics.flightBookingGAObject?[
                      Parameters.rewards_burned.name] = 0.0;
                }

                adLog(
                  'onChanged value ${Analytics.flightBookingGAObject?[Parameters.rewards_burned.name]}',
                );

                if (loyaltyBalance > 0) {
                  _updateLoyaltyView(value: value, context: context);
                }
              }),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Adani Rewards ',
                  style: ADTextStyle700.size16.setTextColor(
                    context.adColors.blackTextColor,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Balance ${getBalance()} Points',
                      style: ADTextStyle400.size14.setTextColor(
                        context.adColors.blackTextColor,
                      ),
                    ),
                    TooltipScreen(
                      richTextMessage: widget.excludedAmount < 1
                          ? 'You can redeem 100% Reward Points'
                          : '100% Reward Points redeemable\n(insurance amount exempted)',
                      textStyleMessage: ADTextStyle400.size14
                          .setTextColor(
                            context.adColors.whiteTextColor,
                          )
                          .copyWith(
                            height: lineHeight,
                          ),
                      padding: widget.excludedAmount < 1
                          ? -context.k_32
                          : -context.k_40 - context.k_4,
                    ),
                  ],
                ),
              ],
            ),
          ),
          ADSizedBox(
            width: context.k_14,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (!(_paymentMethodViewModel?.isRedeemPointsChecked ?? false))
                ADSizedBox(
                  height: context.k_12,
                ),
              SvgPicture.asset(
                SvgAssets.coinIcon,
                height: _paymentMethodViewModel?.isRedeemPointsChecked ?? false
                    ? context.k_20
                    : context.k_20,
                width: (_paymentMethodViewModel?.isRedeemPointsChecked ?? false)
                    ? context.k_18
                    : context.k_24,
              ),
              ADSizedBox(
                height: context.k_6,
              ),
              if ((_paymentMethodViewModel?.isRedeemPointsChecked ?? false) &&
                  loyaltyBalance > 0)
                Text(
                  int.parse(getBalance()) >
                          widget.totalAmount - widget.excludedAmount
                      ? 'You saved ₹${(widget.totalAmount - widget.excludedAmount).floor()}'
                      : 'You saved ₹${getBalance()}',
                  style: ADTextStyle400.size14.setTextColor(
                    context.adColors.greenTextColor,
                  ),
                ).paddingBySide(bottom: context.k_2),
            ],
          ),
        ],
      ),
    );
  }

  void _updateLoyaltyView({bool? value, required BuildContext context}) {
    {
      final loyaltyCheckboxValue = value ?? false;
      _paymentMethodViewModel?.isRedeemPointsChecked = loyaltyCheckboxValue;

      final loyaltyBalance = double.parse(getBalance());
      _paymentMethodViewModel?.rewardPoint.value =
          (_paymentMethodViewModel?.isRedeemPointsChecked ?? false)
              ? (loyaltyBalance > widget.totalAmount
                  ? widget.totalAmount
                  : loyaltyBalance)
              : 0;

      if (loyaltyCheckboxValue && loyaltyBalance >= widget.totalAmount) {
        _paymentMethodViewModel?.allModeCollapsed(
          context.read<SiteCoreStateManagement>(),
        );
        SnackBarUtil.showSnackBar(
          context,
          'uncheck_the_adani_Rewards_toast'.localize(context),
        );
      } else {
        _paymentMethodViewModel?.backToDefaultStage(
          context.read<SiteCoreStateManagement>(),
        );
      }
    }
  }

  String getBalance() {
    final AppSessionState appSessionState = context.read<AppSessionState>();
    return appSessionState.loyaltyPoint;
  }

  /// this method is use for set colour on checkbox
  Color _getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return context.adColors.greyTextColor;
    }
    return context.adColors.black;
  }
}
