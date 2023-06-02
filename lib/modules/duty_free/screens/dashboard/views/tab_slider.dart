/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:math';

import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/dashboard_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/deal_product_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/catalog_list_response_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/duty_free_product_data_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/gradient_configuration.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/tab_configuration.dart';
import 'package:adani_airport_mobile/modules/duty_free/repository/duty_free_repository.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/views/duty_free_product_card.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/views/duty_free_product_card_shimmer.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/dashboard/tabs_state.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_alerts.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///This class used to create widget of tab slider for duty free
class TabSlider extends StatelessWidget {
  final DutyFreeDashboardItem dutyFreeDashboardItem;

  const TabSlider({Key? key, required this.dutyFreeDashboardItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final containerHeight = 345.sp;
    final listHeight =
        containerHeight + (dutyFreeDashboardItem.subItemMargin?.top.sp ?? 0);
    final TabConfiguration? tabConfiguration =
        dutyFreeDashboardItem.tabConfiguration;
    final GradientConfiguration? gradientConfiguration =
        dutyFreeDashboardItem.gradientConfiguration;
    return Container(
      padding: EdgeInsets.only(
        bottom: dutyFreeDashboardItem.itemMargin?.bottom.sp ?? 0,
      ),
      decoration: Utils.getGradientBoxDecoration(
        gradientConfiguration,
        dutyFreeDashboardItem.backgroundColor,
        ADColors.white,
      ),
      child: DefaultTabController(
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
                top: context
                    .scaled(dutyFreeDashboardItem.subItemMargin?.top ?? 0),
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
              unselectedLabelStyle: ADTextStyle400.size16,
              labelStyle: ADTextStyle500.size16,
              labelColor: Color(
                int.tryParse(tabConfiguration?.tabTextSelectedColor ?? '') ??
                    context.adColors.neutralInfoMsg.value,
              ),
              unselectedLabelColor: Color(
                int.tryParse(tabConfiguration?.tabTextColor ?? '') ??
                    context.adColors.greyTextColor.value,
              ),
              indicatorColor: Color(
                int.tryParse(tabConfiguration?.tabTextSelectedColor ?? '') ??
                    context.adColors.neutralInfoMsg.value,
              ),
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
                          (e) => TabView(
                            subItemMargin: dutyFreeDashboardItem.subItemMargin,
                            dutyFreeItem: e,
                            subItemRadius: dutyFreeDashboardItem.subItemRadius,
                            noDataFoundTextColor: tabConfiguration != null
                                ? context.adColors.whiteTextColor
                                : context.adColors.blackTextColor,
                          ),
                        )
                        .toList() ??
                    [],
              ),
            ),
          ],
        ).paddingBySide(
          top: context.scaled(dutyFreeDashboardItem.itemMargin?.top ?? 0),
        ),
      ),
    );
  }
}

class TabView extends StatefulWidget {
  final ItemMargin? subItemMargin;
  final DutyFreeItem dutyFreeItem;
  final double? subItemRadius;
  final Color? noDataFoundTextColor;

  const TabView({
    Key? key,
    required this.subItemMargin,
    required this.dutyFreeItem,
    required this.subItemRadius,
    this.noDataFoundTextColor,
  }) : super(key: key);

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> with AutomaticKeepAliveClientMixin {
  final TabsState _tabsState = TabsState();

  final containerHeight = 340.sp;
  final listLength = 10;
  final scaledImageHeight = 148.sp;

  DutyFreeState? dutyFreeState;

  @override
  void initState() {
    super.initState();
    dutyFreeState = context.read<DutyFreeState>();
  }

  @override
  Widget build(BuildContext context) {
    final noUseWidget = super.build(context);
    //added to avoid the warning
    adLog(noUseWidget.toString());
    final listHeight = containerHeight + (widget.subItemMargin?.top.sp ?? 0);
    return FutureBuilder(
      future: _tabsState.loadProducts(
        widget.dutyFreeItem,
        widget.dutyFreeItem.storeType.isEmpty
            ? dutyFreeState?.terminalModel.value.code ?? ''
            : widget.dutyFreeItem.storeType.toLowerCase(),
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
                  padding: EdgeInsets.only(
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
                              model.skuCode,
                              storeType: widget.dutyFreeItem.storeType,
                            );
                            model = model.copyWith(quantity: quantity ?? 0);

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
                                availability: model.availability,
                                timeStamp: model.timeStamp,
                                index: index,
                                promotions: model.promotions,
                                maxQuantity: min(
                                  model.availableQuantity.toInt(),
                                  Utils.dutyFreeProductMaxQty,
                                ),
                                skuCode: model.skuCode,
                                productCartQty: quantity ?? 0,
                                title: catalogListResponseModel
                                    .result[index].skuName,
                                height: containerHeight,
                                imageScaledHeight: scaledImageHeight,
                                image: model.productImages.isNotEmpty
                                    ? '${Environment.instance.configuration.cmsImageBaseUrl}${model.productImages.first}'
                                    : '',
                                placeHolder:
                                    'lib/assets/images/duty_free/listing/absolut.png',
                                actualPrice: model.price.toString(),
                                discountedPrice: model.discountPrice.toString(),
                                addText: 'add'.localize(context),
                                backgroundColor:
                                    context.adColors.whiteTextColor,
                                borderRadius: widget.subItemRadius,
                                onDecrementTapHandler: (int value) =>
                                    updateData(
                                  context,
                                  model,
                                  false,
                                  widget.dutyFreeItem.storeType,
                                ),
                                onIncrementTapHandler: (int value) =>
                                    updateData(
                                  context,
                                  model,
                                  true,
                                  widget.dutyFreeItem.storeType,
                                ),
                                // isItemAvailable: catalogListResponseModel
                                //         ?.result[index].availability ??
                                //     false,
                                onTap: () => updateData(
                                  context,
                                  model,
                                  true,
                                  widget.dutyFreeItem.storeType,
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
                            width: widget.subItemMargin?.left.sp ?? 0,
                          ),
                          itemCount: catalogListResponseModel.result.length,
                        )
                      : Center(
                          child: Text(
                            'not_able_to_load_products_try_after_some_time'
                                .localize(context),
                            style: ADTextStyle400.size14.setTextColor(
                              widget.noDataFoundTextColor ??
                                  context.adColors.blackTextColor,
                            ),
                          ),
                        ),
                )
              : Center(
                  child: Text(
                    'not_able_to_load_products_try_after_some_time'
                        .localize(context),
                    style: ADTextStyle400.size14.setTextColor(
                      widget.noDataFoundTextColor ??
                          context.adColors.blackTextColor,
                    ),
                  ),
                );
        } else {
          return Container(
            height: listHeight,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(
                top: widget.subItemMargin?.top.sp ?? 0,
              ),
              itemBuilder: (context, index) => DutyFreeProductCardShimmer(
                height: containerHeight,
                imageScaledHeight: scaledImageHeight,
                borderRadius: widget.subItemRadius,
                backgroundColor: context.adColors.whiteTextColor,
              ).paddingBySide(
                left: index == 0 ? widget.subItemMargin?.left.sp ?? 0 : 0,
                right: index == listLength - 1
                    ? widget.subItemMargin?.right.sp ?? 0
                    : 0,
              ),
              separatorBuilder: (context, index) => ADSizedBox(
                width: widget.subItemMargin?.left.sp ?? 0,
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

  void updateData(
    BuildContext context,
    DutyFreeProductDataModel dutyFreeProductDataModel,
    increment,
    String storeType,
  ) {
    final DutyFreeState dutyFreeState = context.read<DutyFreeState>();
    if (dutyFreeState.dutyFreeCartResponse != null &&
        storeType.isNotEmpty &&
        (dutyFreeState.dutyFreeCartResponse?.itemDetails.isNotEmpty ?? false) &&
        (dutyFreeState.dutyFreeCartResponse?.airportCode !=
                selectedAirportsData?.airportCode ||
            dutyFreeState.dutyFreeCartResponse?.itemDetails.first.storeType
                    .toLowerCase() !=
                storeType.toLowerCase())) {
      Utils.clearDutyFreeCartDialog(context, (dialogContext) {
        Navigator.of(dialogContext).pop();
        final DutyFreeRepository dutyFreeRepository = DutyFreeRepository();
        dutyFreeRepository.removeDutyFreeCart().then((value) {
          if (value.viewStatus == Status.complete) {
            (dutyFreeState
                        .addedItemMap[dutyFreeState.terminalModel.value.code] ??
                    {})
                .clear();
            dutyFreeState.notifyListeners();
            //TODO Need to change it to singleWhere as this will be not useful for uniqueness of terminal
            dutyFreeState.terminalModel.value =
                dutyFreeState.terminalList.firstWhere(
              (element) =>
                  element.code.toLowerCase() == storeType.trim().toLowerCase(),
            );
            dutyFreeState
              ..clearCart(context.read<AppSessionState>())
              ..updateCart(
                context: context,
                increment: increment,
                fromCartPage: false,
                dutyFreeProductDataModel: dutyFreeProductDataModel,
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
        fromCartPage: false,
        dutyFreeProductDataModel: dutyFreeProductDataModel,
      );
    }
    // onBottomSheetItemSelect(text);
    // Navigator.of(context).pop();
  }

  @override
  bool get wantKeepAlive => true;
}
