import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/default_filter_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_arrival_nearby_model.dart';

class FilterDepartureNearbyModel{
  String changeCode;
  final String filterName;
  final List<NearbyAirports> departureFilterOptions;
  List<String> selectedFilterType = [];
  Map<String, int>? departureNearByAirportMap;
  int filterCount;
  FilterDepartureNearbyModel({
    required this.changeCode,
    required this.filterName,
    required this.departureFilterOptions,
    required this.selectedFilterType,
    required this.departureNearByAirportMap,
    required this.filterCount,
  });

  factory FilterDepartureNearbyModel.outBoundDefaultValues([
    DefaultFilterModel? flightCountModel,
  ]) =>
      FilterDepartureNearbyModel(
        changeCode: '',
        filterName: 'DepartureAirlineNearby',
        filterCount: 0,
        departureFilterOptions:flightCountModel?.outBoundInternationalDepartureNearbyAirports ?? [],
        selectedFilterType: [],
        departureNearByAirportMap: flightCountModel?.outBoundInternationalDepartureNearByAirportMap,
      );

  factory FilterDepartureNearbyModel.inBoundDefaultValues([
    DefaultFilterModel? flightCountModel,
  ]) =>
      FilterDepartureNearbyModel(
        changeCode: '',
        filterName: 'DepartureAirlineNearby',
        filterCount: 0,
        departureFilterOptions:flightCountModel?.inBoundInternationalDepartureNearbyAirports ?? [],
        selectedFilterType: [],
        departureNearByAirportMap: flightCountModel?.inBoundInternationalDepartureNearByAirportMap,
      );

  FilterDepartureNearbyModel copy() {
    final List<NearbyAirports> departureFilterCopy = [];
    for (final element in departureFilterOptions) {
      departureFilterCopy.add(element.copy());
    }
    return FilterDepartureNearbyModel(
      changeCode: changeCode,
      filterName: filterName,
      departureFilterOptions:departureFilterCopy,
      selectedFilterType: selectedFilterType,
      departureNearByAirportMap: departureNearByAirportMap,
      filterCount: filterCount,
    );
  }
  void updateDepartureChangeCode() {
    final concatenate = StringBuffer();
    final List<String> _selectedFilterType = [];
    for (final item in departureFilterOptions) {
      if (item.isSelected) {
        concatenate.write(item.itemCode);
        _selectedFilterType.add(item.airportCode);
      }
    }
    selectedFilterType = _selectedFilterType;
    changeCode = concatenate.toString();
    filterCount = changeCode.isNotEmpty ? 1 : 0;

    //print(changeCode);
  }
}