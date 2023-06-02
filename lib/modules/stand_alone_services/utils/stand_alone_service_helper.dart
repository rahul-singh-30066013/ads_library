
const int departureServiceId = 1;
const int transitServiceId = 2;
const int roundTripServiceId = 3;
const int arrivalTripServiceId = 4;

const int domesticToInternationalTravelSectorId = 1;
const int internationalToInternationalTravelSectorId = 2;
const int domesticTravelSectorId = 3;
const int internationalTravelSectorId = 4;
const int internationalToDomesticTravelSectorId = 5;
const int domesticToDomesticTravelSectorId = 6;

/// this method is used to check whether pranaam or all airportsList to populate on
bool isDestinationControllerPranaamAirport({required int selectedServiceTypeId}) {
  return selectedServiceTypeId.toString() == arrivalTripServiceId.toString() ||
      selectedServiceTypeId.toString() == transitServiceId.toString();
}

/// this method is used to check whether pranaam or all airportsList to populate on
bool isOriginControllerPranaamAirport({required int selectedServiceTypeId}) {
  return selectedServiceTypeId.toString() == departureServiceId.toString() ||
      selectedServiceTypeId.toString() == roundTripServiceId.toString();
}

bool isDestinationDomesticAirport({required int selectedTravelSectorId}) {
  return selectedTravelSectorId.toString() == domesticTravelSectorId.toString();
}

bool isOriginDomesticAirport({required int selectedTravelSectorId}) {
  return selectedTravelSectorId.toString() == domesticTravelSectorId.toString() ||
        selectedTravelSectorId.toString() == domesticToDomesticTravelSectorId.toString() ||
        selectedTravelSectorId.toString() == domesticToInternationalTravelSectorId.toString();
}

