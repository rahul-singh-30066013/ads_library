/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/apply_coupon_screen/views/apply_coupon_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/flight_automation_keys.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/ga_analytics/pranaam_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/cart_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/validate_coupons/request_model/validate_coupon.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/ga_helper/ga_event.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// [CouponAndPolicyView] is used to draw the view baggage,cancellation policy and coupon code.

const couponColor = Color(0xff32a851);

class CouponAndPolicyView extends StatefulWidget {
  const CouponAndPolicyView({
    required this.title,
    this.icon,
    required this.baseFareAmount,
    required this.adGenericCallback,
    required this.couponApplied,
    this.cartResponse,
    this.subTitle,
    this.pranaamAppDataStateManagement,
    Key? key,
  }) : super(key: key);

  /// title of the tile
  final String title;

  /// icon of the tile
  final IconData? icon;

  final double baseFareAmount;

  final ADGenericCallback adGenericCallback;

  final bool couponApplied;

  final String? subTitle;

  final CartResponse? cartResponse;
  final PranaamAppDataStateManagement? pranaamAppDataStateManagement;

  @override
  State<CouponAndPolicyView> createState() => _CouponAndPolicyViewState();
}

class _CouponAndPolicyViewState extends State<CouponAndPolicyView> {
  //PranaamAppDataStateManagement? pranaamAppDataStateManagement;

  @override
  void initState() {
    /*  pranaamAppDataStateManagement =
        context.read<PranaamAppDataStateManagement>();*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const double dotSize = 8;
    /*final pranaamAppDataStateManagement =
        context.read<PranaamAppDataStateManagement>();*/
    return Column(
      key: const Key(FlightAutomationKeys.couponAndPolicyKey),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.k_16,
            vertical: context.k_24,
          ),
          child: GestureDetector(
            onTap: () => widget.couponApplied ? {} : applyCouponClick(context),
            child: Row(
              children: [
                if (widget.icon != null)
                  Column(
                    children: <Widget>[
                      Row(
                        children: [
                          RotatedBox(
                            quarterTurns: 1,
                            child: Icon(
                              widget.icon,
                              color: context.adColors.neutralInfoMsg,
                            ),
                          ),
                          ADSizedBox(
                            width: context.k_10,
                          ),
                        ],
                      ),
                    ],
                  )
                else
                  const ADSizedBox(),
                Expanded(
                  child: widget.couponApplied
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ADSizedBox(
                              height: context.k_4,
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    widget.title,
                                    style: ADTextStyle700.size18,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                ADSizedBox(
                                  width: context.k_4,
                                ),
                                Expanded(
                                  child: Text(
                                    'applied'.localize(context),
                                    //  widget.title,
                                    style: ADTextStyle700.size18,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                            ADSizedBox(
                              height: context.k_6,
                            ),
                            Text(
                              widget.subTitle ?? '',
                              style: ADTextStyle500.size14.setTextColor(
                                couponColor,
                              ),
                              overflow: TextOverflow.clip,
                            ),
                            ADSizedBox(
                              height: context.k_4,
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: ADTextStyle700.size18,
                              overflow: TextOverflow.clip,
                            ),
                            if (ProfileSingleton.profileSingleton.isLoggedIn)
                              const ADSizedBox()
                            else
                              InkWell(
                                onTap: () => handleSignInClick(),
                                child: Row(
                                  children: <Widget>[
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'Login',
                                            style: ADTextStyle600.size16
                                                .setTextColor(
                                                  context
                                                      .adColors.blackTextColor,
                                                )
                                                .copyWith(
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                          ),
                                          TextSpan(
                                            text:
                                                ' to see best coupons for you',
                                            style: ADTextStyle400.size16,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ).paddingBySide(top: context.k_10),
                              ),
                          ],
                        ),
                ),
                //  const Spacer(),
                if (widget.couponApplied)
                  TextButton(
                    onPressed: () => {
                      handleRemoveCouponCallBack(),
                    },
                    child: Selector<PranaamAppDataStateManagement, bool>(
                      selector: (context, model) =>
                          widget.pranaamAppDataStateManagement
                              ?.isRemoveCouponClick ??
                          false,
                      builder: (context, value, child) => value
                          ? ADSizedBox(
                              height: context.k_20,
                              child: ADDotProgressView(
                                color: context.adColors.blackColor,
                                size: dotSize,
                              ),
                            )
                          : Text(
                              'remove'.localize(context),
                              style: ADTextStyle500.size14
                                  .setTextColor(context.adColors.blackColor)
                                  .copyWith(
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                    ),
                  )
                else if (ProfileSingleton.profileSingleton.isLoggedIn)
                  Icon(
                    Icons.chevron_right,
                    color: context.adColors.black,
                    size: context.k_30,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// this method is used to open apply coupon page
  void applyCouponClick(BuildContext context) {
    if (ProfileSingleton.profileSingleton.isLoggedIn) {
      adLog('Coupon-Applied-Click');
      GaEvent.getInstance()
          .applyCouponCodeEvent(context.read<PranaamAppDataStateManagement>());
      ClickEvents.book_pranaam_coupon
          .logEvent(parameters: GaEvent.getInstance().parameterMap);

      context.read<PranaamAppDataStateManagement>().cancelIconClick();
      adShowBottomSheet(
        context: context,
        childWidget: ApplyCouponScreen(
          baseFareAmount: widget.baseFareAmount,
          adGenericCallback: (value) => handleCallBack(value),
        ),
        headerTitle: 'applyCouponLabel'.localize(context),
      );
    }
  }

  Future<void> handleSignInClick() async {
    final nav = await Navigator.of(context).pushNamed(
      signInScreen,
      arguments: SignInStatusModel(
        currentRouteName: genericCartScreen,
        isLoginStatusTap: (value) => value
            ? Future.delayed(
                const Duration(milliseconds: 500),
                () => {
                  applyCouponClick(context),
                  setState(() {
                    adLog('update');
                  }),
                },
              )
            : null,
        isNotFromSplash: true,
      ),
    );
    adLog('$nav');
    setState(() => {});
  }

  Future<void> handleRemoveCouponCallBack() async {
    final PranaamAppDataStateManagement pranaamAppDataStateManagement = context
        .read<PranaamAppDataStateManagement>()
      ..updateRemoveCouponState(value: true);
    final ValidateCoupon validateCoupon = ValidateCoupon(
      userId: pranaamAppDataStateManagement.cartDataResponse?.userId ?? '',
      packageId: context
              .read<PranaamAppDataStateManagement>()
              .cartDataResponse
              ?.packageDetail
              .packageId ??
          0,
      couponId: widget.cartResponse?.packageDetail.pricingInfo
              .discountCouponDetail.couponId ??
          0,
      couponCode: widget.cartResponse?.packageDetail.pricingInfo
              .discountCouponDetail.couponCode ??
          '',
      adultCount:
          pranaamAppDataStateManagement.serviceBookingData.travellers?.adults ??
              1,
      childCount: pranaamAppDataStateManagement
              .serviceBookingData.travellers?.children ??
          0,
      infantCount: pranaamAppDataStateManagement
              .serviceBookingData.travellers?.infants ??
          0,
      inputLanguage: 'English',
    );
    final ADResponseState responseState =
        await pranaamAppDataStateManagement.removeCoupon(
      validateCoupon.toJson(),
    );

    /// Remove Coupon GA
    PranaamBookingGaAnalytics().removeCouponGaAnalytics(
      ClickEvents.book_pranaam_coupon_remove_start,
      context.read<PranaamAppDataStateManagement>(),
    );
    pranaamAppDataStateManagement.updateRemoveCouponState(value: false);
    if (responseState.viewStatus == Status.complete) {
      PranaamBookingGaAnalytics().removeCouponGaAnalytics(
        ClickEvents.book_pranaam_coupon_removed,
        context.read<PranaamAppDataStateManagement>(),
      );
      widget.adGenericCallback(responseState);
    } else if (responseState.viewStatus == Status.error) {
      SnackBarUtil.showSnackBar(
        context,
        responseState.message ?? 'Something Went Wrong',
      );
    }
  }

  void handleCallBack(val) {
    //adLog('coupon details ${coupon.toString()}');
    widget.adGenericCallback(val);
  }
}
