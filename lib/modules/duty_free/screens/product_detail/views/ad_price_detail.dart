/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/shopping_cart_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/views/redeem_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/animation/shake_widget.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

///this class is used to show price details without expansion tile
///It can be used as a list element or individual element on screen
///*[onTapHandlerApplyCoupon] to handle the coupon button click
///*[onTapHandlerKnowMore]to handle the know more click
///*[onTapHandlerRedeem]to handle the redeem button click
///*[titleText] content that will be used to show on header
///*[priceDetail] param that needs to show for price detail like amount,taxes,discount--this should be from json
///*[totalPriceLabel]content that will be used to show as label for total amount
///*[totalAmount]string that will be used to show as total amount
///
///

class ADPriceDetail extends StatelessWidget {
  /// usage sample code
  /// ADPriceDetailNoExpansionType1(
  ///       onTapHandlerApplyCoupon: () {},
  ///       onTapHandlerKnowMore: () {},
  ///       onTapHandlerRedeem: () {},
  ///       titleText: shoppingCart.leftHeader!,
  ///       priceDetail: shoppingCart.content,
  ///       totalPriceLabel: shoppingCart.leftHeaderSubtitle,
  ///       totalAmount: shoppingCart.rightHeaderSubtitle,
  ///     )
  ///
  const ADPriceDetail({
    Key? key,
    this.onTapHandlerApplyCoupon,
    this.onTapHandlerKnowMore,
    this.onTapHandlerRedeem,
    required this.titleText,
    required this.priceDetail,
    this.totalPriceLabel,
    this.totalAmount,
    this.shakeKey,
    this.tapInfoIcon,
  }) : super(key: key);

  ///function that will be used to handle the coupon button click
  final ADTapCallback? onTapHandlerApplyCoupon;

  // used to show the price break
  final ADTapCallback? tapInfoIcon;

  ///function that will be used to handle the know more click
  final ADTapCallback? onTapHandlerKnowMore;

  ///function that will be used to handle the redeem click
  final ADTapCallback? onTapHandlerRedeem;

  /// text that we need to show as title of container
  final String titleText;

  /// text that we need to show as label for total price
  final String? totalPriceLabel;

  /// text that we need to show as total amount
  final String? totalAmount;

  /// Shake key
  final GlobalKey<ShakeWidgetState>? shakeKey;

  /// json object related price details like charges,discount,taxes
  final ShoppingCart priceDetail;
  static const double shakeOffset = 10;

  // late ShoppingCartViewModel shoppingCartViewModel;
  @override
  Widget build(BuildContext context) {
    adLog('shopping cart price detail build Called');
    return Selector<AppSessionState, ShoppingCart>(
      selector: (context, viewModel) => priceDetail,
      builder: (context, value, Widget? child) {
        final List<ShoppingCartContent>? priceList = priceDetail.content;

        return value.content.isNotEmpty
            ? Container(
                color: ADColors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShakeWidget(
                      shakeDuration: const Duration(milliseconds: 500),
                      key: shakeKey,
                      shakeOffset: shakeOffset,
                      child: Text(
                        titleText,
                        style: ADTextStyle700.size22,
                      ),
                    ),
                    SizedBox(height: context.k_16),
                    ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const ClampingScrollPhysics(),
                      itemCount: priceList?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        final itemName = priceList?[index].title;
                        final itemPrice = priceList?[index].price;
                        final priceTypeColor = priceList?[index].priceTypeColor;
                        final otherLabelType = priceList?[index].otherLabelType;
                        final otherLabel = priceList?[index].otherLabel;
                        final showInfoIcon = priceList?[index].showInfoIcon;
                        return !itemName.isNullOrEmpty
                            ? _SetTextDataAsPerParam(
                                priceDetail: priceDetail,
                                leftContent: itemName,
                                rightContent: itemPrice,
                                rightTextStyle:
                                    _gettextStyle(priceTypeColor, context),
                                otherLabel: otherLabel,
                                otherLabelType: otherLabelType,
                                onTapHandlerApplyCoupon:
                                    onTapHandlerApplyCoupon,
                                onTapHandlerKnowMore: onTapHandlerKnowMore,
                                showInfoIcon: showInfoIcon,
                                tapInfoIcon: tapInfoIcon,
                              )
                            : const SizedBox.shrink();
                      },
                    ),
                    Column(
                      children: [
                        Divider(
                          height: 1,
                          thickness: 1,
                          color: context.adColors.tileBorderColor,
                        ).paddingBySide(top: context.k_30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              totalPriceLabel ?? '',
                              style: ADTextStyle700.size18,
                            ),
                            Text(
                              FlightUtils.getAmountWithTwoDecimalPoint(
                                priceDetail.totalCartValue,
                              ),
                              style: ADTextStyle700.size18,
                            ),
                          ],
                        ).paddingBySide(top: context.k_16),
                        Divider(
                          height: 1,
                          thickness: 1,
                          color: context.adColors.tileBorderColor,
                        ).paddingBySide(top: context.k_16),
                      ],
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink();
      },
      shouldRebuild: (previous, next) => true,
    );
  }

// setting textStyle -basically for color as per content type
  TextStyle _gettextStyle(String? itemName, BuildContext context) {
    switch (itemName) {
      case 'blue':
        return ADTextStyle600.size16.setTextColor(context.adColors.blueColor);
      case 'green':
        return ADTextStyle400.size16
            .setTextColor(context.adColors.greenTextColor);
      case 'black':
        return ADTextStyle400.size16;
      default:
        return ADTextStyle400.size16;
    }
  }
}

class _SetTextDataAsPerParam extends StatelessWidget {
  final String? leftContent;
  final String? rightContent;
  final TextStyle? rightTextStyle;
  final String? otherLabel;
  final String? otherLabelType;
  final ShoppingCart priceDetail;
  final bool? showInfoIcon;
  final ADTapCallback? tapInfoIcon;

  ///function that will be used to handle the coupon button click
  final ADTapCallback? onTapHandlerApplyCoupon;

  ///function that will be used to handle the know more click
  final ADTapCallback? onTapHandlerKnowMore;

  const _SetTextDataAsPerParam({
    Key? key,
    this.leftContent,
    this.rightContent,
    this.rightTextStyle,
    this.otherLabel,
    this.otherLabelType,
    required this.priceDetail,
    this.onTapHandlerApplyCoupon,
    this.onTapHandlerKnowMore,
    this.showInfoIcon,
    this.tapInfoIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return rightContent.isNullOrEmpty
        ? const SizedBox.shrink()
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (leftContent != null)
                Text(
                  leftContent ?? '',
                  style: ADTextStyle400.size16.setTextColor(
                    context.adColors.blackTextColor,
                  ),
                ).paddingBySide(top: context.k_8, bottom: context.k_8),
              if (showInfoIcon != null && showInfoIcon == true)
                GestureDetector(
                  onTap: tapInfoIcon,
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    height: context.k_36,
                    width: context.k_36,
                    child: Icon(
                      Icons.info_outline,
                      size: context.k_20,
                      color: context.adColors.greyTextColor,
                    ),
                  ),
                )
              else
                const SizedBox.shrink(),
              const SizedBox(width: 5),
              if (otherLabelType.validateWithDefaultValue().isNotEmpty &&
                  otherLabelType == 'gradientContainer')
                RedeemView(rightContent: rightContent),
              if (otherLabelType.validateWithDefaultValue().isNotEmpty &&
                  otherLabelType == 'text')
                Text(
                  otherLabel.validateWithDefaultValue(),
                  style: ADTextStyle500.size12.setTextColor(
                    context.adColors.blueColor,
                  ),
                ).paddingBySide(top: context.k_8, bottom: context.k_8),
              const Spacer(flex: 2),
              InkWell(
                onTap: _setTapCoupon(leftContent, context),
                child: Text(
                  _setPriceContentAndCouponBtn(
                    leftContent,
                    rightContent ?? '',
                    context,
                  ),
                  style: rightTextStyle ?? ADTextStyle600.size16,
                ).paddingBySide(top: context.k_8, bottom: context.k_8),
              ),
            ],
          );
  }

  String _setPriceContentAndCouponBtn(
    String? leftContent,
    String rightContent,
    BuildContext context,
  ) {
    if (leftContent?.compareTo('coupon_discount_'.localize(context)) == 0) {
      if (priceDetail.couponDiscount > 0) {
        rightContent = FlightUtils.getAmountWithTwoDecimalPoint(
          priceDetail.couponDiscount,
        );

        return '-$rightContent';
      } else {
        return 'applyCouponLabel'.localize(context);
      }
    } else {
      return leftContent?.compareTo('unit_price'.localize(context)) == 0
          ? FlightUtils.getAmountWithTwoDecimalPoint(
              double.parse(rightContent),
            )
          : '- ${FlightUtils.getAmountWithTwoDecimalPoint(
              double.parse(rightContent),
            )}';
    }
  }

  ADTapCallback? _setTapCoupon(String? leftContent, BuildContext context) {
    if (leftContent?.compareTo('coupon_discount_'.localize(context)) == 0) {
      return onTapHandlerApplyCoupon;
    }
    return null;
  }
}
