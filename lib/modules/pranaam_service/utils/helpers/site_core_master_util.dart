/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

///Utility class for pranaam module
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/enum/service_type_enum.dart';
import 'package:adani_airport_mobile/modules/site_core/model/city_list/city_list_model.dart'
    as city_list;
import 'package:adani_airport_mobile/modules/site_core/model/site_core_masters/site_core_masters.dart'
    as site_core;
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';

List<site_core.TravelSector> getTravelSectorsByServiceType({
  required SiteCoreStateManagement siteCoreStateManagement,
  required String serviceType,
}) {
  final List<site_core.TravelSector> allTravelSectors =
      siteCoreStateManagement.travelSector;
  return serviceType == 'Transit'
      ? getSortedTravelSectorByTransitFlag(
          allTravelSectors,
          transitFlagName[TransitFlagsEnum.transitTrue] ?? '',
        )
      : getSortedTravelSectorByTransitFlag(
          allTravelSectors,
          transitFlagName[TransitFlagsEnum.transitFalse] ?? '',
        );
}

List<site_core.TravelSector> getSortedTravelSectorByTransitFlag(
  List<site_core.TravelSector> allTravelSectors,
  String transitFlag,
) {
  return allTravelSectors.where(
    (travelSector) {
      return travelSector.isTransit == transitFlag;
    },
  ).toList()
    ..sort((a, b) => a.order.compareTo(b.order));
}

List<site_core.State> getStateOnBasisOfCountryCode(
  final List<site_core.State> allStates,
  String countryCode,
) {
  final List<site_core.State> selectedStates = [];
  adLog('allStates Data length ${allStates.length}');
  for (int index = 0; index < allStates.length; index++) {
    if (allStates[index].countryCode == countryCode) {
      selectedStates.add(allStates[index]);
    }
  }
  adLog('selectedStates Data length ${selectedStates.length}');
  return selectedStates;
}

List<city_list.Result> getCitiesOnBasisOfState(
  final List<city_list.Result> allCities,
  String countryCode,
  String stateCode,
) {
  final List<city_list.Result> selectedCities = [];
  adLog('allCities Data length ${allCities.length}');
  for (int index = 0; index < allCities.length; index++) {
    if (allCities[index].countryCode == countryCode &&
        allCities[index].stateCode == stateCode) {
      selectedCities.add(allCities[index]);
    }
  }
  adLog('selectedCities Data length ${selectedCities.length}');
  return selectedCities;
}

///method for filtering states by search term entered by user
List<site_core.State> stateSearchFromList(
  List<site_core.State> listOfStates,
  String userSearchTerm,
) {
  adLog('state search term ..$userSearchTerm');
  return userSearchTerm.trim().isNotEmpty
      ? listOfStates.where(
          (statesModel) {
            return statesModel.name
                .validateWithDefaultValue()
                .toLowerCase()
                .startsWith(userSearchTerm.toLowerCase());
          },
        ).toList()
      : listOfStates;
}

///method for filtering city by search term entered by user
List<city_list.Result> citySearchFromList(
  List<city_list.Result> listOfCities,
  String userSearchTerm,
) {
  adLog('city search term ..$userSearchTerm');
  return userSearchTerm.trim().isNotEmpty
      ? listOfCities.where(
          (cityModel) {
            return cityModel.name
                .validateWithDefaultValue()
                .toLowerCase()
                .startsWith(userSearchTerm.toLowerCase());
          },
        ).toList()
      : listOfCities;
}
