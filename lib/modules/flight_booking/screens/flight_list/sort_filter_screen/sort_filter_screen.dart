/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_price.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_selected_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_sort_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_list/sort_filter_screen/sort_filter_header_footer.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_list/sort_filter_screen/sort_filter_middle_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/flight_listing_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/sort_filter_left_menu_enum.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

/// This class is used to for create Sort & Filter View
///[SortFilterScreen] is use for create Sort & Filter View
class SortFilterScreen extends StatefulWidget {
  const SortFilterScreen({
    Key? key,
    required this.filterSortModel,
    required this.isOneWay,
    this.outBoundFilterPrice,
    this.inBoundFilterPrice,
    required this.flightListingProvider,
  }) : super(key: key);

  @override
  State<SortFilterScreen> createState() => _SortFilterScreenState();
  final FilterSortModel filterSortModel;
  final FilterPrice? outBoundFilterPrice;
  final FilterPrice? inBoundFilterPrice;
  final bool isOneWay;
  final FlightListingState? flightListingProvider;
}

class _SortFilterScreenState extends State<SortFilterScreen>
    with TickerProviderStateMixin {
  FilterSortModel filterSortModelCopy = FilterSortModel.defaultFilterSort();

  FilterSortModel get _filterSortModel => widget.filterSortModel;

  FilterSortModel get _defaultFilters => FilterSortModel.defaultFilterSort();
  final List<FilterSelectedModel> departureList = [];
  final List<FilterSelectedModel> arrivalList = [];
  int tabBarCount = 0;
  List<Tab> myTabs = <Tab>[];

  @override
  void initState() {
    filterSortModelCopy = _filterSortModel.copy();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const int tabCount = 2;
    createDepartureList();
    createArrivalList();
    if (widget.isOneWay) {
      tabBarCount = 1;
      myTabs = <Tab>[
        const Tab(
          text: '',
        ),
      ];
    } else {
      tabBarCount = tabCount;
      myTabs = <Tab>[
        Tab(text: 'departure'.localize(context)),
        Tab(text: 'return'.localize(context)),
      ];
    }
    return DefaultTabController(
      length: tabBarCount,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              if (!widget.isOneWay)
                TabBar(
                  indicatorColor: context.adColors.blackShade700,
                  labelStyle: ADTextStyle600.size16
                      .setTextColor(context.adColors.black),
                  //For Selected tab
                  unselectedLabelStyle: ADTextStyle400.size16
                      .setTextColor(context.adColors.greyTextColor),
                  unselectedLabelColor: context.adColors.greyTextColor,
                  labelColor: context.adColors.black,
                  onTap: (index) => {
                    // setState(() {
                    //   //tabBarSelectedIndex = index;
                    // }),
                  },

                  tabs: [
                    Tab(
                      text: myTabs.first.text.toString(),
                    ),
                    Tab(
                      text: myTabs[1].text.toString(),
                    ),
                  ],
                ),
              if (!widget.isOneWay)
                const Divider(
                  height: 1,
                ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                if (widget.isOneWay) ...[
                  SortFilterMiddleView(
                    tabBarSelectionIndex: 0,
                    filterSortModel: filterSortModelCopy,
                    departureList: departureList,
                    arrivalList: arrivalList,
                  ),
                ] else ...[
                  SortFilterMiddleView(
                    tabBarSelectionIndex: 0,
                    filterSortModel: filterSortModelCopy,
                    departureList: departureList,
                    arrivalList: arrivalList,
                  ),
                  SortFilterMiddleView(
                    tabBarSelectionIndex: 1,
                    filterSortModel: filterSortModelCopy,
                    departureList: departureList,
                    arrivalList: arrivalList,
                  ),
                ],
              ],
            ),
          ),
          SortFooterView(
            applyTapCallback: applyCallBack,
            resetTapCallback: resetCallBack,
          ),
        ],
      ),
    );
  }

  void createDepartureList() {
    if (widget.flightListingProvider?.sectorId != 'D') {
      //TODO:Need to add the conditions if near by available then only add

      final  int outBoundDepartureNearbyListLength=widget.flightListingProvider?.responseMainData?.defaultFilterModel?.outBoundInternationalDepartureNearbyAirports?.length??0;
      if(outBoundDepartureNearbyListLength>1){
        departureList
            .add(
          FilterSelectedModel(
            name: 'Nearby Airport- ${widget.flightListingProvider?.oneWayFromCity}',
            selected:
            _filterSortModel.outBoundDepartureFilterNearbyModel.changeCode,
            sortFilterType: SortFilterLeftMenuEnum.nearbyDepartureAirports,
          ),
        );
      }
      final  int outBoundArrivalNearbyListLength=widget.flightListingProvider?.responseMainData?.defaultFilterModel?.outBoundInternationalArrivalNearbyAirports?.length??0;
      if(outBoundArrivalNearbyListLength>1){
        departureList
          .add(
            FilterSelectedModel(
              name: 'Nearby Airport- ${widget.flightListingProvider?.oneWayToCity}',
              selected:
              _filterSortModel.outBoundArrivalFilterNearbyModel.changeCode,
              sortFilterType: SortFilterLeftMenuEnum.nearbyArrivalAirports,
            ),
          );
      }


    }
    departureList
      ..add(
        FilterSelectedModel(
          name: 'stops'.localize(context),
          selected: _filterSortModel.outBoundStops.changeCode,
          sortFilterType: SortFilterLeftMenuEnum.stop,
        ),
      )
      ..add(
        FilterSelectedModel(
          name: 'departure_time'.localize(context),
          selected: _filterSortModel.outBoundDepartureTimes.changeCode,
          sortFilterType: SortFilterLeftMenuEnum.departureTime,
        ),
      )
      ..add(
        FilterSelectedModel(
          name: 'arrival_time'.localize(context),
          selected: _filterSortModel.outBoundArrivalTimes.changeCode,
          sortFilterType: SortFilterLeftMenuEnum.returnTime,
        ),
      );
    if (widget.flightListingProvider?.sectorId == 'D') {
      departureList.add(
        FilterSelectedModel(
          name: 'price'.localize(context),
          selected: _filterSortModel.outBoundFilterPrice.changeCode,
          sortFilterType: SortFilterLeftMenuEnum.price,
        ),
      );
    }
    departureList.add(
      FilterSelectedModel(
        name: 'airline'.localize(context),
        selected: _filterSortModel.outBoundAirline.changeCode,
        sortFilterType: SortFilterLeftMenuEnum.airline,
      ),
    );
  }

  void createArrivalList() {
    // ..add(
    //   FilterSelectedModel(
    //     name: 'sort'.localize(context),
    //     selected: '',
    //     sortFilterType: SortFilterLeftMenuEnum.sort,
    //   ),
    // )

    if (widget.flightListingProvider?.sectorId != 'D') {
      //TODO:Need to add the conditions if near by available then only add

      final  int inBoundDepartureNearbyListLength=widget.flightListingProvider?.responseMainData?.defaultFilterModel?.inBoundInternationalDepartureNearbyAirports?.length??0;
      if(inBoundDepartureNearbyListLength>1){
        arrivalList
            .add(
          FilterSelectedModel(
            name: 'Nearby Airport- ${widget.flightListingProvider?.roundTripFromCity}',
            selected:
            _filterSortModel.inBoundDepartureFilterNearbyModel.changeCode,
            sortFilterType: SortFilterLeftMenuEnum.nearbyDepartureAirports,
          ),
        );
      }


      final  int inBoundArrivalNearbyListLength=widget.flightListingProvider?.responseMainData?.defaultFilterModel?.inBoundInternationalArrivalNearbyAirports?.length??0;
      if(inBoundArrivalNearbyListLength>1){
        arrivalList
          .add(
            FilterSelectedModel(
              name: 'Nearby Airport- ${widget.flightListingProvider?.roundTripToCity}',
              selected:
              _filterSortModel.inBoundArrivalFilterNearbyModel.changeCode,
              sortFilterType: SortFilterLeftMenuEnum.nearbyArrivalAirports,
            ),
          );
      }


    }
    arrivalList
      ..add(
        FilterSelectedModel(
          name: 'stops'.localize(context),
          selected: _filterSortModel.inBoundStops.changeCode,
          sortFilterType: SortFilterLeftMenuEnum.stop,
        ),
      )
      ..add(
        FilterSelectedModel(
          name: 'departure_time'.localize(context),
          selected: _filterSortModel.inBoundDepartureTimes.changeCode,
          sortFilterType: SortFilterLeftMenuEnum.departureTime,
        ),
      )
      ..add(
        FilterSelectedModel(
          name: 'arrival_time'.localize(context),
          selected: _filterSortModel.inBoundArrivalTimes.changeCode,
          sortFilterType: SortFilterLeftMenuEnum.returnTime,
        ),
      );
    if (widget.flightListingProvider?.sectorId == 'D') {
      arrivalList.add(
        FilterSelectedModel(
          name: 'price'.localize(context),
          selected: _filterSortModel.inBoundFilterPrice.changeCode,
          sortFilterType: SortFilterLeftMenuEnum.price,
        ),
      );
    }
    arrivalList.add(
      FilterSelectedModel(
        name: 'airline'.localize(context),
        selected: _filterSortModel.inBoundAirline.changeCode,
        sortFilterType: SortFilterLeftMenuEnum.airline,
      ),
    );
  }

  void resetCallBack() {
    final FilterSortStateModel stateModel = FilterSortStateModel(
      oldFilter: _defaultFilters,
      newFilter: _defaultFilters,
    );
    navigatorPopScreenWithData(context, stateModel);
  }

  void applyCallBack() {
    widget.flightListingProvider?.filterSortModel = filterSortModelCopy;
    final FilterSortStateModel stateModel = FilterSortStateModel(
      oldFilter: _defaultFilters,
      newFilter: widget.flightListingProvider?.filterSortModel ??
          FilterSortModel.defaultFilterSort(),
    );
    navigatorPopScreenWithData(context, stateModel);
  }
}
