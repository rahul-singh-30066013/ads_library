/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/common_order_detail_base_response.dart';
import 'package:adani_airport_mobile/modules/duty_free/screen_helper/automation_keys/duty_free_order_confirmation_automation_keys.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/customer_info_files/price_details_section_duty_free.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/shopping_cart/duty_free_pre_order_price_info.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// Class is used to show order summary
class OrderSummary extends StatelessWidget {
  final discount = 3;
  final heightOfContinueShoppingButton = 52.sp;
  final spaceBetweenItems = 50.sp;
  final CommonOrderDetailBaseResponse item;

  OrderSummary({
    Key? key,
    required this.item,
  }) : super(key: key);

  /// used in _getDiscountedPrice for discount
  static const int divideByHundred = 100;

  @override
  Widget build(BuildContext context) {
    // final List<OrderList> orderList = dutyConfirmationSnapshot.orderList ?? [];
    return Container(
      padding: EdgeInsets.only(
        top: context.k_36,
        bottom: context.k_10,
        left: context.k_16,
        right: context.k_16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ADSizedBox(
            height: context.k_6,
          ),
          Text(
            'orderSummary'.localize(context),
            key: const Key(
              DutyFreeOrderConfirmationAutomationKeys.orderSummary,
            ),
            style: ADTextStyle700.size22
                .setTextColor(context.adColors.neutralInfoMsg),
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: item.orderDetail?.dutyfreeDetail?.itemDetails
                .length, // orderList.length,
            itemBuilder: (BuildContext context, int index) {
              final double imageHeight = 70.sp;
              final double imageWidth = 60.sp;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: imageHeight,
                        width: imageWidth,
                        child: ADCachedImage(
                          imageUrl:
                              '${Environment.instance.configuration.cmsImageBaseUrl}${item.orderDetail?.dutyfreeDetail?.itemDetails[index].productImage.validateWithDefaultValue()}',
                          key: Key(
                            DutyFreeOrderConfirmationAutomationKeys
                                    .orderSummaryitemImage +
                                index.toString(),
                          ),
                          boxFit: BoxFit.contain,
                        ),
                      ),
                      ADSizedBox(
                        width: context.k_16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              key: Key(
                                DutyFreeOrderConfirmationAutomationKeys
                                        .orderSummaryitemName +
                                    index.toString(),
                              ),
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    style: ADTextStyle400.size16.setTextColor(
                                      context.adColors.blackTextColor,
                                    ),
                                    text: item.orderDetail?.dutyfreeDetail
                                        ?.itemDetails[index].skuName
                                        ?.validateWithDefaultValue(),
                                  ),
                                ],
                              ),
                            ),
                            // ADSizedBox(
                            //   height: context.k_10,
                            // ),
                            // Row(
                            //   children: [
                            //     Text(
                            //       FlightUtils.getPriceFormatWithSymbol(
                            //         price: (item.orderDetail.skuDetail[index]
                            //                         .discountedPrice ??
                            //                     0) >
                            //                 0
                            //             ? item.orderDetail.skuDetail[index]
                            //                     .discountedPrice
                            //                     ?.toDouble() ??
                            //                 0
                            //             : item.orderDetail.skuDetail[index]
                            //                     .unitPrice
                            //                     ?.toDouble() ??
                            //                 0,
                            //       ),
                            //       key: Key(
                            //         DutyFreeOrderConfirmationAutomationKeys
                            //                 .orderSummaryitemDiscountedPrice +
                            //             index.toString(),
                            //       ),
                            //       style: ADTextStyle500.size16,
                            //     ),
                            //     ADSizedBox(
                            //       width: context.k_10,
                            //     ),
                            //     if ((item.orderDetail.skuDetail[index]
                            //                     .discountedPrice ??
                            //                 0) >
                            //             0 &&
                            //         (item.orderDetail.skuDetail[index]
                            //                     .discountedPrice ??
                            //                 0) !=
                            //             (item.orderDetail.skuDetail[index]
                            //                     .unitPrice ??
                            //                 0))
                            //       Text(
                            //         FlightUtils.getPriceFormatWithSymbol(
                            //           price: item.orderDetail.skuDetail[index]
                            //                   .unitPrice
                            //                   ?.toDouble() ??
                            //               0,
                            //         ),
                            //         key: Key(
                            //           DutyFreeOrderConfirmationAutomationKeys
                            //                   .orderSummaryitemPrice +
                            //               index.toString(),
                            //         ),
                            //         style: ADTextStyle400.size14.copyWith(
                            //           decoration: TextDecoration.lineThrough,
                            //         ),
                            //       ),
                            //   ],
                            // ),
                            ADSizedBox(
                              height: context.k_10,
                            ),
                            Text(
                              '${'qtyLabel'.localize(context)} ${item.orderDetail?.dutyfreeDetail?.itemDetails[index].quantity ?? 0}',
                              key: Key(
                                DutyFreeOrderConfirmationAutomationKeys
                                        .orderSummaryitemOrderId +
                                    index.toString(),
                              ),
                              style: ADTextStyle400.size14.setTextColor(
                                context.adColors.blackTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ).paddingBySide(top: context.k_20, bottom: context.k_18),
                  if (item.orderDetail?.dutyfreeDetail?.itemDetails.length !=
                      index + 1)
                    Divider(
                      color: context.adColors.dividerColor,
                    ),
                ],
              );
            },
          ),
          ADSizedBox(
            height: context.k_20,
          ),

          ///TODO need to set loyalty points
          PriceDetailsSectionDutyFree(
            totalPrice:
                item.orderDetail?.dutyfreeDetail?.unitPriceResponse?.amount,
            discountPrice:
                item.orderDetail?.dutyfreeDetail?.discountPrice?.amount,
            preOrderDiscount: item
                .orderDetail?.dutyfreeDetail?.preOrderDiscount?.amount
                ?.toDouble(),
            totalAmount: item.orderDetail?.dutyfreeDetail?.finalAmount?.amount,
            couponDiscount: item
                .orderDetail?.dutyfreeDetail?.promoCoupon.offerValue
                ?.toDouble(),
            loyaltyPoint: 0,

            ///TODO need to set loyalty points
            ///TODO need to % not coming
            percentageDiscount: item.orderDetail?.dutyfreeDetail
                ?.preOrderDiscount?.percentageDiscount,
            showInfoIcon: item.orderDetail?.dutyfreeDetail
                    ?.preOrderDiscountBreakup?.isNotEmpty ??
                false,
            tapInfoIcon: () => adShowBottomSheet(
              childWidget: DutyFreePreOrderPriceInfo(
                preOrderDiscountBreakupList:
                    item.orderDetail?.dutyfreeDetail?.preOrderDiscountBreakup ??
                        [],
              ),
              context: context,
              headerTitle: 'pre_order_discount_breakup'.localize(context),
            ),
          ),
          // Align(
          //   child: Container(
          //     height: heightOfContinueShoppingButton,
          //     child: OutlinedButton(
          //       onPressed: () => Navigator.of(context).popUntil((route) {
          //         return route.isFirst;
          //       }),
          //       key: const Key(
          //         DutyFreeOrderConfirmationAutomationKeys
          //             .continueShoppingButton,
          //       ),
          //       style: OutlinedButton.styleFrom(
          //         padding: EdgeInsets.symmetric(
          //           horizontal: context.k_48,
          //         ),
          //         shape: const StadiumBorder(),
          //         side: BorderSide(color: context.adColors.neutralInfoMsg),
          //       ),
          //       child: Text(
          //         'continueShopping'.localize(context).toUpperCase(),
          //         style: ADTextStyle600.size14.copyWith(
          //           color: context.adColors.neutralInfoMsg,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

// num _getDiscountedPrice({required num actualPrice, required num discount}) {
//   final num discountPrice = actualPrice * discount ~/ divideByHundred;
//   final num discountedPrice = actualPrice - discountPrice;
//   return discountedPrice;
// }
}
