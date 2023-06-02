/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:math';

import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/deal_product_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/catalog_list_response_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/duty_free_product_data_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/views/duty_free_product_card.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/views/duty_free_product_card_shimmer.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/dashboard/tabs_state.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///Widget for duty free component for bags component
class DutyFreeBagsCard extends StatelessWidget {
  final DutyFreeDashboardItem dutyFreeDashboardItem;

  DutyFreeBagsCard({Key? key, required this.dutyFreeDashboardItem})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BagsComponent(
          dutyFreeDashboardItem: dutyFreeDashboardItem,
        ),
      ],
    );
  }
}

class BagsComponent extends StatefulWidget {
  const BagsComponent({Key? key, required this.dutyFreeDashboardItem})
      : super(key: key);

  final DutyFreeDashboardItem dutyFreeDashboardItem;
  @override
  _BagsComponentState createState() => _BagsComponentState();
}

class _BagsComponentState extends State<BagsComponent>
    with AutomaticKeepAliveClientMixin {
  final TabsState _tabsState = TabsState();

  DutyFreeState? dutyFreeState;
  final ValueNotifier<bool> isVisible = ValueNotifier(true);
  @override
  void initState() {
    super.initState();
    dutyFreeState = context.read<DutyFreeState>();
  }

  @override
  Widget build(BuildContext context) {
    final superWidget = super.build(context);

    ///To avoid warning
    adLog(superWidget.toString());
    final listHeight =
        390.sp + (widget.dutyFreeDashboardItem.subItemMargin?.top.sp ?? 0);
    final scaledImageHeight = 213.sp;
    const listLength = 10;
    return ValueListenableBuilder<bool>(
      valueListenable: isVisible,
      builder: (context, bool value, child) => Visibility(
        visible: value,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.dutyFreeDashboardItem.title ?? '',
                  style: ADTextStyle700.size22.setTextColor(
                    context.adColors.blackTextColor,
                  ),
                ).paddingBySide(
                  left: widget.dutyFreeDashboardItem.itemMargin?.left.sp ?? 0,
                ),
                Text(
                  widget.dutyFreeDashboardItem.subTitle ?? '',
                  style: ADTextStyle400.size16.setTextColor(
                    context.adColors.blackTextColor,
                  ),
                ).paddingBySide(
                  left: widget.dutyFreeDashboardItem.itemMargin?.left.sp ?? 0,
                  top: widget.dutyFreeDashboardItem.subTitle == null
                      ? 0
                      : context.k_10,
                ),
              ],
            ).paddingBySide(
              top: widget.dutyFreeDashboardItem.itemMargin?.top.sp ?? 0,
            ),
            Container(
              height: listHeight,
              margin: EdgeInsets.only(
                top: widget.dutyFreeDashboardItem.subItemMargin?.top.sp ?? 0,
              ),
              child: FutureBuilder(
                future: _tabsState
                    .loadProducts(
                  widget.dutyFreeDashboardItem.widgetItems?.first ??
                      DutyFreeItem(),
                  context.read<DutyFreeState>().terminalModel.value.code,
                  context.read<DutyFreeState>(),
                )
                    .then(
                  (value) {
                    if (value.data != null &&
                        value.data is CatalogListResponseModel) {
                      isVisible.value = (value.data as CatalogListResponseModel)
                          .result
                          .isNotEmpty;
                    }
                    adLog(
                      'value---> ${isVisible.value}',
                    );
                    return value;
                  },
                ),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final ADResponseState responseState =
                        snapshot.data as ADResponseState;
                    final CatalogListResponseModel? catalogListResponseModel =
                        responseState.data;
                    // adLog(responseState.data);
                    return responseState.viewStatus == Status.complete &&
                            catalogListResponseModel != null
                        ? catalogListResponseModel.result.isNotEmpty
                            ? ListView.separated(
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) {
                                  final DutyFreeState dutyFreeState =
                                      context.read<DutyFreeState>();
                                  final int? quantity = dutyFreeState.getSkuQty(
                                    catalogListResponseModel
                                        .result[index].skuCode,
                                    storeType: catalogListResponseModel
                                        .result[index].storeType,
                                  );

                                  final dutyFreeDataProductModel =
                                      catalogListResponseModel.result[index];
                                  catalogListResponseModel.result[index] =
                                      dutyFreeDataProductModel.copyWith(
                                    quantity: quantity ?? 0,
                                  );

                                  if (catalogListResponseModel
                                      .result[index].timeStamp.isEmpty) {
                                    DutyFreeProductDataModel model =
                                        catalogListResponseModel.result[index];

                                    model = model.copyWith(
                                      timeStamp: DateTime.now()
                                          .millisecondsSinceEpoch
                                          .toString(),
                                    );
                                    catalogListResponseModel.result[index] =
                                        model;
                                    adLog(
                                      'Models Time Stamps ${catalogListResponseModel.result[index].timeStamp}',
                                    );
                                  }

                                  return TouchableOpacity(
                                    onTap: () =>
                                        navigateToScreenUsingNamedRouteWithArguments(
                                      context,
                                      productDetailDutyFreeScreen,
                                      rootNavigator: false,
                                      argumentObject: DealProductModel(
                                        catalogType: catalogListResponseModel
                                            .result[index].category,
                                        item: catalogListResponseModel
                                            .result[index],
                                        index: index,
                                        timeStamp: catalogListResponseModel
                                            .result[index].timeStamp,
                                      ),
                                    ),
                                    child: DutyFreeProductCard(
                                      availability: catalogListResponseModel
                                          .result[index].availability,
                                      timeStamp: catalogListResponseModel
                                          .result[index].timeStamp,
                                      index: index,
                                      promotions: catalogListResponseModel
                                          .result[index].promotions,
                                      skuCode: catalogListResponseModel
                                          .result[index].skuCode,
                                      productCartQty: quantity ?? 0,
                                      title: catalogListResponseModel
                                          .result[index].skuName,
                                      imageScaledHeight: scaledImageHeight,
                                      height: listHeight,
                                      image: catalogListResponseModel
                                              .result[index]
                                              .productImages
                                              .isNotEmpty
                                          ? '${Environment.instance.configuration.cmsImageBaseUrl}${catalogListResponseModel.result[index].productImages.first}'
                                          : '',
                                      placeHolder:
                                          'lib/assets/images/duty_free/listing/absolut.png',
                                      actualPrice: catalogListResponseModel
                                          .result[index].price
                                          .toString(),
                                      discountedPrice: catalogListResponseModel
                                          .result[index].discountPrice
                                          .toString(),
                                      addText: 'add'.localize(context),
                                      backgroundColor: Colors.transparent,
                                      borderRadius: widget
                                          .dutyFreeDashboardItem.subItemRadius,
                                      onDecrementTapHandler: (int value) =>
                                          context
                                              .read<DutyFreeState>()
                                              .updateCart(
                                                context: context,
                                                increment: false,
                                                fromCartPage: false,
                                                dutyFreeProductDataModel:
                                                    catalogListResponseModel
                                                        .result[index],
                                              ),
                                      onIncrementTapHandler: (int value) =>
                                          context
                                              .read<DutyFreeState>()
                                              .updateCart(
                                                context: context,
                                                fromCartPage: false,
                                                dutyFreeProductDataModel:
                                                    catalogListResponseModel
                                                        .result[index],
                                              ),
                                      // isItemAvailable: catalogListResponseModel
                                      //         ?.result[index].availability ??
                                      //     false,
                                      onTap: () => context
                                          .read<DutyFreeState>()
                                          .updateCart(
                                            context: context,
                                            fromCartPage: false,
                                            dutyFreeProductDataModel:
                                                catalogListResponseModel
                                                    .result[index],
                                          ),
                                      maxQuantity: min(
                                        catalogListResponseModel
                                            .result[index].availableQuantity
                                            .toInt(),
                                        Utils.dutyFreeProductMaxQty,
                                      ),
                                      bonusString: returnLoyalityText(
                                        catalogListResponseModel.result[index],
                                      ),
                                    ).paddingBySide(
                                      left: index == 0
                                          ? widget.dutyFreeDashboardItem
                                                  .subItemMargin?.left.sp ??
                                              0
                                          : 0,
                                      right: index ==
                                              (catalogListResponseModel
                                                      .result.length) -
                                                  1
                                          ? widget.dutyFreeDashboardItem
                                                  .subItemMargin?.right.sp ??
                                              0
                                          : 0,
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        ADSizedBox(
                                  width: widget.dutyFreeDashboardItem
                                          .subItemMargin?.right.sp ??
                                      0,
                                ),
                                itemCount:
                                    catalogListResponseModel.result.length,
                              )
                            : Center(
                                child: Text(
                                  'there_are_no_items_available_for_this_category'
                                      .localize(context),
                                ),
                              )
                        : Center(
                            child: Text(
                              'not_able_to_load_products_try_after_some_time'
                                  .localize(context),
                            ),
                          );
                  } else {
                    return Container(
                      height: listHeight,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            DutyFreeProductCardShimmer(
                          height: listHeight,
                          imageScaledHeight: scaledImageHeight,
                          borderRadius:
                              widget.dutyFreeDashboardItem.subItemRadius,
                        ).paddingBySide(
                          left: index == 0
                              ? widget.dutyFreeDashboardItem.subItemMargin?.left
                                      .sp ??
                                  0
                              : 0,
                          right: index == listLength - 1
                              ? widget.dutyFreeDashboardItem.subItemMargin
                                      ?.right.sp ??
                                  0
                              : 0,
                        ),
                        separatorBuilder: (context, index) => ADSizedBox(
                          width: widget.dutyFreeDashboardItem.subItemMargin
                                  ?.right.sp ??
                              0,
                        ),
                        itemCount: listLength,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String returnLoyalityText(
    DutyFreeProductDataModel? result,
  ) {
    final loyaltyType = result?.earn2XString ?? '';
    return loyaltyType.isNotEmpty ? loyaltyType : '';
  }

  void updateData(
    BuildContext context,
    DutyFreeProductDataModel dutyFreeProductDataModel, {
    required bool increment,
  }) {
    context.read<DutyFreeState>().updateCart(
          context: context,
          increment: increment,
          fromCartPage: false,
          dutyFreeProductDataModel: dutyFreeProductDataModel,
        );
  }

  @override
  bool get wantKeepAlive => true;
}
