/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:math';

import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/deal_product_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/catalog_list_response_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/duty_free_product_data_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/views/duty_free_product_card.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_dashboard_site_core_response.dart';
import 'package:adani_airport_mobile/modules/loyalty/state_management/loyalty_state_management.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///This class used to create widget of tab slider for duty free section on loyalty
class DutyFreeView extends StatefulWidget {
  final DashboardItem dashboardItem;

  const DutyFreeView({Key? key, required this.dashboardItem}) : super(key: key);

  @override
  State<DutyFreeView> createState() => _DutyFreeViewState();
}

class _DutyFreeViewState extends State<DutyFreeView> {
  LoyaltyStateManagement? loyaltyStateProvider;

  @override
  void initState() {
    super.initState();
    loyaltyStateProvider = context.read<LoyaltyStateManagement>();
  }

  @override
  Widget build(BuildContext context) {
    final containerHeight = 448.sp;
    // for (int size = 0; size < dashboardItem.widgetItems.length; size++) {
    //   if (context.read<DutyFreeState>().ageAbove25) {
    //     if (dashboardItem.widgetItems[size].productDatas.isNotEmpty) {
    //       customWidgetItem.add(dashboardItem.widgetItems[size]);
    //     }
    //   } else {
    //     if (dashboardItem.widgetItems[size].productDatas.isNotEmpty &&
    //         dashboardItem.widgetItems[size].productDatas.first.materialGroup !=
    //             'Liquor') {
    //       if (dashboardItem.widgetItems[size].productDatas.isNotEmpty) {
    //         customWidgetItem.add(dashboardItem.widgetItems[size]);
    //       }
    //     }
    //   }
    // }
    return Selector<LoyaltyStateManagement, String>(
      selector: (context, model) => model.selectedTerminal,
      builder: (context, value, child) {
        final List<WidgetItem> customWidgetItem =
            List.of(widget.dashboardItem.widgetItems);
        for (int item = 0; item < customWidgetItem.length; item++) {
          customWidgetItem[item] = customWidgetItem[item].copyWith(
            productDatas: List.of(customWidgetItem[item].productDatas)
              ..removeWhere((element) => element.storeType != value),
          );
        }
        customWidgetItem.removeWhere((element) => element.productDatas.isEmpty);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultTabController(
              length: customWidgetItem.length,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (customWidgetItem.length > 1)
                    TabBar(
                      isScrollable: true,
                      tabs: customWidgetItem
                          .map(
                            (e) => Tab(
                              text: e.category,
                            ),
                          )
                          .toList(),
                      //onTap: (index) => selectedIndex = size[index],
                      unselectedLabelStyle: ADTextStyle400.size16.copyWith(
                        color: context.adColors.greyTextColor,
                      ),
                      labelStyle: ADTextStyle500.size16.copyWith(
                        color: context.adColors.neutralInfoMsg,
                      ),
                      indicatorColor: context.adColors.neutralInfoMsg,
                    ).paddingBySide(
                      left: context.k_20,
                      // top: context.k_10,
                    )
                  else
                    const ADSizedBox.shrink(),
                  if (customWidgetItem.length > 1)
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: Color(0xffE2E2E2),
                    ).paddingBySide(
                      bottom: context.k_12,
                      left: context.k_20,
                    )
                  else
                    ADSizedBox(
                      height: context.k_12,
                    ),
                  Container(
                    height: containerHeight,
                    child: TabBarView(
                      children: customWidgetItem
                          .map(
                            (e) => _TabView(
                              subItemMargin: widget.dashboardItem.subItemMargin,
                              dutyFreeItem: e,
                              subItemRadius: widget.dashboardItem.subItemRadius,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  if (customWidgetItem.length < context.k_2)
                    ADSizedBox(
                      height: context.k_30,
                    ),
                ],
              ).paddingBySide(
                  //  top: dashboardItem.itemMargin.top.sp,
                  ),
            ),
          ],
        );
      },
    );
  }
}

class _TabView extends StatefulWidget {
  final ItemMargin? subItemMargin;
  final WidgetItem dutyFreeItem;
  final double? subItemRadius;

  const _TabView({
    Key? key,
    required this.subItemMargin,
    required this.dutyFreeItem,
    this.subItemRadius,
  }) : super(key: key);

  @override
  State<_TabView> createState() => _TabViewState();
}

class _TabViewState extends State<_TabView> with AutomaticKeepAliveClientMixin {
  final containerHeight = 482.sp;
  final imageScaledHeight = 248.sp;
  final listLength = 10;

  // ValueNotifier<bool> updateList = ValueNotifier(false);

  CatalogListResponseModel? catalogListResponseModel;
  DutyFreeState? dutyFreeState;

  //final List<DutyFreeProductDataModel>? productsList = [];

  @override
  Widget build(BuildContext context) {
    // productsList?.clear();
    for (int subItems = 0;
        subItems < widget.dutyFreeItem.productDatas.length;
        subItems++) {
      final dutyFreeDataProductModel =
          widget.dutyFreeItem.productDatas[subItems];
      widget.dutyFreeItem.productDatas[subItems] =
          dutyFreeDataProductModel.copyWith(
        quantity: dutyFreeState?.getSkuQty(
              widget.dutyFreeItem.productDatas[subItems].skuCode,
              storeType: widget.dutyFreeItem.productDatas[subItems].storeType,
            ) ??
            0,
      );
    }

    //   productsList?.add(
    //     DutyFreeProductDataModel(
    //       materialGroup:
    //           widget.dutyFreeItem.productDatas[subItems].materialGroup,
    //       brand: widget.dutyFreeItem.productDatas[subItems].brand,
    //       category: widget.dutyFreeItem.productDatas[subItems].category,
    //       subCategory: widget.dutyFreeItem.productDatas[subItems].subCategory,
    //       skuName: widget.dutyFreeItem.productDatas[subItems].skuName,
    //       skuCode: widget.dutyFreeItem.productDatas[subItems].skuCode,
    //       price: widget.dutyFreeItem.productDatas[subItems].price,
    //       productImages:
    //           widget.dutyFreeItem.productDatas[subItems].productImages,
    //       quantity: context.read<DutyFreeState>().addedItemMap.containsKey(
    //                 widget.dutyFreeItem.productDatas[subItems].skuCode,
    //               )
    //           ? context.read<DutyFreeState>().addedItemMap[
    //                   widget.dutyFreeItem.productDatas[subItems].skuCode] ??
    //               0
    //           : 0,
    //     ),
    //   );
    // }
    final noUseWidget = super.build(context);

    adLog(noUseWidget.toString());
    final listHeight = containerHeight + (widget.subItemMargin?.top.sp ?? 0);
    return Container(
      height: listHeight,
      margin: EdgeInsets.only(
        top: widget.subItemMargin?.top ?? 0,
      ),
      child: (widget.dutyFreeItem.productDatas.isNotEmpty)
          ? ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.fromLTRB(context.k_16, context.k_8, 0, 0),
              itemBuilder: (context, index) {
                final int quantity = (dutyFreeState?.checkSkuAvailable(
                          widget.dutyFreeItem.productDatas[index].skuCode,
                        ) ??
                        false)
                    ? dutyFreeState?.getSkuQty(
                          widget.dutyFreeItem.productDatas[index].skuCode,
                        ) ??
                        0
                    : 0;
                final dutyFreeDataProductModel =
                    widget.dutyFreeItem.productDatas[index];
                widget.dutyFreeItem.productDatas[index] =
                    dutyFreeDataProductModel.copyWith(
                  quantity: quantity,
                );

                if (widget.dutyFreeItem.productDatas[index].timeStamp.isEmpty) {
                  widget.dutyFreeItem.productDatas[index] =
                      widget.dutyFreeItem.productDatas[index].copyWith(
                    timeStamp: DateTime.now().millisecondsSinceEpoch.toString(),
                  );
                }
                return TouchableOpacity(
                  onTap: () => navigateToProductDetailPage(
                    index,
                    context,
                    widget.dutyFreeItem.productDatas,
                  ),
                  child: DutyFreeProductCard(
                    maxQuantity: min(
                      Utils.dutyFreeProductMaxQty,
                      widget.dutyFreeItem.productDatas[index].availableQuantity
                          .toInt(),
                    ),
                    availability:
                        widget.dutyFreeItem.productDatas[index].availability,
                    timeStamp:
                        widget.dutyFreeItem.productDatas[index].timeStamp,
                    index: index,
                    skuCode: widget.dutyFreeItem.productDatas[index].skuCode,
                    productCartQty: quantity,
                    title: widget.dutyFreeItem.productDatas[index].skuName,
                    height: listHeight,
                    isBonusBorderRequired: true,

                    imageScaledHeight: imageScaledHeight,
                    image:
                        '${Environment.instance.configuration.cmsImageBaseUrl}${widget.dutyFreeItem.productDatas[index].productImages.first}',
                    placeHolder:
                        'lib/assets/images/duty_free/listing/absolut.png',
                    actualPrice: widget.dutyFreeItem.productDatas[index].price
                        .toString(),
                    // discountedPrice: widget.dutyFreeItem.productDatas[index]
                    //     .pramotions.first?.discountPrice
                    //     .toString(),
                    addText: 'Add',
                    backgroundColor: Colors.transparent,
                    borderRadius: context.k_8,
                    onDecrementTapHandler: (int value) => updateData(
                      context,
                      index,
                      false,
                    ),
                    onIncrementTapHandler: (int value) => updateData(
                      context,
                      index,
                      true,
                    ),
                    // isItemAvailable: widget.dutyFreeItem.productDatas[index]
                    //         .availability ??
                    //     false,
                    //  isItemAvailable: true,
                    onTap: () => updateData(
                      context,
                      index,
                      true,
                    ),
                    bonusString:
                        widget.dutyFreeItem.productDatas[index].earn2XString,
                  ).paddingBySide(
                    right: context.k_22,
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => ADSizedBox(
                width: context.scaled(widget.subItemMargin?.left ?? 0),
              ),
              itemCount: widget.dutyFreeItem.productDatas.length,
            )
          : const Center(
              child: Text(
                'There are no items available for this category.',
              ),
            ),
    );
  }

  void updateData(
    BuildContext context,
    index,
    increment,
  ) {
    adLog('qua<<<<<>>>>>>>>>');
    adLog(index.toString());
    //adLog(widget.dutyFreeItem.productDatas[index].quantity.toString() ?? '');
    //adLog(widget.selectedIndex.toString());

    //final int selectedIndexvalue = index + selectedIndex;
    context.read<DutyFreeState>().updateCart(
          context: context,
          increment: increment,
          dutyFreeProductDataModel: widget.dutyFreeItem.productDatas[index],
          fromCartPage: false,
        );
  }

  void navigateToProductDetailPage(
    int index,
    BuildContext context,
    List<DutyFreeProductDataModel> productDatas,
  ) {
    navigateToScreenUsingNamedRouteWithArguments(
      context,
      productDetailDutyFreeScreen,
      rootNavigator: false,
      argumentObject: DealProductModel(
        catalogType: productDatas[index].category,
        item: productDatas[index],
        index: index,
        timeStamp: productDatas[index].timeStamp,
        airportCode: productDatas[index].airportCode,
      ),
    );
  }

  // void navigateToProductDetailPage(
  //   int index,
  //   BuildContext context,
  //   List<DutyFreeProductDataModel>? productList,
  // ) {
  //   setData();
  //   // if (context.read<DutyFreeState>().cartItemClick == Status.loading) {
  //   //   return;
  //   // }
  //   context.read<DutyFreeState>().cartItemClick = Status.loading;
  //   context.read<DutyFreeState>().notifyListeners();
  //   CatalogListResponseModel? pdpPageResponse;
  //   final DutyFreeProductListRequest dutyFreeProductListRequest =
  //       DutyFreeProductListRequest(
  //     language: 'en',
  //     materialGroup: productList?[index].materialGroup,
  //     pageSize: 1,
  //     channel: 'app',
  //     skuCode: [productList?[index].skuCode ?? ''],
  //   );
  //   context
  //       .read<DutyFreeState>()
  //       .repository
  //       .getDutyFreeProducts(
  //         catalogRequest: dutyFreeProductListRequest,
  //       )
  //       .then((value) {
  //     pdpPageResponse = value.data != null
  //         ? CatalogListResponseModel.fromJson(value.data)
  //         : null;
  //
  //     context.read<DutyFreeState>().cartItemClick = Status.complete;
  //     context.read<DutyFreeState>().notifyListeners();
  //     navigateToScreenUsingNamedRouteWithArguments(
  //       context,
  //       productDetailDutyFreeScreen,
  //       rootNavigator: false,
  //       argumentObject: DealProductModel(
  //         item: pdpPageResponse?.result.first,
  //         index: 0,
  //         from: 'cart',
  //       ),
  //     );
  //   });
  // }

  @override
  void dispose() {
    super.dispose();
    // updateList.dispose();
    // try {
    //   final remove =
    //       dutyFreeState?.dashboardItemNotifierList.remove(updateList) ?? false;
    //
    //   ///To avoid dart metrics error
    //   adLog(remove.toString());
    // } catch (e) {
    //   adLog(e.toString());
    // }
  }

  @override
  void initState() {
    super.initState();
    dutyFreeState = context.read<DutyFreeState>();
  }

  @override
  bool get wantKeepAlive => true;
}
