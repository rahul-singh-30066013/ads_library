/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:math';

import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/dashboard_model.dart';
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
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///This class used to create widget of tab slider background for duty free
///TODO Price and discounted price should be string or double not int
class TabSliderBackground extends StatelessWidget {
  final DutyFreeDashboardItem dutyFreeDashboardItem;

  const TabSliderBackground({Key? key, required this.dutyFreeDashboardItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final containerHeight = 440.sp;
    final listHeight =
        containerHeight + (dutyFreeDashboardItem.subItemMargin?.top.sp ?? 0);
    return DefaultTabController(
      length: dutyFreeDashboardItem.widgetItems?.length ?? 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dutyFreeDashboardItem.title.validateWithDefaultValue(),
            style: ADTextStyle700.size22
                .copyWith(color: context.adColors.blackTextColor),
          ).paddingBySide(
            left: context.scaled(dutyFreeDashboardItem.itemMargin?.left ?? 0),
          ),
          TabBar(
            padding: EdgeInsets.only(
              top:
                  context.scaled(dutyFreeDashboardItem.subItemMargin?.top ?? 0),
            ),
            isScrollable: true,
            tabs: dutyFreeDashboardItem.widgetItems
                    ?.map(
                      (e) => Tab(
                        text: e.title,
                      ),
                    )
                    .toList() ??
                [],
            unselectedLabelStyle: ADTextStyle400.size16.copyWith(
              color: context.adColors.greyTextColor,
            ),
            labelStyle: ADTextStyle500.size16.copyWith(
              color: context.adColors.neutralInfoMsg,
            ),
            indicatorColor: context.adColors.neutralInfoMsg,
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xffE2E2E2),
          ).paddingBySide(bottom: context.k_12),
          Container(
            height: listHeight,
            child: TabBarView(
              children: dutyFreeDashboardItem.widgetItems
                      ?.map(
                        (e) => _TabView(
                          subItemMargin: dutyFreeDashboardItem.subItemMargin,
                          dutyFreeItem: e,
                          subItemRadius: dutyFreeDashboardItem.subItemRadius,
                        ),
                      )
                      .toList() ??
                  [],
            ),
          ),
        ],
      ).paddingBySide(
        top: dutyFreeDashboardItem.itemMargin?.top.sp ?? 0,
      ),
    );
  }
}

class _TabView extends StatefulWidget {
  final ItemMargin? subItemMargin;
  final DutyFreeItem dutyFreeItem;
  final double? subItemRadius;

  const _TabView({
    Key? key,
    required this.subItemMargin,
    required this.dutyFreeItem,
    required this.subItemRadius,
  }) : super(key: key);

  @override
  State<_TabView> createState() => _TabViewState();
}

class _TabViewState extends State<_TabView> with AutomaticKeepAliveClientMixin {
  final TabsState _tabsState = TabsState();
  final containerHeight = 530.sp;
  final imageScaledHeight = 248.sp;
  final listLength = 10;

  // ValueNotifier<bool> updateList = ValueNotifier(false);
  DutyFreeState? dutyFreeState;

  @override
  Widget build(BuildContext context) {
    final noUseWidget = super.build(context);
    //added to avoid the warning
    adLog(noUseWidget.toString());
    final listHeight = containerHeight + (widget.subItemMargin?.top.sp ?? 0);
    return FutureBuilder(
      future: _tabsState.loadProducts(
        widget.dutyFreeItem,
        context.read<DutyFreeState>().terminalModel.value.code,
        context.read<DutyFreeState>(),
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final ADResponseState responseState =
              snapshot.data as ADResponseState;
          final CatalogListResponseModel catalogListResponseModel =
              responseState.data;
          return responseState.viewStatus == Status.complete
              ? Container(
                  height: listHeight,
                  margin: EdgeInsets.only(
                    top: context.scaled(widget.subItemMargin?.top ?? 0),
                  ),
                  child: (catalogListResponseModel.result.isNotEmpty)
                      ? ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            DutyFreeProductDataModel model =
                                catalogListResponseModel.result[index];
                            final DutyFreeState dutyFreeState =
                                context.read<DutyFreeState>();
                            final int? quantity = dutyFreeState.getSkuQty(
                              catalogListResponseModel.result[index].skuCode,
                              storeType: catalogListResponseModel
                                  .result[index].storeType,
                            );

                            model = model.copyWith(
                              quantity: quantity ?? 0,
                            );

                            if (model.timeStamp.isEmpty) {
                              model = model.copyWith(
                                timeStamp: DateTime.now()
                                    .millisecondsSinceEpoch
                                    .toString(),
                              );
                            }
                            catalogListResponseModel.result[index] = model;

                            return TouchableOpacity(
                              onTap: () =>
                                  navigateToScreenUsingNamedRouteWithArguments(
                                context,
                                productDetailDutyFreeScreen,
                                rootNavigator: false,
                                argumentObject: DealProductModel(
                                  catalogType: model.category,
                                  item: model,
                                  index: index,
                                  timeStamp: model.timeStamp,
                                ),
                              ),
                              child: DutyFreeProductCard(
                                maxQuantity: min(
                                  model.availableQuantity.toInt(),
                                  Utils.dutyFreeProductMaxQty,
                                ),
                                availability: model.availability,
                                timeStamp: model.timeStamp,
                                index: index,
                                promotions: model.promotions,
                                skuCode: model.skuCode,
                                productCartQty: quantity ?? 0,
                                title: model.skuName,
                                height: listHeight,
                                isBorderRequired: false,
                                imageScaledHeight: imageScaledHeight,
                                image: model.productImages.isNotEmpty
                                    ? '${Environment.instance.configuration.cmsImageBaseUrl}${model.productImages.first}'
                                    : '',
                                placeHolder:
                                    'lib/assets/images/duty_free/listing/absolut.png',
                                actualPrice: model.price.toString(),
                                discountedPrice: model.discountPrice.toString(),
                                addText: 'add'.localize(context),
                                backgroundColor: Colors.transparent,
                                borderRadius: widget.subItemRadius,
                                onDecrementTapHandler: (int value) =>
                                    context.read<DutyFreeState>().updateCart(
                                          context: context,
                                          increment: false,
                                          fromCartPage: false,
                                          dutyFreeProductDataModel: model,
                                        ),
                                onIncrementTapHandler: (int value) =>
                                    context.read<DutyFreeState>().updateCart(
                                          context: context,
                                          fromCartPage: false,
                                          dutyFreeProductDataModel: model,
                                        ),
                                // isItemAvailable: catalogListResponseModel
                                //         ?.result[index].availability ??
                                //     false,
                                onTap: () =>
                                    context.read<DutyFreeState>().updateCart(
                                          context: context,
                                          fromCartPage: false,
                                          dutyFreeProductDataModel: model,
                                        ),
                                bonusString: returnLoyalityText(
                                  model,
                                ),
                              ).paddingBySide(
                                left: context.scaled(
                                  index == 0
                                      ? widget.subItemMargin?.left ?? 0
                                      : 0,
                                ),
                                right: context.scaled(
                                  index ==
                                          (catalogListResponseModel
                                                  .result.length) -
                                              1
                                      ? widget.subItemMargin?.left ?? 0
                                      : 0,
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              ADSizedBox(
                            width:
                                context.scaled(widget.subItemMargin?.left ?? 0),
                          ),
                          itemCount: catalogListResponseModel.result.length,
                        )
                      : Center(
                          child: Text(
                            'there_are_no_items_available_for_this_category'
                                .localize(context),
                          ),
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
              itemBuilder: (context, index) => DutyFreeProductCardShimmer(
                isBorderRequired: false,
                height: containerHeight,
                imageScaledHeight: imageScaledHeight,
                borderRadius: widget.subItemRadius,
                itemMargin: widget.subItemMargin,
              ).paddingBySide(
                left: context.scaled(
                  index == 0 ? widget.subItemMargin?.left ?? 0 : 0,
                ),
                right: context.scaled(
                  index == listLength - 1 ? widget.subItemMargin?.left ?? 0 : 0,
                ),
              ),
              separatorBuilder: (context, index) => ADSizedBox(
                width: context.scaled(widget.subItemMargin?.left ?? 0),
              ),
              itemCount: listLength,
            ),
          );
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

  @override
  void initState() {
    super.initState();
    dutyFreeState = context.read<DutyFreeState>();
  }

  @override
  bool get wantKeepAlive => true;
}
