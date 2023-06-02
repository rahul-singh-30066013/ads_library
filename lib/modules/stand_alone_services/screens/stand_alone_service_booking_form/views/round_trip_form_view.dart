import 'package:adani_airport_mobile/modules/stand_alone_services/screens/stand_alone_service_booking_form/views/destination_airport_picker.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/stand_alone_service_booking_form/views/origin_airport_picker.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/stand_alone_service_booking_form/views/stand_alone_date_picker.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/stand_alone_service_booking_form/views/stand_alone_flight_picker.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/state_management/stand_alone_service_booking_state_management.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/utils/stand_alone_service_helper.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class RoundTripFormView extends StatelessWidget {
  const RoundTripFormView({
    Key? key,
    required this.standAloneServiceBookingState,
  }) : super(key: key);
  final StandAloneServiceBookingStateManagement standAloneServiceBookingState;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OriginAirportPicker(
          selectedAirport:
              standAloneServiceBookingState.selectedRoundTripOrigin?.cityName ??
                  '',
          callback: (data) => standAloneServiceBookingState
              .handleRoundTripOriginAirportTap(data, context),
          selectedTravelSectorId: standAloneServiceBookingState
                  .selectedTravelSector?.travelSectorId ??
              0,

          /// this because we want to show all airports for round trip second trip origin
          selectedServiceTypeId: arrivalTripServiceId,
          errorMsg:
              standAloneServiceBookingState.roundTripOriginAirportErrorMsg,
        ),
        ADSizedBox(
          height: context.k_20,
        ),
        DestinationAirportPicker(
          isDisabled: true,
          selectedAirport:
              standAloneServiceBookingState.selectedOrigin?.cityName ?? '',
          selectedTravelSectorId: standAloneServiceBookingState
                  .selectedTravelSector?.travelSectorId ??
              0,
          selectedServiceTypeId:
              standAloneServiceBookingState.selectedService.serviceId,
          callback: (data) => adLog('disabled'),
        ),
        ADSizedBox(
          height: context.k_20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: StandAloneDatePicker(
                onDateSelected:
                    standAloneServiceBookingState.handleRoundTripDateSelect,
                selectedDate:
                    standAloneServiceBookingState.selectedRoundTripDate,
                calendarStartDate:
                    standAloneServiceBookingState.selectedArrivalDepartureDate,
              ),
            ),
            ADSizedBox(
              width: context.k_20,
            ),
            Expanded(
              child: StandAloneFlightPicker(
                errorMsg: standAloneServiceBookingState.roundTripFlightErrorMsg,
                response: standAloneServiceBookingState.roundTripFlightResponse,
                onFlightSelect:
                    standAloneServiceBookingState.handleRoundTripFlightTap,
                selectedFlight: standAloneServiceBookingState
                        .selectedRoundTripFlight?.flightFinalNumber ??
                    '',
                isValid:
                    standAloneServiceBookingState.validateRoundTripFlight(),
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
