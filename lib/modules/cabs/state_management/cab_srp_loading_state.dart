import 'package:adani_airport_mobile/modules/cabs/models/google_places_models/destination_address_details_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/google_places_models/destination_search_address_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/srp_loading_navigation_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/request_models/search_cab_request_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/search_cab_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cabs_booking_repository.dart';
import 'package:adani_airport_mobile/modules/cabs/utilities/constants/cab_constants.dart';
import 'package:adani_airport_mobile/utils/force_upgrade/app_constant_remote.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';

class CabSrpLoadingState extends BaseViewModel {
  final CabsBookingRepository _cabBookingRepository = CabsBookingRepository();
  SrpLoadingNavigationModel? srpLoadingNavigationModel;
  AddressDetailModel? updatedSelectedAddressModel;

  Future<ADResponseState> getCabItineraries() async {
    final pickUpDetails = LocationDetails(
      tripDateTime: srpLoadingNavigationModel?.selectedDate != null
          ? ((srpLoadingNavigationModel?.selectedDate?.millisecondsSinceEpoch ??
                      0) /
                  1000)
              .round()
          : (DateTime.now().millisecondsSinceEpoch / 1000).round(),
      latitude: srpLoadingNavigationModel?.isFromAirport ?? true
          ? srpLoadingNavigationModel?.airportTerminalDetailModel?.latitude ??
              ''
          : updatedSelectedAddressModel?.geometry?.location?.lat.toString() ??
              '',
      longitude: srpLoadingNavigationModel?.isFromAirport ?? true
          ? srpLoadingNavigationModel?.airportTerminalDetailModel?.longitude ??
              ''
          : updatedSelectedAddressModel?.geometry?.location?.lng.toString() ??
              '',
      locationCode: srpLoadingNavigationModel?.isFromAirport ?? true
          ? srpLoadingNavigationModel
                  ?.airportTerminalDetailModel?.airportAddressDescription ??
              ''
          : updatedSelectedAddressModel?.formattedAddress.toString() ?? '',
      placeId: srpLoadingNavigationModel?.isFromAirport ?? true
          ? srpLoadingNavigationModel?.airportTerminalDetailModel?.placeID ?? ''
          : updatedSelectedAddressModel?.placeId ?? '',
    );
    final dropDetails = LocationDetails(
      tripDateTime: 0,
      latitude: !(srpLoadingNavigationModel?.isFromAirport ?? true)
          ? srpLoadingNavigationModel?.airportTerminalDetailModel?.latitude ??
              ''
          : updatedSelectedAddressModel?.geometry?.location?.lat.toString() ??
              '',
      longitude: !(srpLoadingNavigationModel?.isFromAirport ?? true)
          ? srpLoadingNavigationModel?.airportTerminalDetailModel?.longitude ??
              ''
          : updatedSelectedAddressModel?.geometry?.location?.lng.toString() ??
              '',
      locationCode: !(srpLoadingNavigationModel?.isFromAirport ?? true)
          ? srpLoadingNavigationModel
                  ?.airportTerminalDetailModel?.airportAddressDescription ??
              ''
          : updatedSelectedAddressModel?.formattedAddress.toString() ?? '',
      placeId: !(srpLoadingNavigationModel?.isFromAirport ?? true)
          ? srpLoadingNavigationModel?.airportTerminalDetailModel?.placeID ?? ''
          : updatedSelectedAddressModel?.placeId ?? '',
    );
    final searchCabRequestModel = SearchCabRequestModel(
      pickupDetails: pickUpDetails,
      dropDetails: dropDetails,
      tripDistance: 0,
      tripType: CabConstants.cabTripType,
      preferredVendor: AppConstantRemote()
                  .appConstantRemoteModel
                  ?.preferredVendorList
                  .isNotEmpty ??
              false
          ? AppConstantRemote().appConstantRemoteModel?.preferredVendorList
          : CabConstants.preferredVendorList,
      isRideNow: srpLoadingNavigationModel?.selectedDate == null,
      isCityToAirport: !(srpLoadingNavigationModel?.isFromAirport ?? true),
    );
    final response = await _cabBookingRepository.fetchCabItineraries(
      searchCabRequestModel: searchCabRequestModel,
    );
    return response;
  }

  Future<void> fetchCabData({
    required void Function(ADResponseState searchResponseState)
        cabSrpCallBackWithResponse,
    required void Function(ADResponseState searchResponseState) moveToSrp,
    required void Function() cabSrpError,
  }) async {
    final value = await _cabBookingRepository.fetchPlaceDetailsByPlaceId(
      searchAddressModel:
          srpLoadingNavigationModel?.selectedLocationDetailModel ??
              SearchAddressModel(),
    );
    if (value.viewStatus == Status.complete) {
      updatedSelectedAddressModel = value.data;
      final ADResponseState searchResponseState = await getCabItineraries();
      if (searchResponseState.viewStatus == Status.complete) {
        final List<CabItineraries>? cabItineraries =
            (searchResponseState.data as SearchCabResponseModel).cabItineraries;
        if ((cabItineraries ?? []).isNotEmpty ||
            searchResponseState.successCode ==
                CabBookingErrorCode.cabB11.name) {
          moveToSrp(searchResponseState);
        } else {
          cabSrpCallBackWithResponse(searchResponseState);
        }
      } else {
        cabSrpCallBackWithResponse(searchResponseState);
      }
    } else {
      cabSrpError();
    }
  }
}
