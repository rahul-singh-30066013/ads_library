import 'package:adani_airport_mobile/modules/stand_alone_services/screens/stand_alone_service_booking_form/views/destination_airport_picker.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/stand_alone_service_booking_form/views/origin_airport_picker.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/stand_alone_service_booking_form/views/stand_alone_date_picker.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/stand_alone_service_booking_form/views/stand_alone_flight_picker.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/state_management/stand_alone_service_booking_state_management.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class ArrivalDepartureFormView extends StatelessWidget {
  const ArrivalDepartureFormView({
    Key? key,
    required this.standAloneServiceBookingState,
  }) : super(key: key);
  final StandAloneServiceBookingStateManagement standAloneServiceBookingState;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ADSizedBox(
          height: context.k_10,
        ),
        OriginAirportPicker(
          selectedAirport:
              standAloneServiceBookingState.selectedOrigin?.cityName ?? '',
          callback: (data) => standAloneServiceBookingState
              .handleOriginAirportTap(data, context),
          selectedTravelSectorId: standAloneServiceBookingState
                  .selectedTravelSector?.travelSectorId ??
              0,
          selectedServiceTypeId:
              standAloneServiceBookingState.selectedService.serviceId,
          errorMsg: standAloneServiceBookingState.originAirportErrorMsg,
        ),
        ADSizedBox(
          height: context.k_20,
        ),
        DestinationAirportPicker(
          errorMsg: standAloneServiceBookingState.destinationAirportErrorMsg,
          selectedAirport:
              standAloneServiceBookingState.selectedDestination?.cityName ?? '',
          selectedTravelSectorId: standAloneServiceBookingState
                  .selectedTravelSector?.travelSectorId ??
              0,
          selectedServiceTypeId:
              standAloneServiceBookingState.selectedService.serviceId,
          callback: (data) => standAloneServiceBookingState
              .handleDestinationAirportTap(data, context),
        ),
        ADSizedBox(
          height: context.k_20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: StandAloneDatePicker(
                onDateSelected: standAloneServiceBookingState
                    .handleArrivalDepartureDateSelect,
                selectedDate:
                    standAloneServiceBookingState.selectedArrivalDepartureDate,
              ),
            ),
            ADSizedBox(
              width: context.k_20,
            ),
            Expanded(
              child: StandAloneFlightPicker(
                errorMsg: standAloneServiceBookingState
                    .arrivalDepartureFlightErrorMsg,
                response: standAloneServiceBookingState
                    .arrivalDepartureFlightResponse,
                onFlightSelect: standAloneServiceBookingState
                    .handleArrivalDepartureFlightTap,
                selectedFlight: standAloneServiceBookingState
                        .selectedArrivalDepartureFlight?.flightFinalNumber ??
                    '',
                isValid: standAloneServiceBookingState
                    .validateArrivalDepartureFlight(),
              ),
            ),
          ],
        ),
        ADSizedBox(
          height: context.k_20,
        ),
      ],
    );
  }
}
