import 'package:adani_airport_mobile/modules/cabs/models/google_places_models/destination_search_address_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/airport_terminal_detail_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';

class SrpLoadingNavigationModel {
  AirportTerminalDetailModel? airportTerminalDetailModel;
  SearchAddressModel? selectedLocationDetailModel;
  final void Function(ADResponseState?) cabSrpCallBackWithResponse;
  final void Function(DateTime?) updateSelectedDate;
  final void Function() cabSrpError;
  final bool isFromAirport;
  final DateTime? selectedDate;

  SrpLoadingNavigationModel({
    required this.airportTerminalDetailModel,
    required this.cabSrpCallBackWithResponse,
    required this.updateSelectedDate,
    required this.cabSrpError,
    required this.selectedLocationDetailModel,
    required this.isFromAirport,
    required this.selectedDate,
  });
}
