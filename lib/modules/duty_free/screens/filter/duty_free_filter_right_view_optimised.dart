/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/country_list_bottom_sheet/search_view.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/filter/duty_free_filter_constants.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/view_models/duty_free_filter_view_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/flight_automation_keys.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/views/no_data_found_error_screen.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

/// sliderContainerHeight is used for slider Container height
var sliderContainerHeight = 70.0;

/// leftViewArray used for menu list of left array
/// To Do
var _imageAirLineArray = [
  'indigo.png',
  'spice-jet.png',
  'air-asia.png',
  'vistra.png',
  'go-first.png',
  'air-india.png',
];

/// This class is used to for create Right View Container
///[DutyFreeFilterRightViewOptimised] is use for create Right sort, airline and departure view container
///[DutyFreeFilterRightViewOptimised] is use for create price view container

class DutyFreeFilterRightViewOptimised extends StatelessWidget {
  const DutyFreeFilterRightViewOptimised({
    Key? key,
    required this.rightTitleText,
    required this.isSelected,
    required this.descriptionText,
    required this.descriptionVisibility,
    required this.imageVisibility,
    required this.index,
    required this.checkBoxTap,
  }) : super(key: key);
  final String rightTitleText;
  final String descriptionText;
  final bool descriptionVisibility;
  final bool imageVisibility;
  final int index;
  final bool isSelected;
  final ADTapCallback checkBoxTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: checkBoxTap,
        child: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Visibility(
                          visible: imageVisibility,
                          child: Image.asset(
                            'lib/assets/images/common/${_imageAirLineArray.first}',
                            width: context.k_24,
                            height: context.k_24,
                            fit: BoxFit.cover,
                          ).paddingBySide(right: context.k_12),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              ///Set value in Left List Sheet
                              rightTitleText,
                              textAlign: TextAlign.left,
                              style: isSelected
                                  ? ADTextStyle500.size14.setTextColor(
                                      context.adColors.blackTextColor,
                                    )
                                  : ADTextStyle400.size14.setTextColor(
                                      context.adColors.blackTextColor,
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Visibility(
                        visible: descriptionVisibility,
                        child: Text(
                          ///Set value in Left List Sheet
                          descriptionText,
                          textAlign: TextAlign.right,
                          style: ADTextStyle400.size10
                              .setTextColor(context.adColors.greyTextColor),
                        ),
                      ),
                      Checkbox(
                        key: Key('${FlightAutomationKeys.checkBox}$index'),
                        side: const BorderSide(color: Color(0xffb2b2b2)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(context.k_4),
                        ),
                        checkColor: context.adColors.whiteTextColor,
                        activeColor: context.adColors.black,
                        value: isSelected,
                        onChanged: (bool? value) => checkBoxTap(),
                      ),
                    ],
                  ),
                ],
              ).paddingBySide(
                left: context.k_16,
                top: context.k_8,
                bottom: context.k_8,
              ),
              Divider(
                height: context.scaled(1),
                color: context.adColors.dividerColor,
              ).paddingBySide(
                left: context.k_16,
                right: context.k_16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// this class is used for manage for Price View Slider in Price Container View
/// [DutyFreeFilterPriceViewContainer] class is used for manage for Price View Slider in Price Container View
class DutyFreeFilterPriceViewContainer extends StatefulWidget {
  const DutyFreeFilterPriceViewContainer({
    Key? key,
    required this.minValue,
    required this.maxValue,
    required this.isCheck,
  }) : super(key: key);
  final double minValue;
  final double maxValue;
  final bool isCheck;

  @override
  State<DutyFreeFilterPriceViewContainer> createState() =>
      _DutyFreeFilterPriceViewContainerState();
}

class _DutyFreeFilterPriceViewContainerState
    extends State<DutyFreeFilterPriceViewContainer> {
  double sliderValue = 0;

  bool isOpen = false;

  @override
  void initState() {
    super.initState();
    sliderValue = widget.minValue;
  }

  @override
  Widget build(BuildContext context) {
    final DutyFreeState dutyFreeState = context.read<DutyFreeState>();
    final sliderVal = FlightUtils.getPriceFormatWithSymbol(
      price: sliderValue.toDouble().roundToDouble(),
    );
    if (!isOpen) {
      dutyFreeState.priceSelectedValue = dutyFreeState.priceSelectedValueBackup;
      if (dutyFreeState.priceSelectedValue == 0) {
        dutyFreeState.priceSelectedValue = dutyFreeState.filterMaxPriceBackup;
      }
      isOpen = true;
    }

    return Container(
      height: sliderContainerHeight,
      child: Column(
        children: [
          Slider(
            key: const Key('priceSlider'),
            min: widget.minValue,
            max: widget.maxValue,
            value: dutyFreeState.priceSelectedValue.toDouble(),
            thumbColor: context.adColors.black,
            activeColor: context.adColors.black,
            inactiveColor: context.adColors.greyCircleColor,
            divisions: widget.maxValue.toInt(),
            label: sliderVal,
            onChanged: (double value) => setState(() {
              sliderValue = value;
              context.read<DutyFreeState>().filterMaxPrice =
                  sliderValue.toInt();
              context.read<DutyFreeState>().priceSelectedValue =
                  sliderValue.toInt();
            }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  FlightUtils.getPriceFormatWithSymbol(
                    price: widget.minValue.toDouble().roundToDouble(),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  FlightUtils.getPriceFormatWithSymbol(
                    price: widget.maxValue.toDouble().roundToDouble(),
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ).paddingBySide(left: context.k_22, right: context.k_22),
        ],
      ),
    );
  }
}

/// this class use for select Right view containers
/// [SelectRightViewOptimised] is used for manage different type of Right View Container
class SelectRightViewOptimised extends StatefulWidget {
  const SelectRightViewOptimised({Key? key, required this.dutyFreeState})
      : super(key: key);
  final DutyFreeState dutyFreeState;

  @override
  State<SelectRightViewOptimised> createState() =>
      _SelectRightViewOptimisedState();
}

class _SelectRightViewOptimisedState extends State<SelectRightViewOptimised> {
  DutyFreeState? dutyFreeState;
  final ScrollController _scrollController = ScrollController();
  final int minFilterSearchLength = 10;

  @override
  void initState() {
    super.initState();
    dutyFreeState = context.read<DutyFreeState>();
    dutyFreeState?.tempFilterMap.clear();
    dutyFreeState?.appliedFilterMap.forEach((mainKey, value) {
      value.forEach((key, value) {
        final mainMap =
            dutyFreeState?.tempFilterMap[mainKey] ?? <String, List<String>>{};
        mainMap[key] = (mainMap[key] ?? List.empty(growable: true))
          ..addAll(value);
        dutyFreeState?.tempFilterMap[mainKey] = mainMap;
      });
    });
    _scrollController.addListener(removeFocus);
  }

  void removeFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key(FlightAutomationKeys.sortReturn),
      color: context.adColors.whiteTextColor,
      child: rightViewListCount(dutyFreeState) == 0
          ? NoDataFoundErrorScreen(
              paddingBetweenImageAndErrorTitle: context.k_20,
              paddingBetweenErrorMessageAndRetry: context.k_30,
              errorTitle: 'no_data_available'.localize(context),
            )
          : Column(
              children: [
                if ((dutyFreeState
                            ?.dutyFreeFilterList[
                                widget.dutyFreeState.selectedIndex]
                            .subCategories
                            ?.length ??
                        0) >=
                    minFilterSearchLength)
                  SearchView(
                    onChanged: (value) => searchBrand(
                      value,
                      dutyFreeState,
                    ),
                    onFieldSubmitted: (value) =>
                        FocusScope.of(context).unfocus(),
                    onIconButtonPressed: () => searchBrand(
                      '',
                      dutyFreeState,
                    ),
                    hintText:
                        '${'search'.localize(context)} ${dutyFreeState?.dutyFreeFilterList[widget.dutyFreeState.selectedIndex].title ?? ''}',
                    textInputType: TextInputType.text,
                  ).paddingAllSide(
                    context.k_10,
                  ),
                Expanded(
                  child: Selector<DutyFreeState, int?>(
                    selector: (context, model) => model
                        .dutyFreeFilterList[widget.dutyFreeState.selectedIndex]
                        .filteredSubCategories
                        ?.length,
                    builder: (context, value, child) {
                      final bool searchFound = (value ?? 0) > 0;
                      return searchFound
                          ? ListView.builder(
                              controller: _scrollController,
                              shrinkWrap: true,
                              itemCount: widget
                                  .dutyFreeState
                                  .dutyFreeFilterList[
                                      widget.dutyFreeState.selectedIndex]
                                  .filteredSubCategories
                                  ?.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Selector<DutyFreeState, bool?>(
                                  selector: (context, catalogListViewModel) =>
                                      dutyFreeState
                                          ?.dutyFreeFilterList[widget
                                              .dutyFreeState.selectedIndex]
                                          .filteredSubCategories?[index]
                                          .selected,
                                  builder: (
                                    BuildContext context,
                                    state,
                                    Widget? child,
                                  ) {
                                    final DutyFreeFilterViewModel?
                                        dutyFreeFilterViewModel =
                                        dutyFreeState?.dutyFreeFilterList[
                                            dutyFreeState?.selectedIndex ?? 0];

                                    Map<String, List<String>>? filteredMap;
                                    if (dutyFreeFilterViewModel?.isCategory ??
                                        false) {
                                      filteredMap =
                                          dutyFreeState?.tempFilterMap[
                                              DutyFreeFilterConstants.category];
                                    } else if (dutyFreeFilterViewModel
                                            ?.isBrand ??
                                        false) {
                                      filteredMap =
                                          dutyFreeState?.tempFilterMap[
                                              DutyFreeFilterConstants.brands];
                                    } else if (dutyFreeFilterViewModel
                                            ?.isOffer ??
                                        false) {
                                      filteredMap =
                                          dutyFreeState?.tempFilterMap[
                                              DutyFreeFilterConstants.offers];
                                    } else if (dutyFreeFilterViewModel
                                            ?.isExclusive ??
                                        false) {
                                      filteredMap = dutyFreeState
                                              ?.tempFilterMap[
                                          DutyFreeFilterConstants.exclusive];
                                    } else if (dutyFreeFilterViewModel
                                            ?.isIncludeOOS ??
                                        false) {
                                      filteredMap = dutyFreeState
                                              ?.tempFilterMap[
                                          DutyFreeFilterConstants.includeOOS];
                                    }
                                    return DutyFreeFilterRightViewOptimised(
                                      rightTitleText: dutyFreeFilterViewModel
                                              ?.filteredSubCategories?[index]
                                              .title ??
                                          '',
                                      descriptionVisibility: true,
                                      imageVisibility: false,
                                      index: index,
                                      descriptionText: '',
                                      isSelected: filteredMap?[
                                                  dutyFreeFilterViewModel?.code]
                                              ?.contains(
                                            dutyFreeFilterViewModel
                                                    ?.filteredSubCategories?[
                                                        index]
                                                    .code ??
                                                '',
                                          ) ??
                                          false,
                                      checkBoxTap: () =>
                                          dutyFreeState?.filterClickAction(
                                        index,
                                      ),
                                    );
                                  },
                                );
                              },
                            )
                          : NoDataFoundErrorScreen(
                              paddingBetweenImageAndErrorTitle: context.k_20,
                              paddingBetweenErrorMessageAndRetry: context.k_30,
                              errorTitle: 'no_data_available'.localize(context),
                            ).paddingBySide(bottom: context.k_60);
                    },
                  ),
                ),
              ],
            ),
    );
  }

  void searchBrand(String value, DutyFreeState? dutyFreeState) {
    final DutyFreeFilterViewModel? dutyFreeFilterViewModel =
        dutyFreeState?.dutyFreeFilterList[dutyFreeState.selectedIndex];
    dutyFreeFilterViewModel?.filteredSubCategories =
        dutyFreeFilterViewModel.subCategories
            ?.where(
              (element) =>
                  element.title
                      ?.toLowerCase()
                      .trim()
                      .contains(value.toLowerCase().trim()) ??
                  false,
            )
            .toList();
    dutyFreeState?.notifyListeners();
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    final List<String> subCategories = dutyFreeState?.getSubCategory() ?? [];
    final List<String> categories = dutyFreeState?.getCategory() ?? [];
    final List<String> brands = dutyFreeState?.getBrand() ?? [];
    final List<String> offers = dutyFreeState?.getOffers() ?? [];
    final List<String> exclusive = dutyFreeState?.getExclusive() ?? [];
    for (final element
        in dutyFreeState?.dutyFreeFilterList ?? <DutyFreeFilterViewModel>[]) {
      if (element.isCategory && categories.isNotEmpty) {
        moveSelectedFiltersOnTop(subCategories, element);
      } else if (element.isBrand && brands.isNotEmpty) {
        moveSelectedFiltersOnTop(brands, element);
      } else if (element.isOffer && offers.isNotEmpty) {
        moveSelectedFiltersOnTop(offers, element);
      } else if (element.isExclusive && exclusive.isNotEmpty) {
        moveSelectedFiltersOnTop(exclusive, element);
      } else {
        element.filteredSubCategories = List.of(element.subCategories ?? []);
      }
    }
    _scrollController
      ..removeListener(removeFocus)
      ..dispose();
  }

  int rightViewListCount(DutyFreeState? dutyFreeState) {
    adLog(
      'rightViewListCount ${dutyFreeState?.selectedIndex} ${dutyFreeState?.dutyFreeFilterList[dutyFreeState.selectedIndex].filteredSubCategories?.length ?? 0}',
    );
    return dutyFreeState?.dutyFreeFilterList[dutyFreeState.selectedIndex]
            .subCategories?.length ??
        0;
  }

  void moveSelectedFiltersOnTop(
    List<String> subCategories,
    DutyFreeFilterViewModel element,
  ) {
    final selectedModels = element.subCategories
        ?.where(
          (e) => subCategories.contains(e.code ?? ''),
        )
        .toList();
    if (selectedModels?.isNotEmpty ?? false) {
      element
        ..subCategories?.removeWhere(
          (element) => subCategories.contains(element.code ?? ''),
        )
        ..subCategories?.insertAll(0, selectedModels ?? []);
    }
    element.filteredSubCategories = List.of(element.subCategories ?? []);
  }
}
