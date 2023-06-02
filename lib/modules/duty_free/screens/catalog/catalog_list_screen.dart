/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/screen_events.dart';
import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/custom_tab_scaffold.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/request/duty_free_product_list_request.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/filter/duty_free_filter_base_response.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/terminal_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/catalog/views/catalog_sliver_appbar.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/catalog/views/filters_list_view.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/catalog/views/sliver_app_bar_delegate.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/catalog/views/sliver_staggered_gridview.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/filter/duty_free_filter_screen.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/views/no_data_found_error_screen.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/filter/filter_menu_list_model.dart';
import 'package:superapp_mobile_style_guide/filter/sort_view_model.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

/// This class is used to show category list of products items
/// where user can set filter and select DealProductBrand
///
const int k_1 = 1;
const int k_2 = 2;

const int shimmerItemCount = 6;
const int shimmerGridRowCount = 2;
const double containerHeight = 220;
const int noOfItemsInRow = 2;
const double shimmerWidgetAspectRatio = 0.7;
const double loaderPadding = 80;

// ignore: must_be_immutable
class CatalogListScreen extends StatefulWidget {
  /// this class will used to show the catalog for Shop and Duty Free
  CatalogListScreen({
    Key? key,
    required this.catalogType,
    this.slug,
    this.dutyFreeState,
  }) : super(key: key);

  /// to check whether coming from shop or duty free if true it will show the story view.
  final String catalogType;

  final String? slug;

  DutyFreeState? dutyFreeState;

  /// usage sample code
  /// CatalogListScreen(isFromAirportMall: true)

  @override
  State<CatalogListScreen> createState() => _CatalogListScreenState();
}

class _CatalogListScreenState extends State<CatalogListScreen> {
  /// Used for filter on the basis of sort
  SortViewModel sortGenderModelList = SortViewModel();

  /// Used for filter based on Size/Brand/Type/Discount/Price
  FilterMenuListModel filterModelList = FilterMenuListModel();

  DutyFreeState? _dutyFreeState;

  /// Scroll controller for scroll end deduction

  /// shoppingFilter Is used for shopping Filter View
  void shoppingFilter({required BuildContext context}) {
    adShowBottomSheet(
      context: context,
      childWidget: const DutyFreeFilterScreen(),
      headerTitle: 'all_filter'.localize(context),
    );
    // showModalBottomSheet<void>(
    //   backgroundColor: context.adColors.whiteTextColor,
    //   elevation: context.k_8,
    //   isScrollControlled: true,
    //   useRootNavigator: true,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.vertical(
    //       top: Radius.circular(context.k_22),
    //     ),
    //   ),
    //   context: context,
    //   builder: (context) {
    //     return ADDraggableScrollableBottomSheet(
    //       initialChildSize: BottomSheetUtils.getBottomSheetHeightRatio(context),
    //       childWidget: const DutyFreeFilterScreen(),
    //     );
    //   },
    // );
  }

  @override
  void initState() {
    super.initState();
    ScreenEvents.catalog_list_screen.log();

    /// adding listener to scroll controller

    _dutyFreeState = context.read<DutyFreeState>();
    _dutyFreeState?.resetData();
    _dutyFreeState?.productListState = ADResponseState.loading();
    _dutyFreeState?.initCatalogListScreen(
      slug: widget.slug,
    );

    //
    // if (dutyFreeState.addedCategoryMap.isEmpty) {
    //   _productListApiCall(
    //     dutyFreeState.dutyFreeProductListRequest,
    //   );
    // } else {
    //   dutyFreeState.getDutyFreeFilter(
    //     dutyFreeProductFilterRequest: DutyFreeProductFilterRequest(
    //       materialGroup: context.read<DutyFreeState>().materialGroupCode,
    //       language: 'en',
    //     ),
    //   );
    // }
  }

  /// function handling pagination
  bool pagination(ScrollNotification? notification) {
    if ((notification?.metrics.pixels ==
            notification?.metrics.maxScrollExtent) &&
        (context.read<DutyFreeState>().dutyFreeProductDataList.length <
            (context.read<DutyFreeState>().catalogListResponseModel?.count ??
                0)) &&
        context.read<DutyFreeState>().productListState.viewStatus !=
            Status.loading) {
      _productListApiCall(
        context.read<DutyFreeState>().dutyFreeProductListRequest,
      );
      final int currentPageCount =
          context.read<DutyFreeState>().dutyFreeProductDataList.length ?? 0;

      context.read<DutyFreeState>().currentPage =
          (currentPageCount ~/ context.read<DutyFreeState>().pageSize) + 1;
    }
    return false;
  }

  @override
  void dispose() {
    super.dispose();
    _dutyFreeState?.selectedIndex = 0;
    // _dutyFreeState?.selectedAirportsData = selectedAirportsData;
    // _dutyFreeState?.getDutyFreeTerminalList();
  }

  /// to move in state
  void _productListApiCall(
    DutyFreeProductListRequest? dutyFreeProductListRequest,
  ) {
    final DutyFreeState dutyFreeState = context.read<DutyFreeState>();
    final List<String>? category = dutyFreeState.getCategory();
    final List<String>? subCategory = dutyFreeState.getSubCategory();
    final bool remove1 = category?.remove(price) ?? false;
    final bool remove2 = subCategory?.remove(price) ?? false;
    adLog('$remove1');
    adLog('$remove2');
    dutyFreeProductListRequest = dutyFreeProductListRequest?.copyWith(
      page: context.read<DutyFreeState>().currentPage,
      brand: dutyFreeState.selectedBrand == ''
          ? dutyFreeState.getBrand()
          : [dutyFreeState.selectedBrand],
      subCategory: subCategory,
      category: category,
      restricted: !dutyFreeState.ageAbove25,
      storeType: (dutyFreeState.storeType ?? '').isNotEmpty
          ? dutyFreeState.storeType ?? ''
          : dutyFreeState.terminalModel.value.code,
      offers: dutyFreeState.getOffers(),
      exclusive: dutyFreeState.exclusive,
    );
    dutyFreeState.getDutyFreeProductList(
      dutyFreeProductListRequest ??
          DutyFreeProductListRequest(
            airportCode: selectedAirportsData?.airportCode ?? '',
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _dutyFreeState = context.read<DutyFreeState>();
    const double sliverAppBarExpandedHeight = 250;
    return Scaffold(
      appBar: Utils.getGenericAppBar(context),
      body: SafeArea(
        bottom: false,
        child: NotificationListener<ScrollNotification>(
          onNotification: pagination,
          child: CustomScrollView(
            controller: PrimaryScrollController.of(context),
            shrinkWrap: true,
            slivers: [
              Selector<DutyFreeState, DutyFreeFilterBaseResponse?>(
                selector: (context, model) => model.dutyFreeFilterBaseResponse,
                builder: (context, value, child) {
                  return CatalogSliverAppBar(
                    isFromAirportMall: widget.catalogType == 'Shop',
                    expandedHeight: sliverAppBarExpandedHeight,
                    catalogType: _dutyFreeState?.catalogListTitle ?? '',
                    //widget.catalogType,
                    showSearchIcon: false,
                    // spacebar: FlexibleSpaceBar(
                    //   centerTitle: true,
                    //   title: Text(
                    //     'Title',
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: 16.0,
                    //     ),
                    //   ),
                    //   background: Image.network(
                    //     'https://images.pexels.com/photos/443356/pexels-photo-443356.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                  );
                },
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: context.k_38,
                  decoration: BoxDecoration(
                    color: const Color(0xfff4f4f8),
                    borderRadius: BorderRadius.circular(context.k_8),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        SvgAssets.cartLocationIcon,
                        width: context.k_12,
                        height: context.k_14,
                        color: context.adColors.greyTextColor,
                      ).paddingBySide(
                        left: context.k_14,
                        right: context.k_8,
                      ),
                      ValueListenableBuilder(
                        valueListenable:
                            context.read<DutyFreeState>().terminalModel,
                        builder: (context, TerminalModel value, child) {
                          return Text(
                            '${_dutyFreeState?.airportData?.city} - ${_dutyFreeState?.terminalModel.value.title}',
                            style: TextStyle(
                              color: context.adColors.blackTextColor,
                              fontSize: context.k_14,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ).paddingBySide(
                  top: context.k_10,
                  bottom: context.k_20,
                  left: context.k_16,
                  right: context.k_16,
                ),
              ),
              Selector<DutyFreeState, DutyFreeFilterBaseResponse?>(
                builder: (context, value, child) {
                  final filterHeight = 70.sp;
                  final filterPersistentHeaderHeight =
                      (value == Status.complete)
                          ? ((context
                                          .read<DutyFreeState>()
                                          .dutyFreeFilterBaseResponse
                                          ?.result
                                          .materialGroupBanner
                                          ?.imageSrc ??
                                      '')
                                  .isNotEmpty)
                              ? filterHeight + context.widthOfScreen * 0.4
                              : 0.0
                          : filterHeight + context.widthOfScreen * 0.4;
                  return SliverPersistentHeader(
                    pinned: true,
                    // floating: true,
                    delegate: SliverAppBarDelegate(
                      minHeight: filterHeight,
                      //filterPersistentHeaderHeight.sp,
                      maxHeight: filterPersistentHeaderHeight.sp,
                      child: Container(
                        color: context.adColors.whiteTextColor,
                        // height: filterPersistentHeaderHeight.sp,
                        child: FiltersListView(
                          content: _dutyFreeState?.dataList ?? [],
                          onTapHandler: (index, code) =>
                              filterListTap(index, context, code),
                          filterHeight: filterHeight,
                        ),
                      ),
                    ),
                  );
                },
                selector: (context, model) => model.dutyFreeFilterBaseResponse,
              ),
              Selector<DutyFreeState, Status?>(
                builder: (context, value, child) {
                  switch (value) {
                    case Status.complete:
                      adLog('success 12345');
                      return (_dutyFreeState?.catalogListResponseModel?.result
                                  .isNotEmpty ??
                              false)
                          ? SliverToBoxAdapter(
                              child: SafeArea(
                                bottom: false,
                                child: SingleChildScrollView(
                                  primary: false,

                                  physics: const NeverScrollableScrollPhysics(),
                                  // physics:
                                  //     const ClampingScrollPhysics(),
                                  child: Column(
                                    children: [
                                      Selector<DutyFreeState, int>(
                                        selector: (context, model) => model
                                            .dutyFreeProductDataList.length,
                                        builder: (context, value, child) =>
                                            CustomScrollView(
                                          primary: false,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          slivers: [
                                            SliverPadding(
                                              padding: EdgeInsets.only(
                                                left: context.k_14,
                                                right: context.k_14,
                                                bottom: context.k_14,
                                              ),
                                              sliver: SliverStaggeredGridView(
                                                dutyFreeState: context
                                                    .read<DutyFreeState>(),
                                                catalogType: _dutyFreeState
                                                        ?.catalogListTitle ??
                                                    '',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: loaderPadding +
                                            (BottomBarState.key.currentWidget
                                                    as CustomTabScaffold)
                                                .tabBar
                                                .height,
                                        alignment: Alignment.center,
                                        child: Selector<DutyFreeState, Status?>(
                                          selector: (context, model) => model
                                              .productPaginationState
                                              .viewStatus,
                                          builder: (context, value, child) {
                                            return context
                                                        .read<DutyFreeState>()
                                                        .productPaginationState
                                                        .viewStatus ==
                                                    Status.loading
                                                ? const ADDotProgressView()
                                                : const ADSizedBox.shrink();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : SliverFillRemaining(
                              hasScrollBody: false,
                              child: (_dutyFreeState?.catalogListResponseModel
                                              ?.result.isEmpty ??
                                          false) &&
                                      (_dutyFreeState?.isFilterApplied ?? false)
                                  ? NoDataFoundErrorScreen(
                                      paddingBetweenImageAndErrorTitle:
                                          context.k_20,
                                      paddingBetweenErrorMessageAndRetry:
                                          context.k_30,
                                      errorTitle: 'oops_no_results_found'
                                          .localize(context),
                                      hyperlinkTitle:
                                          'reset_filter'.localize(context),
                                      onRetryTap: () => {
                                        _dutyFreeState?.resetFilter(
                                          context,
                                          shouldFinish: false,
                                        ),
                                      },
                                    ).paddingBySide(
                                      bottom: context.k_40,
                                    )
                                  : Center(
                                      child: Text(
                                        'no_data_available'.localize(context),
                                      ),
                                    ),
                            );

                    case Status.loading:
                      adLog('loading');

                      return SliverFillRemaining(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent:
                                context.widthOfScreen / noOfItemsInRow,
                            childAspectRatio: shimmerWidgetAspectRatio,
                          ),
                          itemBuilder: (BuildContext context, index) {
                            return const ADShimmerWidget.shimmerShape(
                              type: ShimmerType.rectangleBox,
                              height: containerHeight,
                            );
                          },
                        ),
                      );

                    case Status.error:
                      adLog('error');

                      return SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(
                          child: Text(
                            'unable_to_load_msg'.localize(context),
                          ),
                        ),
                      );

                    default:
                      return SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(
                          child: Text(
                            'Process'.localize(context),
                          ),
                        ),
                      );
                  }
                },
                selector: (context, model) => model.productListState.viewStatus,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void filterListTap(int value, BuildContext context, String code) {
    final DutyFreeState dutyFreeState = context.read<DutyFreeState>();
    if (value == dutyFreeState.dataList.length - 1) {
      // final Map<String, List<String>>? categoryMap =
      //     dutyFreeState.appliedFilterMap['category'];
      // if (categoryMap?.containsKey(code) ?? false) {
      //   final removed = categoryMap?.remove(code);
      //   adLog('filterListTap removed $removed');
      // } else {
      //   categoryMap?[code] = dutyFreeState.dutyFreeFilterList
      //           .singleWhere((element) => element.code == code)
      //           .subCategories
      //           ?.map((e) => e.code ?? '')
      //           .toList() ??
      //       [];
      //   dutyFreeState.appliedFilterMap['category'] = categoryMap ?? {};
      // }
      // dutyFreeState.notifyListeners();
      // adLog(dutyFreeState.addedCategoryMap.toString());
      shoppingFilter(
        context: context,
      );
    } else {
      context.read<DutyFreeState>().cancelToken?.cancel();
      context.read<DutyFreeState>().cancelToken = CancelToken();

      // dutyFreeState.dutyFreeProductDataList.clear();
      // dutyFreeState.updateProductListStatus(Status.loading);
      // final List<String> category =
      //     dutyFreeState.dutyFreeProductListRequest?.category ?? [];
      //
      // if (category.contains(dutyFreeState.dataList[value].code)) {
      //   final bool removed =
      //       category.remove(dutyFreeState.dataList[value].code);
      //   adLog('$removed');
      //   dutyFreeState.dataList[value].isSelected.value = false;
      // } else {
      //   category.add(dutyFreeState.dataList[value].code);
      //   dutyFreeState.dataList[value].isSelected.value = true;
      // }
      //
      // dutyFreeState.dutyFreeProductListRequest =
      //     dutyFreeState.dutyFreeProductListRequest?.copyWith(
      //   category: category,
      // );
      // adLog(
      //   'Avoid cascade consecutive method invocations on the same reference.',
      // );
      dutyFreeState.isFilterApplied = true;
      // adLog(
      //   'Avoid cascade consecutive method invocations on the same reference.',
      // );
      //
      // dutyFreeState.dutyFreeSelectedIndex = -1;
      //
      // adLog(
      //   'Avoid cascade consecutive method invocations on the same reference.',
      // );
      // dutyFreeState.filterClickActionCategoryFromCatalogPage(value - k_2);
      adLog(
        'Avoid cascade consecutive method invocations on the same reference.',
      );
      final dataListItem = dutyFreeState.dataList.singleWhere(
        (element) => element.code.toLowerCase() == code.toLowerCase(),
      );

      dataListItem.isSelected.value = !dataListItem.isSelected.value;
      dutyFreeState.filterCopy(code);
      adLog(
        'Avoid cascade consecutive method invocations on the same reference.',
      );
      dutyFreeState
        ..currentPage = 1
        // dutyFreeState.addedCategoryMap.clear();
        // dutyFreeState.appliedFilterMap.forEach(
        //   (key, value) => dutyFreeState.addedCategoryMap[key] = List.of(value),
        // );
        ..notifyListeners();
      // adLog(dutyFreeState.addedCategoryMap.toString());
      // dutyFreeState.dutyFreeProductListRequest =
      //     dutyFreeState.dutyFreeProductListRequest?.copyWith(
      //   category: dutyFreeState.getCategory(),
      //   subCategory: dutyFreeState.getSubCategory(),
      // );
      _productListApiCall(dutyFreeState.dutyFreeProductListRequest);
      dutyFreeState.dutyFreeEventState.filterSelectEvent();
    }
    HapticFeedback.lightImpact();
  }
}
