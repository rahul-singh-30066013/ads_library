/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/cabs/mixin/apply_coupon.dart';
import 'package:adani_airport_mobile/modules/cabs/models/coupon/cab_booking_coupon_request.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/cab_cart_detail_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/cab_booking_coupon_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/screen_helper/automation_keys/apply_coupon_automation_key.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/customer_information_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/coupon_response/coupon_list_response.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/apply_coupon/flight_booking_coupon_list.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/loyalty/utils/constants/widget_type_enum.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/error_page/ad_error_page.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

const double progressWidth = 42;

///used to avoid the matrix error
const double textFieldContainerRadius = 8;
const int color = 0x080d67ca;
const int two = 2;

/// this class is used to show the list of coupons.
class CabBookingCouponList extends StatefulWidget {
  final num amount;
  final ApplyCoupon applyCoupon;
  final String oldAgentID;
  final CabCartDetailResponseModel? cabCartDetailResponseModel;

  const CabBookingCouponList({
    Key? key,
    required this.amount,
    required this.applyCoupon,
    required this.oldAgentID,
    required this.cabCartDetailResponseModel,
  }) : super(key: key);

  @override
  State<CabBookingCouponList> createState() => _CabBookingCouponListState();
}

///this is a state class of coupon
class _CabBookingCouponListState extends State<CabBookingCouponList> {
  double imageHeight = 109.sp;
  double imageWidth = 125.sp;
  CabBookingCouponState cabBookingCouponState = CabBookingCouponState();

  @override
  void initState() {
    super.initState();
    final CabBookingCouponState cabBookingState =
        context.read<CabBookingCouponState>();
    adLog(cabBookingState.toString());
    cabBookingState.getCoupon(
      CabBookingCouponRequest(
        amount: widget.amount,
      ),
      widget.oldAgentID,
    );
  }

  @override
  Widget build(BuildContext context) {
    final CabBookingCouponState cabBookingState =
        context.read<CabBookingCouponState>();
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: cabBookingState.isCouponApplying,
        builder: (BuildContext context, bool value, Widget? child) =>
            AbsorbPointer(
          absorbing: value,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ValueListenableBuilder(
                    valueListenable: cabBookingState.selectedCouponNotFound,
                    builder: (context, int value, child) {
                      return InputViewController(
                        cabCartDetailResponseModel:
                            widget.cabCartDetailResponseModel,
                        applyCoupon: widget.applyCoupon,
                        amount: widget.amount,
                        border: value == 1
                            ? context.adColors.blackTextColor
                            : (value == 0
                                ? context.adColors.textFieldBorderGrey
                                : errorColor),
                        oldAgentID: widget.oldAgentID,
                      );
                    },
                  ),
                  ValueListenableBuilder(
                    valueListenable: cabBookingState.couponError,
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
                  Text(
                    'or_choose'.localize(context),
                    style: ADTextStyle400.size14
                        .setTextColor(context.adColors.greyTextColor),
                  ).paddingBySide(top: context.k_13),
                ],
              ).paddingBySide(left: context.k_16, right: context.k_16),
              Expanded(
                child: Consumer<CabBookingCouponState>(
                  builder: (context, cabBookingState, Widget? child) {
                    switch (cabBookingState.couponState.viewStatus) {
                      case Status.complete:
                        final List<CouponDetails> couponList = cabBookingState
                                .cabBookingCouponResponse?.promoDetails ??
                            [];
                        return couponList.isNotEmpty
                            ? ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: couponList.length,
                                itemBuilder: (context, index) {
                                  final DateTime date;
                                  String formattedDate;
                                  try {
                                    date = DateTime.parse(
                                      couponList[index].endDate,
                                    );
                                    formattedDate =
                                        DateFormat(Constant.dateFormat19)
                                            .format(date);
                                  } catch (e) {
                                    formattedDate = '';
                                  }

                                  return Column(
                                    children: [
                                      ADSizedBox(
                                        height: context.k_10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ADSizedBox(
                                            height: context.k_12,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: (couponList[index]
                                                            .eligible ??
                                                        false)
                                                    ? () => cabBookingState
                                                            .applyCoupon(
                                                          cabCartDetailResponseModel:
                                                              widget
                                                                  .cabCartDetailResponseModel,
                                                          context: context,
                                                          index: index,
                                                          amount: widget.amount,
                                                          applyCoupon: widget
                                                              .applyCoupon,
                                                          oldAgentId:
                                                              widget.oldAgentID,
                                                        )
                                                    : null,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(
                                                        context.k_4,
                                                      ),
                                                    ),
                                                    border: Border.all(
                                                      color:
                                                          context.adColors.blue,
                                                    ),
                                                    color: const Color(color),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      if (couponList[index]
                                                          .promoImgUrl
                                                          .isNotEmpty)
                                                        SizedBox(
                                                          width: context.k_24,
                                                          height: context.k_22,
                                                          child: couponList[
                                                                      index]
                                                                  .promoImgUrl
                                                                  .contains(
                                                                    '.svg',
                                                                  )
                                                              ? SvgPicture
                                                                  .network(
                                                                  couponList[
                                                                          index]
                                                                      .promoImgUrl,
                                                                )
                                                              : Image.network(
                                                                  couponList[
                                                                          index]
                                                                      .promoImgUrl,
                                                                ),
                                                        ).paddingBySide(
                                                          left: context.k_6,
                                                        ),
                                                      Text(
                                                        couponList[index]
                                                            .couponCode,
                                                        style: ADTextStyle600
                                                            .size14
                                                            .copyWith(
                                                          color: context
                                                              .adColors
                                                              .blackTextColor,
                                                        ),
                                                      ).paddingAllSide(
                                                        context.k_10,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                  minimumSize: Size.zero,
                                                  tapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                ),
                                                onPressed: (couponList[index]
                                                            .eligible ??
                                                        false)
                                                    ? () => cabBookingState
                                                            .applyCoupon(
                                                          cabCartDetailResponseModel:
                                                              widget
                                                                  .cabCartDetailResponseModel,
                                                          context: context,
                                                          index: index,
                                                          amount: widget.amount,
                                                          applyCoupon: widget
                                                              .applyCoupon,
                                                          oldAgentId:
                                                              widget.oldAgentID,
                                                        )
                                                    : null,
                                                child: Selector<
                                                    CabBookingCouponState,
                                                    bool>(
                                                  selector: (context, state) =>
                                                      state
                                                          .cabBookingCouponResponse
                                                          ?.promoDetails[index]
                                                          .isSelected ??
                                                      false,
                                                  builder: (
                                                    BuildContext context,
                                                    value,
                                                    Widget? child,
                                                  ) {
                                                    return value
                                                        ? ADDotProgressView(
                                                            color: context
                                                                .adColors
                                                                .blackColor,
                                                            size: context.k_4,
                                                          )
                                                        : Text(
                                                            'apply'.localize(
                                                              context,
                                                            ),
                                                            style: ADTextStyle500
                                                                .size14
                                                                .setTextColor(
                                                                  couponList[index]
                                                                              .eligible ==
                                                                          true
                                                                      ? context
                                                                          .adColors
                                                                          .blackTextColor
                                                                      : context
                                                                          .adColors
                                                                          .greyReviewShade,
                                                                )
                                                                .copyWith(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                ),
                                                          );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            couponList[index].promoName,
                                            style: ADTextStyle600.size16
                                                .setTextColor(
                                              context.adColors.blackTextColor,
                                            ),
                                          ).paddingBySide(top: context.k_16),
                                          Text(
                                            couponList[index].description,
                                            style: ADTextStyle400.size14
                                                .setTextColor(
                                              context.adColors.greyTextColor,
                                            ),
                                          ).paddingBySide(top: context.k_10),
                                          Row(
                                            children: [
                                              if (formattedDate.isNotEmpty)
                                                Text(
                                                  '${'expires'.localize(context)} $formattedDate',
                                                  style: ADTextStyle400.size14
                                                      .setTextColor(
                                                    context
                                                        .adColors.greyTextColor,
                                                  ),
                                                ).paddingBySide(
                                                  right: context.k_8,
                                                ),
                                              Text.rich(
                                                TextSpan(
                                                  text: 't_c_apply'
                                                      .localize(context),
                                                  style: ADTextStyle400.size14
                                                      .copyWith(
                                                        color: context.adColors
                                                            .blackTextColor,
                                                      )
                                                      .copyWith(
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                      ),
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () {
                                                          if (!couponList[index]
                                                              .couponCode
                                                              .isNullOrEmpty) {
                                                            navigateToScreenUsingNamedRouteWithArguments(
                                                              context,
                                                              offerDetail,
                                                              rootNavigator:
                                                                  false,
                                                              argumentObject:
                                                                  OfferKeyModel(
                                                                id: couponList[
                                                                        index]
                                                                    .couponCode,
                                                                title: couponList[
                                                                        index]
                                                                    .promoName,
                                                                fetchDataFromPromoCode:
                                                                    true,
                                                                showBookNowButton:
                                                                    false,
                                                              ),
                                                            );
                                                          }
                                                        },
                                                ),
                                              ),
                                            ],
                                          ).paddingBySide(top: context.k_10),
                                          if (couponList[index]
                                              .recommendations
                                              .amount
                                              .isNotEmpty)
                                            Text(
                                              couponList[index]
                                                  .recommendations
                                                  .amount,
                                              style: ADTextStyle400.size14
                                                  .setTextColor(
                                                context
                                                    .adColors.rustyOrangeColor,
                                              ),
                                            ).paddingBySide(top: context.k_10),
                                        ],
                                      ).paddingBySide(
                                        left: context.k_16,
                                        right: context.k_16,
                                      ),
                                      ADSizedBox(
                                        height: context.k_30,
                                      ),
                                      Divider(
                                        color: context.adColors.dividerColor,
                                        thickness: 1,
                                      ),
                                    ],
                                  );
                                },
                              )
                            : Center(
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        SvgAssets.couponNotAvailable,
                                        width: imageWidth,
                                        height: imageHeight,
                                      ),
                                      Text(
                                        'coupons_not_found'.localize(context),
                                        textAlign: TextAlign.center,
                                        style:
                                            ADTextStyle700.size16.setTextColor(
                                          context.adColors.blackTextColor,
                                        ),
                                      ).paddingAllSide(context.k_16),
                                    ],
                                  ),
                                ),
                              );
                      case Status.loading:
                        return const ShowShimmerForCouponList();
                      case Status.error:
                        return ADErrorPage(
                          message: cabBookingState.couponState.message,
                        );
                      default:
                        return const SizedBox.shrink();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InputViewController extends StatelessWidget {
  final Color border;
  final num amount;
  final ApplyCoupon applyCoupon;
  final String oldAgentID;
  final CabCartDetailResponseModel? cabCartDetailResponseModel;

  const InputViewController({
    Key? key,
    required this.cabCartDetailResponseModel,
    required this.border,
    required this.amount,
    required this.applyCoupon,
    required this.oldAgentID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CabBookingCouponState cabBookingState =
        context.read<CabBookingCouponState>();
    return Container(
      width: double.infinity,
      height: context.k_60,
      padding: EdgeInsets.symmetric(horizontal: context.k_16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(textFieldContainerRadius),
        ),
        border: Border.all(
          color: border,
        ),
      ),
      child: Row(
        children: [
          Flexible(
            child: FocusScope(
              onFocusChange: (focus) =>
                  cabBookingState.selectedCouponNotFound.value = 1,
              child: TextField(
                cursorColor: context.adColors.blackTextColor,
                textCapitalization: TextCapitalization.characters,
                controller: cabBookingState.applyCouponController,
                key: const Key(
                  ApplyCouponAutomationKey.enterCouponCode,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'enterCouponCode'.localize(context),
                  labelStyle: ADTextStyle400.size16.setTextColor(
                    context.adColors.greyTextColor,
                  ),
                ),
                onChanged: (text) => onChange(cabBookingState, text),
              ),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: cabBookingState.couponTextErrorNotifier,
            builder: (context, String value, child) => value.isNotEmpty
                ? InkWell(
                    onTap: () => cabBookingState.cancelIconClick(),
                    child: cabBookingState.applyCouponController.text.isEmpty
                        ? const ADSizedBox()
                        : Icon(
                            Icons.close,
                            color: context.adColors.darkGreyTextColor,
                            size: context.k_20,
                          ),
                  )
                : const ADSizedBox(),
          ),
          ValueListenableBuilder(
            valueListenable: cabBookingState.selectedCouponNotFound,
            builder: (
              context,
              int value,
              child,
            ) {
              return value == 0
                  ? ValueListenableBuilder(
                      valueListenable: cabBookingState.couponTextErrorNotifier,
                      builder: (
                        context,
                        String value,
                        child,
                      ) =>
                          ADSizedBox(
                        width: context.k_10,
                      ),
                    )
                  : const ADSizedBox();
            },
          ),
          ValueListenableBuilder(
            valueListenable: cabBookingState.applyButtonEnableNotifier,
            builder: (context, bool value, child) => value
                ? TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    key: const Key(
                      ApplyCouponAutomationKey.applyTextFieldButton,
                    ),
                    onPressed: context
                            .read<CabBookingCouponState>()
                            .applyCouponController
                            .text
                            .isNotEmpty
                        ? () =>
                            context.read<CabBookingCouponState>().applyCoupon(
                                  cabCartDetailResponseModel:
                                      cabCartDetailResponseModel,
                                  context: context,
                                  index: -1,
                                  amount: amount,
                                  applyCoupon: applyCoupon,
                                  oldAgentId: oldAgentID,
                                )
                        : null,
                    child: Selector<CabBookingCouponState, bool?>(
                      selector: (context, stateClass) =>
                          stateClass.isCouponAppliedFromInput,
                      builder: (
                        BuildContext context,
                        value,
                        Widget? child,
                      ) {
                        return (value ?? false)
                            ? Container(
                                width: progressWidth.sp,
                                child: ADDotProgressView(
                                  color: context.adColors.blackTextColor,
                                  size: context.k_4,
                                ),
                              )
                            : ValueListenableBuilder(
                                valueListenable:
                                    cabBookingState.selectedCouponNotFound,
                                builder: (
                                  context,
                                  int value,
                                  child,
                                ) {
                                  return (value != two)
                                      ? ValueListenableBuilder(
                                          valueListenable: cabBookingState
                                              .couponTextErrorNotifier,
                                          builder: (
                                            context,
                                            String value,
                                            child,
                                          ) =>
                                              Text(
                                            'apply'.localize(
                                              context,
                                            ),
                                            style: ADTextStyle500.size14
                                                .setTextColor(
                                                  value.isNotEmpty
                                                      ? context.adColors
                                                          .neutralInfoMsg
                                                      : context.adColors
                                                          .greyReviewShade,
                                                )
                                                .copyWith(
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                          ).paddingAllSide(context.k_4),
                                        )
                                      : const ADSizedBox();
                                },
                              );
                      },
                    ),
                  )
                : const ADSizedBox(),
          ),
        ],
      ),

      //
    );
  }

  void onChange(CabBookingCouponState state, String text) {
    state.couponError.value = '';
    state.couponTextErrorNotifier.value = text;
    state.selectedCouponNotFound.value = 1;
    state.applyButtonEnableNotifier.value = true;
  }
}
