/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:math';

import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/deal_product_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/catalog_list_response_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/duty_free_product_data_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/repository/duty_free_repository.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/product_detail_duty_free_screen.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/views/duty_free_pdp_product_card.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_alerts.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

const subItemRadius = 4.0;
const subItemMarginRight = 16.0;
const subItemMarginTop = 0.0;
const subItemMarginBottom = 0.0;
const bottomPadding = 120.0;
const sliderRatio = 0.4489795;
const maxLines = 2;

class SimilarSoldProductList extends StatelessWidget {
  final CatalogListResponseModel pdpPageResponse;

  SimilarSoldProductList({Key? key, required this.pdpPageResponse})
      : super(key: key);
  final containerHeight = 318.sp;
  final scaledImageHeight = 100.sp;

  @override
  Widget build(BuildContext context) {
    return Consumer<DutyFreeState>(
      builder: (BuildContext context, state, Widget? child) {
        if (state.pdpStatus == Status.complete) {
          final List<DutyFreeProductDataModel>? similar =
              pdpPageResponse.similar;
          final List<DutyFreeProductDataModel>? soldTogether =
              pdpPageResponse.soldTogether;
          final List<DutyFreeProductDataModel>? exclusive =
              pdpPageResponse.exclusive;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (similar?.isNotEmpty ?? false)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ADSizedBox(
                      height: k_52.sp,
                    ),
                    Text(
                      'similarProduct'.localize(context),
                      style: ADTextStyle600.size18.setTextColor(
                        context.adColors.storyViewBarFillColor,
                      ),
                    ).paddingBySide(
                      left: context.k_16,
                    ),
                    ADSizedBox(
                      height: context.k_20,
                    ),
                    Container(
                      height: containerHeight,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(
                          horizontal: context.k_16,
                        ),
                        itemBuilder: (context, index) {
                          final DutyFreeState dutyFreeState =
                              context.read<DutyFreeState>();

                          final int? quantity = dutyFreeState.getSkuQty(
                            similar?[index].skuCode ?? '',
                            storeType: similar?[index].storeType ?? 'departure',
                            airportCode: similar?[index].airportCode,
                          );

                          final dutyFreeDataProductModel = similar?[index];
                          similar?[index] = dutyFreeDataProductModel?.copyWith(
                                quantity: quantity ?? 0,
                              ) ??
                              const DutyFreeProductDataModel();

                          if (similar?[index].timeStamp.isEmpty == true) {
                            similar?[index] = similar[index].copyWith(
                              timeStamp: DateTime.now()
                                  .millisecondsSinceEpoch
                                  .toString(),
                            );
                          }

                          return GestureDetector(
                            onTap: () => navigateToPdpPage(
                              context,
                              similar?[index],
                              index,
                            ),
                            child: DutyFreePdpProductCard(
                              // width:
                              //     (context.widthOfScreen - (context.k_16 * maxLines)) *
                              //         sliderRatio,
                              availability:
                                  similar?[index].availability ?? true,
                              maxQuantity: min(
                                similar?[index].availableQuantity.toInt() ??
                                    Utils.dutyFreeProductMaxQty,
                                Utils.dutyFreeProductMaxQty,
                              ),
                              timeStamp: similar?[index].timeStamp ?? '',
                              index: index,
                              skuCode: similar?[index].skuCode ?? '',
                              productCartQty: quantity ?? 0,
                              title: similar?[index].skuName ?? '',
                              height: containerHeight,

                              promotions: similar?[index].promotions,
                              imageScaledHeight: scaledImageHeight,
                              image: (similar?[index]
                                          .productImages
                                          .isNotEmpty ??
                                      false)
                                  ? '${Environment.instance.configuration.cmsImageBaseUrl}${similar?[index].productImages.first}'
                                  : '',
                              placeHolder:
                                  'lib/assets/images/duty_free/listing/absolut.png',
                              actualPrice:
                                  similar?[index].price.toString() ?? '',
                              discountedPrice:
                                  similar?[index].discountPrice.toString(),
                              addText: 'Add',
                              backgroundColor: Colors.transparent,
                              borderRadius: subItemRadius,
                              onDecrementTapHandler: (int value) =>
                                  updateRecommended(
                                context,
                                pdpPageResponse.similar?[index] ??
                                    const DutyFreeProductDataModel(),
                                increment: false,
                              ),
                              onIncrementTapHandler: (int value) =>
                                  updateRecommended(
                                context,
                                pdpPageResponse.similar?[index] ??
                                    const DutyFreeProductDataModel(),
                                increment: true,
                              ),
                              // isItemAvailable:
                              //     similar?[index].availability ?? false,
                              onTap: () => updateRecommended(
                                context,
                                pdpPageResponse.similar?[index] ??
                                    const DutyFreeProductDataModel(),
                                increment: true,
                              ),
                              bonusString: returnLoyalityText(similar?[index]),
                            ),
                          );
                        },
                        separatorBuilder: (
                          BuildContext context,
                          int index,
                        ) =>
                            ADSizedBox(
                          width: context.k_12,
                        ),
                        itemCount: similar?.length ?? 0,
                      ),
                    ),
                  ],
                ),
              if (soldTogether?.isNotEmpty ?? false)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ADSizedBox(
                      height: k_52.sp,
                    ),
                    Text(
                      'frequently_bought_together'.localize(context),
                      style: ADTextStyle600.size18.setTextColor(
                        context.adColors.storyViewBarFillColor,
                      ),
                    ).paddingBySide(
                      left: context.k_16,
                    ),
                    ADSizedBox(
                      height: context.k_20,
                    ),
                    Container(
                      height: containerHeight,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(
                          horizontal: context.k_16,
                        ),
                        itemBuilder: (context, index) {
                          final DutyFreeState dutyFreeState =
                              context.read<DutyFreeState>();

                          final int? quantity = dutyFreeState.getSkuQty(
                            soldTogether?[index].skuCode ?? '',
                            storeType: soldTogether?[index].storeType ?? '',
                            airportCode: soldTogether?[index].airportCode,
                          );

                          final dutyFreeDataProductModel = soldTogether?[index];
                          soldTogether?[index] =
                              dutyFreeDataProductModel?.copyWith(
                                    quantity: quantity ?? 0,
                                  ) ??
                                  const DutyFreeProductDataModel();

                          if (soldTogether?[index].timeStamp.isEmpty ?? false) {
                            soldTogether?[index] = soldTogether[index].copyWith(
                              timeStamp: DateTime.now()
                                  .millisecondsSinceEpoch
                                  .toString(),
                            );
                          }
                          return GestureDetector(
                            onTap: () => navigateToPdpPage(
                              context,
                              soldTogether?[index],
                              index,
                            ),
                            child: DutyFreePdpProductCard(
                              // width:
                              // (context.widthOfScreen - (context.k_16 * maxLines)) *
                              //     sliderRatio,
                              availability:
                                  soldTogether?[index].availability ?? true,
                              maxQuantity: min(
                                soldTogether?[index]
                                        .availableQuantity
                                        .toInt() ??
                                    Utils.dutyFreeProductMaxQty,
                                Utils.dutyFreeProductMaxQty,
                              ),
                              timeStamp: soldTogether?[index].timeStamp ?? '',
                              index: index,
                              skuCode: soldTogether?[index].skuCode ?? '',
                              productCartQty: quantity ?? 0,
                              title: soldTogether?[index].skuName ?? '',
                              height: containerHeight,
                              imageScaledHeight: scaledImageHeight,
                              promotions: soldTogether?[index].promotions,
                              image: (soldTogether?[index]
                                          .productImages
                                          .isNotEmpty ??
                                      false)
                                  ? '${Environment.instance.configuration.cmsImageBaseUrl}${soldTogether?[index].productImages.first}'
                                  : '',
                              placeHolder:
                                  'lib/assets/images/duty_free/listing/absolut.png',
                              actualPrice:
                                  soldTogether?[index].price.toString() ?? '',
                              discountedPrice:
                                  soldTogether?[index].discountPrice.toString(),
                              addText: 'add'.localize(context),
                              backgroundColor: Colors.transparent,
                              borderRadius: subItemRadius,
                              onDecrementTapHandler: (int value) =>
                                  updateRecommended(
                                context,
                                pdpPageResponse.soldTogether?[index] ??
                                    const DutyFreeProductDataModel(),
                                increment: false,
                              ),
                              onIncrementTapHandler: (int value) =>
                                  updateRecommended(
                                context,
                                pdpPageResponse.soldTogether?[index] ??
                                    const DutyFreeProductDataModel(),
                                increment: true,
                              ),
                              onTap: () => updateRecommended(
                                context,
                                pdpPageResponse.soldTogether?[index] ??
                                    const DutyFreeProductDataModel(),
                                increment: true,
                              ),
                              bonusString: returnLoyalityText(
                                soldTogether?[index],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (
                          BuildContext context,
                          int index,
                        ) =>
                            ADSizedBox(
                          width: context.k_12,
                        ),
                        itemCount: soldTogether?.length ?? 0,
                      ),
                    ),
                  ],
                ),
              if (exclusive?.isNotEmpty ?? false)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ADSizedBox(
                      height: k_52.sp,
                    ),
                    Text(
                      'other_exclusive_items'.localize(context),
                      style: ADTextStyle600.size18.setTextColor(
                        context.adColors.storyViewBarFillColor,
                      ),
                    ).paddingBySide(
                      left: context.k_16,
                    ),
                    ADSizedBox(
                      height: context.k_20,
                    ),
                    Container(
                      height: containerHeight,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(
                          horizontal: context.k_16,
                        ),
                        itemBuilder: (context, index) {
                          final DutyFreeState dutyFreeState =
                              context.read<DutyFreeState>();

                          final int? quantity = dutyFreeState.getSkuQty(
                            exclusive?[index].skuCode ?? '',
                            storeType: exclusive?[index].storeType ?? '',
                            airportCode: exclusive?[index].airportCode,
                          );

                          final dutyFreeDataProductModel = exclusive?[index];
                          exclusive?[index] =
                              dutyFreeDataProductModel?.copyWith(
                                    quantity: quantity ?? 0,
                                  ) ??
                                  const DutyFreeProductDataModel();

                          if (exclusive?[index].timeStamp.isEmpty ?? false) {
                            exclusive?[index] = exclusive[index].copyWith(
                              timeStamp: DateTime.now()
                                  .millisecondsSinceEpoch
                                  .toString(),
                            );
                          }
                          return GestureDetector(
                            onTap: () => navigateToPdpPage(
                              context,
                              exclusive?[index],
                              index,
                            ),
                            child: DutyFreePdpProductCard(
                              // width:
                              // (context.widthOfScreen - (context.k_16 * maxLines)) *
                              //     sliderRatio,
                              availability:
                                  exclusive?[index].availability ?? true,
                              maxQuantity: min(
                                exclusive?[index].availableQuantity.toInt() ??
                                    Utils.dutyFreeProductMaxQty,
                                Utils.dutyFreeProductMaxQty,
                              ),
                              timeStamp: exclusive?[index].timeStamp ?? '',
                              index: index,
                              skuCode: exclusive?[index].skuCode ?? '',
                              productCartQty: quantity ?? 0,
                              title: exclusive?[index].skuName ?? '',
                              height: containerHeight,
                              imageScaledHeight: scaledImageHeight,
                              promotions: exclusive?[index].promotions,
                              image: (exclusive?[index]
                                          .productImages
                                          .isNotEmpty ??
                                      false)
                                  ? '${Environment.instance.configuration.cmsImageBaseUrl}${exclusive?[index].productImages.first}'
                                  : '',
                              placeHolder:
                                  'lib/assets/images/duty_free/listing/absolut.png',
                              actualPrice:
                                  exclusive?[index].price.toString() ?? '',
                              discountedPrice:
                                  exclusive?[index].discountPrice.toString(),
                              addText: 'add'.localize(context),
                              backgroundColor: Colors.transparent,
                              borderRadius: subItemRadius,
                              onDecrementTapHandler: (int value) =>
                                  updateRecommended(
                                context,
                                pdpPageResponse.exclusive?[index] ??
                                    const DutyFreeProductDataModel(),
                                increment: false,
                              ),
                              onIncrementTapHandler: (int value) =>
                                  updateRecommended(
                                context,
                                pdpPageResponse.exclusive?[index] ??
                                    const DutyFreeProductDataModel(),
                                increment: true,
                              ),
                              onTap: () => updateRecommended(
                                context,
                                pdpPageResponse.exclusive?[index] ??
                                    const DutyFreeProductDataModel(),
                                increment: true,
                              ),
                              bonusString: returnLoyalityText(
                                exclusive?[index],
                              ),
                              isExclusive:
                                  exclusive?[index].isExclusive ?? false,
                            ),
                          );
                        },
                        separatorBuilder: (
                          BuildContext context,
                          int index,
                        ) =>
                            ADSizedBox(
                          width: context.k_12,
                        ),
                        itemCount: exclusive?.length ?? 0,
                      ),
                    ),
                  ],
                ),
            ],
          ).paddingBySide(bottom: bottomPadding);
        }
        /* else if (state.pdpStatus == Status.loading) {
          return Center(
            child: ADDotProgressView(
              color: context.adColors.black,
            ),
          );
        } */
        else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  String returnLoyalityText(
    DutyFreeProductDataModel? result,
  ) {
    final loyaltyType = result?.earn2XString ?? '';
    return loyaltyType.isNotEmpty ? loyaltyType : '';
  }

  void updateRecommended(
    BuildContext context,
    DutyFreeProductDataModel productList, {
    required bool increment,
  }) {
    final DutyFreeState dutyFreeState = context.read<DutyFreeState>();
    if ((dutyFreeState.dutyFreeCartResponse?.itemDetails.isNotEmpty ?? false) &&
        (productList.storeType.isNotEmpty) &&
        (dutyFreeState.dutyFreeCartResponse?.airportCode !=
                selectedAirportsData?.airportCode ||
            dutyFreeState.dutyFreeCartResponse?.itemDetails.first.storeType
                    .toLowerCase() !=
                productList.storeType)) {
      Utils.clearDutyFreeCartDialog(context, (dialogContext) {
        Navigator.of(dialogContext).pop();
        final DutyFreeRepository dutyFreeRepository = DutyFreeRepository();
        dutyFreeRepository.removeDutyFreeCart().then((value) {
          if (value.viewStatus == Status.complete) {
            (dutyFreeState
                        .addedItemMap[dutyFreeState.terminalModel.value.code] ??
                    {})
                .clear();
            // try {
            //   dutyFreeState.dashboardItemNotifier?.value =
            //       !(dutyFreeState.dashboardItemNotifier?.value ?? false);
            // } catch (e) {
            //   adLog(e.toString());
            // }
            if (dutyFreeState.terminalList.isEmpty) {
              dutyFreeState.getDutyFreeTerminalList().then((value) {
                //TODO Need to change it to singleWhere as this will be not useful for uniqueness of terminal
                dutyFreeState.terminalModel.value =
                    dutyFreeState.terminalList.firstWhere(
                  (element) =>
                      element.code.toLowerCase() == productList.storeType,
                );
              });
            } else {
              //TODO Need to change it to singleWhere as this will be not useful for uniqueness of terminal
              dutyFreeState.terminalModel.value =
                  dutyFreeState.terminalList.firstWhere(
                (element) =>
                    element.code.toLowerCase() == productList.storeType,
              );
            }
            dutyFreeState
              ..clearCart(context.read<AppSessionState>())
              ..updateCart(
                context: context,
                increment: increment,
                dutyFreeProductDataModel: productList,
                fromCartPage: false,
              );
          } else {
            getView(
              context: context,
              dialogEnm: DialogTypeEnm.snackBar,
              message: value.message ?? 'Something went wrong',
            );
          }
        });
      });
    } else {
      dutyFreeState.updateCart(
        context: context,
        increment: increment,
        dutyFreeProductDataModel: productList,
        fromCartPage: false,
      );
    }
    // setData();
  }

  Future<void> navigateToPdpPage(
    BuildContext context,
    DutyFreeProductDataModel? item,
    int index,
  ) async {
    context.read<DutyFreeState>().dutyFreeEventState.selectItemEvent(
          item ?? const DutyFreeProductDataModel(),
          'cart_screen',
        );
    navigateToScreenUsingNamedRouteWithArguments(
      context,
      productDetailDutyFreeScreen,
      rootNavigator: false,
      argumentObject: DealProductModel(
        item: item,
        index: index,
        timeStamp: item?.timeStamp ?? '',
      ),
    );
  }
}
