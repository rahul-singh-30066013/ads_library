/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:core';
import 'dart:io';

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/helping_models/flight_search_data_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/helping_models/flight_search_navigate_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/helping_models/flight_status_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/response_models/flight_status_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/utils/enums/flight_status_search_options.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///This class is used to construct view for search and listing of airports,city and flights.
///[ScrollController] is of type [ScrollController] and since the screen is a part of
///DraggableScrollableSheet, [ScrollController] is passed to construction via builder of DraggableScrollableSheet.

class FlightSearchScreen extends StatefulWidget {
  final FlightSearchNavigateModel flightSearchNavigateModel;
  const FlightSearchScreen({
    Key? key,
    required this.flightSearchNavigateModel,
  }) : super(key: key);

  @override
  State<FlightSearchScreen> createState() => _FlightSearchScreenState();
}

class _FlightSearchScreenState extends State<FlightSearchScreen> {
  TextEditingController textController = TextEditingController();
  List<FlightSearchDataModel> flightDataList = [];
  List<FlightSearchDataModel> filteredFlightDataList = [];
  bool noResultsFound = false;
  @override
  void initState() {
    textController.text = widget.flightSearchNavigateModel.searchKeyword;
    buildCompleteList();
    if (widget.flightSearchNavigateModel.searchKeyword.trim() != '') {
      buildSearchList(widget.flightSearchNavigateModel.searchKeyword);
    }
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchTextFieldHeight = 42.sp;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ADSizedBox(
              height: searchTextFieldHeight,
              child: TextFormField(
                cursorColor: context.adColors.blackTextColor,
                autofocus: true,
                style: ADTextStyle400.size16
                    .setTextColor(context.adColors.neutralInfoMsg),
                controller: textController,
                decoration: InputDecoration(
                  hintText: 'searchAirlineFlightsOrCity'.localize(context),
                  hintStyle: ADTextStyle400.size16
                      .setTextColor(context.adColors.greyTextColor),
                  contentPadding: EdgeInsets.symmetric(vertical: context.k_4),
                  border: getBorder(context),
                  focusedBorder: getBorder(context),
                  enabledBorder: getBorder(context),
                  prefixIcon: IconButton(
                    splashRadius: context.k_20,
                    onPressed: () => navigatorPopScreen(context),
                    icon: Icon(
                      Platform.isIOS
                          ? Icons.arrow_back_ios_outlined
                          : Icons.arrow_back_outlined,
                      color: context.adColors.blackTextColor,
                    ).paddingBySide(left: context.k_8),
                  ),
                  suffixIcon: IconButton(
                    splashRadius: context.k_20,
                    onPressed: () => clearFocusController(context),
                    icon: textController.text.isNotEmpty
                        ? Icon(
                            Icons.clear,
                            color: context.adColors.greyTextColor,
                          )
                        : const ADSizedBox.shrink(),
                  ),
                ),
                onChanged: (value) => buildSearchList(value),
                //   onFieldSubmitted: (value) => buildSearchList(value),
              ),
            ).paddingBySide(
              left: context.k_16,
              right: context.k_16,
            ),
            ADSizedBox(
              height: context.k_10,
            ),
            Expanded(
              child: noResultsFound
                  ? Center(
                      child: Text(
                        'no_search_result_found'.localize(context),
                      ),
                    )
                  : ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: filteredFlightDataList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => filterAirportsClicked(index, context),
                          child: Row(
                            children: [
                              if (filteredFlightDataList[index]
                                      .flightStatusSearchOptions ==
                                  FlightStatusSearchOptions.city)
                                Container(
                                  height: context.k_28,
                                  width: context.k_28,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(context.k_14),
                                    ),
                                    color: context.adColors.paleGrey,
                                  ),
                                  child: SvgPicture.asset(
                                    SvgAssets.location,
                                    height: context.k_4,
                                    width: context.k_4,
                                  ).paddingAllSide(context.k_6),
                                ).paddingBySide(
                                  left: context.k_16,
                                  top: context.k_14,
                                  bottom: context.k_14,
                                )
                              else
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  width: context.k_28,
                                  height: context.k_28,
                                  decoration: BoxDecoration(
                                    color: filteredFlightDataList[index].icon ==
                                            null
                                        ? context.adColors.paleGrey
                                        : null,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(context.k_4),
                                    ),
                                  ),
                                  child: Image.network(
                                    filteredFlightDataList[index].icon ?? '',
                                    fit: BoxFit.contain,
                                  ),
                                ).paddingBySide(
                                  left: context.k_16,
                                  top: context.k_14,
                                  bottom: context.k_14,
                                ),
                              Text(
                                filteredFlightDataList[index].text,
                                style: ADTextStyle400.size16.setTextColor(
                                  context.adColors.neutralInfoMsg,
                                ),
                                textAlign: TextAlign.left,
                              ).paddingBySide(
                                left: context.k_10,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void filterAirportsClicked(int index, BuildContext context) {
    if (filteredFlightDataList[index].flightStatusSearchOptions !=
        FlightStatusSearchOptions.flightNo) {
      widget.flightSearchNavigateModel.flightTap(
        filteredFlightDataList[index],
      );
      navigatorPopScreen(context);
    } else {
      final flightStatusSegmentList =
          widget.flightSearchNavigateModel.flightSegment.where(
        (segment) {
          if (segment.flightnumber == filteredFlightDataList[index].text) {
            return true;
          }
          return false;
        },
      ).toList();
      if (flightStatusSegmentList.length > 1) {
        widget.flightSearchNavigateModel.flightTap(
          filteredFlightDataList[index],
        );
        navigatorPopScreen(context);
      } else {
        navigateToScreenUsingNamedRouteWithArguments(
          context,
          flightStatusDetailScreen,
          argumentObject: FlightStatusDetailModel(
            /// call back variable used for updating list of saved flight
            refreshTap: (value) => {
              widget.flightSearchNavigateModel.refreshTap(),
            },
            flightStatusStorageModel:
                widget.flightSearchNavigateModel.flightStatusStorageModel,
            flightNumber: filteredFlightDataList[index].text,
            selectedFlightStatusSegment: flightStatusSegmentList.first,
          ),
        );
      }
    }
  }

  void clearFocusController(BuildContext context) {
    textController.clear();
    FocusScope.of(context).unfocus();
    buildSearchList('');
  }

  InputBorder getBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(context.k_26)),
      borderSide: BorderSide(
        color: context.adColors.textFieldBorderGrey,
      ),
    );
  }

  ///to filter the list
  Future<void> buildSearchList(String value) async {
    if (value.trim() != '') {
      setState(() {
        filteredFlightDataList = flightDataList
            .where(
              (flightDataList) => searchMatch(
                flightDataList,
                value,
              ),
            )
            .toList();
        noResultsFound = filteredFlightDataList.isEmpty;
      });
    } else {
      setState(() {
        filteredFlightDataList = [];
        noResultsFound = false;
      });
    }
  }

  /// method to match out the search results
  bool searchMatch(FlightSearchDataModel segment, String value) {
    if (segment.text.toString().toUpperCase().contains(value.toUpperCase())) {
      return true;
    }
    return false;
  }

  /// method to match out the flight type
  bool flightTypeMatch(FlightStatusSegment segment) {
    if (segment.flightkind.toString().toUpperCase() ==
        widget.flightSearchNavigateModel.flightType.name.toUpperCase()) {
      return true;
    }
    return false;
  }

  /// Method to create complete search list
  Future<void> buildCompleteList() async {
    final List<String> initialFlightList = [];
    final List<String> initialCityNames = [];
    final List<String> initialAirlineList = [];
    final filteredFlightSegmentList = widget
        .flightSearchNavigateModel.flightSegment
        .where((flightDataList) => flightTypeMatch(flightDataList))
        .toList();
    for (int index = 0; index < filteredFlightSegmentList.length; index++) {
      final airlineInfo = FlightUtils
          .airlineInfo?[filteredFlightSegmentList[index].airlinecode];

      /// Adding flight
      if (!initialFlightList
          .contains(filteredFlightSegmentList[index].flightnumber)) {
        initialFlightList.add(
          filteredFlightSegmentList[index].flightnumber,
        );

        /// Adding flight list
        flightDataList.add(
          FlightSearchDataModel(
            text: filteredFlightSegmentList[index].flightnumber,
            flightStatusSearchOptions: FlightStatusSearchOptions.flightNo,
            icon: airlineInfo?.icon,
            airlineCode: '',
          ),
        );
      }

      /// Adding source city
      if (!initialCityNames
          .contains(filteredFlightSegmentList[index].iataroute)) {
        initialCityNames.add(
          filteredFlightSegmentList[index].iataroute,
        );

        ///Adding city list
        flightDataList.add(
          FlightSearchDataModel(
            text: filteredFlightSegmentList[index].iataroute,
            flightStatusSearchOptions: FlightStatusSearchOptions.city,
            icon: SvgAssets.location,
            airlineCode: '',
          ),
        );
      }

      /// Adding destination city
      if (!initialCityNames
          .contains(filteredFlightSegmentList[index].iatalocalairport)) {
        initialCityNames.add(
          filteredFlightSegmentList[index].iatalocalairport,
        );
        //Adding city list
        flightDataList.add(
          FlightSearchDataModel(
            text: filteredFlightSegmentList[index].iatalocalairport,
            flightStatusSearchOptions: FlightStatusSearchOptions.city,
            icon: SvgAssets.location,
            airlineCode: '',
          ),
        );
      }

      /// Adding airline
      if (airlineInfo?.name != null &&
          !initialAirlineList.contains(airlineInfo?.name)) {
        initialAirlineList.add(
          airlineInfo?.name ?? '',
        );

        ///Adding airline list
        flightDataList.add(
          FlightSearchDataModel(
            text: airlineInfo?.name ?? '',
            flightStatusSearchOptions: FlightStatusSearchOptions.airlineName,
            icon: airlineInfo?.icon,
            airlineCode: filteredFlightSegmentList[index].airlinecode,
          ),
        );
      }
    }
  }
}
