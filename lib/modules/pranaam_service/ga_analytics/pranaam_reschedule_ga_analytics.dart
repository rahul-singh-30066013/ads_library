/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:collection';

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/pranaam_detail.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/booking_and_cancellation_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_reschedule_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';

class PranaamRescheduleGaAnalytics {
  final Map<String, Object?> eventAnalyticsMap = HashMap();

  void rescheduleEvent(
    ClickEvents events,
    BookingAndCancellationState? bookingAndCancellationState, {
    PranaamRescheduleStateManagement? pranaamRescheduleStateManagement,
  }) {
    final PranaamDetail? createBooking = bookingAndCancellationState
        ?.bookingDetailsResponse?.orderDetail?.pranaamDetail;

    eventAnalyticsMap[Parameters.category.name] = 'pranaam';
    eventAnalyticsMap[Parameters.sub_category.name] = 'reschedule';

    ///TODO:fix this
    eventAnalyticsMap[Parameters.label.name] = 'free_rescheduled';
    // getReschedulePrice(
    //           createBooking?.rescheduleDetail ?? const RescheduleDetail(),
    //         ) ==
    //         0
    //     ? 'free_rescheduled'
    //     : 'paid_rescheduled';
    eventAnalyticsMap[Parameters.pax_count.name] =
        paxCount(createBooking?.travelers);
    eventAnalyticsMap[Parameters.type.name] = 'full';
    eventAnalyticsMap[Parameters.transaction_id.name] =
        bookingAndCancellationState
            ?.bookingDetailsResponse?.transactionReferenceId;
    eventAnalyticsMap[Parameters.trip_type.name] =
        createBooking?.tripDetails?.serviceType;
    eventAnalyticsMap[Parameters.sector_type.name] =
        createBooking?.tripDetails?.travelSector;
    eventAnalyticsMap[Parameters.departure_date.name] = universalDateFormatter(
      requiredFormat: "'~t'yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
      dateTimeObject: createBooking?.tripDetails?.flightDate,
    );
    eventAnalyticsMap[Parameters.outbound_flight_number.name] =
        createBooking?.tripDetails?.serviceType == 'Transit'
            ? createBooking?.tripDetails?.transitRoundTripSecFlightName ?? ''
            : createBooking?.tripDetails?.flightName ?? '';
    eventAnalyticsMap[Parameters.outbound_airline.name] =
        '${createBooking?.tripDetails?.flightName}';
    eventAnalyticsMap[Parameters.departure_station.name] =
        createBooking?.tripDetails?.originAirport ?? '';
    eventAnalyticsMap[Parameters.arrival_station.name] =
        createBooking?.tripDetails?.destinationAirport ?? '';
    eventAnalyticsMap[Parameters.return_date.name] =
        createBooking?.tripDetails?.serviceType == 'Round Trip'
            ? universalDateFormatter(
                requiredFormat: "'~t'yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
                dateTimeObject: createBooking?.roundTripDetail?.flightDate,
              )
            : '';
    eventAnalyticsMap[Parameters.inbound_flight_number.name] =
        createBooking?.roundTripDetail?.flightNumber ?? '';
    eventAnalyticsMap[Parameters.inbound_airline.name] =
        '${createBooking?.roundTripDetail?.flightName}';
    eventAnalyticsMap[Parameters.inbound_departure_station.name] =
        createBooking?.roundTripDetail?.originAirport ?? '';
    eventAnalyticsMap[Parameters.inbound_arrival_station.name] =
        createBooking?.roundTripDetail?.destinationAirport ?? '';
    if (createBooking?.tripDetails?.serviceType == 'Transit') {
      eventAnalyticsMap[Parameters.transit_airline.name] =
          '${createBooking?.tripDetails?.transitRoundTripSecFlightName}';
      eventAnalyticsMap[Parameters.transit_at.name] =
          createBooking?.tripDetails?.serviceAirport ?? '';
      eventAnalyticsMap[Parameters.transit_date.name] = universalDateFormatter(
        requiredFormat: "'~t'yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
        inCommingFormat: 'MM/dd/yyyy',
        // dateTimeObject: createBooking?.tripDetails?.serviceDateTime,
      );
      eventAnalyticsMap[Parameters.transit_flight.name] =
          createBooking?.tripDetails?.flightNumber ?? '';
      eventAnalyticsMap[Parameters.transit_reschedule_date.name] =
          pranaamRescheduleStateManagement?.selectedDepartureDate;
      eventAnalyticsMap[Parameters.transit_scheduled_time.name] =
          pranaamRescheduleStateManagement?.selectedDepartureTime;
      eventAnalyticsMap[Parameters.transit_reschedule_flight_number.name] =
          pranaamRescheduleStateManagement?.selectedDepartureFlightNumber;
    }
    eventAnalyticsMap[Parameters.arrival_reschedule_date.name] =
        pranaamRescheduleStateManagement?.selectedDepartureDate;
    eventAnalyticsMap[Parameters.departure_reschedule_date.name] =
        pranaamRescheduleStateManagement?.selectedArrivalDate;
    eventAnalyticsMap[Parameters.arrival_scheduled_time.name] =
        pranaamRescheduleStateManagement?.selectedDepartureTime;
    eventAnalyticsMap[Parameters.departure_scheduled_time.name] =
        pranaamRescheduleStateManagement?.selectedArrivalTime;
    eventAnalyticsMap[Parameters.arrival_reschedule_flight_number.name] =
        pranaamRescheduleStateManagement?.selectedDepartureFlightNumber;
    eventAnalyticsMap[Parameters.departure_reschedule_flight_number.name] =
        pranaamRescheduleStateManagement?.selectedArrivalFlightNumber;
    eventAnalyticsMap[Parameters.transaction_id1.name] = '';

    events.logEvent(parameters: eventAnalyticsMap);
  }

  int paxCount(List<Traveler>? travellers) {
    const int passengerTypeId = 3;
    int paxCount = 0;
    travellers?.forEach((element) {
      if (element.passengerTypeId != passengerTypeId) {
        paxCount++;
      }
    });
    return paxCount;
  }

  void pranaamUpgradeEvent(
    ClickEvents events,
    BookingAndCancellationState? bookingAndCancellationState,
  ) {
    final PranaamDetail? createBooking = bookingAndCancellationState
        ?.bookingDetailsResponse?.orderDetail?.pranaamDetail;
    eventAnalyticsMap[Parameters.category.name] = 'pranaam';
    eventAnalyticsMap[Parameters.sub_category.name] = 'upgrade';
    eventAnalyticsMap[Parameters.pax_count.name] =
        paxCount(createBooking?.travelers);
    eventAnalyticsMap[Parameters.type.name] = 'full';
    eventAnalyticsMap[Parameters.transaction_id.name] =
        bookingAndCancellationState
            ?.bookingDetailsResponse?.transactionReferenceId;
    eventAnalyticsMap[Parameters.trip_type.name] =
        createBooking?.tripDetails?.serviceType;
    eventAnalyticsMap[Parameters.sector_type.name] =
        createBooking?.tripDetails?.travelSector;
    eventAnalyticsMap[Parameters.departure_date.name] = universalDateFormatter(
      requiredFormat: "'~t'yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
      dateTimeObject: createBooking?.tripDetails?.flightDate,
    );
    eventAnalyticsMap[Parameters.outbound_flight_number.name] =
        createBooking?.tripDetails?.serviceType == 'Transit'
            ? createBooking?.tripDetails?.transitRoundTripSecFlightName ?? ''
            : createBooking?.tripDetails?.flightName ?? '';
    eventAnalyticsMap[Parameters.outbound_airline.name] =
        '${createBooking?.tripDetails?.flightName}';
    eventAnalyticsMap[Parameters.departure_station.name] =
        createBooking?.tripDetails?.originAirport ?? '';
    eventAnalyticsMap[Parameters.arrival_station.name] =
        createBooking?.tripDetails?.destinationAirport ?? '';
    eventAnalyticsMap[Parameters.return_date.name] =
        createBooking?.tripDetails?.serviceType == 'Round Trip'
            ? universalDateFormatter(
                requiredFormat: "'~t'yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
                dateTimeObject: createBooking?.roundTripDetail?.flightDate,
              )
            : '';
    eventAnalyticsMap[Parameters.inbound_flight_number.name] =
        createBooking?.roundTripDetail?.flightNumber ?? '';
    eventAnalyticsMap[Parameters.inbound_airline.name] =
        '${createBooking?.roundTripDetail?.flightName}';
    eventAnalyticsMap[Parameters.inbound_departure_station.name] =
        createBooking?.roundTripDetail?.originAirport ?? '';
    eventAnalyticsMap[Parameters.inbound_arrival_station.name] =
        createBooking?.roundTripDetail?.destinationAirport ?? '';
    if (createBooking?.tripDetails?.serviceType == 'Transit') {
      eventAnalyticsMap[Parameters.transit_airline.name] =
          '${createBooking?.tripDetails?.transitRoundTripSecFlightName}';
      eventAnalyticsMap[Parameters.transit_at.name] =
          createBooking?.tripDetails?.serviceAirport ?? '';
      eventAnalyticsMap[Parameters.transit_date.name] = universalDateFormatter(
        requiredFormat: "'~t'yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
        inCommingFormat: 'MM/dd/yyyy',
        // dateTimeObject: createBooking?.tripDetails?.serviceDateTime,
      );
      eventAnalyticsMap[Parameters.transit_flight.name] =
          createBooking?.tripDetails?.flightNumber ?? '';
    }
    eventAnalyticsMap[Parameters.transaction_id1.name] = '';

    events.logEvent(parameters: eventAnalyticsMap);
  }
}
