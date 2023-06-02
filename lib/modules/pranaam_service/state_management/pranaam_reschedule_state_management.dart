/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/common_order_detail_base_response.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/pranaam_detail.dart'
    as pranaam_detail;
import 'package:adani_airport_mobile/modules/flight_booking/screens/calender/views/date_range_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/payment_method_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/payment/models/request/pay_now_request/check_out_request.dart';
import 'package:adani_airport_mobile/modules/payment/models/response/pay_now_response/check_out_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/ga_analytics/pranaam_reschedule_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/create_booking_request_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_flights/request_model/get_flights_request_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_flights/response_model/get_flights_response_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_flights/response_model/pranaam_flights.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/reschedule/reschedule_booking_request_model/reschedule_booking_request_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/reschedule/reschedule_booking_response_model/reschedule_booking_response_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/repository/pranaam_app_data_repository/pranaam_app_data_repository.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/booking_and_cancellation_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/service_booking/service_booking_details.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/utils/stand_alone_service_helper.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/profile/profile_singleton.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PranaamRescheduleStateManagement extends ChangeNotifier {
  BookingAndCancellationState bookingAndCancellationState;

  PranaamRescheduleStateManagement(this.bookingAndCancellationState);

  String selectedArrivalFlightNumber = '';
  DateTime? selectedArrivalServiceDateTime;
  String selectedArrivalDate = '';
  String selectedArrivalTime = '';
  String selectedDepartureFlightNumber = '';
  DateTime? selectedDepartureServiceDateTime;
  String selectedDepartureDate = '';
  String selectedDepartureTime = '';
  CommonOrderDetailBaseResponse? bookingDetailsResponseModel;
  ValueNotifier<ADResponseState> pranaamArrivalFlightsResponse =
      ValueNotifier(ADResponseState.init());
  ValueNotifier<ADResponseState> pranaamDepartureFlightsResponse =
      ValueNotifier(ADResponseState.init());
  PranaamFlights? selectedArrivalFlight;
  PranaamFlights? selectedDepartureFlight;
  DateTime departureDateTime = DateTime.now();
  DateTime arrivalDateTime = DateTime.now();
  List<int> passengerId = [];
  ADResponseState resheduleBookingResponse = ADResponseState.init();
  final PranaamAppDataRepository _pranaamAppDataRepository =
      PranaamAppDataRepository();
  ValueNotifier<bool> isRescheduleEnabled = ValueNotifier(false);
  final TextEditingController arrivalDateController = TextEditingController();
  final TextEditingController departureDateController = TextEditingController();
  final TextEditingController arrivalFlightController = TextEditingController();
  final TextEditingController departureFlightController =
      TextEditingController();

  void initControllersForRoundTrip(BuildContext context) {
    if (bookingDetailsResponseModel
            ?.orderDetail?.pranaamDetail?.tripDetails?.serviceTypeId ==
        roundTripServiceId) {
      //arrival
      DateTime? date;
      try {
        date = bookingDetailsResponseModel
            ?.orderDetail?.pranaamDetail?.tripDetails?.flightDate;
      } catch (e) {
        adLog('$e');
      }
      if (date != null) {
        arrivalDateTime = date;
        arrivalDateController.text = universalDateFormatter(
          requiredFormat: Constant.dateFormat10,
          dateTimeObject: date,
        );
        arrivalFlightController.text = bookingDetailsResponseModel
                ?.orderDetail?.pranaamDetail?.tripDetails?.flightName ??
            '';
        selectedArrivalServiceDateTime = bookingDetailsResponseModel
            ?.orderDetail?.pranaamDetail?.tripDetails?.serviceDateTime;
        getPranaamFlight(
          createGetFlightRequestModel(
            bookingDetailsResponseModel?.orderDetail?.pranaamDetail,
            arrivalDateTime,
            context,
            isRoundTrip: false,
          ),
          isRoundTrip: false,
        ).then(
          (value) {
            if (pranaamArrivalFlightsResponse.value.viewStatus ==
                Status.complete) {
              selectedArrivalFlight = (pranaamArrivalFlightsResponse.value.data
                      as GetFlightsResponseModel)
                  .pranaamFlights
                  ?.firstWhereOrNull(
                    (element) =>
                        element.flightFinalNumber ==
                        bookingDetailsResponseModel?.orderDetail?.pranaamDetail
                            ?.tripDetails?.flightName,
                  );
              selectedArrivalFlightNumber =
                  selectedArrivalFlight?.flightFinalNumber ?? '';
              selectedArrivalDate = formatDateTime(
                dateTimeFormat: Constant.dateFormat3,
                dateString: selectedArrivalFlight?.serviceDateTime,
              );
              selectedArrivalTime = reviewServiceTime(
                selectedArrivalFlight?.serviceDateTime ?? '',
              );
            } else if (pranaamArrivalFlightsResponse.value.viewStatus ==
                Status.error) {
              arrivalFlightController.text = '';
            }
          },
        );
      }
      //departure
      DateTime? date2;
      try {
        date2 = bookingDetailsResponseModel
            ?.orderDetail?.pranaamDetail?.roundTripDetail?.flightDate;
      } catch (e) {
        adLog('$e');
      }
      if (date2 != null) {
        departureDateTime = date2;
        departureDateController.text = universalDateFormatter(
          requiredFormat: Constant.dateFormat10,
          dateTimeObject: date2,
        );
        departureFlightController.text = bookingDetailsResponseModel
                ?.orderDetail?.pranaamDetail?.roundTripDetail?.flightName ??
            '';
        selectedDepartureServiceDateTime = bookingDetailsResponseModel
            ?.orderDetail?.pranaamDetail?.roundTripDetail?.serviceDateTime;
        getPranaamFlight(
          createGetFlightRequestModel(
            bookingDetailsResponseModel?.orderDetail?.pranaamDetail,
            departureDateTime,
            context,
            isRoundTrip: true,
          ),
          isRoundTrip: true,
        ).then(
          (value) {
            if (pranaamDepartureFlightsResponse.value.viewStatus ==
                Status.complete) {
              selectedDepartureFlight = (pranaamDepartureFlightsResponse
                      .value.data as GetFlightsResponseModel)
                  .pranaamFlights
                  ?.firstWhereOrNull(
                    (element) =>
                        element.flightFinalNumber ==
                        bookingDetailsResponseModel?.orderDetail?.pranaamDetail
                            ?.roundTripDetail?.flightName,
                  );
              selectedDepartureFlightNumber =
                  selectedDepartureFlight?.flightFinalNumber ?? '';
              selectedDepartureDate = formatDateTime(
                dateTimeFormat: Constant.dateFormat3,
                dateString: selectedDepartureFlight?.serviceDateTime,
              );
              selectedDepartureTime = reviewServiceTime(
                selectedDepartureFlight?.serviceDateTime ?? '',
              );
            } else if (pranaamDepartureFlightsResponse.value.viewStatus ==
                Status.error) {
              departureFlightController.text = '';
            }
          },
        );
      }
    }
  }

  void _verifyRescheduleButton() {
    if (bookingDetailsResponseModel
                ?.orderDetail?.pranaamDetail?.tripDetails?.serviceTypeId ==
            id_3 ||
        bookingDetailsResponseModel
                ?.orderDetail?.pranaamDetail?.tripDetails?.serviceTypeId ==
            id_2) {
      isRescheduleEnabled.notifyListeners();

      ///round trip and transit
      if (selectedArrivalFlightNumber.isEmpty) {
        isRescheduleEnabled.value = false;
        return;
      }
      if (selectedArrivalDate.isEmpty) {
        isRescheduleEnabled.value = false;
        return;
      }
      if (selectedDepartureDate.isEmpty) {
        isRescheduleEnabled.value = false;
        return;
      }
      if (selectedDepartureFlightNumber.isEmpty) {
        isRescheduleEnabled.value = false;
        return;
      }
      if (bookingDetailsResponseModel?.orderDetail?.pranaamDetail
                  ?.roundTripDetail?.serviceDateTime ==
              selectedDepartureServiceDateTime &&
          bookingDetailsResponseModel
                  ?.orderDetail?.pranaamDetail?.tripDetails?.serviceDateTime ==
              selectedArrivalServiceDateTime) {
        isRescheduleEnabled.value = false;
        return;
      }
      isRescheduleEnabled.value = true;
    }
    if (selectedArrivalFlightNumber.isEmpty) {
      isRescheduleEnabled.value = false;
      return;
    }
    if (selectedArrivalDate.isEmpty) {
      isRescheduleEnabled.value = false;
      return;
    }
    isRescheduleEnabled.value = true;
  }

  void updateAppData(BookingAndCancellationState _bookingData) {
    bookingAndCancellationState = _bookingData;
    adLog('updated');
  }

  void initData(CommonOrderDetailBaseResponse _bookingDetailsResponseModel) {
    selectedArrivalFlightNumber = '';
    selectedArrivalDate = '';
    selectedArrivalTime = '';
    pranaamArrivalFlightsResponse = ValueNotifier(ADResponseState.init());
    pranaamDepartureFlightsResponse = ValueNotifier(ADResponseState.init());
    selectedDepartureFlightNumber = '';
    selectedDepartureDate = '';
    selectedDepartureTime = '';
    selectedArrivalFlight = null;
    selectedDepartureFlight = null;
    departureDateTime = DateTime.now();
    arrivalDateTime = DateTime.now();
    passengerId.clear();
    bookingDetailsResponseModel = _bookingDetailsResponseModel;
    isRescheduleEnabled = ValueNotifier(false);
    departureDateController.clear();
    arrivalDateController.clear();
    _initDepartureFlightData();
    _initArrivalFlightData();
  }

  void _initDepartureFlightData() {
    selectedDepartureFlightNumber = '';
    selectedDepartureDate = '';
    selectedDepartureTime = '';
    selectedDepartureFlight = null;
    departureFlightController.clear();
  }

  void _initArrivalFlightData() {
    selectedArrivalFlightNumber = '';
    selectedArrivalDate = '';
    selectedArrivalTime = '';
    selectedArrivalFlight = null;
    arrivalFlightController.clear();
  }

  void getAllPassengerId() {
    final List<pranaam_detail.Traveler> travelers =
        bookingDetailsResponseModel?.orderDetail?.pranaamDetail?.travelers ??
            [];
    for (final pranaam_detail.Traveler traveler in travelers) {
      if (traveler.passengerStatus?.toLowerCase() != 'cancelled') {
        passengerId.add(traveler.passengerId ?? 0);
      }
    }
  }

  void updateDate(
    CalendarModel calendarModel,
    TextEditingController controller,
    pranaam_detail.PranaamDetail? pranaamDetail,
    BuildContext context, {
    required bool isRoundTrip,
    required TextEditingController flightController,
  }) {
    controller.text = formatDateTime(
      dateTimeType: calendarModel.departureDate,
      dateTimeFormat: dataTimeFormatDayMonth,
    );
    if (isRoundTrip) {
      departureDateTime = calendarModel.departureDate;
      _initDepartureFlightData();
    } else {
      arrivalDateTime = calendarModel.departureDate;
      if (pranaamDetail?.tripDetails?.serviceTypeId == roundTripServiceId &&
          arrivalDateTime.isAfter(departureDateTime)) {
        departureDateTime = calendarModel.departureDate;
        departureDateController.text = formatDateTime(
          dateTimeType: calendarModel.departureDate,
          dateTimeFormat: dataTimeFormatDayMonth,
        );
        _initDepartureFlightData();
        getPranaamFlight(
          createGetFlightRequestModel(
            pranaamDetail,
            calendarModel.departureDate,
            context,
            isRoundTrip: true,
          ),
          isRoundTrip: true,
        );
      } else if (pranaamDetail?.tripDetails?.serviceTypeId == id_2) {
        departureDateTime = calendarModel.departureDate;
        departureDateController.text = formatDateTime(
          dateTimeType: calendarModel.departureDate,
          dateTimeFormat: dataTimeFormatDayMonth,
        );
        _initDepartureFlightData();
        getPranaamFlight(
          createGetFlightRequestModel(
            pranaamDetail,
            calendarModel.departureDate,
            context,
            isRoundTrip: true,
          ),
          isRoundTrip: true,
        );
      }
      _initArrivalFlightData();
    }
    flightController.clear();
    getPranaamFlight(
      createGetFlightRequestModel(
        pranaamDetail,
        calendarModel.departureDate,
        context,
        isRoundTrip: isRoundTrip,
      ),
      isRoundTrip: isRoundTrip,
    );
  }

  Future<void> getPranaamFlight(
    Map<String, dynamic> flightRequestModel, {
    required bool isRoundTrip,
  }) async {
    if (isRoundTrip) {
      selectedDepartureFlightNumber = '';
      pranaamDepartureFlightsResponse.value = ADResponseState.loading();
      final ADResponseState adResponseState =
          await _pranaamAppDataRepository.getFlights(flightRequestModel);
      pranaamDepartureFlightsResponse.value = adResponseState;
    } else {
      selectedArrivalFlightNumber = '';
      pranaamArrivalFlightsResponse.value = ADResponseState.loading();
      final ADResponseState adResponseState =
          await _pranaamAppDataRepository.getFlights(flightRequestModel);
      pranaamArrivalFlightsResponse.value = adResponseState;
    }
    _verifyRescheduleButton();
  }

  Map<String, dynamic> createGetFlightRequestModel(
    pranaam_detail.PranaamDetail? pranaamDetail,
    DateTime? date,
    BuildContext context, {
    required bool isRoundTrip,
  }) {
    return GetFlightsRequestModel(
      serviceType:
          getServiceTypeId(pranaamDetail?.tripDetails?.serviceType ?? '')
              .toString(),
      tripType: '',
      destinationAirport: isRoundTrip
          ? getDestAirportCodeForTransitAndRoundTrip(context, pranaamDetail) ??
              ''
          : pranaamDetail?.tripDetails?.destinationAirport ?? '',
      serviceAirport: isRoundTrip
          ? getServiceAirportCodeForTransitAndRoundTrip(pranaamDetail)
          : pranaamDetail?.tripDetails?.serviceAirport ?? '',
      trip: isRoundTrip ? '2' : '1',
      serviceDate: formatDateTime(
        dateTimeFormat: dataTimeFormatddMMyyyy,
        dateTimeType: date,
      ),
      originAirport: isRoundTrip
          ? getOriginAirportCodeForTransitAndRoundTrip(
                bookingDetailsResponseModel?.orderDetail?.pranaamDetail,
              ) ??
              ''
          : pranaamDetail?.tripDetails?.originAirport ?? '',
      travelSectorType: pranaamDetail?.tripDetails?.travelSectorId,
    ).toJson();
  }

  void selectFlightCallback(
    PranaamFlights flight,
    pranaam_detail.PranaamDetail? pranaamDetail, {
    required bool isRoundTrip,
    required BuildContext context,
  }) {
    if (isRoundTrip) {
      if (pranaamDetail?.tripDetails?.serviceTypeId == id_2) {
        /// Todo: refactor this
        if (sixHourValidation(
          '${flight.serviceDate} ${flight.serviceTime}',
          '${selectedArrivalFlight?.serviceDate ?? ''} ${selectedArrivalFlight?.serviceTime ?? ''}',
        )) {
          setDepartureData(flight);
        } else {
          SnackBarUtil.showSnackBar(
            context,
            'Service not available for selected flight',
          );
        }
      } else {
        setDepartureData(flight);
      }
    } else {
      selectedArrivalFlight = flight;
      //todo add try catch
      selectedArrivalServiceDateTime = DateFormat(
        Constant.dateFormat12,
      ).parse(flight.serviceDateTime);
      selectedArrivalFlightNumber = flight.flightFinalNumber;
      selectedArrivalDate = formatDateTime(
        dateTimeFormat: Constant.dateFormat3,
        dateString: flight.serviceDateTime,
      );
      selectedArrivalTime = reviewServiceTime(flight.serviceDateTime);
      adLog(
        'selectedFlightNumber $selectedArrivalFlightNumber \n selected date $selectedArrivalDate \n selected Time $selectedArrivalTime',
      );
    }
    _verifyRescheduleButton();
  }

  void setDepartureData(PranaamFlights flight) {
    selectedDepartureFlight = flight;
    selectedDepartureServiceDateTime =
        DateFormat(Constant.dateFormat12).parse(flight.serviceDateTime);
    selectedDepartureFlightNumber = flight.flightFinalNumber;
    selectedDepartureDate = formatDateTime(
      dateTimeFormat: Constant.dateFormat3,
      dateString: flight.serviceDateTime,
    );
    selectedDepartureTime = reviewServiceTime(flight.serviceDateTime);
    adLog(
      'selectedFlightNumber $selectedArrivalFlightNumber \n selected date $selectedArrivalDate \n selected Time $selectedArrivalTime',
    );
  }

  bool sixHourValidation(String laterDateTime, String earlierDateTime) {
    final Duration? duration = getDurationBetweenDateTimes(
      laterDateTime: stringToDateTimeNew(
        date: laterDateTime,
        incomingDateFormat: 'dd-MM-yyyy hh:mm:ss',
      ),
      earlierDateTime: stringToDateTimeNew(
        date: earlierDateTime,
        incomingDateFormat: 'dd-MM-yyyy hh:mm:ss',
      ),
    );
    final int minutes = duration?.inMinutes ?? 0;
    return minutes >= 0 &&
        minutes <= validTimeDifferenceForSecondFlightInTransit;
  }

  Future<void> rescheduleBooking(
    BuildContext context, {
    required bool isRoundTrip,
    required bool isFree,
  }) async {
    try {
      resheduleBookingResponse = ADResponseState.loading();
      notifyListeners();
      resheduleBookingResponse =
          await _pranaamAppDataRepository.rescheduleBooking(
        getRescheduleBookingRequestModel(isRoundTrip: isRoundTrip),
      );
      // notifyListeners();
      switch (resheduleBookingResponse.viewStatus) {
        case Status.complete:
          context.read<PranaamAppDataStateManagement>().bookingID =
              bookingAndCancellationState.bookingId.toString();
          PranaamRescheduleGaAnalytics().rescheduleEvent(
            ClickEvents.book_pranaam_reschedule_confirm,
            context.read<BookingAndCancellationState>(),
            pranaamRescheduleStateManagement:
                context.read<PranaamRescheduleStateManagement>(),
          );
          if (isFree) {
            final PaymentMethodState _paymentMethodViewModel =
                PaymentMethodState();
            final CheckOutRequest checkOutRequest = CheckOutRequest(
              paymentCallbackUrl:
                  'https://shop.merchant.com/payments/handleResponse',
              businessSubType: businessTypePranaam,
              orderReferenceId: bookingAndCancellationState
                      .bookingDetailsResponse?.orderReferenceId ??
                  '',
              channelid: Platform.isAndroid ? 'ANDROID' : 'IOS',
            );
            final Map map = (jsonDecode(jsonEncode(checkOutRequest))) as Map
              ..removeWhere(
                (key, value) => key == null || value == null || value == 0,
              );
            await _paymentMethodViewModel
                .checkoutApiCall(
              jsonEncode(map),
              context,
              isFreeReschedule: true,
            )
                .then((value) {
              final ADResponseState responseState = value;
              final CheckOutResponse data = value.data;
              if (responseState.viewStatus == Status.complete) {
                if (data.paymentMethodType?.toLowerCase() == 'not-applicable') {
                  notifyListeners();
                  unawaited(
                    context
                        .read<BookingAndCancellationState>()
                        .getBookingDetails(
                          orderId: context
                                  .read<BookingAndCancellationState>()
                                  .bookingDetailsResponse
                                  ?.orderReferenceId ??
                              '',
                          fromInit: true,
                        ),
                  );
                  navigateUsingPushNamedAndRemoveUntilV2(
                    context,
                    pranaamConfirmationScreen,
                    myAccountView,
                    argumentsData: [
                      const CreateBookingRequestModel(),
                      bookingAndCancellationState.bookingId.toString(),
                    ],
                  );
                }
              } else if (responseState.viewStatus == Status.error) {
                resheduleBookingResponse =
                    ADResponseState.error(value.errorCode);
                notifyListeners();
                SnackBarUtil.showSnackBar(
                  context,
                  value.errorCode.toString().localize(context),
                );
              }
            });
          } else {
            await ProfileSingleton.profileSingleton
                .readUserProfile(SharedPrefUtilsKeys.keyUserProfileData)
                .then(
              (userData) async {
                final cartResponse = await context
                    .read<PranaamAppDataStateManagement>()
                    .getUserCart(
                      context.read<AppSessionState>(),
                      userData.userId,
                    );
                notifyListeners();
                if (cartResponse.viewStatus == Status.complete) {
                  navigateToScreenUsingNamedRouteWithArguments(
                    context,
                    genericPaymentScreen,
                    argumentObject: PaymentModule.pranaam,
                  );
                }
              },
            );
          }
          break;
        case Status.error:
          SnackBarUtil.showSnackBar(
            context,
            resheduleBookingResponse.data != null
                ? RescheduleBookingResponseModel.fromJson(
                    resheduleBookingResponse.data,
                  ).meta.error.description
                : resheduleBookingResponse.message ?? '',
          );
          resheduleBookingResponse = ADResponseState.init();
          notifyListeners();
          break;
        case Status.none:
        case Status.loading:
        case Status.errorWithCode:
        default:
          break;
      }
    } on Exception catch (e) {
      resheduleBookingResponse = ADResponseState.error(e.toString());
      notifyListeners();
    }
  }

  RescheduleBookingRequestModel getRescheduleBookingRequestModel({
    required bool isRoundTrip,
  }) {
    final pranaam_detail.RescheduleCharges rescheduleDetail =
        bookingDetailsResponseModel?.orderDetail?.pranaamDetail?.packageDetail
                ?.rescheduleCharges ??
            const pranaam_detail.RescheduleCharges();
    return RescheduleBookingRequestModel(
      rescheduleCharges: getRescheduleCharges(rescheduleDetail),
      bookingId: bookingAndCancellationState
              .bookingDetailsResponse?.orderDetail?.pranaamDetail?.bookingId ??
          0,
      referenceId: bookingAndCancellationState
              .bookingDetailsResponse?.orderReferenceId ??
          '',
      passengerIdList: passengerId,
      phoneNo: bookingAndCancellationState.bookingDetailsResponse?.orderDetail
              ?.pranaamDetail?.placardInfo?.mobileNumber ??
          '',
      countryDialCode: bookingAndCancellationState.bookingDetailsResponse
              ?.orderDetail?.pranaamDetail?.placardInfo?.countryDialCode ??
          '',
      isPartialReshedule: false,
      tripInfo: TripInfo(
        serviceDateTime: convertDateTimeToIso(
          inCommingFormat: 'yyyy-MM-dd HH:mm:ss',
          dateString: selectedArrivalFlight?.serviceDateTime ?? '',
        ),
        flightNumber: selectedArrivalFlight?.flightNo ?? '',
        transitRoundTripSecFlightNumber:
            int.parse(selectedDepartureFlight?.flightNo ?? '0'),
        flightName: selectedArrivalFlightNumber,
        flightTerminal: 'N/A',
        flightDate: universalDateFormatter(
          dateTimeObject: arrivalDateTime,
          requiredFormat: 'yyyy-MM-dd',
        ),
        flightTime: universalDateFormatter(
          inCommingFormat: 'HH:mm',
          requiredFormat: 'HH:mm:ss',
          dateString: selectedArrivalFlight?.flightTime ?? '',
        ),
        transitRoundTripSecFlightTerminal: 'N/A',
        roundTripSecServiceDateTime: isRoundTrip
            ? convertDateTimeToIso(
                inCommingFormat: 'yyyy-MM-dd HH:mm:ss',
                dateString: selectedDepartureFlight?.serviceDateTime ?? '',
              )
            : null,
        transitDestRoundTripSecOrigin: isRoundTrip
            ? bookingAndCancellationState.bookingDetailsResponse?.orderDetail
                    ?.pranaamDetail?.roundTripDetail?.originAirportId ??
                0
            : 0,
        transitRoundTripSecFlightDate: isRoundTrip
            ? universalDateFormatter(
                dateTimeObject: departureDateTime,
                requiredFormat: 'yyyy-MM-dd',
              )
            : '',
        transitRoundTripSecFlightName:
            isRoundTrip ? selectedDepartureFlight?.flightFinalNumber ?? '' : '',
        transitRoundTripSecFlightTime: isRoundTrip
            ? universalDateFormatter(
                inCommingFormat: 'HH:mm',
                requiredFormat: 'HH:mm:ss',
                dateString: selectedDepartureFlight?.flightTime ?? '',
              )
            : '',
      ),
      paymentInfo: PaymentInfo(
        status: 'success',
        udf1: bookingAndCancellationState
                .bookingDetailsResponse?.orderDetail?.pranaamDetail?.bookingId
                .toString() ??
            '',
        udf2: getServiceNameFromServiceTypeId(
          bookingAndCancellationState.bookingDetailsResponse?.orderDetail
                  ?.pranaamDetail?.tripDetails?.serviceTypeId ??
              0,
        ).toLowerCase(),
        udf3: bookingAndCancellationState
                .bookingDetailsResponse?.orderDetail?.pranaamDetail?.bookingId
                .toString() ??
            '',
        amount: getTotalRescheduleCharges(rescheduleDetail).toString(),
      ),
    );
  }

  double getRescheduleCharges(
    pranaam_detail.RescheduleCharges rescheduleDetail,
  ) {
    return rescheduleDetail.rescheduleAdultCharges;
  }

  double getTotalRescheduleCharges(
    pranaam_detail.RescheduleCharges rescheduleDetail,
  ) {
    final travellers =
        bookingDetailsResponseModel?.orderDetail?.pranaamDetail?.travelers ??
            [];
    int numberOfAdults = 0;
    int numberOfChildren = 0;
    int numberOfInfants = 0;
    for (final traveller in travellers) {
      if (traveller.passengerStatus?.toLowerCase() != 'cancelled') {
        if (ServiceBookingDetails.getInstance()
                .getPassengerType[traveller.passengerTypeId] ==
            'Adult') {
          numberOfAdults += 1;
        } else if (ServiceBookingDetails.getInstance()
                .getPassengerType[traveller.passengerTypeId] ==
            'Child') {
          numberOfChildren += 1;
        } else {
          numberOfInfants += 1;
        }
      }
    }
    final rescheduleCharges = (((rescheduleDetail.rescheduleAdultCharges +
                    rescheduleDetail.rescheduleAdultChargesSGST +
                    rescheduleDetail.rescheduleAdultChargesCGST) *
                numberOfAdults) +
            ((rescheduleDetail.rescheduleChildCharges +
                    rescheduleDetail.rescheduleChildChargesSGST +
                    rescheduleDetail.rescheduleChildChargesCGST) *
                numberOfChildren) +
            ((rescheduleDetail.rescheduleInfantCharges +
                    rescheduleDetail.rescheduleInfantChargesSGST +
                    rescheduleDetail.rescheduleInfantChargesCGST) *
                numberOfInfants))
        .toStringAsFixed(2);
    if (bookingDetailsResponseModel
            ?.orderDetail?.pranaamDetail?.tripDetails?.serviceTypeId ==
        roundTripServiceId) {
      bool isArrivalSame = false;
      bool isDepartureSame = false;
      try {
        isArrivalSame = arrivalFlightController.text ==
                bookingDetailsResponseModel
                    ?.orderDetail?.pranaamDetail?.tripDetails?.flightName &&
            bookingDetailsResponseModel?.orderDetail?.pranaamDetail?.tripDetails
                    ?.serviceDateTime ==
                selectedArrivalServiceDateTime;

        isDepartureSame = departureFlightController.text ==
                bookingDetailsResponseModel
                    ?.orderDetail?.pranaamDetail?.roundTripDetail?.flightName &&
            bookingDetailsResponseModel?.orderDetail?.pranaamDetail
                    ?.roundTripDetail?.serviceDateTime ==
                selectedDepartureServiceDateTime;
      } catch (e) {
        adLog(e.toString());
        isArrivalSame = false;
        isDepartureSame = false;
      }

      final bool noLegsChanged = isArrivalSame && isDepartureSame;
      if (noLegsChanged) {
        return 0;
      }
      final bool bothLegsChanged = !isArrivalSame && !isDepartureSame;

      const k_2 = 2;
      return (double.tryParse(rescheduleCharges) ?? 0.0) *
          (bothLegsChanged ? k_2 : 1);
    }
    return double.tryParse(rescheduleCharges) ?? 0.0;
  }

  String? getOriginAirportCodeForTransitAndRoundTrip(
    pranaam_detail.PranaamDetail? pranaamDetail,
  ) {
    return pranaamDetail?.tripDetails?.serviceTypeId == id_3
        ? pranaamDetail?.roundTripDetail?.originAirport
        : pranaamDetail?.tripDetails?.destinationAirport;
  }

  String? getDestAirportCodeForTransitAndRoundTrip(
    BuildContext context,
    pranaam_detail.PranaamDetail? pranaamDetail,
  ) {
    return pranaamDetail?.tripDetails?.serviceTypeId == id_3
        ? pranaamDetail?.roundTripDetail?.destinationAirport
        : getAirportCodeFromAirportId(
            pranaamDetail?.tripDetails?.transitDestRoundTripSecOrigin
                    .toString() ??
                '',
            context.read<SiteCoreStateManagement>(),
          );
  }

  String getServiceAirportCodeForTransitAndRoundTrip(
    pranaam_detail.PranaamDetail? pranaamDetail,
  ) {
    return pranaamDetail?.tripDetails?.serviceTypeId == id_3
        ? pranaamDetail?.roundTripDetail?.serviceAirport ?? ''
        : pranaamDetail?.tripDetails?.serviceAirport ?? '';
  }
}
