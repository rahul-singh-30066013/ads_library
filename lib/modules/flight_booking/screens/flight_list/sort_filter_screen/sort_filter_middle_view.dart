/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_selected_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_sort_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_list/sort_filter_screen/sort_filter_airline_right_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_list/sort_filter_screen/sort_filter_arrival_right_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_list/sort_filter_screen/sort_filter_departure_right_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_list/sort_filter_screen/sort_filter_left_view_container.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_list/sort_filter_screen/sort_filter_nearby_right_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_list/sort_filter_screen/sort_filter_price_view_container.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_list/sort_filter_screen/sort_filter_view_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_list/sort_filter_screen/stop_right_view_container.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/flight_automation_keys.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/sort_filter_left_menu_enum.dart';
import 'package:adani_mobile_utility/base/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// This class is used to for create Bottom Sheet Container and Select Right View Container
///[SortFilterMiddleView] is use for create Bottom Sheet Container
///[SelectDepartureRightView] is use for Select Right View Container
/// sortImageArray used for list of sort container icon.
var sortImageArray = [
  'lib/assets/images/svg/icons/flight/sort_arrow.svg',
  'lib/assets/images/svg/icons/flight/sort_arrow.svg',
  'lib/assets/images/svg/icons/flight/sort_arrow.svg',
  'lib/assets/images/svg/icons/flight/sort_arrow.svg',
  'lib/assets/images/svg/icons/flight/sort_arrow.svg',
  'lib/assets/images/svg/icons/flight/sort_arrow.svg',
];

var sortIconsArray = [
  'lib/assets/images/svg/icons/filter/rupee.svg',
  'lib/assets/images/svg/icons/filter/rupee.svg',
  SvgAssets.clock,
  SvgAssets.clock,
  'lib/assets/images/svg/icons/filter/time.svg',
  'lib/assets/images/svg/icons/filter/time.svg',
];

///SortFilterMiddleView This class is used for create middle view of sor & filter
///[SortFilterMiddleView] This class is used for create middle view of sor & filter
class SortFilterMiddleView extends StatefulWidget {
  const SortFilterMiddleView({
    Key? key,
    required this.tabBarSelectionIndex,
    this.filterSortModel,
    required this.arrivalList,
    required this.departureList,
  }) : super(key: key);
  final int tabBarSelectionIndex;
  final FilterSortModel? filterSortModel;
  final List<FilterSelectedModel> departureList;
  final List<FilterSelectedModel> arrivalList;

  @override
  State<SortFilterMiddleView> createState() => _SortFilterMiddleViewState();
}

class _SortFilterMiddleViewState extends State<SortFilterMiddleView> {
  final int flex1 = 8;
  final int flex2 = 17;

  @override
  Widget build(BuildContext context) {
    final List<FilterSelectedModel> filtersCategories =
        widget.tabBarSelectionIndex == 0
            ? widget.departureList
            : widget.arrivalList;
    final SortFilterViewModel sortFilterViewModel = SortFilterViewModel(
      filtersCategories.first.sortFilterType,
      filtersCategories.first,
    );
    return ADSelectorStateLessWidget(
      viewModel: sortFilterViewModel,
      child: Row(
        children: [
          Expanded(
            flex: flex1,
            child: Container(
              color: context.adColors.containerGreyBg,
              child: ListView.builder(
                itemCount: filtersCategories.length,
                itemBuilder: (BuildContext context, int index) {
                  ///InkWell that will be used to handle the click event in Right List
                  final FilterSelectedModel filterSelectedModel =
                      filtersCategories[index];
                  return Material(
                    child: InkWell(
                      key:
                          Key('${FlightAutomationKeys.filterMenuOption}$index'),
                      onTap: () => {
                        sortFilterViewModel.updateSwitchStatus(
                          index,
                          filterSelectedModel,
                        ),
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Selector<SortFilterViewModel, int>(
                            selector: (context, viewModel) =>
                                viewModel.selectedIndex,
                            builder: (context, value, Widget? child) {
                              return SortFilterLeftViewContainer(
                                isSelected: value == index,
                                filterSelectedModel: filtersCategories[index],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: flex2,
            child: Theme(
              data: ThemeData(
                checkboxTheme: CheckboxThemeData(
                  side: const BorderSide(color: Color(0xffb2b2b2)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(context.k_4),
                  ),
                ),
              ),
              child: Selector<SortFilterViewModel, int>(
                selector: (context, viewModel) => viewModel.selectedIndex,
                builder: (context, value, Widget? child) {
                  return widget.tabBarSelectionIndex == 0
                      ? SelectDepartureRightView(
                          sortFilterViewModel: sortFilterViewModel,
                          filterSortModel: widget.filterSortModel,
                        )
                      : SelectArrivalRightView(
                          sortFilterViewModel: sortFilterViewModel,
                          filterSortModel: widget.filterSortModel,
                        );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const int _sortCrossAxisCount = 2;
final double iconSize = 15.sp;

/// this class use for select Right view containers
/// [SelectDepartureRightView] is used for manage different type of Right View Container
class SelectDepartureRightView extends StatelessWidget {
  const SelectDepartureRightView({
    Key? key,
    required this.sortFilterViewModel,
    this.filterSortModel,
  }) : super(key: key);
  final SortFilterViewModel sortFilterViewModel;
  final FilterSortModel? filterSortModel;

  @override
  Widget build(BuildContext context) {
    switch (sortFilterViewModel.leftSelectedMenu) {
      case SortFilterLeftMenuEnum.sort:
        return GridView.builder(
          padding: EdgeInsets.symmetric(
            horizontal: context.k_8,
            vertical: context.k_20,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _sortCrossAxisCount,
            mainAxisSpacing: context.k_16,
          ),
          itemCount:
              filterSortModel?.outBoundFilterAllSortModel.priceSort.length,
          itemBuilder: (context, index) {
            return InkWell(
              borderRadius: BorderRadius.circular(context.k_8),
              onTap: () => {
                for (int indexValue = 0;
                    indexValue <
                        (filterSortModel
                                ?.outBoundFilterAllSortModel.priceSort.length ??
                            0);
                    indexValue++)
                  {
                    filterSortModel?.outBoundFilterAllSortModel
                        .priceSort[indexValue].isSelected = false,
                    filterSortModel?.outBoundFilterAllSortModel.priceSort[index]
                        .isSelected = true,
                    filterSortModel?.outBoundFilterAllSortModel.changeCode =
                        '01',
                  },
                sortFilterViewModel.updateSortStatus(),
              },
              child: Selector<SortFilterViewModel, FilterSortModel?>(
                selector: (context, viewModel) => viewModel.filterSortModel,
                builder: (context, value, Widget? child) {
                  return Container(
                    padding: EdgeInsets.all(context.k_8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: filterSortModel?.outBoundFilterAllSortModel
                                    .priceSort[index].isSelected ==
                                false
                            ? context.adColors.lightGreyGridSeparatorColor
                            : context.adColors.greyTextColor,
                      ),
                      borderRadius:
                          BorderRadius.all(Radius.circular(context.k_8)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            // Text(
                            //   // 'rupeeSymbolLabel'.localize(context),
                            //   '',
                            //   style: ADTextStyle700.size16.setTextColor(
                            //     context.adColors.neutralInfoMsg,
                            //   ),
                            // ),
                            SvgPicture.asset(
                              sortIconsArray[index],
                              height: iconSize,
                              color: context.adColors.darkGreyTextColor,
                            ),
                            ADSizedBox(
                              width: context.k_4,
                            ),
                            if (filterSortModel?.outBoundFilterAllSortModel
                                    .priceSort[index].isSelected ==
                                true)
                              RotatedBox(
                                quarterTurns:
                                    index.isOdd ? _sortCrossAxisCount : 0,
                                child: SvgPicture.asset(
                                  sortImageArray[index],
                                  height: context.k_12,
                                  color: context.adColors.darkGreyTextColor,
                                ),
                              ),
                          ],
                        ),
                        Text(
                          filterSortModel?.outBoundFilterAllSortModel
                                  .priceSort[index].sortName ??
                              '',
                          style: filterSortModel?.outBoundFilterAllSortModel
                                      .priceSort[index].isSelected ==
                                  false
                              ? ADTextStyle400.size14.setTextColor(
                                  context.adColors.greyTextColor,
                                )
                              : ADTextStyle500.size14.setTextColor(
                                  context.adColors.blackTextColor,
                                ),
                          overflow: TextOverflow.fade,
                        ),
                      ],
                    ),
                  );
                },
                shouldRebuild: (previous, next) => true,
              ),
            ).paddingBySide(left: context.k_8, right: context.k_8);
          },
        );
      case SortFilterLeftMenuEnum.stop:
        return ListView.builder(
          itemCount: filterSortModel?.outBoundStops.filterOptions.length,
          itemBuilder: (BuildContext context, int index) {
            ///SortFilterRightViewContainer that will be used show right view container for sort
            return StopRightViewContainer(
              rightTitleText: filterSortModel
                      ?.outBoundStops.filterOptions[index].stopName ??
                  '',
              index: index,
              sortFilterViewModel: sortFilterViewModel,
              filterStopModel: filterSortModel?.outBoundStops,
            );
          },
        );
      case SortFilterLeftMenuEnum.departureTime:
        return ListView.builder(
          itemCount:
              filterSortModel?.outBoundDepartureTimes.filterOptions.length,
          itemBuilder: (BuildContext context, int index) {
            return SortFilterDepartureRightView(
              index: index,
              filterDepartureModel: filterSortModel?.outBoundDepartureTimes,
            );
          },
        );
      case SortFilterLeftMenuEnum.returnTime:
        return ListView.builder(
          itemCount: filterSortModel?.outBoundArrivalTimes.filterOptions.length,
          itemBuilder: (BuildContext context, int index) {
            return SortFilterArrivalRightView(
              index: index,
              filterArrivalModel: filterSortModel?.outBoundArrivalTimes,
            );
          },
        );
      case SortFilterLeftMenuEnum.price:
        return Align(
          alignment: Alignment.topCenter,
          child: SortFilterPriceViewContainer(
            key: const Key(FlightAutomationKeys.sortPrice),
            isCheck: false,
            filterSortModel: filterSortModel,
            outBoundFilterPrice: filterSortModel?.outBoundFilterPrice,
          ),
        );
      case SortFilterLeftMenuEnum.airline:
        return ListView.builder(
          itemCount: filterSortModel?.outBoundAirline.filterOptions.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            ///InkWell that will be used to handle the click event in Right List
            return SortFilterAirlineRightView(
              descriptionVisibility: true,
              index: index,
              descriptionText: '',
              filterAirlineModel: filterSortModel?.outBoundAirline,
            );
          },
        );
      case SortFilterLeftMenuEnum.nearbyArrivalAirports:
        return ListView.builder(
          itemCount: filterSortModel?.outBoundArrivalFilterNearbyModel
                  .arrivalFilterOptions.length ??
              0,
          itemBuilder: (BuildContext context, int index) {
            ///InkWell that will be used to handle the click event in Right List
            return SortFilterNearbyRightView(
              descriptionVisibility: true,
              index: index,
              descriptionText: '',
              viewType: 0,
              arrivalNearbyModel:
                  filterSortModel?.outBoundArrivalFilterNearbyModel,
            );
          },
        );
      case SortFilterLeftMenuEnum.nearbyDepartureAirports:
        return ListView.builder(
          itemCount: filterSortModel?.outBoundDepartureFilterNearbyModel
                  .departureFilterOptions.length ??
              0,
          itemBuilder: (BuildContext context, int index) {
            ///InkWell that will be used to handle the click event in Right List
            return SortFilterNearbyRightView(
              descriptionVisibility: true,
              index: index,
              descriptionText: '',
              viewType: 1,
              departureNearbyModel:
                  filterSortModel?.outBoundDepartureFilterNearbyModel,
            );
          },
        );
      default:
        return const ADSizedBox.shrink();
    }
  }
}

class SelectArrivalRightView extends StatelessWidget {
  const SelectArrivalRightView({
    Key? key,
    required this.sortFilterViewModel,
    this.filterSortModel,
  }) : super(key: key);
  final SortFilterViewModel sortFilterViewModel;
  final FilterSortModel? filterSortModel;

  @override
  Widget build(BuildContext context) {
    switch (sortFilterViewModel.leftSelectedMenu) {
      case SortFilterLeftMenuEnum.sort:
        return GridView.builder(
          padding: EdgeInsets.symmetric(
            horizontal: context.k_8,
            vertical: context.k_20,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _sortCrossAxisCount,
            mainAxisSpacing: context.k_16,
          ),
          itemCount:
              filterSortModel?.inBoundFilterAllSortModel.priceSort.length,
          itemBuilder: (context, index) {
            return InkWell(
              borderRadius: BorderRadius.circular(context.k_8),
              onTap: () => {
                for (int indexValue = 0;
                    indexValue <
                        (filterSortModel
                                ?.inBoundFilterAllSortModel.priceSort.length ??
                            0);
                    indexValue++)
                  {
                    filterSortModel?.inBoundFilterAllSortModel
                        .priceSort[indexValue].isSelected = false,
                    filterSortModel?.inBoundFilterAllSortModel.priceSort[index]
                        .isSelected = true,
                    filterSortModel?.inBoundFilterAllSortModel.changeCode =
                        '01',
                  },
                sortFilterViewModel.updateSortStatus(),
              },
              child: Selector<SortFilterViewModel, FilterSortModel?>(
                selector: (context, viewModel) => viewModel.filterSortModel,
                builder: (context, value, Widget? child) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: filterSortModel?.inBoundFilterAllSortModel
                                    .priceSort[index].isSelected ==
                                false
                            ? context.adColors.lightGreyGridSeparatorColor
                            : context.adColors.greyTextColor,
                      ),
                      borderRadius:
                          BorderRadius.all(Radius.circular(context.k_8)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            // Text(
                            //   'rupeeSymbolLabel'.localize(context),
                            //   style: ADTextStyle700.size16.setTextColor(
                            //     context.adColors.neutralInfoMsg,
                            //   ),
                            // ),
                            SvgPicture.asset(
                              sortIconsArray[index],
                              height: iconSize,
                              color: context.adColors.darkGreyTextColor,
                            ),
                            ADSizedBox(
                              width: context.k_4,
                            ),
                            if (filterSortModel?.inBoundFilterAllSortModel
                                    .priceSort[index].isSelected ==
                                true)
                              RotatedBox(
                                quarterTurns:
                                    index.isOdd ? _sortCrossAxisCount : 0,
                                child: SvgPicture.asset(
                                  sortImageArray[index],
                                  height: context.k_12,
                                  color: context.adColors.darkGreyTextColor,
                                ),
                              ),
                          ],
                        ),
                        Text(
                          filterSortModel?.inBoundFilterAllSortModel
                                  .priceSort[index].sortName ??
                              '',
                          style: filterSortModel?.inBoundFilterAllSortModel
                                      .priceSort[index].isSelected ==
                                  false
                              ? ADTextStyle400.size14.setTextColor(
                                  context.adColors.greyTextColor,
                                )
                              : ADTextStyle500.size14.setTextColor(
                                  context.adColors.blackTextColor,
                                ),
                        ),
                      ],
                    ).paddingAllSide(context.k_8),
                  );
                },
                shouldRebuild: (previous, next) => true,
              ),
            ).paddingBySide(left: context.k_8, right: context.k_8);
          },
        );
      case SortFilterLeftMenuEnum.stop:
        return ListView.builder(
          itemCount: filterSortModel?.inBoundStops.filterOptions.length,
          itemBuilder: (BuildContext context, int index) {
            ///SortFilterRightViewContainer that will be used show right view container for sort
            return StopRightViewContainer(
              rightTitleText:
                  filterSortModel?.inBoundStops.filterOptions[index].stopName ??
                      '',
              index: index,
              sortFilterViewModel: sortFilterViewModel,
              arrivalFilterStopModel: filterSortModel?.inBoundStops,
            );
          },
        );
      case SortFilterLeftMenuEnum.departureTime:
        return ListView.builder(
          itemCount:
              filterSortModel?.inBoundDepartureTimes.filterOptions.length,
          itemBuilder: (BuildContext context, int index) {
            return SortFilterDepartureRightView(
              index: index,
              arrivalFilterDepartureModel:
                  filterSortModel?.inBoundDepartureTimes,
            );
          },
        );
      case SortFilterLeftMenuEnum.returnTime:
        return ListView.builder(
          itemCount: filterSortModel?.inBoundArrivalTimes.filterOptions.length,
          itemBuilder: (BuildContext context, int index) {
            return SortFilterArrivalRightView(
              index: index,
              arrivalFilterArrivalModel: filterSortModel?.inBoundArrivalTimes,
            );
          },
        );
      case SortFilterLeftMenuEnum.price:
        return Align(
          alignment: Alignment.topCenter,
          child: SortFilterPriceViewContainer(
            key: const Key(FlightAutomationKeys.sortPrice),
            isCheck: false,
            filterSortModel: filterSortModel,
            inBoundFilterPrice: filterSortModel?.inBoundFilterPrice,
          ),
        );
      case SortFilterLeftMenuEnum.airline:
        return ListView.builder(
          itemCount: filterSortModel?.inBoundAirline.filterOptions.length,
          itemBuilder: (BuildContext context, int index) {
            ///InkWell that will be used to handle the click event in Right List
            return SortFilterAirlineRightView(
              descriptionVisibility: true,
              index: index,
              descriptionText: '',
              arrivalFilterAirlineModel: filterSortModel?.inBoundAirline,
            );
          },
        );
      case SortFilterLeftMenuEnum.nearbyArrivalAirports:
        return ListView.builder(
          itemCount: filterSortModel?.inBoundArrivalFilterNearbyModel
                  .arrivalFilterOptions.length ??
              0,
          itemBuilder: (BuildContext context, int index) {
            ///InkWell that will be used to handle the click event in Right List
            return SortFilterNearbyRightView(
              descriptionVisibility: true,
              index: index,
              descriptionText: '',
              viewType: 0,
              arrivalNearbyModel:
                  filterSortModel?.inBoundArrivalFilterNearbyModel,
            );
          },
        );
      case SortFilterLeftMenuEnum.nearbyDepartureAirports:
        return ListView.builder(
          itemCount: filterSortModel?.inBoundDepartureFilterNearbyModel
                  .departureFilterOptions.length ??
              0,
          itemBuilder: (BuildContext context, int index) {
            ///InkWell that will be used to handle the click event in Right List
            return SortFilterNearbyRightView(
              descriptionVisibility: true,
              index: index,
              descriptionText: '',
              viewType: 1,
              departureNearbyModel:
                  filterSortModel?.inBoundDepartureFilterNearbyModel,
            );
          },
        );
      default:
        return const ADSizedBox.shrink();
    }
  }
}
