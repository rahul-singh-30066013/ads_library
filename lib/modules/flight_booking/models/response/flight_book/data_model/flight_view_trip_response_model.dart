/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_book/data_model/payment_details.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_book/data_model/ticket_info.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/air_itinerary_pricing_info.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/itinerary_contact_detail.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/pax_info_list.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/priced_itinerary.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/pricing_summary.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/display_model/flight_review_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/flight_list_isolate_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/flights_display_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/review_screen_type.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';

// this class will used to receive view trip response
class FlightViewTripResponseModel {
  FlightViewTripResponseModel({
    String? orderStatus,
    String? bookingID,
    String? tripID,
    String? bookingStatus,
    String? bookedDate,
    String? bookingType,
    bool? isInternational,
    bool? isInvoiceDownload,
    ItineraryTripType? tripType,
    ItineraryContactDetail? contactDetail,
    List<PricedItinerary>? pricedItineraries,
    List<PaxInfoList>? paxInfoList,
    PaymentDetails? paymentDetails,
    PricingSummary? pricingSummary,
    String? orderReferenceId,
    bool? isEmailItinerary,
    bool? isZeroCancellation,
    String? cancellationClaimURL,
    String? cancellationClaimDate,
    bool? cancellationClaimActive,
    bool? isInfantCancelOnly,
  }) {
    _orderStatus = orderStatus;
    _bookingId = bookingID;
    _tripID = tripID;
    _bookingStatus = bookingStatus;
    _bookedDate = bookedDate;
    _bookingType = bookingType;
    _isInternational = isInternational;
    _isInvoiceDownload = isInvoiceDownload;
    _tripType = tripType;
    _contactDetail = contactDetail;
    _pricedItineraries = pricedItineraries;
    _paxInfoList = paxInfoList;
    _paymentDetails = paymentDetails;
    _isEmailItinerary = isEmailItinerary;
    _pricingSummary = pricingSummary;
    orderReferenceId = orderReferenceId;

    _isZeroCancellation = isZeroCancellation;
    _cancellationClaimURL = cancellationClaimURL;
    _cancellationClaimDate = cancellationClaimDate;
    _cancellationClaimActive = cancellationClaimActive;
    _isInfantCancelOnly = isInfantCancelOnly;
  }

  FlightViewTripResponseModel.fromJson(
    FlightListIsolateModel model,
    String? status,
    String? bookingIdPass,
  ) {
    final List<FlightReviewDetailInfo> _flightReviewDetailInfo = [];
    final List<FareDetailsInfo> _fareDetailsInfoList = [];
    _orderStatus = status;
    _bookingId=bookingIdPass;
    _tripID = model.jsonData['tripId'];
    _bookingStatus = model.jsonData['bookingStatus'];
    _bookedDate = model.jsonData['bookedDate'];
    _bookingType = model.jsonData['bookingType'];
    _isInternational = model.jsonData['isInternational'];
    _isInvoiceDownload = model.jsonData['isInvoiceDownload'];
    _isEmailItinerary = model.jsonData['isEmailItinerary'];
    _isZeroCancellation = model.jsonData['isZeroCancellation'];
    _cancellationClaimURL = model.jsonData['cancellationClaimURL'];
    _cancellationClaimDate = model.jsonData['cancellationClaimDate'];
    _cancellationClaimActive = model.jsonData['cancellationClaimActive'];
    _isInfantCancelOnly = model.jsonData['isInfantCancelOnly'];

    if (model.jsonData['tripType'] != null) {
      final String tripType = model.jsonData['tripType'];
      _tripType = ItineraryTripType.values.byName(tripType);
    }
    if (model.jsonData['pricingSummary'] is Map) {
      _pricingSummary = model.jsonData['pricingSummary'] == null
          ? null
          : PricingSummary.fromJson(model.jsonData['pricingSummary']);
    }
    _contactDetail = model.jsonData['contactDetail'] != null
        ? ItineraryContactDetail.fromJson(model.jsonData['contactDetail'])
        : null;
    if (model.jsonData['paxInfoList'] != null) {
      _paxInfoList = [];
      for (final object in model.jsonData['paxInfoList'] as List) {
        final PaxInfoList paxInfoList = PaxInfoList.fromJson(object, status);
        _paxInfoList?.add(paxInfoList);
      }
    }
    if (model.jsonData['pricedItineraries'] != null) {
      _pricedItineraries = [];
      for (final object in model.jsonData['pricedItineraries'] as List) {
        final PricedItinerary pricedItinerariesItem =
            PricedItinerary.fromJson(object);
        final FlightReviewDetailInfo flightReviewDetailInfo =
            FlightReviewDetailInfo.fromPricedItinerary(
          itinerary: pricedItinerariesItem,
          paxInfoList: _paxInfoList,
          airlineInfo: model.airlineInfo,
          isInternationalReturn: false,
        );
        _flightReviewDetailInfo.add(flightReviewDetailInfo);

        if ((_isInternational ?? false) && _tripType == ItineraryTripType.R) {
          final FlightReviewDetailInfo flightReviewDetailInfo =
              FlightReviewDetailInfo.fromPricedItinerary(
            itinerary: pricedItinerariesItem,
            paxInfoList: _paxInfoList,
            airlineInfo: model.airlineInfo,
            isInternationalReturn: true,
          );
          _flightReviewDetailInfo.add(flightReviewDetailInfo);
        }

        _fareDetailsInfoList.add(
          FareDetailsInfo(
            arrivalCity: pricedItinerariesItem.airItinerary
                    ?.originDestinationOption?.first.flightArrivalCityName ??
                '',
            departureCity: pricedItinerariesItem.airItinerary
                    ?.originDestinationOption?.first.flightDepartureCityName ??
                '',
            airItineraryPricingInfo:
                pricedItinerariesItem.airItineraryPricingInfo ??
                    AirItineraryPricingInfo(),
          ),
        );
        _pricedItineraries?.add(pricedItinerariesItem);
      }
    }
    _paymentDetails = model.jsonData['paymentDetails'] != null
        ? PaymentDetails.fromJson(model.jsonData['paymentDetails'])
        : null;
    flightReviewDetailModel = FlightReviewDetailModel(
      flightReviewDetailInfo: _flightReviewDetailInfo,
      flightFareInfo: _fareDetailsInfoList,
    );
  }

  String? _orderStatus;
  String? _bookingId;
  String? _tripID;
  String? _bookingStatus;
  String? _bookedDate;
  String? _bookingType;
  bool? _isInternational;
  bool? _isInvoiceDownload;
  ItineraryTripType? _tripType;
  ItineraryContactDetail? _contactDetail;
  List<PricedItinerary>? _pricedItineraries;
  List<PaxInfoList>? _paxInfoList;
  PaymentDetails? _paymentDetails;
  FlightReviewDetailModel? flightReviewDetailModel;
  bool? _isEmailItinerary;
  PricingSummary? _pricingSummary;
  String? orderReferenceId;
  bool? _isZeroCancellation;
  String? _cancellationClaimURL;
  String? _cancellationClaimDate;
  bool? _cancellationClaimActive;
  bool? _isInfantCancelOnly;

  String? get orderStatus => _orderStatus;
  String? get bookingID => _bookingId;

  String? get tripID => _tripID;
  PricingSummary? get pricingSummary => _pricingSummary;
  String? get bookingStatus => _bookingStatus;

  String? get bookedDate => _bookedDate;

  String? get bookingType => _bookingType;

  bool? get isInternational => _isInternational;

  bool get isInvoiceDownload => _isInvoiceDownload ?? false;

  bool get isEmailItinerary => _isEmailItinerary ?? false;

  bool get isZeroCancellation => _isZeroCancellation ?? false;

  String? get cancellationClaimURL => _cancellationClaimURL;

  String? get cancellationClaimDate => _cancellationClaimDate;

  bool? get cancellationClaimActive => _cancellationClaimActive ?? false;

  bool? get isInfantCancelOnly => _isInfantCancelOnly ?? false;

  ItineraryTripType? get tripType => _tripType;

  ItineraryContactDetail? get contactDetail => _contactDetail;

  List<PricedItinerary>? get pricedItineraries => _pricedItineraries;

  List<PaxInfoList>? get paxInfoList => _paxInfoList;

  PaymentDetails? get paymentDetails => _paymentDetails;

  bool get isPnrGenerated => _isPnrGenerated();

  double get cCFFee =>
      paymentDetails?.bookingPaymentBreakup?.calculateCCFFees ?? 0;

  double get discountedCCFFee =>
      paymentDetails?.bookingPaymentBreakup?.calculateDiscountedCCFFees ?? 0;
  double get ccfApplied => cCFFee - discountedCCFFee;

  ///Use to check the wallet button should show or not
  bool isAddToWalletEnabled() {
    final String bookingStatus = this.bookingStatus ?? '';
    if(bookingStatus.isEmpty){
      return false;
    }
    if (bookingStatus.isNotEmpty  &&
        (bookingStatus == BookingStatusType.Q.name ||
            bookingStatus == BookingStatusType.K.name ||
            bookingStatus == BookingStatusType.F.name)||
        bookingStatus=='NA') {
      return false;
    }

    final List<JourneyFlightDetails> journeyFlightDetails =
        flightReviewDetailModel
                ?.flightReviewDetailInfo?.last.journeyFlightDetails ??
            [];
    if (journeyFlightDetails.isNotEmpty) {
      final currentDate = DateTime.now();
      final String departureDate =
          journeyFlightDetails.first.flightDepartureDate;
      final parseDepartureDate =
          DateTime.parse(FlightUtils.changeDateFormat(departureDate));
      final String departureTime =
          journeyFlightDetails.first.flightDepartureTime;

      final bookedTimeArray = departureTime.split(':');
      final selectedDateTime = DateTime(
        parseDepartureDate.year,
        parseDepartureDate.month,
        parseDepartureDate.day,
        int.parse(bookedTimeArray.first),
        int.parse(bookedTimeArray.last),
        parseDepartureDate.second,
        parseDepartureDate.millisecond,
        parseDepartureDate.microsecond,
      );

      final int difference = DateTime(
        parseDepartureDate.year,
        parseDepartureDate.month,
        parseDepartureDate.day,
      )
          .difference(
            DateTime(
              currentDate.year,
              currentDate.month,
              currentDate.day,
            ),
          )
          .inDays;

      if (difference >= 0) {
        if (selectedDateTime.isAfter(DateTime.now())) {
          if (selectedDateTime.difference(DateTime.now()).inMinutes >= 0) {
            return true;
          }
          return false;
        }
      } else {
        return false;
      }
    } else {
      return false;
    }

    return true;
  }

  ///to check itinerary is cancellable or not
  bool isItineraryCancellable() {
    bool isEligible = false;
    final List<FlightReviewDetailInfo> flightReviewDetailInfo =
        flightReviewDetailModel?.flightReviewDetailInfo ?? [];
    if (flightReviewDetailInfo.isNotEmpty) {
      for (final object in flightReviewDetailInfo) {
        final bool isCancellableJourney = object.isJourneyCancelable ?? false;
        if (isCancellableJourney) {
          isEligible = true;
          break;
        }
      }
    }
    /*final String bookingStatusType = bookingStatus ?? '';
    adLog(
      'Checking PNR-booking STATUS>>>> $isPnrGenerated - $bookingStatusType',
    );
    if (bookingStatusType.isEmpty || !isPnrGenerated) {
      isEligible = false;
    } else if (bookingStatusType == BookingStatusType.Q.name ||
        bookingStatusType == BookingStatusType.K.name ||
        bookingStatusType == BookingStatusType.H.name ||
        bookingStatusType == BookingStatusType.Z.name) {
      isEligible = false;
    } else {
      final List<FlightReviewDetailInfo> flightReviewDetailInfo =
          flightReviewDetailModel?.flightReviewDetailInfo ?? [];
      if (tripType == ItineraryTripType.O &&
          checkDurationEligibility(
            flightReviewDetailInfo.first,
          ) &&
          checkCancelledStatus(
            flightReviewDetailInfo.first.passengerListInJourney?.allPaxInfoList
                    ?.first.cancellablePaxInfoList?.ticketInfo ??
                [],
            tripType ?? ItineraryTripType.O,
            orderStatus,
          )) {
        isEligible = true;
      } else if (tripType == ItineraryTripType.R) {
        if (checkDurationEligibility(
              flightReviewDetailInfo.last,
            ) &&
            checkCancelledStatus(
              flightReviewDetailInfo.last.passengerListInJourney?.allPaxInfoList
                      ?.last.cancellablePaxInfoList?.ticketInfo ??
                  [],
              tripType ?? ItineraryTripType.O,
              orderStatus,
            )) {
          isEligible = true;
        } else {
          if (checkDurationEligibility(
                flightReviewDetailInfo.first,
              ) &&
              (orderStatus == 'Confirmed' ||
                  orderStatus == 'Partially Cancelled')) {
            isEligible = true;
          }
        }
      } else {
        isEligible = false;
      }
    }*/
    return isEligible;
  }

  /// to check eligibility for itinerary to cancel as per date/duration(should not less then 120 min)
  bool checkDurationEligibility(FlightReviewDetailInfo flightReviewDetailInfo) {
    const int minimumTimeRequiredToCancel = 120;
    bool isEligible = false;
    final List<JourneyFlightDetails> journeyFlightDetails =
        flightReviewDetailInfo.journeyFlightDetails ?? [];
    if (journeyFlightDetails.isNotEmpty) {
      final currentDate = DateTime.now();
      final String departureDate =
          journeyFlightDetails.first.flightDepartureDate;
      final parseDepartureDate =
          DateTime.parse(FlightUtils.changeDateFormat(departureDate));
      final String departureTime =
          journeyFlightDetails.first.flightDepartureTime;

      final bookedTimeArray = departureTime.split(':');
      final selectedDateTime = DateTime(
        parseDepartureDate.year,
        parseDepartureDate.month,
        parseDepartureDate.day,
        int.parse(bookedTimeArray.first),
        int.parse(bookedTimeArray.last),
        parseDepartureDate.second,
        parseDepartureDate.millisecond,
        parseDepartureDate.microsecond,
      );

      final int difference = DateTime(
        parseDepartureDate.year,
        parseDepartureDate.month,
        parseDepartureDate.day,
      )
          .difference(
            DateTime(
              currentDate.year,
              currentDate.month,
              currentDate.day,
            ),
          )
          .inDays;

      if (difference >= 0) {
        if (selectedDateTime.isAfter(DateTime.now())) {
          if (selectedDateTime.difference(DateTime.now()).inMinutes >=
              minimumTimeRequiredToCancel) {
            isEligible = true;
          }
        }
      }
    } else {
      isEligible = true;
    }
    return isEligible;
  }

  /// to check eligibility for itinerary to cancel as ticket cancel state
  bool checkCancelledStatus(
    List<TicketInfo> ticketInfoList,
    ItineraryTripType tripType,
    String? orderStatus,
  ) {
    bool isEligible = true;
    if (tripType == ItineraryTripType.O) {
      final TicketInfo ticketInfo = ticketInfoList.first;
      if (ticketInfo.bookingStatus == BookingStatusType.Q.name ||
          ticketInfo.bookingStatus == BookingStatusType.K.name) {
        isEligible = false;
        if (orderStatus == 'Confirmed' ||
            orderStatus == 'Partially Cancelled') {
          isEligible = true;
        }
      }
    }
    if (tripType == ItineraryTripType.R) {
      isEligible = true;
      final TicketInfo ticketInfoInWard = ticketInfoList.last;
      if (ticketInfoInWard.bookingStatus == BookingStatusType.Q.name ||
          ticketInfoInWard.bookingStatus == BookingStatusType.K.name) {
        final TicketInfo ticketInfoOut = ticketInfoList.first;
        if (ticketInfoOut.bookingStatus == BookingStatusType.Q.name ||
            ticketInfoOut.bookingStatus == BookingStatusType.K.name) {
          isEligible = false;
        }
      }
    }
    return isEligible;
  }

  /// check pnr is generated for all pax or not
  bool _isPnrGenerated() {
    String pnrNo = '';
    bool isGenerated = true;
    final List<PaxInfoList> currentPaxInfoList = paxInfoList ?? [];
    if (currentPaxInfoList.isNotEmpty) {
      for (int index = 0; index < currentPaxInfoList.length; index++) {
        final List<TicketInfo> ticketInfoList =
            currentPaxInfoList[index].ticketInfo ?? [];
        if (ticketInfoList.isNotEmpty) {
          final TicketInfo? ticketInfo = ticketInfoList.first;
          pnrNo = ticketInfo?.pnr ?? '';
          if (pnrNo.isEmpty) {
            break;
          }
        }
      }
    } else {
      pnrNo = '';
    }
    if (pnrNo.isEmpty || pnrNo == '-') {
      isGenerated = false;
    }
    return isGenerated;
  }

  /// to check is invoice button enable
  /// TODO: Need to remove ccfApplied > 0 && isPnrGenerated once API include this in api.
  bool isInvoiceButtonEnable() {
    bool isEnable = false;
    if (isInvoiceDownload) {
      isEnable = true;
    }
    return isEnable;
  }

  ///to check email itinerary button visible
  bool isEmailButtonEnable() {
    bool isEnable = false;
    if (isEmailItinerary) {
      isEnable = true;
    }
    return isEnable;
  }

  /// to check bottom bar visible
  bool isBottomBarVisible() {
    bool isEnable = false;
    if (isInvoiceButtonEnable() || isItineraryCancellable()) {
      isEnable = true;
    }
    return isEnable;
  }

  bool isRefundAvailable() {
    if (orderStatus?.toLowerCase() == 'cancelled' ||
        orderStatus?.toLowerCase() == 'partially cancelled' ||
        orderStatus?.toLowerCase() == 'failed') {
      return true;
    }
    return false;
  }

  bool isRefundAvailableConfirmationPage() {
    if (orderStatus?.toLowerCase() == 'failed') {
      return true;
    }
    return false;
  }
}
