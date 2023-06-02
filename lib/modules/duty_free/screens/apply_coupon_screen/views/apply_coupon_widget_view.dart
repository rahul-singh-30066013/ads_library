/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/duty_free/screen_helper/automation_keys/apply_coupon_automation_key.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/apply_coupon_screen/views/apply_coupon_controller.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/apply_coupon_screen/views/apply_coupon_screen.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/apply_coupon_screen/views/coupon_container.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/customer_information_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/apply_coupon/flight_booking_coupon_list.dart';
import 'package:adani_airport_mobile/modules/offers/screens/offer_dashboard_main_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/apply_coupons/responce_model/apply_coupon_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/package_service/horizontally_scrollable_column.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/service_booking/widget_view/widgetview.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/apply_coupon_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/ga_helper/ga_event.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// this class is widget view of apply coupon screen where we access buisness logic and click listener ApplyCouponController class
const double textFieldContainerRadius = 8;
const couponCode = 100;
int selectedCouponIndex = 0;
final double gifHeight = 118.sp;
final double gifWidth = 146.sp;
final double _k_118 = 118.sp;

class ApplyCouponWidgetView
    extends WidgetView<ApplyCouponScreen, ApplyCouponController> {
  const ApplyCouponWidgetView(
    ApplyCouponController state, {
    Key? key,
    required this.adGenericCallback,
  }) : super(
          state,
          key: key,
        );

  final ADGenericCallback adGenericCallback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ADSelectorStateLessWidget<ApplyCouponState>(
        key: const Key('ApplyCoupon'),
        viewModel: state.applyCouponViewModel,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ValueListenableBuilder(
                    valueListenable: state
                        .pranaamAppDataStateManagement.selectedCouponNotFound,
                    builder: (context, String value, child) {
                      return Container(
                        width: double.infinity,
                        height: context.k_60,
                        padding: EdgeInsets.symmetric(horizontal: context.k_16),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(textFieldContainerRadius),
                          ),
                          border: value.isNotEmpty
                              ? Border.all(
                                  color: errorColor,
                                )
                              : Border.all(
                                  color: context.adColors.textFieldBorderGrey,
                                ),
                        ),
                        child: Row(
                          children: [
                            Flexible(
                              child: TextField(
                                textCapitalization:
                                    TextCapitalization.characters,
                                controller: state.pranaamAppDataStateManagement
                                    .applyCouponController,
                                key: const Key(
                                  ApplyCouponAutomationKey.enterCouponCode,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  labelText:
                                      'enterCouponCode'.localize(context),
                                  labelStyle:
                                      ADTextStyle400.size16.setTextColor(
                                    context.adColors.greyTextColor,
                                  ),
                                ),
                                onChanged: (text) => {
                                  state.pranaamAppDataStateManagement
                                      .couponTextChangedNotifier.value = text,
                                  state.pranaamAppDataStateManagement
                                      .applyButtonEnableNotifier.value = '',
                                },
                              ),
                            ),
                            ValueListenableBuilder(
                              valueListenable: state
                                  .pranaamAppDataStateManagement
                                  .couponTextChangedNotifier,
                              builder: (context, String value, child) => value
                                      .isNotEmpty
                                  ? InkWell(
                                      onTap: () => context
                                          .read<PranaamAppDataStateManagement>()
                                          .cancelIconClick(),
                                      child: state
                                              .pranaamAppDataStateManagement
                                              .applyCouponController
                                              .text
                                              .isEmpty
                                          ? const ADSizedBox()
                                          : Icon(
                                              Icons.close,
                                              color: context
                                                  .adColors.darkGreyTextColor,
                                              size: context.k_20,
                                            ),
                                    )
                                  : const ADSizedBox(),
                            ),
                            ValueListenableBuilder(
                              valueListenable: state
                                  .pranaamAppDataStateManagement
                                  .applyButtonEnableNotifier,
                              builder: (context, String value, child) =>
                                  value.isEmpty
                                      ? Row(
                                          children: [
                                            ADSizedBox(
                                              width: context.k_24,
                                            ),
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                minimumSize: Size.zero,
                                                padding: EdgeInsets.only(
                                                  top: context.k_6,
                                                ),
                                                tapTargetSize:
                                                    MaterialTapTargetSize
                                                        .shrinkWrap,
                                              ),
                                              key: const Key(
                                                ApplyCouponAutomationKey
                                                    .applyTextFieldButton,
                                              ),
                                              onPressed: () => {
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus(),
                                                if (state
                                                        .pranaamAppDataStateManagement
                                                        .applyCouponController
                                                        .text !=
                                                    '')
                                                  state.onCouponApplyClicked(
                                                    Coupon(
                                                      id: state.getCouponId(
                                                        state
                                                            .pranaamAppDataStateManagement
                                                            .applyCouponController
                                                            .text,
                                                      ),
                                                      couponCode: state
                                                          .pranaamAppDataStateManagement
                                                          .applyCouponController
                                                          .text,
                                                    ),
                                                    context,
                                                  ),

                                                ///setCouponValue in Pranam State
                                                context
                                                        .read<
                                                            PranaamAppDataStateManagement>()
                                                        .getCouponValue =
                                                    state
                                                        .pranaamAppDataStateManagement
                                                        .applyCouponController
                                                        .text,

                                                /// GA Event for book pranaam event

                                                if (state
                                                    .pranaamAppDataStateManagement
                                                    .applyCouponController
                                                    .text
                                                    .isNotEmpty)
                                                  {
                                                    GaEvent.getInstance()
                                                        .applyCouponEventMap(
                                                      context.read<
                                                          PranaamAppDataStateManagement>(),
                                                    ),
                                                    ClickEvents
                                                        .book_pranaam_coupon_applied
                                                        .logEvent(
                                                      parameters:
                                                          GaEvent.getInstance()
                                                              .parameterMap,
                                                    ),
                                                  },

                                                ///GA Offers coupon apply
                                                GaEvent.getInstance()
                                                    .offersCouponApplyEvent(
                                                  '',
                                                  state
                                                      .pranaamAppDataStateManagement
                                                      .applyCouponController
                                                      .text,
                                                  'pranaam',
                                                ),
                                                ClickEvents.offers_coupon_apply
                                                    .logEvent(
                                                  parameters:
                                                      GaEvent.getInstance()
                                                          .parameterMap,
                                                ),
                                              },
                                              //onPressed: () => state.onTap(),
                                              child: Selector<
                                                  PranaamAppDataStateManagement,
                                                  bool>(
                                                selector: (context, model) => state
                                                    .pranaamAppDataStateManagement
                                                    .isApplyCouponClick,
                                                builder: (
                                                  context,
                                                  value,
                                                  child,
                                                ) =>
                                                    value
                                                        ? ADSizedBox(
                                                            height:
                                                                context.k_20,
                                                            child:
                                                                ADDotProgressView(
                                                              color: context
                                                                  .adColors
                                                                  .blackColor,
                                                              size: dotSize,
                                                            ),
                                                          )
                                                        : ValueListenableBuilder(
                                                            valueListenable: state
                                                                .pranaamAppDataStateManagement
                                                                .couponTextChangedNotifier,
                                                            builder: (
                                                              context,
                                                              String value,
                                                              child,
                                                            ) =>
                                                                value.isNotEmpty
                                                                    ? Text(
                                                                        'apply'
                                                                            .localize(
                                                                          context,
                                                                        ),
                                                                        style: ADTextStyle500
                                                                            .size14
                                                                            .setTextColor(
                                                                          context
                                                                              .adColors
                                                                              .neutralInfoMsg,
                                                                        )
                                                                            .copyWith(
                                                                          shadows: [
                                                                            Shadow(
                                                                              color: context.adColors.neutralInfoMsg,
                                                                              offset: Offset(0, -context.k_4),
                                                                            ),
                                                                          ],
                                                                          color:
                                                                              Colors.transparent,
                                                                          decoration:
                                                                              TextDecoration.underline,
                                                                          decorationColor: context
                                                                              .adColors
                                                                              .neutralInfoMsg,
                                                                        ),
                                                                      )
                                                                    : Text(
                                                                        'apply'
                                                                            .localize(
                                                                          context,
                                                                        ),
                                                                        style: ADTextStyle400
                                                                            .size14
                                                                            .setTextColor(
                                                                          context
                                                                              .adColors
                                                                              .greyTextColor,
                                                                        )
                                                                            .copyWith(
                                                                          shadows: [
                                                                            Shadow(
                                                                              color: context.adColors.greyTextColor,
                                                                              offset: const Offset(0, -1),
                                                                            ),
                                                                          ],
                                                                          color:
                                                                              Colors.transparent,
                                                                          decoration:
                                                                              TextDecoration.underline,
                                                                          decorationColor: context
                                                                              .adColors
                                                                              .greyTextColor,
                                                                        ),
                                                                      ),
                                                          ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : const ADSizedBox(),
                            ),
                          ],
                        ),

                        //
                      );
                    },
                  ),
                  ValueListenableBuilder(
                    valueListenable: state
                        .pranaamAppDataStateManagement.selectedCouponNotFound,
                    builder: (context, String value, child) {
                      return value.isNotEmpty
                          ? Column(
                              children: [
                                ADSizedBox(
                                  height: context.k_12,
                                ),
                                Text(
                                  value,
                                  style: ADTextStyle400.size14.setTextColor(
                                    errorColor,
                                  ),
                                  overflow: TextOverflow.clip,
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            )
                          : const ADSizedBox();
                    },
                  ),
                  ADSizedBox(
                    height: context.k_20,
                  ),
                ],
              ).paddingBySide(left: context.k_16, right: context.k_16),
              Consumer<ApplyCouponState>(
                builder: (context, value, Widget? child) {
                  switch (state
                      .applyCouponViewModel.applyCouponDetails.viewStatus) {
                    case Status.complete:
                      final List couponList =
                          value.applyCouponResponse?.coupons ?? [];
                      adLog('couponList length ${couponList.length}');
                      return couponList.isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'choose_offer_below'.localize(context),
                                  key: const Key(
                                    ApplyCouponAutomationKey.chooseOfferBelow,
                                  ),
                                  style: ADTextStyle400.size14.setTextColor(
                                    context.adColors.greyTextColor,
                                  ),
                                ).paddingBySide(
                                  left: context.k_16,
                                ),
                                ADSizedBox(
                                  height: context.k_10,
                                ),
                                ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:
                                      value.applyCouponResponse?.coupons.length,
                                  itemBuilder: (context, index) {
                                    selectedCouponIndex = index;
                                    return ValueListenableBuilder(
                                      valueListenable: context
                                          .read<PranaamAppDataStateManagement>()
                                          .toucheEffectListener,
                                      builder: (
                                        BuildContext context,
                                        v,
                                        Widget? child,
                                      ) =>
                                          AbsorbPointer(
                                        absorbing: context
                                            .read<
                                                PranaamAppDataStateManagement>()
                                            .toucheEffectListener
                                            .value,
                                        child: CouponContainer(
                                          coupon: value.applyCouponResponse
                                                  ?.coupons[index] ??
                                              const Coupon(),
                                          adGenericCallback: (value) =>
                                              validateCoupon(value, context),
                                          couponIndex: index,
                                          selectedIndex: value
                                                  .applyCouponResponse
                                                  ?.coupons[index]
                                                  .couponCode ??
                                              '',
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                ADSizedBox(
                                  height: _k_118,
                                ),
                                SvgPicture.asset(
                                  'lib/assets/images/svg/icons/coupons_not_available.svg',
                                  width: gifWidth,
                                  height: gifHeight,
                                ),
                                ADSizedBox(
                                  height: context.k_6,
                                ),
                                Text(
                                  'coupons_not_found'.localize(context),
                                  textAlign: TextAlign.center,
                                  style: ADTextStyle700.size16.setTextColor(
                                    context.adColors.blackTextColor,
                                  ),
                                ).paddingAllSide(context.k_16),
                              ],
                            );
                    case Status.loading:
                      return const ShowShimmerForCouponList();
                    case Status.error:
                      // return ADErrorPage(
                      //   message: state.applyCouponViewModel.error,
                      // );
                      return NoOfferView().paddingBySide(top: context.k_20);

                    default:
                      return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validateCoupon(Coupon coupon, BuildContext context) {
    state.onCouponApplyFillCodeClicked(
      Coupon(
        id: coupon.id,
        couponCode: coupon.couponCode,
        isMerchantFunded: coupon.isMerchantFunded,
        pcmPercentage: coupon.pcmPercentage,
      ),
      context,
    );
  }
}
