/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/common_order_detail/pranaam_detail.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/review/views/ad_row.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/flight_automation_keys.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/add_ons_list_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/package_addon.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cancellation/widget_view/pranaam_order_cancellation_widget_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/animation/shake_widget.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

double shakeOffset = 10;
const couponColor = Color(0xff32a851);

class PriceDetailsView extends StatelessWidget {
  const PriceDetailsView({
    required this.totalMRP,
    required this.cGst,
    required this.sGst,
    required this.totalAmount,
    required this.addOnsAmount,
    required this.promoType,
    required this.expressFareAmount,
    required this.discountAmount,
    this.shakeKey,
    this.showApplyCoupon = false,
    this.packageName,
    this.adTapCallback,
    this.isPaidVisible = false,
    Key? key,
    this.modeOfPayment = '',
    this.reward = 0,
    this.isCancellation = false,
    this.isForUpgrade = false,
    this.newPackPrice,
    this.oldPackPrice,
    this.differenceAmount,
    this.isForReschedule = false,
    this.isForRescheduleConfirmation = false,
    this.rescheduleAmount,
    required this.addOnsList,
    this.isPostBooking = false,
  }) : super(key: key);

  final double totalMRP;
  final double addOnsAmount;
  final double reward;
  final String promoType;
  final double cGst;

  final double sGst;
  final double totalAmount;
  final double discountAmount;
  final double expressFareAmount;
  final bool? showApplyCoupon;
  final ADTapCallback? adTapCallback;
  final String? packageName;
  final bool isPaidVisible;
  final GlobalKey<ShakeWidgetState>? shakeKey;
  final String modeOfPayment;
  final bool isCancellation;
  final bool isForUpgrade;
  final double? newPackPrice;
  final double? oldPackPrice;
  final double? differenceAmount;
  final bool isForReschedule;
  final bool isForRescheduleConfirmation;
  final double? rescheduleAmount;
  final List addOnsList;
  final bool isPostBooking;

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    final heightOfCreditCardImage = 15.sp;
    final widthOfCreditCardImage = 22.sp;
    return Column(
      children: [
        Padding(
          key: const Key(FlightAutomationKeys.fairDetailKey),
          padding: EdgeInsets.only(
            left: context.k_16,
            right: context.k_16,
            top: context.k_30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ShakeWidget(
                key: shakeKey,
                shakeOffset: shakeOffset,
                shakeDuration: const Duration(milliseconds: 500),
                child: Text(
                  'price_details'.localize(context),
                  style: ADTextStyle700.size22,
                ),
              ),
              ADSizedBox(
                height: context.k_20,
              ),
              if (!isForUpgrade)
                ADRow(
                  leftText: isForRescheduleConfirmation
                      ? 'Reschedule Charges'
                      : packageName ?? 'total_mrp'.localize(context),
                  rightText: FlightUtils.getAmountWithTwoDecimalPoint(totalMRP),
                  leftTextStyle: ADTextStyle400.size16,
                  rightTextStyle: ADTextStyle400.size16,
                ),
              if (discountAmount > 0 &&
                  promoType == '2' &&
                  !isForRescheduleConfirmation)
                ADSizedBox(
                  height: context.k_16,
                ),
              if (discountAmount > 0 &&
                  promoType == '2' &&
                  !isForRescheduleConfirmation)
                ADRow(
                  leftText: 'coupon_discount_'.localize(context),
                  rightText: '- ${FlightUtils.getAmountWithTwoDecimalPoint(
                    discountAmount,
                  )}',
                  leftTextStyle: ADTextStyle400.size16,
                  rightTextStyle:
                      ADTextStyle400.size16.setTextColor(couponColor),
                )
              else if (discountAmount > 0 && promoType == '2')
                showApplyCoupon ?? false
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'coupon_discount'.localize(context),
                            style: ADTextStyle400.size16
                                .setTextColor(context.adColors.greyTextColor),
                          ),
                          InkWell(
                            onTap: adTapCallback,
                            child: Text(
                              'apply_coupon'.localize(context),
                              style: ADTextStyle700.size16.setTextColor(
                                context.adColors.greenTextColor,
                              ),
                            ),
                          ),
                        ],
                      )
                    : const ADSizedBox.shrink(),
              if (isForReschedule)
                ADSizedBox(
                  height: context.k_16,
                ),
              if (isForReschedule)
                ADRow(
                  leftText: 'Reschedule Charges',
                  rightText: rescheduleAmount == 0
                      ? 'FREE'
                      : FlightUtils.getAmountWithTwoDecimalPoint(
                          rescheduleAmount ?? 0,
                        ),
                  leftTextStyle: ADTextStyle400.size16,
                  rightTextStyle: rescheduleAmount == 0
                      ? ADTextStyle400.size16.setTextColor(couponColor)
                      : ADTextStyle400.size16,
                ),
              if (isForUpgrade)
                ADRow(
                  leftText: 'New Pack Price',
                  rightText: FlightUtils.getAmountWithTwoDecimalPoint(
                    newPackPrice ?? 0,
                  ),
                  leftTextStyle: ADTextStyle400.size16,
                  rightTextStyle: ADTextStyle400.size16,
                ).paddingBySide(bottom: context.k_16),
              if (isForUpgrade)
                ADRow(
                  leftText: 'Old Pack Price',
                  rightText:
                      '- ${FlightUtils.getAmountWithTwoDecimalPoint(oldPackPrice ?? 0)}',
                  leftTextStyle: ADTextStyle400.size16,
                  rightTextStyle: ADTextStyle400.size16,
                ).paddingBySide(bottom: context.k_16),
              if (isForUpgrade)
                ADRow(
                  leftText: 'Difference Amount',
                  rightText: FlightUtils.getAmountWithTwoDecimalPoint(
                    differenceAmount ?? 0,
                  ),
                  leftTextStyle: ADTextStyle400.size16,
                  rightTextStyle: ADTextStyle400.size16,
                ),
              for (var addOnItem in addOnsList)
                Column(
                  children: [
                    ADSizedBox(
                      height: context.k_16,
                    ),
                    ADRow(
                      leftText: isPostBooking
                          ? getAddOnsNamePostBooking(addOnItem)
                          : getAddOnsName(addOnItem),
                      rightText: isPostBooking
                          ? getAddOnsPricePostBooking(addOnItem)
                          : getAddOnsPrice(addOnItem),
                      leftTextStyle: ADTextStyle400.size16,
                      rightTextStyle: ADTextStyle400.size16,
                    ),
                  ],
                ),
              if (expressFareAmount > 0)
                ADSizedBox(
                  height: context.k_16,
                ),
              if (expressFareAmount > 0)
                ADRow(
                  leftText: 'Express Charges',
                  rightText: FlightUtils.getAmountWithTwoDecimalPoint(
                    expressFareAmount,
                  ),
                  leftTextStyle: ADTextStyle400.size16,
                  rightTextStyle: ADTextStyle400.size16,
                )
              else
                const SizedBox.shrink(),
              ADSizedBox(
                height: context.k_16,
              ),
              ADRow(
                leftText: '${'cgst'.localize(context)} (9%)',
                rightText: FlightUtils.getAmountWithTwoDecimalPoint(cGst),
                leftTextStyle: ADTextStyle400.size16,
                rightTextStyle: ADTextStyle400.size16,
              ),
              ADSizedBox(
                height: context.k_16,
              ),
              ADRow(
                leftText: '${'sgst'.localize(context)} (9%)',
                rightText: FlightUtils.getAmountWithTwoDecimalPoint(sGst),
                leftTextStyle: ADTextStyle400.size16,
                rightTextStyle: ADTextStyle400.size16,
              ),
              if (discountAmount > 0 &&
                  promoType != '2' &&
                  !isForRescheduleConfirmation)
                ADRow(
                  leftText: 'coupon_discount_'.localize(context),
                  rightText: '- ${FlightUtils.getAmountWithTwoDecimalPoint(
                    discountAmount,
                  )}',
                  leftTextStyle: ADTextStyle400.size16,
                  rightTextStyle:
                      ADTextStyle400.size16.setTextColor(couponColor),
                ).paddingBySide(top: context.k_16)
              else if (discountAmount > 0 && promoType != '2')
                showApplyCoupon ?? false
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'coupon_discount'.localize(context),
                            style: ADTextStyle400.size16
                                .setTextColor(context.adColors.greyTextColor),
                          ),
                          InkWell(
                            onTap: adTapCallback,
                            child: Text(
                              'apply_coupon'.localize(context),
                              style: ADTextStyle700.size16.setTextColor(
                                context.adColors.greenTextColor,
                              ),
                            ),
                          ),
                        ],
                      )
                    : const ADSizedBox.shrink(),
              if (reward > 0)
                ADSizedBox(
                  height: context.k_16,
                ),
              if (reward > 0)
                ADRow(
                  leftText: 'Reward Points',
                  rightText: '- ${FlightUtils.getAmountWithTwoDecimalPoint(
                    double.parse(reward.toString()),
                  )}',
                  //' -₹$reward',
                  leftTextStyle: ADTextStyle400.size16,
                  rightTextStyle: ADTextStyle500.size16
                      .setTextColor(context.adColors.greenTextColor),
                ),
              ADSizedBox(
                height: context.k_22,
              ),
              Divider(
                thickness: 1.sp,
                height: 1.sp,
                color: context.adColors.paleGrey,
              ),
              ADRow(
                leftText: 'totalAmount'.localize(context),
                rightText: FlightUtils.getAmountWithTwoDecimalPoint(
                  totalAmount,
                ),
                leftTextStyle: ADTextStyle700.size18,
                rightTextStyle: ADTextStyle700.size18,
              ).paddingBySide(top: context.k_20, bottom: context.k_20),
              if (!isPaidVisible)
                isCancellation
                    ? const ADSizedBox()
                    : Container(
                        height: 1,
                        color: context.adColors.paleGrey,
                      ),
            ],
          ),
        ),
        if (isPaidVisible && modeOfPayment != '')
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: context.k_16,
              vertical: context.k_20,
            ),
            color: containerColor,
            child: Row(
              children: [
                Image.asset(
                  'lib/assets/images/pranaam/credit_card.png',
                  height: heightOfCreditCardImage,
                  width: widthOfCreditCardImage,
                  fit: BoxFit.fill,
                ),
                ADSizedBox(
                  width: context.k_8,
                ),
                Text(
                  'Paid with $modeOfPayment',
                  style: ADTextStyle500.size16
                      .setTextColor(context.adColors.blackColor),
                ),
              ],
            ),
          ),
      ],
    );
  }

  String getAddOnsName(var addOnsItem) {
    if (addOnsItem is PackageAddOn) {
      return addOnsItem.addOnServiceName;
    } else if (addOnsItem is AddOnsListModel) {
      return addOnsItem.serviceName;
    }
    return '';
  }

  String getAddOnsPrice(var addOnsItem) {
    if (addOnsItem is PackageAddOn) {
      return FlightUtils.getAmountWithTwoDecimalPoint(
        getAddonItemTotalPrice(addOnsItem),
      );
    } else if (addOnsItem is AddOnsListModel) {
      return FlightUtils.getAmountWithTwoDecimalPoint(
        getAddOnItemTotalPrice(addOnsItem),
      );
    }
    return '';
  }

  ///Post Booking
  String getAddOnsNamePostBooking(var addOnsItem) {
    if (addOnsItem is PackageAddOn) {
      return addOnsItem.addOnServiceName;
    } else if (addOnsItem is AddOnService) {
      return addOnsItem.serviceName;
    }
    return '';
  }

  String getAddOnsPricePostBooking(var addOnsItem) {
    if (addOnsItem is PackageAddOn) {
      return FlightUtils.getAmountWithTwoDecimalPoint(
        getAddonItemTotalPricePostBooking(addOnsItem),
      );
    } else if (addOnsItem is AddOnService) {
      return FlightUtils.getAmountWithTwoDecimalPoint(
        getAddOnItemTotalPricePostBooking(addOnsItem),
      );
    }
    return '';
  }
}
