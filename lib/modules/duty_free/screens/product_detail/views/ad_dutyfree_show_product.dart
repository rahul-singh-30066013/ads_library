/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/item_detail_response.dart';
import 'package:adani_airport_mobile/modules/duty_free/screen_helper/automation_keys/duty_free_cart_automation_keys.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/views/ad_duty_free_selling_price_row.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/views/duty_free_product_quantity_view.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/views/duty_free_remove_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

const discountPercentage = 0;
const promotionType2 = 2;
const opacity = 0.699999988079071;

class ADDutyFreeShowProduct extends StatelessWidget {
  const ADDutyFreeShowProduct({
    Key? key,
    required this.productList,
    required this.isProgress,
  }) : super(key: key);
  final ItemDetailResponse productList;
  final bool isProgress;

  @override
  Widget build(BuildContext context) {
    // final RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
    // String? offerValue = '';
    // if (productList.promotions.isNotEmpty) {
    //   offerValue =
    //       productList.promotions.first.offer.toString().replaceAll(regex, '');
    // }
    const maxLines = 2;
    const value = 0.55;
    final outOfStockHeight = 7.sp;
    const outOfStockOpacity = 0.07000000029802322;
    return SizedBox(
      width: context.widthOfScreen * value,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Opacity(
            opacity: productList.inStock ? 1 : opacity,
            child: Text(
              (productList.skuName).validateWithDefaultValue(),
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
              style: ADTextStyle500.size16
                  .setTextColor(context.adColors.neutralInfoMsg),
              key:
                  const Key(DutyFreeCartAutomationKeys.dutyFreeCartProductName),
            ),
          ),
          SizedBox(height: context.k_14),
          Selector<DutyFreeState, int>(
            selector: (context, catalogListViewModel) =>
                catalogListViewModel.isProgressMap.length,
            builder: (
              BuildContext context,
              state,
              Widget? child,
            ) {
              final dropDownWidth = 96.sp;
              final dropDownHeight = 36.sp;

              return context
                      .read<DutyFreeState>()
                      .isProgressMap
                      .containsKey(productList.skuCode)
                  ? GestureDetector(
                      onTap: () => adLog('testing...'),
                      child: Container(
                        height: dropDownHeight,
                        width: dropDownWidth,
                        decoration: BoxDecoration(
                          color: context.adColors.whiteTextColor,
                          borderRadius: BorderRadius.circular(context.k_30),
                          boxShadow: [
                            BoxShadow(
                              color: context.adColors.circleGreyTextColor,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: ADDotProgressView(
                          color: context.adColors.black,
                          size: context.k_6,
                        ),
                      ),
                    )
                  : DutyFreeProductQuantityView(
                      productList: productList,
                      onChange: (value) => onItemClickHandler(
                        productList,
                        value.toString(),
                        context,
                      ),
                    );
            },
          ),
          SizedBox(height: context.k_14),
          if (productList.totalDiscountedPrice > 0 &&
              productList.totalDiscountedPrice != productList.totalUnitPrice)
            Row(
              children: [
                Text(
                  FlightUtils.getPriceFormatWithSymbol(
                    price: productList.totalUnitPrice.toDouble(),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: ADTextStyle400.size14.copyWith(
                    color: context.adColors.greyTextColor,
                    decoration: TextDecoration.lineThrough,
                  ),
                  key: const Key(
                    DutyFreeCartAutomationKeys.dutyFreeRupee,
                  ),
                ).paddingBySide(bottom: context.k_4),
              ],
            ),
          Row(
            //1850, 4950
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ADDutyFreeSellingPriceRow(
                      inStock: productList.inStock,
                      productSellingPrice: productList.totalDiscountedPrice,
                      off: discountPercentage,
                      context: context,
                    ),
                    ADSizedBox(
                      width: context.k_10,
                    ),
                    if ((productList.promotion?.promotionType ?? 0) == 1)
                      Text(
                        '${Utils.removeExtraZeros(productList.promotion?.offer?.toInt().toString() ?? '0')}% off',
                        style: ADTextStyle700.size12.copyWith(
                          color: context.adColors.greenTextColor,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ).paddingBySide(top: context.k_4),
                    if ((productList.promotion?.promotionType ?? 0) ==
                            promotionType2 &&
                        (productList.promotion?.offer ?? 0) > 0)
                      Text(
                        'off_label'.localize(context).replaceAll(
                              '%',
                              FlightUtils.getPriceFormatWithSymbol(
                                price:
                                    productList.promotion?.offer?.toDouble() ??
                                        0,
                              ),
                            ),
                        style: ADTextStyle700.size12.copyWith(
                          color: context.adColors.greenTextColor,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ).paddingBySide(top: context.k_4),
                  ],
                ),
              ),
              TextButton(
                onPressed: () => {
                  showRemoveDialog(context, productList),
                },
                style: TextButton.styleFrom(
                  primary: context.adColors.blackTextColor,
                ),
                key: const Key(
                  DutyFreeCartAutomationKeys.dutyFreeRemoveProductClick,
                ),
                child: Text(
                  'remove'.localize(context),
                  style: ADTextStyle400.size14
                      .setTextColor(context.adColors.black)
                      .copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: context.adColors.black,
                        decorationThickness: 1,
                        decorationStyle: TextDecorationStyle.solid,
                      ),
                  key: const Key(
                    DutyFreeCartAutomationKeys.dutyFreeRemoveProductTitle,
                  ),
                ),
              ),
            ],
          ),
          if (!productList.inStock || productList.overheadStock > 0)
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                vertical: outOfStockHeight,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(context.k_4)),
                color: const Color(0xffdc464b).withOpacity(outOfStockOpacity),
              ),
              child: Text(
                productList.inStock
                    ? 'selected_qty_not_available'.localize(context)
                    : 'out_of_stock'.localize(context),
                style:
                    ADTextStyle600.size14.setTextColor(const Color(0xffdc464b)),
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }

  void showRemoveDialog(
    BuildContext buildContext,
    ItemDetailResponse productList,
  ) {
    buildContext
        .read<DutyFreeState>()
        .dutyFreeEventState
        .removeFromCartRequestEvent(request: productList);

    final bottomSheet = showModalBottomSheet(
      useRootNavigator: true,
      backgroundColor: buildContext.adColors.whiteTextColor,
      elevation: buildContext.k_8,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(buildContext.k_22),
        ),
      ),
      context: buildContext,
      builder: (context) {
        return DutyFreeRemoveItem(
          detailString: 'are_you_sure_you_want_to_remove_one_item_from_cart'
              .localize(context),
          titleString: 'remove_one_item'.localize(context),
          yesCallBack: () => onItemClickHandler(
            productList,
            '0',
            buildContext,
            dialogContext: context,
            isFinish: 'true',
          ),
          noCallBack: () => navigatorPopScreen(context),
        );
      },
    );
    adLog('$bottomSheet');
  }

  void onItemClickHandler(
    ItemDetailResponse productList,
    String value,
    BuildContext context, {
    BuildContext? dialogContext,
    String? isFinish,
  }) {
    context
        .read<DutyFreeState>()
        .onDropDownAndRemoveItemClick(productList, value, context);
    if (isFinish != null) {
      navigatorPopScreen(dialogContext ?? context);
    }
  }
}
