/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/request/duty_free_product_list_request.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/filter/duty_free_filter_constants.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/shopping_sort/shopping_sort_screen.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

const int borderColor = 0xffffffff;
const int filterSelectedColor = 0xfff3f3f3;
const double k_2 = 2;
const double k_4 = 4;
const double k_6 = 6;
const double k_10 = 10;
const double k_18 = 18;
const double k_20 = 20;
const int filterShimmerWidgetCount = 3;
final double filterShimmerWidgetWidth = 100.sp;
final double filterShimmerWidgetHeight = 40.sp;

typedef FilterCallBack = void Function(int index, String code);

class FiltersListView extends StatelessWidget {
  ///usage sample code
  ///  FiltersListView(
  ///             content: dataList,
  ///             onTapHandler: (value) {
  ///
  ///             }),
  ///
  ///

  const FiltersListView({
    Key? key,
    required this.content,
    required this.filterHeight,
    required this.onTapHandler,
  }) : super(key: key);

  ///List of content that contains the multiple brand names.
  final List<DutyFreeFilter> content;

  ///used to handle the brand tap
  final FilterCallBack onTapHandler;
  final double filterHeight;
  static const double bannerRatio = 0.4;

  @override
  Widget build(BuildContext context) {
    final DutyFreeState dutyFreeState = context.read<DutyFreeState>();
    return Column(
      children: [
        () {
          switch (dutyFreeState.productFilterState.viewStatus) {
            case Status.loading:
              return Flexible(
                child: ADShimmerWidget.shimmerShape(
                  type: ShimmerType.rectangleBox,
                  rectanglePadding: EdgeInsets.zero,
                  height: context.widthOfScreen * bannerRatio,
                  width: context.widthOfScreen,
                ),
              );
            case Status.complete:
              return ((dutyFreeState.dutyFreeFilterBaseResponse?.result
                              .materialGroupBanner?.imageSrc ??
                          '')
                      .isNotEmpty)
                  ? Flexible(
                      child: ADCachedImage(
                        width: context.widthOfScreen,
                        height: context.widthOfScreen * bannerRatio,
                        imageUrl: dutyFreeState.dutyFreeFilterBaseResponse
                                ?.result.materialGroupBanner?.imageSrc ??
                            '',
                      ),
                    )
                  : const SizedBox.shrink();
            default:
              return const SizedBox.shrink();
          }
        }(),
        Container(
          height: filterHeight,
          child: () {
            switch (dutyFreeState.productFilterState.viewStatus) {
              //dutyFreeState.productFilterState.viewStatus
              case Status.complete:
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _FilterView(
                        name: 'Sort',
                        trailing: Icons.keyboard_arrow_down_rounded,
                        // leading: content[index].leading,
                        isSelected: ValueNotifier(false),
                        onTap: () => sortFilter(context),
                      ).paddingBySide(
                        left: context.k_10,
                      ),
                      if (dutyFreeState
                              .dutyFreeFilterBaseResponse?.result.exclusive !=
                          null)
                        Selector<DutyFreeState, bool>(
                          selector: (context, model) => model.exclusive,
                          builder: (context, value, child) => _FilterView(
                            name: 'Exclusive',
                            isSelected: ValueNotifier<bool>(value),
                            onTap: () => {
                              dutyFreeState.toggleExclusive(),
                              dutyFreeState
                                ..currentPage = 1
                                ..dutyFreeProductDataList.clear()
                                ..productListState = ADResponseState.loading()
                                ..dutyFreeAppliedSortIndex =
                                    dutyFreeState.dutyFreeSelectedIndex
                                ..setExclusiveFilterCount(),
                              _productListApiCall(
                                dutyFreeState.dutyFreeProductListRequest,
                                context,
                              ),
                              HapticFeedback.lightImpact(),
                            },
                          ),
                        ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: content.length,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(vertical: context.k_10),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return content[index].showInPrimery &&
                                  content[index].code !=
                                      DutyFreeFilterConstants.exclusive
                              ? _FilterView(
                                  name: (index == 0 &&
                                          dutyFreeState.appliedSort != null)
                                      ? (dutyFreeState.appliedSort ?? '')
                                      : content[index].name,
                                  trailing: content[index].trailing,
                                  leading: content[index].leading,
                                  isSelected: content[index].isSelected,
                                  onTap: () => onTapHandler(
                                    index,
                                    content[index].code,
                                  ),
                                )
                              : const SizedBox.shrink();
                        },
                      ),
                    ],
                  ),
                );
              case Status.loading:
                return Row(
                  children: const [
                    FilterShimmerWidget(),
                    FilterShimmerWidget(),
                    FilterShimmerWidget(),
                  ],
                );
              default:
                return ADSizedBox(
                  height: filterHeight,
                );
            }
          }(),
        ),
      ],
    );
  }

  /// sortFilter Is used for sort Filter View
  void sortFilter(BuildContext context) {
    showModalBottomSheet<void>(
      backgroundColor: context.adColors.whiteTextColor,
      elevation: context.k_8,
      useRootNavigator: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(context.k_22),
        ),
      ),
      context: context,
      builder: (context) {
        final DutyFreeState dutyFreeState = context.read<DutyFreeState>();
        dutyFreeState.dutyFreeSelectedIndex =
            dutyFreeState.dutyFreeAppliedSortIndex;
        return SafeArea(
          child: ShoppingSortScreen(
            dutyFreeState: context.read<DutyFreeState>(),
            adTapCallback: (context, value, name) => sort(context, value, name),
          ),
        );
      },
    );
    HapticFeedback.lightImpact();
  }

  void sort(BuildContext context, String value, String name) {
    final DutyFreeState dutyFreeState = context.read<DutyFreeState>();
    dutyFreeState
      ..currentPage = 1
      ..dutyFreeAppliedSortIndex = dutyFreeState.dutyFreeSelectedIndex;
    adLog('Cascade consecutive method invocations on the same reference.');
    dutyFreeState.appliedSort = name;
    adLog('Cascade consecutive method invocations on the same reference.');
    dutyFreeState.dutyFreeProductDataList.clear();
    dutyFreeState.updateProductListStatus(Status.loading);
    adLog('Cascade consecutive method invocations on the same reference.');
    dutyFreeState.dutyFreeProductListRequest =
        dutyFreeState.dutyFreeProductListRequest?.copyWith(
      sort: value,
    );

    _productListApiCall(dutyFreeState.dutyFreeProductListRequest, context);
    navigatorPopScreen(context);
    dutyFreeState.dutyFreeEventState.sortSelectEvent(sortParam: name);
  }

  void _productListApiCall(
    DutyFreeProductListRequest? dutyFreeProductListRequest,
    BuildContext context,
  ) {
    final DutyFreeState dutyFreeState = context.read<DutyFreeState>();
    adLog('dutyfreestate $dutyFreeState');
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
}

class _FilterView extends StatefulWidget {
  // filter.svg
  final String name;
  final ValueNotifier<bool> isSelected;
  final String? leading;
  final IconData? trailing;
  final ADTapCallback? onTap;

  const _FilterView({
    Key? key,
    required this.name,
    required this.isSelected,
    this.leading,
    this.trailing,
    this.onTap,
  }) : super(key: key);

  @override
  State<_FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<_FilterView> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.isSelected,
      builder: (BuildContext context, bool value, Widget? child) {
        adLog('Category Select ${widget.isSelected}');
        return GestureDetector(
          onTap: widget.onTap,
          child: Container(
            margin: EdgeInsets.fromLTRB(
              context.k_4,
              context.k_6,
              context.k_4,
              context.k_6,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: context.k_10,
            ),
            constraints: BoxConstraints(
              minHeight: context.k_40,
              maxHeight: context.k_40,
            ),
            decoration: BoxDecoration(
              // color: value ? context.adColors.black : const Color(borderColor),
              color: Color(value ? filterSelectedColor : borderColor),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  context.k_20,
                ),
              ),
              border: Border.all(
                width: value ? k_2 : 1,
                color: value
                    ? context.adColors.black
                    : context.adColors.greyTextColor,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.leading != null)
                  SvgPicture.asset(
                    widget.leading ?? '',
                    height: context.k_12,
                    width: context.k_12,
                    color: value
                        ? context.adColors.whiteTextColor
                        : context.adColors.black,
                  ).paddingBySide(left: context.k_10),
                SizedBox(
                  width: context.k_10,
                ),
                Text(
                  widget.name,
                  style: value
                      ? ADTextStyle500.size14.setTextColor(
                          context.adColors.blackTextColor,
                        )
                      : ADTextStyle400.size14.setTextColor(
                          context.adColors.blackTextColor,
                        ),
                ),
                if (widget.trailing != null)
                  Icon(
                    widget.trailing,
                    color: value
                        ? context.adColors.whiteTextColor
                        : context.adColors.black,
                    size: context.k_18,
                  ),
                SizedBox(
                  width: context.k_6,
                ),
                if (widget.leading != null)
                  Selector<DutyFreeState, int>(
                    selector: (context, model) => model.getTotalFilterCount(),
                    builder: (context, count, child) => count > 0
                        ? Container(
                            width: context.k_18,
                            height: context.k_18,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: context.adColors.black,
                            ),
                            child: Center(
                              child: Text(
                                '$count',
                                style: ADTextStyle600.size12.setTextColor(
                                  context.adColors.whiteTextColor,
                                ),
                              ),
                            ),
                          )
                        : const ADSizedBox.shrink(),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();

    ///TODO: need to un dispose, but as of now i ignore this because its crashing.
    // widget.isSelected.dispose();
  }
}

class FilterShimmerWidget extends StatelessWidget {
  const FilterShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ADShimmerWidget.shimmerShape(
      type: ShimmerType.rectangleBox,
      width: filterShimmerWidgetWidth,
      height: filterShimmerWidgetHeight,
    ).paddingBySide(
      top: context.k_6,
      bottom: context.k_6,
    );
  }
}

///this class is used to show the Brands List.
///*[isSelected] is Used to show selected and un selected item
///*[name] is used to show the name of filter
///*[leading] used to show the leading icon
///*[trailing] used to show the trailing icon
///

class DutyFreeFilter {
  ValueNotifier<bool> isSelected;
  String name;
  String code;
  bool showInPrimery;
  String? leading;
  IconData? trailing;

  DutyFreeFilter({
    required this.isSelected,
    required this.name,
    required this.code,
    this.leading,
    this.trailing,
    required this.showInPrimery,
  });
}
