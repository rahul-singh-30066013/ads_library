/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/duty_free_product_data_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/out_of_stock.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/views/ad_counter_button.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
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

const k_0_5 = 0.5;
const k_0_3 = 0.3;
const k_1_5 = 1.5;
const k_2 = 2;
const k_10 = 10;
const k_42 = 42;
const k_70 = 70;
const double k_80 = 80;
const k_94 = 94;
const k_100 = 100;
const double k_131 = 131;
const backgroundColor = 0.07000000029802322;
const promotionType = 3;

///this class is used to show the duty product that contains product name, actual price, discounted price, image, discount and is favorite
///*[productSize] a int that will be shown as size of this product
///*[placeHolderImagePath] path of icon/image that will be shown till the network image is loading
///*[isFavorite] a bool that will be used to set product is favorite or not
///*[onTapHandler] function that will be used to handle the product click
///*[favoriteTapHandler] function that will be used to handle the favorite icon click
///

class ADDutyFreeProduct extends StatelessWidget {
  ///usage sample code
  /// ADDutyFreeProduct(
  ///               placeHolderImagePath: 'lib/assets/gif/hour_glass.gif',
  ///               productNameText: 'product name is great',
  ///               productActualPrice: 10000,
  ///               isFavorite: true,
  ///               productDiscount: 50,
  ///               productSize: 100 ml,
  ///               onTapHandler: () {
  ///                 print(index);
  ///               },
  ///               productDiscountedPrice: 5000,
  ///             );
  ///
  const ADDutyFreeProduct({
    Key? key,
    required this.productSize,
    this.placeHolderImagePath = '',
    required this.isFavorite,
    this.onTapHandler,
    this.favoriteTapHandler,
    this.heroTag,
    required this.addButtonText,
    required this.onAddTap,
    this.productCartQty = 0,
    this.onIncrementTapHandler,
    this.onDecrementTapHandler,
    this.enableFavourite = true,
    required this.catalogType,
    required this.isEven,
    required this.maxQuantity,
    required this.unit,
    required this.isProgress,
    required this.loyaltyType,
    required this.dutyFreeProductDataModel,
    required this.loyaltyAvailable,
  }) : super(key: key);

  ///Network image string that needs to be shown as product image

  ///string that needs to be set as hero tag
  final String? heroTag;

  ///use to set add button text in this product
  final String addButtonText;

  ///use to set product size in this product
  final String productSize;

  ///use to set product cart qty.
  final int productCartQty;

  ///path of icon/image that will be shown till the network image is loading
  final String? placeHolderImagePath;

  ///used to handle the product tap
  final ADTapCallback? onTapHandler;

  ///used to handle the Add button tap
  final ADTapCallback? onAddTap;

  ///used to handle the favorite icon tap
  final ADTapCallback? favoriteTapHandler;

  ///use to set is product favorite or not
  final bool isFavorite;

  ///use to enable/disable product favourite functionality
  final bool enableFavourite;

  ///use to enable/disable product add functionality
  final String catalogType;

  ///use to find the index of view to manage space
  final bool isEven;

  ///use to restrict the max quantity
  final int maxQuantity;

  ///use to identify the liqour unit
  final String? unit;

  ///use to set product price after discount in this product
  final bool isProgress;

  ///use this function to decrement product cart qty
  final ADCounterTapCallback? onDecrementTapHandler;

  ///use this function to increment product cart qty
  final ADCounterTapCallback? onIncrementTapHandler;

  ///use Loyalty points earning quantity
  final String loyaltyType;

  /// remove Extra spacing if points not available
  final bool loyaltyAvailable;

  final DutyFreeProductDataModel dutyFreeProductDataModel;

  @override
  Widget build(BuildContext context) {
    final double rightMargin = isEven ? context.k_16 : 0;
    final height = 200.sp;
    final String productImageUrl = dutyFreeProductDataModel
            .productImages.isNotEmpty
        ? '${Environment.instance.configuration.cmsImageBaseUrl}${dutyFreeProductDataModel.productImages.first}'
        : '';

    final RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
    String? offerValue = '';
    if (dutyFreeProductDataModel.promotions.isNotEmpty) {
      final double value =
          double.tryParse(dutyFreeProductDataModel.promotions.first.offer) ?? 0;
      offerValue = value.toString().replaceAll(regex, '');
    }
    final num loyaltyPoint = num.tryParse(
          loyaltyType.replaceAll(RegExp('[^0-9]'), ''),
        ) ??
        0;
    return InkWell(
      onTap: onTapHandler,
      child: Stack(
        children: [
          // if (!dutyFreeProductDataModel.availability)
          //   Transform.rotate(
          //     angle: -math.pi / k_10,
          //     child: Text(
          //       'out_of_stock'.localize(context),
          //       style:
          //           ADTextStyle500.size18.setTextColor(context.adColors.red900),
          //     ),
          //   ).paddingBySide(top: context.k_16)
          // else
          //   const SizedBox.shrink(),
          Opacity(
            // opacity: !dutyFreeProductDataModel.availability ? k_0_3 : 1,
            opacity: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ADSizedBox(
                  height: height,
                  child: Hero(
                    tag: heroTag.toString(),
                    child: Container(
                      color: Colors.white,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          FadeInImage.memoryNetwork(
                            image: productImageUrl,
                            imageCacheHeight: height.toInt(),
                            fit: BoxFit.contain,
                            height: height,
                            placeholder: kTransparentImage,
                            imageErrorBuilder: (context, child, error) =>
                                Container(
                              color: context.adColors.cardBgColor,
                              child: const SizedBox(),
                            ),
                          ).paddingBySide(
                            left: context.k_4,
                            right: rightMargin,
                            top: context.k_30,
                            bottom: context.k_30,
                          ),
                          if (enableFavourite)
                            Positioned(
                              top: 0,
                              right: 0,
                              child: IconButton(
                                icon: !isFavorite
                                    ? Icon(
                                        Icons.favorite_outline_outlined,
                                        color: context.adColors.greyTextColor,
                                      )
                                    : Icon(
                                        Icons.favorite,
                                        color: context.adColors.red900,
                                      ),
                                onPressed: favoriteTapHandler,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: context.k_10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: context.k_4),
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: dutyFreeProductDataModel.skuName.trim(),
                          style: ADTextStyle500.size16
                              .setTextColor(context.adColors.blackTextColor),
                        ),
                        TextSpan(
                          text: productSize.trim(),
                          style: ADTextStyle700.size16
                              .setTextColor(context.adColors.blackTextColor),
                        ),
                      ],
                    ),
                    maxLines: k_2,
                  ).paddingBySide(right: context.k_16),
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (dutyFreeProductDataModel.promotions.isNotEmpty &&
                              dutyFreeProductDataModel
                                      .promotions.first.quantity ==
                                  1 &&
                              dutyFreeProductDataModel.promotions.first.type !=
                                  promotionType &&
                              dutyFreeProductDataModel
                                      .promotions.first.discountPrice !=
                                  dutyFreeProductDataModel.price &&
                              dutyFreeProductDataModel
                                      .promotions.first.discountPrice >
                                  0)
                            Container(
                              padding:
                                  EdgeInsets.symmetric(vertical: context.k_2),
                              child: Text(
                                FlightUtils.getPriceFormatWithSymbol(
                                  price:
                                      dutyFreeProductDataModel.price.toDouble(),
                                ),
                                style: ADTextStyle500.size12.copyWith(
                                  color: context.adColors.greyTextColor,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            )
                          else
                            const SizedBox.shrink(),
                          Container(
                            padding: EdgeInsets.only(
                              top: context.k_4,
                              bottom: context.k_4,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FlightUtils.getPriceFormatWithSymbol(
                                    price: (dutyFreeProductDataModel.promotions
                                                        .isNotEmpty &&
                                                    dutyFreeProductDataModel
                                                            .promotions
                                                            .first
                                                            .type !=
                                                        promotionType &&
                                                    dutyFreeProductDataModel
                                                            .promotions
                                                            .first
                                                            .quantity ==
                                                        1
                                                ? dutyFreeProductDataModel
                                                    .promotions
                                                    .first
                                                    .discountPrice
                                                : 0) >
                                            0
                                        ? dutyFreeProductDataModel
                                            .promotions.first.discountPrice
                                            .toDouble()
                                        : dutyFreeProductDataModel.price
                                            .toDouble(),
                                  ),
                                  style: ADTextStyle700.size14.copyWith(
                                    color: context.adColors.black,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                if (dutyFreeProductDataModel.promotions.isNotEmpty &&
                                    dutyFreeProductDataModel
                                            .promotions.first.type ==
                                        1 &&
                                    dutyFreeProductDataModel
                                            .promotions.first.quantity ==
                                        1)
                                  Text(
                                    dutyFreeProductDataModel
                                            .promotions.isNotEmpty
                                        ? '${(double.tryParse(offerValue) ?? 0).toInt()}${'off_label'.localize(context)}'
                                        : '',
                                    style: ADTextStyle700.size12.copyWith(
                                      color: context.adColors.greenTextColor,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ).paddingBySide(top: context.k_4),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (dutyFreeProductDataModel.availability)
                      Selector<DutyFreeState, bool>(
                        selector: (context, model) => model.isProgressMap
                            .containsKey(dutyFreeProductDataModel.skuCode),
                        builder: (BuildContext context, state, Widget? child) {
                          return state
                              ? Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(28),
                                    ),
                                    color: context.adColors.blueColor
                                        .withOpacity(1),
                                  ),
                                  height: k_42.sp,
                                  width: k_80.sp,
                                  child: ADDotProgressView(
                                    color: context.adColors.whiteTextColor,
                                    size: context.k_4,
                                  ),
                                ).paddingBySide(
                                  bottom: loyaltyAvailable
                                      ? context.k_2
                                      : context.k_12,
                                  right: isEven ? context.k_16 : 0,
                                )
                              : child ??
                                  Selector<DutyFreeState, int>(
                                    selector: (context, model) =>
                                        model.getSkuQty(
                                      dutyFreeProductDataModel.skuCode,
                                      storeType:
                                          dutyFreeProductDataModel.storeType,
                                      airportCode: dutyFreeProductDataModel
                                              .airportCode.isEmpty
                                          ? null
                                          : dutyFreeProductDataModel
                                              .airportCode,
                                    ),
                                    builder: (context, value, child) => value ==
                                            0
                                        ? ElevatedButton(
                                            onPressed: onAddTap,
                                            style: ElevatedButton.styleFrom(
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              primary: context
                                                  .adColors.whiteTextColor,
                                              shadowColor: Colors.transparent,
                                              fixedSize: Size(k_80.sp, k_42.sp),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                    context.k_28,
                                                  ),
                                                ),
                                                side: BorderSide(
                                                  color: context.adColors
                                                      .addButtonBorderColor,
                                                ),
                                              ),
                                              elevation: 0,
                                            ),
                                            child: RichText(
                                              text: TextSpan(
                                                style: ADTextStyle600.size16
                                                    .setTextColor(
                                                  context.adColors.blueColor,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: addButtonText,
                                                  ),
                                                  TextSpan(
                                                    text: '\u207A',
                                                    style: ADTextStyle500.size24
                                                        .setTextColor(
                                                      context
                                                          .adColors.blueColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ).paddingBySide(
                                              bottom: context.k_4,
                                            ),
                                          ).paddingBySide(
                                            right: isEven ? context.k_16 : 0,
                                            bottom: loyaltyAvailable
                                                ? context.k_2
                                                : context.k_12,
                                          )
                                        : ADCounterButton(
                                            onIncrementTapHandler:
                                                onIncrementTapHandler ??
                                                    (int value) {
                                                      adLog('');
                                                    },
                                            onDecrementTapHandler:
                                                onDecrementTapHandler ??
                                                    (int value) {
                                                      adLog('');
                                                    },
                                            onErrorTapHandler: (
                                              int value,
                                            ) =>
                                                adLog(value.toString()),
                                            counterNumber: context
                                                .read<DutyFreeState>()
                                                .getSkuQty(
                                                  dutyFreeProductDataModel
                                                      .skuCode,
                                                  storeType:
                                                      dutyFreeProductDataModel
                                                          .storeType,
                                                  airportCode:
                                                      dutyFreeProductDataModel
                                                              .airportCode
                                                              .isEmpty
                                                          ? null
                                                          : dutyFreeProductDataModel
                                                              .airportCode,
                                                ),
                                            maxCounterLimit: maxQuantity,
                                          ).paddingBySide(
                                            bottom: loyaltyAvailable
                                                ? context.k_2
                                                : context.k_12,
                                            right: isEven ? context.k_16 : 0,
                                          ),
                                  );
                        },
                        child: Selector<DutyFreeState, int>(
                          selector: (context, model) => model.getSkuQty(
                            dutyFreeProductDataModel.skuCode,
                            storeType: dutyFreeProductDataModel.storeType,
                            airportCode:
                                dutyFreeProductDataModel.airportCode.isEmpty
                                    ? null
                                    : dutyFreeProductDataModel.airportCode,
                          ),
                          builder: (context, value, child) => value == 0
                              ? ElevatedButton(
                                  onPressed: onAddTap,
                                  style: ElevatedButton.styleFrom(
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    primary: context.adColors.whiteTextColor,
                                    shadowColor: Colors.transparent,
                                    fixedSize: Size(k_80.sp, k_42.sp),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          context.k_28,
                                        ),
                                      ),
                                      side: BorderSide(
                                        color: context
                                            .adColors.addButtonBorderColor,
                                      ),
                                    ),
                                    elevation: 0,
                                  ),
                                  child: RichText(
                                    text: TextSpan(
                                      style: ADTextStyle600.size16.setTextColor(
                                        context.adColors.blueColor,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: addButtonText,
                                        ),
                                        TextSpan(
                                          text: '\u207A',
                                          style: ADTextStyle500.size24
                                              .setTextColor(
                                            context.adColors.blueColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ).paddingBySide(
                                    bottom: context.k_4,
                                  ),
                                ).paddingBySide(
                                  right: isEven ? context.k_16 : 0,
                                  bottom: loyaltyAvailable
                                      ? context.k_2
                                      : context.k_12,
                                )
                              : ADCounterButton(
                                  onIncrementTapHandler:
                                      onIncrementTapHandler ??
                                          (int value) {
                                            adLog('');
                                          },
                                  onDecrementTapHandler:
                                      onDecrementTapHandler ??
                                          (int value) {
                                            adLog('');
                                          },
                                  onErrorTapHandler: (
                                    int value,
                                  ) =>
                                      adLog(value.toString()),
                                  counterNumber: context
                                      .read<DutyFreeState>()
                                      .getSkuQty(
                                        dutyFreeProductDataModel.skuCode,
                                        storeType:
                                            dutyFreeProductDataModel.storeType,
                                        airportCode: dutyFreeProductDataModel
                                                .airportCode.isEmpty
                                            ? null
                                            : dutyFreeProductDataModel
                                                .airportCode,
                                      ),
                                  maxCounterLimit: maxQuantity,
                                ).paddingBySide(
                                  bottom: loyaltyAvailable
                                      ? context.k_2
                                      : context.k_12,
                                  right: isEven ? context.k_16 : 0,
                                ),
                        ),
                      )
                    else
                      OutOfStock(
                        fixedSize: Size(k_100.sp, k_42.sp),
                        textStyle: ADTextStyle400.size12.setTextColor(
                          context.adColors.darkGreyTextColor,
                        ),
                      ).paddingBySide(
                        right: isEven ? context.k_2 : 0,
                        bottom: loyaltyAvailable ? 0 : context.k_12,
                      ),
                  ],
                ),
                // if (isShowPoints)
                if (loyaltyAvailable)
                  Visibility(
                    visible: loyaltyPoint > 1,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          SvgAssets.coinIcon,
                          height: context.k_20,
                          width: context.k_20,
                        ),
                        ADSizedBox(
                          width: context.k_6,
                        ),
                        Text(
                          loyaltyType,
                          style: ADTextStyle500.size12
                              .setTextColor(context.adColors.greyTextColor),
                        ),
                      ],
                    ),
                  ).paddingBySide(bottom: context.k_16)
                else
                  ADSizedBox(
                    height: context.k_6,
                  ),
              ],
            ),
          ),
          if (dutyFreeProductDataModel.promotions.isNotEmpty &&
              !dutyFreeProductDataModel.isExclusive)
            Stack(
              alignment: Alignment.center,
              children: [
                Opacity(
                  opacity: backgroundColor,
                  child: Container(
                    width: context.k_56,
                    height: context.k_24,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: context.adColors.greenColor,
                    ),
                  ),
                ),
                Text(
                  'offer'.localize(context),
                  style: ADTextStyle700.size12.copyWith(
                    color: context.adColors.greenTextColor,
                  ),
                ),
              ],
            ).paddingBySide(top: context.k_8),
          if (dutyFreeProductDataModel.isExclusive &&
              dutyFreeProductDataModel.promotions.isEmpty)
            Stack(
              alignment: Alignment.center,
              children: [
                Opacity(
                  opacity: backgroundColor,
                  child: Container(
                    width: k_80,
                    height: context.k_24,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: context.adColors.adLogoGradient4,
                    ),
                  ),
                ),
                Text(
                  'exclusive'.localize(context),
                  style: ADTextStyle700.size12.copyWith(
                    color: context.adColors.adLogoGradient4,
                  ),
                ),
              ],
            ).paddingBySide(
              top: dutyFreeProductDataModel.isExclusive ? context.k_8 : 0,
            ),
          if (dutyFreeProductDataModel.isExclusive &&
              dutyFreeProductDataModel.promotions.isNotEmpty)
            Stack(
              alignment: Alignment.center,
              children: [
                Opacity(
                  opacity: backgroundColor,
                  child: Container(
                    width: k_131,
                    height: context.k_24,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: context.adColors.adLogoGradient4,
                    ),
                  ),
                ),
                Text(
                  '${'exclusive'.localize(context)} + ${'offer'.localize(context)}',
                  style: ADTextStyle700.size12.copyWith(
                    color: context.adColors.adLogoGradient4,
                  ),
                ),
              ],
            ).paddingBySide(
              top: dutyFreeProductDataModel.isExclusive ? context.k_8 : 0,
            ),
          // if (!dutyFreeProductDataModel.availability)
          //   Transform.rotate(
          //     angle: -math.pi / k_10,
          //     child: Text(
          //       'out_of_stock'.localize(context),
          //       style:
          //           ADTextStyle500.size18.setTextColor(context.adColors.red900),
          //     ),
          //   ).paddingBySide(top: context.k_16)
          // else
          //   const SizedBox.shrink(),
        ],
      ),
    );
  }

// void onError(BuildContext context) {
//   final showSnackBar = ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       margin: EdgeInsets.symmetric(
//         horizontal: context.k_16,
//         vertical: 76,
//       ),
//       behavior: SnackBarBehavior.floating,
//       content: Text(
//         'limit_exceeded_liqour'.localize(context),
//         textAlign: TextAlign.left,
//         style: ADTextStyle400.size12.setTextColor(Colors.white),
//       ),
//       duration: const Duration(
//         milliseconds: 1000,
//       ),
//       backgroundColor: context.adColors.storyViewBarFillColor,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(context.k_4),
//         ),
//       ),
//     ),
//   );
//   adLog(showSnackBar.toString());
// }
}
