import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/default_filter_model.dart';

class FilterArrivalNearbyModel {
  String changeCode;
  final String filterName;
  final List<NearbyAirports> arrivalFilterOptions;
  List<String> selectedFilterType = [];
  Map<String, int>? arrivalNearByAirportMap;
  int filterCount;
  FilterArrivalNearbyModel({
    required this.changeCode,
    required this.filterName,
    required this.arrivalFilterOptions,
    required this.selectedFilterType,
    required this.arrivalNearByAirportMap,
    required this.filterCount,
  });

  factory FilterArrivalNearbyModel.outBoundDefaultValues([
    DefaultFilterModel? flightCountModel,
  ]) =>
      FilterArrivalNearbyModel(
        changeCode: '',
        filterName: 'ArrivalAirlineNearby',
        filterCount: 0,
        arrivalFilterOptions:
            flightCountModel?.outBoundInternationalArrivalNearbyAirports ?? [],
        selectedFilterType: [],
        arrivalNearByAirportMap:
            flightCountModel?.outBoundInternationalArrivalNearByAirportMap,
      );

  factory FilterArrivalNearbyModel.inBoundDefaultValues([
    DefaultFilterModel? flightCountModel,
  ]) =>
      FilterArrivalNearbyModel(
        changeCode: '',
        filterName: 'ArrivalAirlineNearby',
        filterCount: 0,
        arrivalFilterOptions:
            flightCountModel?.inBoundInternationalArrivalNearbyAirports ?? [],
        selectedFilterType: [],
        arrivalNearByAirportMap:
            flightCountModel?.inBoundInternationalArrivalNearByAirportMap,
      );

  FilterArrivalNearbyModel copy() {
    final List<NearbyAirports> arrivalFilterCopy = [];
    for (final element in arrivalFilterOptions) {
      arrivalFilterCopy.add(element.copy());
    }

    return FilterArrivalNearbyModel(
      changeCode: changeCode,
      filterName: filterName,
      arrivalFilterOptions: arrivalFilterCopy,
      selectedFilterType: selectedFilterType,
      arrivalNearByAirportMap: arrivalNearByAirportMap,
      filterCount: filterCount,
    );
  }

  void updateArrivalChangeCode() {
    final concatenate = StringBuffer();
    final List<String> _selectedFilterType = [];
    for (final item in arrivalFilterOptions) {
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

class NearbyAirports {
  String airportName;
  String airportCode;
  bool isSelected = false;
  String? itemCode;
  String? cityName;

  NearbyAirports({
    required this.airportName,
    required this.airportCode,
    required this.isSelected,
    this.itemCode,
    this.cityName,
  });

  NearbyAirports copy() {
    return NearbyAirports(
      airportName: airportName,
      airportCode: airportCode,
      isSelected: isSelected,
      itemCode: itemCode,
      cityName: cityName,
    );
  }
}
