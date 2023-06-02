/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/analytics/screen_events.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/bottom_bar.dart';
import 'package:adani_airport_mobile/modules/bottom_tab/custom_tab_scaffold.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/dashboard_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/views/no_package_found.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/city_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/travellers.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/calender/views/date_range_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/ga_analytics/pranaam_booking_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_flights/request_model/get_flights_request_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_flights/response_model/pranaam_flights.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_packages/api_request_model/get_packages_request_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_packages/api_response_model/get_packages_response_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/date_of_journey_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/service_booking_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/service_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/travel_sector_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/service_booking/widget_view/booking_screen_widget_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/service_booking/widget_view/service_booking_form.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/service_booking/widget_view/view/booked_to_capacity_error_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/ga_helper/ga_event.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/service_booking/service_booking_details.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/utils/stand_alone_service_helper.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';

///this class is used to separate logic from layout here we define logic
class BookingScreenController extends State<ServiceBookingForm>
    with AutomaticKeepAliveClientMixin {
  BookingScreenController({
    this.item,
    this.shouldBeKeptAlive = true,
  });

  final bool shouldBeKeptAlive;

  /// dashboard item currently used for setting padding.
  final DashBoardItem? item;

  /// logic of booking screen
  PranaamAppDataStateManagement bookingServiceState =
      PranaamAppDataStateManagement();

  /// logic of booking screen
  CalendarModel calendarModel = CalendarModel(
    tripType: TripType.oneWay,
    departureDate: DateTime.now(),
  );

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    bookingServiceState = context.read<PranaamAppDataStateManagement>();

    ///TODO vaibhav why we are clear flight data
    //bookingServiceState.flightDetailModelList.clear();

    ScreenEvents.booking_form_screen.log();

    adLog(
      'editBooking_form..${bookingServiceState.serviceBookingData.toString()}',
    );

    if (bookingServiceState.isFormFilled) {
      adLog('if editBookingForm ${bookingServiceState.isFormFilled}');
      fillForm();
    } else {
      adLog('else editBookingForm');
      if (bookingServiceState.pranaamBookingFormInit) {
        bookingServiceState
          ..setInitialDataBookingForm()
          ..pranaamBookingFormInit = false;
        setCurrentDateInJourneyModel();
      }
    }
  }

  @override
  void dispose() {
    bookingServiceState.setAnimationLoadingFalse();
    super.dispose();
  }

  void updateUI() {
    // state.bookingServiceState.editForm(value: false);
    if (bookingServiceState.serviceBookingData.selectedService?.serviceId ==
        id_2) {
      bookingServiceState
        ..updateIsTransitVisible(value: true)
        ..updateIsGuestVisible(value: false)
        ..updateIsRoundTripVisible(value: false);
    } else if (bookingServiceState
            .serviceBookingData.selectedService?.serviceId ==
        id_3) {
      bookingServiceState
        ..updateIsTransitVisible(value: false)
        ..updateIsGuestVisible(value: false)
        ..updateIsRoundTripVisible(value: true);
    } else {
      bookingServiceState
        ..updateIsTransitVisible(value: false)
        ..updateIsRoundTripVisible(value: false)
        ..updateIsGuestVisible(value: true);
    }
  }

  /// this is used to handle listener of book button
  void handleElevatedButtonTapHandler(
    BuildContext context,
  ) {
    adLog('inside book now on tap');
    final GetPackagesRequestModel getPackagesRequestModel =
        createPackageRequestModel();
    createServiceBookingModel();
    bookingServiceState
      ..isAnimationLoading = true
      ..notifyListeners();
    final CustomTabScaffold customTabScaffold =
        BottomBarState.key.currentWidget as CustomTabScaffold;
    customTabScaffold.heightNotifier.value = 0;
    bookingServiceState.getPackages(getPackagesRequestModel).then((value) {
      adLog('value in srp page $value');
      switch (value.viewStatus) {
        case Status.complete:
          if (widget.showImage) {
            adLog('insideEditBooking');
            createServiceBookingModel();
            // bookingServiceState.isFormFilled = false;
            final Data data = bookingServiceState.packagesResponse.data;
            if (data.packageDetails.isNotEmpty) {
              if (widget.fromDashboard) {
                bookingServiceState
                  ..isAnimationLoading = false
                  ..notifyListeners();
                final val = Navigator.of(context).pushNamed(selectPackage);
                adLog('$val');
              } else {
                adLog('Modify clicked from Edit Booking');
                GaEvent.getInstance().pranaamBookModifyEvent(
                  context.read<PranaamAppDataStateManagement>(),
                );
                ClickEvents.book_pranaam_modify
                    .logEvent(parameters: GaEvent.getInstance().parameterMap);
                navigatorPopScreen(context);
              }
            } else {
              PranaamBookingGaAnalytics().serviceUnavailableGaAnalytics(
                context.read<PranaamAppDataStateManagement>(),
              );
              adShowBottomSheet(
                context: context,
                childWidget: BookedToCapacityErrorScreen(
                  textOne:
                      'pranaam_booked_to_capacity_msg_one'.localize(context),
                  textTwo:
                      'pranaam_booked_to_capacity_msg_two'.localize(context),
                  textThree:
                      'pranaam_booked_to_capacity_msg_three'.localize(context),
                  textFour:
                      'pranaam_booked_to_capacity_msg_four'.localize(context),
                ),
                headerTitle:
                    'pranaam_booked_to_capacity_title'.localize(context),
              );
            }
          } else {
            final Data data = bookingServiceState.packagesResponse.data;
            if (data.packageDetails.isNotEmpty) {
              createServiceBookingModel();
              // bookingServiceState.isFormFilled = true;
              adLog('Book Now clicked from Dashboard');

              ///GA event book now pranaam
              GaEvent.getInstance().pranaamBookNowEvent(
                context.read<PranaamAppDataStateManagement>(),
              );
              ClickEvents.book_pranaam_start
                  .logEvent(parameters: GaEvent.getInstance().parameterMap);
              bookingServiceState
                ..isAnimationLoading = false
                ..notifyListeners();
              Navigator.of(context).pushNamed(selectPackage).then((value) {
                if (value != null) {
                  adLog(
                    'pop $value ',
                  );
                  fillForm();
                }
              });
            } else {
              PranaamBookingGaAnalytics().serviceUnavailableGaAnalytics(
                context.read<PranaamAppDataStateManagement>(),
              );
              adShowBottomSheet(
                context: context,
                childWidget: BookedToCapacityErrorScreen(
                  textOne:
                      'pranaam_booked_to_capacity_msg_one'.localize(context),
                  textTwo:
                      'pranaam_booked_to_capacity_msg_two'.localize(context),
                  textThree:
                      'pranaam_booked_to_capacity_msg_three'.localize(context),
                  textFour:
                      'pranaam_booked_to_capacity_msg_four'.localize(context),
                ),
                headerTitle:
                    'pranaam_booked_to_capacity_title'.localize(context),
              );
              bookingServiceState
                ..isAnimationLoading = false
                ..notifyListeners();
            }
          }
          // bookingServiceState.isAnimationLoading = false;
          // bookingServiceState.notifyListeners();
          break;
        case Status.error:
          bookingServiceState.isAnimationLoading = false;
          bookingServiceState.notifyListeners();
          updateButtonStateOnErrorPackages(
            context,
            bookingServiceState.packagesResponse.message ??
                'Something went wrong',
          );
          ClickEvents.book_pranaam_error
              .logEvent(parameters: GaEvent.getInstance().parameterMap);
          break;
        case Status.none:
          break;
        case Status.loading:
          break;
        default:
          break;
      }
    });
  }

  String getServiceAirport({bool isTransit = false}) {
    // if (bookingServiceState.isFormFilled) {
    //   adLog('getServiceAirport ${bookingServiceState.isFormFilled}');
    //   adLog('ServiceAirport ${bookingServiceState.serviceAirportCode}');
    //
    //   return bookingServiceState.serviceAirportCode ?? '';
    // } else {
    adLog('getServiceAirport ${bookingServiceState.isFormFilled}');

    if (bookingServiceState.selectedServiceId == id_1.toString()) {
      adLog('Departure Airport');
      bookingServiceState
        ..serviceAirport = bookingServiceState.selectedOriginCityController.text
        ..serviceAirportCode = bookingServiceState.fromCityCode
        ..serviceAirportId =
            bookingServiceState.departureCityDetailModel?.airportID;

      return bookingServiceState.fromCityCode.validateWithDefaultValue();
    } else {
      if (bookingServiceState.selectedServiceId == id_4.toString()) {
        bookingServiceState
          ..serviceAirport =
              bookingServiceState.selectedDestinationCityController.text
          ..serviceAirportCode = bookingServiceState.toCityCode
          ..serviceAirportId =
              bookingServiceState.arrivalCityDetailModel?.airportID;
        adLog('Service Airport${bookingServiceState.serviceAirport}');
        return bookingServiceState.toCityCode.validateWithDefaultValue();
      } else {
        if (bookingServiceState.selectedServiceId == id_2.toString()) {
          bookingServiceState
            ..serviceAirport =
                bookingServiceState.selectedDestinationCityController.text
            ..serviceAirportCode = bookingServiceState.toCityCode
            ..serviceAirportId =
                bookingServiceState.arrivalCityDetailModel?.airportID;
          return bookingServiceState.toCityCode.validateWithDefaultValue();
        } else {
          if (bookingServiceState.selectedServiceId == id_3.toString()) {
            if (isTransit) {
              bookingServiceState
                ..serviceAirport =
                    bookingServiceState.selectedOriginCityController.text
                ..serviceAirportCode = bookingServiceState.roundGoingToCode
                ..serviceAirportId =
                    bookingServiceState.departureCityDetailModel?.airportID;
              return bookingServiceState.roundGoingToCode
                  .validateWithDefaultValue();
            } else {
              bookingServiceState
                ..serviceAirport =
                    bookingServiceState.selectedOriginCityController.text
                ..serviceAirportCode = bookingServiceState.fromCityCode
                ..serviceAirportId =
                    bookingServiceState.departureCityDetailModel?.airportID;
              return bookingServiceState.fromCityCode
                  .validateWithDefaultValue();
            }
          }
        }
      }
    }
    return '';
    //   }
  }

  String getTransitServiceAirport() {
    return bookingServiceState.toCityCode.validateWithDefaultValue();
  }

  void createServiceBookingModel() {
    // if (bookingServiceState.isFormFilled) {
    //   final ServiceBookingModel serviceBookingModel = ServiceBookingModel()
    //     ..selectedService = ServiceModel(
    //       serviceId: bookingServiceState
    //               .serviceBookingData.selectedService?.serviceId ??
    //           0,
    //       serviceTitle: selectedServiceController.text,
    //     )
    //     ..selectedTravelSector = TravelSectorModel(
    //       travelSectorId: bookingServiceState
    //               .serviceBookingData.selectedTravelSector?.travelSectorId ??
    //           0,
    //       travelSectorTitle: getTravelSector(),
    //     )
    //     ..selectedCityDetailFrom =
    //         bookingServiceState.serviceBookingData.selectedCityDetailFrom
    //     ..selectedCityDetailTo =
    //         bookingServiceState.serviceBookingData.selectedCityDetailTo
    //     ..selectedFlightDetailModel =
    //         bookingServiceState.serviceBookingData.selectedFlightDetailModel
    //     ..dateOfJourney = bookingServiceState.serviceBookingData.dateOfJourney
    //     ..travellers = bookingServiceState.serviceBookingData.travellers
    //     ..arriveFrom = bookingServiceState.serviceBookingData.arriveFrom
    //     ..goingTo = bookingServiceState.serviceBookingData.goingTo
    //     ..roundTripTransitFlights =
    //         bookingServiceState.serviceBookingData.roundTripTransitFlights
    //     ..roundTripTransitDate =
    //         bookingServiceState.serviceBookingData.roundTripTransitDate;
    //   bookingServiceState.updateServiceBookingData(serviceBookingModel);
    //
    //   adLog(
    //     'createServiceBookingModel ISFORMFILLED ${serviceBookingModel.toString()}',
    //   );
    // } else {
    final ServiceBookingModel serviceBookingModel = ServiceBookingModel()
      ..selectedService = ServiceModel(
        serviceId: int.parse(
          bookingServiceState.selectedServiceId.validateWithDefaultValue(),
        ),
        serviceTitle: bookingServiceState.selectedServiceController.text,
      )
      ..selectedTravelSector = TravelSectorModel(
        travelSectorId: int.parse(
          bookingServiceState.selectedTravelSectorId.validateWithDefaultValue(),
        ),
        travelSectorTitle:
            bookingServiceState.selectedTravelSectorController.text,
      )
      ..selectedCityDetailFrom = bookingServiceState.departureCityDetailModel
      ..selectedCityDetailTo = bookingServiceState.arrivalCityDetailModel
      ..selectedFlightDetailModel = bookingServiceState.pranaamADFlights
      ..dateOfJourney = bookingServiceState.dateOfJourneyModel
      ..travellers = bookingServiceState.travellers
      ..arriveFrom = bookingServiceState.transitDetailModel
      ..goingTo = bookingServiceState.roundDetailModel
      ..roundTripTransitFlights = bookingServiceState.roundTripRoundTripFlights
      ..roundTripTransitDate = bookingServiceState.transitDateModel
      ..serviceAirport = bookingServiceState.serviceAirport;
    bookingServiceState
      ..editForm(value: false)
      ..updateServiceBookingData(serviceBookingModel)
      ..editForm(value: true);

    adLog(
      'createServiceBookingModel ${serviceBookingModel.toString()}',
    );
    // }
  }

  void updateButtonStateOnErrorPackages(
    BuildContext context,
    String errorMessage,
  ) {
    //TODO as of now handle edit form need to handle book now scenario
    adLog(errorMessage);
    final bottomSheet = showModalBottomSheet(
      useRootNavigator: true,
      backgroundColor: context.adColors.whiteTextColor,
      elevation: context.k_8,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(context.k_22),
        ),
      ),
      context: context,
      builder: (dialogContext) {
        return NoPackageFound(
          detailString: 'package_not_available'.localize(context),
          titleString: 'package_not_found'.localize(context),
          cancelText: 'done'.localize(context),
          yesCallBack: () async => navigatorPopScreen(dialogContext),
          noCallBack: () => navigatorPopScreen(dialogContext),
        );
      },
    );
    adLog('$bottomSheet.this');
    // SnackBarUtil.showSnackBar(context, errorMessage);
    bookingServiceState.editForm(value: true);
  }

  GetPackagesRequestModel createPackageRequestModel() {
    final GetPackagesRequestModel getPackagesRequestModel =
        GetPackagesRequestModel(
      serviceTypeId:
          bookingServiceState.selectedServiceId.validateWithDefaultValue(),
      serviceType: bookingServiceState.selectedServiceController.text,
      travelSector: getTravelSector(),
      originAirport:
          bookingServiceState.fromCityCode.validateWithDefaultValue(),
      destinationAirport:
          bookingServiceState.toCityCode.validateWithDefaultValue(),
      serviceDate: bookingServiceState.selectedDate.validateWithDefaultValue(),
      serviceTime: bookingServiceState.selectedTime.validateWithDefaultValue(),
      adultCount: bookingServiceState.travellers.adults,
      childCount: bookingServiceState.travellers.children,
      infantCount: bookingServiceState.travellers.infants,
      serviceAirportId:
          int.tryParse(bookingServiceState.serviceAirportId ?? ''),
      roundTransitServiceDate:
          int.tryParse(bookingServiceState.selectedServiceId ?? '') ==
                      roundTripServiceId ||
                  int.tryParse(bookingServiceState.selectedServiceId ?? '') ==
                      transitServiceId
              ? bookingServiceState.selectedDate
              : null,
      roundTransitServiceTime:
          int.tryParse(bookingServiceState.selectedServiceId ?? '') ==
                      roundTripServiceId ||
                  int.tryParse(bookingServiceState.selectedServiceId ?? '') ==
                      transitServiceId
              ? bookingServiceState.selectedTime
              : null,
    );
    return getPackagesRequestModel;
  }

  String getTravelSector() {
    ///Because of this line, issue 6249 is happening, Bhaskar please check why you added this here
    //resetFlightValueNotifiers(id_3);
    return bookingServiceState.selectedTravelSectorController.text;
  }

  void onFlightListCallBack(
    PranaamFlights pranaamFlights,
    TextEditingController controller, {
    bool isTransit = false,
  }) {
    if (bookingServiceState.selectedServiceId == id_3.toString()) {
      bookingServiceState
        ..getFlights(
          createFlightRequestModel(id_3),
          id_3,
        )
        ..flightController.clear();
    }
    if (isTransit) {
      bookingServiceState.transitFlightNotifier.value = '';
      bookingServiceState.roundTripRoundTripFlights = pranaamFlights;
      adLog(
        'Selected Transit Flight Number ${pranaamFlights.flightFinalNumber}',
      );
      adLog('Selected Transit Flight Time ${pranaamFlights.serviceDateTime}');
      bookingServiceState
        ..selectedTransitDate = formatDateTime(
          dateTimeFormat: dataTimeFormatddMMyyyy,
          dateString: pranaamFlights.serviceDateTime,
        )
        ..selectedTransitTime = formatTime(pranaamFlights.serviceDateTime);
      adLog(
        'API Transit Flight Date ${bookingServiceState.selectedTransitDate}',
      );
      adLog(
        'API Transit Flight Time ${bookingServiceState.selectedTransitTime}',
      );

      adLog(
        'API Second Flight Date ${bookingServiceState.selectedTransitDate}',
      );
      adLog(
        'API Second Flight Time ${bookingServiceState.roundTripRoundTripFlights?.flightTime}',
      );
      adLog('API First Flight Date ${bookingServiceState.selectedDate}');
      adLog(
        'API First Service Time ${bookingServiceState.pranaamADFlights?.serviceTime}',
      );

      if (timeDiffGreaterThenCurrentTime(
        datetime1: DateFormat('dd-MM-yyyy hh:mm').parse(
          '${bookingServiceState.selectedTransitDate} ${bookingServiceState.selectedTransitTime}',
        ),
        dateTime2: DateTime.now(),
      )) {
        if (bookingServiceState.selectedFlightController.text.isNotEmpty) {
          setSixHourValidation(
            controller,
            bookingServiceState.roundTripRoundTripFlights ??
                const PranaamFlights(),
          );
        } else {
          controller.text = bookingServiceState
                  .roundTripRoundTripFlights?.flightFinalNumber ??
              '';
          setServiceTime();
        }
      } else {
        SnackBarUtil.showSnackBar(context, 'Flight departed');
      }
    } else {
      bookingServiceState.flightNotifier.value = '';
      bookingServiceState.pranaamADFlights = pranaamFlights;

      adLog('Selected Flight Number ${pranaamFlights.flightFinalNumber}');
      adLog('Selected Flight Time ${pranaamFlights.serviceDateTime}');

      bookingServiceState
        ..selectedDate = formatDateTime(
          dateTimeFormat: dataTimeFormatddMMyyyy,
          dateString: pranaamFlights.serviceDateTime,
        )
        ..selectedTime = formatTime(pranaamFlights.serviceDateTime);
      // bookingServiceState.selectedFlightDetailModel = pranaamFlights;
      adLog('API Flight Date ${bookingServiceState.selectedDate}');
      adLog('API Flight Time ${bookingServiceState.selectedTime}');
      if (timeDiffGreaterThenCurrentTime(
        datetime1: DateFormat('dd-MM-yyyy hh:mm').parse(
          '${bookingServiceState.selectedDate} ${bookingServiceState.selectedTime}',
        ),
        dateTime2: DateTime.now(),
      )) {
        if (bookingServiceState.flightController.text.isNotEmpty) {
          setSixHourValidation(
            controller,
            bookingServiceState.pranaamADFlights ?? const PranaamFlights(),
          );
        } else {
          controller.text =
              bookingServiceState.pranaamADFlights?.flightFinalNumber ?? '';
          setServiceTime();
        }
      } else {
        SnackBarUtil.showSnackBar(context, 'Flight departed');
      }
    }
  }

  /// this method is used to show 6hrs validation toast between two flights.
  void setSixHourValidation(
    TextEditingController controller,
    PranaamFlights pranaamFlights,
  ) {
    if (bookingServiceState.selectedServiceId == id_2.toString()) {
      /// id 2 is for transit

      if (bookingServiceState.roundTripRoundTripFlights != null &&
          bookingServiceState.pranaamADFlights != null) {
        final Duration? duration = getDurationBetweenDateTimes(
          laterDateTime: stringToDateTimeNew(
            date:
                '${bookingServiceState.selectedTransitDate} ${bookingServiceState.roundTripRoundTripFlights?.flightTime}',
            incomingDateFormat: 'dd-MM-yyyy hh:mm',
          ),
          earlierDateTime: stringToDateTimeNew(
            date:
                '${bookingServiceState.selectedDate} ${bookingServiceState.pranaamADFlights?.serviceTime}',
            incomingDateFormat: 'dd-MM-yyyy hh:mm',
          ),
        );

        adLog(
          'in hours ${duration?.inHours} >>> in minutes ${duration?.inMinutes} ',
        );

        final int minutes = duration?.inMinutes ?? 0;

        if (minutes >= 0 &&
            minutes <= validTimeDifferenceForSecondFlightInTransit) {
          /// for transit we're checking time difference between arrival of
          /// first flight and departure of second flight
          /// if time difference is between 0 to 6 hours,
          /// the second flight can be selected.

          controller.text = pranaamFlights.flightFinalNumber;
          setServiceTime();
        } else {
          SnackBarUtil.showSnackBar(
            context,
            'Service not available for selected flight',
          );
        }
      } else {
        controller.text = pranaamFlights.flightFinalNumber;
        setServiceTime();
      }
    } else {
      controller.text = pranaamFlights.flightFinalNumber;
      setServiceTime();
    }
  }

  /// this method is used to used to get time difference between two times
  bool timeDiffGreaterThenCurrentTime({
    required DateTime datetime1,
    required DateTime dateTime2,
    int? hoursValue,
    int? minutesValue,
    bool? onlyHours,
  }) {
    final Duration durationTime = datetime1.difference(dateTime2);

    adLog(
      'Time difference between current time selected flight ${durationTime.inHours}',
    );

    return onlyHours ?? false
        ? durationTime.inHours >= (hoursValue ?? 0)
        : durationTime.inHours.isNegative
            ? !durationTime.inHours.isNegative
            : durationTime.inHours > (hoursValue ?? 0) ||
                durationTime.inMinutes > (minutesValue ?? 0);
  }

  void onServiceListCallBack(
    ServiceModel serviceModel,
    TextEditingController controller,
  ) {
    bookingServiceState.travelSectorList.clear();

    bookingServiceState
      ..selectedServiceModel = serviceModel
      ..selectedServiceId = serviceModel.serviceId.toString();
    controller.text = serviceModel.serviceTitle;
    adLog(
      'Selected Service ${bookingServiceState.selectedServiceModel?.serviceTitle}',
    );
    adLog(
      'Selected Service ID ${bookingServiceState.selectedServiceModel?.serviceId}',
    );

    setCurrentDateInJourneyModel();

    switch (bookingServiceState.selectedServiceModel?.serviceId) {
      case id_2:
        bookingServiceState
          ..updateIsTransitVisible(value: true)
          ..updateIsGuestVisible(value: false)
          ..updateIsRoundTripVisible(value: false);
        bookingServiceState.dateController.text = '';
        bookingServiceState.selectedServiceCheck.value =
            bookingServiceState.selectedServiceModel?.serviceTitle ?? '';

        setTransitDefaultDate();

        for (int index = 0;
            index < bookingServiceState.travelSectorListCount;
            index++) {
          if (bookingServiceState.listTravelSector?[index].isTransit == true) {
            bookingServiceState.travelSectorList.add(
              bookingServiceState.listTravelSector?[index] ??
                  TravelSectorModel(),
            );
          }
        }
        final TravelSectorModel travelSectorModel =
            bookingServiceState.travelSectorList.first;
        bookingServiceState.selectedTravelSectorController.text =
            travelSectorModel.travelSectorTitle;
        bookingServiceState.selectedTravelSectorModel = travelSectorModel;
        bookingServiceState.selectedTravelSectorId =
            travelSectorModel.travelSectorId.toString();

        clearDataForTransit();
        if (bookingServiceState.fromCityCode != null &&
            bookingServiceState.toCityCode != null) {
          bookingServiceState.getFlights(
            createFlightRequestModel(id_1),
            id_1,
          );
        }

        break;
      case id_3:
        bookingServiceState
          ..updateIsRoundTripVisible(value: true)
          ..updateIsGuestVisible(value: false)
          ..updateIsTransitVisible(value: false);
        bookingServiceState.selectedServiceCheck.value =
            bookingServiceState.selectedServiceModel?.serviceTitle ?? '';

        setRoundTripDefaultDate();

        for (int index = 0;
            index < bookingServiceState.travelSectorListCount;
            index++) {
          if (bookingServiceState.listTravelSector?[index].isTransit == false) {
            bookingServiceState.travelSectorList.add(
              bookingServiceState.listTravelSector?[index] ??
                  TravelSectorModel(),
            );
          }
        }
        final TravelSectorModel travelSectorModel =
            bookingServiceState.travelSectorList.first;
        bookingServiceState.selectedTravelSectorController.text =
            travelSectorModel.travelSectorTitle;
        bookingServiceState.selectedTravelSectorModel = travelSectorModel;
        bookingServiceState.selectedTravelSectorId =
            travelSectorModel.travelSectorId.toString();

        clearDataForTransit();
        if (bookingServiceState.fromCityCode != null &&
            bookingServiceState.toCityCode != null) {
          bookingServiceState.getFlights(
            createFlightRequestModel(id_1),
            id_1,
          );
        }
        break;
      default:
        bookingServiceState
          ..updateIsTransitVisible(value: false)
          ..updateIsRoundTripVisible(value: false);
        bookingServiceState.selectedServiceCheck.value =
            bookingServiceState.selectedServiceModel?.serviceTitle ?? '';

        for (int index = 0;
            index < bookingServiceState.travelSectorListCount;
            index++) {
          if (bookingServiceState.listTravelSector?[index].isTransit == false) {
            bookingServiceState.travelSectorList.add(
              bookingServiceState.listTravelSector?[index] ??
                  TravelSectorModel(),
            );
          }
        }
        final TravelSectorModel travelSectorModel =
            bookingServiceState.listTravelSector?.first ?? TravelSectorModel();
        bookingServiceState.selectedTravelSectorController.text =
            travelSectorModel.travelSectorTitle;
        bookingServiceState.selectedTravelSectorModel = travelSectorModel;
        bookingServiceState.selectedTravelSectorId =
            travelSectorModel.travelSectorId.toString();
        bookingServiceState.updateIsGuestVisible(value: true);

        clearDataForTransit();
        break;
    }
    resetValueNotifiers();
    bookingServiceState.flightTimeTopSpacing.value = 0;
    getSelectionHeading(serviceModel.serviceId);
  }

  void resetValueNotifiers() {
    bookingServiceState.originCityValueNotifier.value = '';
    bookingServiceState.destinationCityValueNotifier.value = '';
    bookingServiceState.flightNotifier.value = '';
    bookingServiceState.transitFlightNotifier.value = '';
    bookingServiceState.transitNotifier.value = '';
  }

  ///Update dateOfJourneyModel to current date when service changed
  void setCurrentDateInJourneyModel() {
    bookingServiceState
      ..isRoundOrTransitDateSelected = false
      ..dateOfJourneyModel = DateOfJourneyModel(
        dateOfJourney: DateTime.now(),
        dateSelected: true,
        dayMonth: formatDateTime(
          dateTimeType: DateTime.now(),
          dateTimeFormat: dataTimeFormatDayMonth,
        ),
      );
    bookingServiceState.selectedDateOfTravelController.text = formatDateTime(
      dateTimeType: DateTime.now(),
      dateTimeFormat: dataTimeFormatDayMonth,
    );
    bookingServiceState.selectedDate = formatDateTime(
      dateTimeFormat: dataTimeFormatddMMyyyy,
      dateTimeType: DateTime.now(),
    );
  }

  void setRoundTripDefaultDate() {
    bookingServiceState.dateController.text = formatDateTime(
      dateTimeType: DateTime.now().add(const Duration(days: 1)),
      dateTimeFormat: dataTimeFormatDayMonth,
    );
    bookingServiceState
      ..transitDateModel = DateOfJourneyModel(
        dateOfJourney: DateTime.now().add(const Duration(days: 1)),
        dateSelected: true,
        dayMonth: formatDateTime(
          dateTimeType: DateTime.now().add(const Duration(days: 1)),
          dateTimeFormat: dataTimeFormatDayMonth,
        ),
      )
      ..selectedTransitDate = formatDateTime(
        dateTimeFormat: dataTimeFormatddMMyyyy,
        dateString: DateTime.now().add(const Duration(days: 1)).toString(),
      );
  }

  void setTransitDefaultDate() {
    bookingServiceState.dateController.text = formatDateTime(
      dateTimeType: DateTime.now(),
      dateTimeFormat: dataTimeFormatDayMonth,
    );
    bookingServiceState
      ..transitDateModel = DateOfJourneyModel(
        dateOfJourney: DateTime.now(),
        dateSelected: true,
        dayMonth: formatDateTime(
          dateTimeType: DateTime.now(),
          dateTimeFormat: dataTimeFormatDayMonth,
        ),
      )
      ..selectedTransitDate = formatDateTime(
        dateTimeFormat: dataTimeFormatddMMyyyy,
        dateTimeType: DateTime.now(),
      );
  }

  void clearDataForTransit() {
    bookingServiceState
      ..fromCityCode = null
      ..toCityCode = null
      ..transitCityCode = null;
    bookingServiceState.selectedOriginCityController.clear();
    bookingServiceState.selectedDestinationCityController.clear();
    if (bookingServiceState.flightDetailModelList.isNotEmpty) {
      bookingServiceState.flightDetailModelList.clear();
    }
    bookingServiceState.goingToController.clear();
    bookingServiceState.transitToController.clear();
    bookingServiceState.flightController.clear();
    bookingServiceState.selectedFlightController.clear();
  }

  void swapControllers(ServiceModel serviceModel) {
    adLog('swapControllers Called');
    final TextEditingController swapController = TextEditingController();
    String swapCode;

    if (serviceModel.serviceId == id_1) {
      swapController.text =
          bookingServiceState.selectedOriginCityController.text;
      bookingServiceState.selectedOriginCityController.text =
          bookingServiceState.selectedDestinationCityController.text;
      bookingServiceState.selectedDestinationCityController.text =
          swapController.text;
      swapCode = bookingServiceState.fromCityCode.validateWithDefaultValue();
      bookingServiceState
        ..fromCityCode = bookingServiceState.toCityCode
        ..toCityCode = swapCode;
    } else {
      swapController.text =
          bookingServiceState.selectedDestinationCityController.text;
      bookingServiceState.selectedDestinationCityController.text =
          bookingServiceState.selectedOriginCityController.text;
      bookingServiceState.selectedOriginCityController.text =
          swapController.text;
      swapCode = bookingServiceState.toCityCode.validateWithDefaultValue();
      bookingServiceState
        ..toCityCode = bookingServiceState.fromCityCode
        ..fromCityCode = swapCode;
    }
    bookingServiceState.getFlights(
      createFlightRequestModel(id_1),
      id_1,
    );

    adLog('Arrive From ${bookingServiceState.fromCityCode}');
    adLog('Going to ${bookingServiceState.toCityCode}');
  }

  void onTravelListCallBack(
    TravelSectorModel travelSectorModel,
    TextEditingController controller,
  ) {
    bookingServiceState
      ..selectedTravelSectorModel = travelSectorModel
      ..selectedTravelSectorId = travelSectorModel.travelSectorId.toString();
    controller.text = travelSectorModel.travelSectorTitle;
    clearDataForTransit();
    bookingServiceState.flightTimeTopSpacing.value = 0;

    adLog(
      'Selected Travel Sector ${bookingServiceState.selectedTravelSectorModel?.travelSectorTitle}',
    );
    adLog(
      'Selected Travel Sector ID ${bookingServiceState.selectedTravelSectorModel?.travelSectorId}',
    );
  }

  void updateDate(
    CalendarModel calendarModel,
    TextEditingController controller, {
    bool isTransit = false,
  }) {
    adLog('DATETIME ${calendarModel.departureDate}');

    if (isTransit) {
      bookingServiceState
        ..transitDateModel = DateOfJourneyModel(
          dateOfJourney: calendarModel.departureDate,
          dateSelected: true,
          dayMonth: formatDateTime(
            dateTimeType: calendarModel.departureDate,
            dateTimeFormat: dataTimeFormatDayMonth,
          ),
        )
        ..selectedTransitDate = formatDateTime(
          dateTimeFormat: dataTimeFormatddMMyyyy,
          dateString: calendarModel.departureDate.toString(),
        );
      adLog('Selected Transit Flight Date ${bookingServiceState.selectedDate}');

      bookingServiceState.flightController.clear();
      if (bookingServiceState.fromCityCode != null &&
          bookingServiceState.toCityCode != null &&
          bookingServiceState.transitCityCode != null) {
        if (bookingServiceState.selectedServiceId == id_2.toString()) {
          bookingServiceState.getFlights(
            createFlightRequestModel(id_2),
            id_2,
          );
        } else {
          if (bookingServiceState.selectedServiceId == id_3.toString()) {
            bookingServiceState.getFlights(
              createFlightRequestModel(id_3),
              id_3,
            );
          }
        }
      }
      adLog(
        'Selected Transit Flight Date ${bookingServiceState.selectedTransitDate}',
      );
    } else {
      bookingServiceState
        ..dateOfJourneyModel = DateOfJourneyModel(
          dateOfJourney: calendarModel.departureDate,
          dateSelected: true,
          dayMonth: formatDateTime(
            dateTimeType: calendarModel.departureDate,
            dateTimeFormat: dataTimeFormatDayMonth,
          ),
        )
        ..selectedDate = formatDateTime(
          dateTimeFormat: dataTimeFormatddMMyyyy,
          dateString: calendarModel.departureDate.toString(),
        );
      adLog('Selected Flight Date ${bookingServiceState.selectedDate}');

      bookingServiceState.selectedFlightController.clear();

      if (bookingServiceState.fromCityCode != null &&
          bookingServiceState.toCityCode != null) {
        bookingServiceState.getFlights(
          createFlightRequestModel(id_1),
          id_1,
        );
      }

      if (bookingServiceState.selectedServiceId == id_3.toString()) {
        bookingServiceState.flightController.clear();

        bookingServiceState.dateController.text = formatDateTime(
          dateTimeType: DateTime.parse(calendarModel.departureDate.toString())
              .add(const Duration(days: 1)),
          dateTimeFormat: dataTimeFormatDayMonth,
        );
        bookingServiceState
          ..transitDateModel = DateOfJourneyModel(
            dateOfJourney:
                DateTime.parse(calendarModel.departureDate.toString())
                    .add(const Duration(days: 1)),
            dateSelected: true,
            dayMonth: formatDateTime(
              dateTimeType:
                  DateTime.parse(calendarModel.departureDate.toString())
                      .add(const Duration(days: 1)),
              dateTimeFormat: dataTimeFormatDayMonth,
            ),
          )
          ..selectedTransitDate = formatDateTime(
            dateTimeFormat: dataTimeFormatddMMyyyy,
            dateString: DateTime.parse(calendarModel.departureDate.toString())
                .add(const Duration(days: 1))
                .toString(),
          )
          ..getFlights(
            createFlightRequestModel(id_3),
            id_3,
          );
      }
      if (bookingServiceState.selectedServiceId == id_2.toString()) {
        bookingServiceState.flightController.clear();

        bookingServiceState.dateController.text = formatDateTime(
          dateTimeType: DateTime.parse(calendarModel.departureDate.toString()),
          dateTimeFormat: dataTimeFormatDayMonth,
        );
        bookingServiceState
          ..transitDateModel = DateOfJourneyModel(
            dateOfJourney:
                DateTime.parse(calendarModel.departureDate.toString()),
            dateSelected: true,
            dayMonth: formatDateTime(
              dateTimeType:
                  DateTime.parse(calendarModel.departureDate.toString()),
              dateTimeFormat: dataTimeFormatDayMonth,
            ),
          )
          ..selectedTransitDate = formatDateTime(
            dateTimeFormat: dataTimeFormatddMMyyyy,
            dateString: DateTime.parse(calendarModel.departureDate.toString())
                .toString(),
          );
        if (bookingServiceState.transitCityCode != null &&
            bookingServiceState.roundGoingToCode != null) {
          bookingServiceState.getFlights(
            createFlightRequestModel(id_2),
            id_2,
          );
        }
      }
    }

    controller.text = formatDateTime(
      dateTimeType: calendarModel.departureDate,
      dateTimeFormat: dataTimeFormatDayMonth,
    );
    bookingServiceState.flightTimeTopSpacing.value = 0;
  }

  void onCitySelected(
    CityDetailModel cityDetailModel,
    TextEditingController textEditingController,
    int selectionType,
    BuildContext context,
  ) {
    adLog('onCitySelected selectionType$selectionType');
    if (selectionType == id_4) {
      bookingServiceState.originCityValueNotifier.value = '';

      bookingServiceState
        ..fromCityCode = cityDetailModel.cityCode.validateWithDefaultValue()
        ..departureCityDetailModel = cityDetailModel;

      adLog('Arrive From ${bookingServiceState.fromCityCode}');

      if (bookingServiceState.fromCityCode ==
              bookingServiceState.transitCityCode &&
          bookingServiceState.selectedServiceId == id_3.toString()) {
        adLog('Source and Destination transit Same-----');
        showToastMessage(context);
        return;
      } else {
        if (bookingServiceState.fromCityCode ==
            bookingServiceState.toCityCode) {
          adLog('Source and not Same-----');
          showToastMessage(context);
        } else {
          textEditingController.text =
              cityDetailModel.cityName.validateWithDefaultValue();

          bookingServiceState.goingToController.text =
              cityDetailModel.cityName.validateWithDefaultValue();
          bookingServiceState
            ..roundGoingToCode =
                cityDetailModel.cityCode.validateWithDefaultValue()
            ..roundDetailModel = cityDetailModel;
        }
      }
      if (bookingServiceState.toCityCode != null) {
        bookingServiceState.selectedFlightController.clear();
        bookingServiceState.getFlights(
          createFlightRequestModel(id_4),
          id_4,
        );
      }
    } else {
      if (selectionType == id_1) {
        bookingServiceState.destinationCityValueNotifier.value = '';

        bookingServiceState
          ..toCityCode = cityDetailModel.cityCode.validateWithDefaultValue()
          ..arrivalCityDetailModel = cityDetailModel;

        adLog('Going To ${bookingServiceState.toCityCode}');
        if (bookingServiceState.fromCityCode ==
            bookingServiceState.toCityCode) {
          adLog('Source and Destination Same-----');
          showToastMessage(context);
        } else {
          adLog(
            'City Name ${cityDetailModel.cityName.validateWithDefaultValue()}',
          );
          textEditingController.text =
              cityDetailModel.cityName.validateWithDefaultValue();
        }

        bookingServiceState.selectedFlightController.clear();

        if (bookingServiceState.fromCityCode != null) {
          bookingServiceState.getFlights(
            createFlightRequestModel(id_1),
            id_1,
          );
        }
      } else {
        if (selectionType == id_2) {
          bookingServiceState.transitNotifier.value = '';
          bookingServiceState
            ..transitCityCode =
                cityDetailModel.cityCode.validateWithDefaultValue()
            ..transitDetailModel = cityDetailModel;

          if (bookingServiceState.selectedTransitDate != null) {
            bookingServiceState.flightController.clear();
            if (bookingServiceState.selectedServiceId == id_2.toString() &&
                bookingServiceState.toCityCode != null) {
              bookingServiceState.transitFlightDetailModelList.clear();
              bookingServiceState.getFlights(
                createFlightRequestModel(id_2),
                id_2,
              );
            } else {
              if (bookingServiceState.selectedServiceId == id_3.toString()) {
                bookingServiceState.transitFlightDetailModelList.clear();
                bookingServiceState.getFlights(
                  createFlightRequestModel(id_3),
                  id_3,
                );
              }
            }
          }

          if (bookingServiceState.toCityCode ==
                  bookingServiceState.transitCityCode &&
              bookingServiceState.selectedServiceId == id_2.toString()) {
            adLog('Source and Destination transit Same-----');
            showToastMessage(context);
            return;
          } else if (bookingServiceState.transitCityCode ==
              bookingServiceState.roundGoingToCode) {
            showToastMessage(context);
          } else {
            textEditingController.text =
                cityDetailModel.cityName.validateWithDefaultValue();
          }
        } else {
          if (selectionType == id_3) {
            bookingServiceState
              ..roundGoingToCode =
                  cityDetailModel.cityCode.validateWithDefaultValue()
              ..roundDetailModel = cityDetailModel;

            adLog('Round Going To ${bookingServiceState.roundGoingToCode}');
            if (bookingServiceState.transitCityCode ==
                bookingServiceState.roundGoingToCode) {
              adLog('Source and Destination Same-----');
              showToastMessage(context);
            } else {
              textEditingController.text =
                  cityDetailModel.cityName.validateWithDefaultValue();
            }
          }
        }
      }
    }

    bookingServiceState.flightTimeTopSpacing.value = 0;
  }

  Map<String, dynamic> createFlightRequestModel(int id) {
    final GetFlightsRequestModel getFlightsRequestModel;

    switch (id) {
      case id_2:
        getFlightsRequestModel = GetFlightsRequestModel(
          serviceType: bookingServiceState.selectedServiceId ?? '',
          originAirport: bookingServiceState.toCityCode ?? '',
          destinationAirport: bookingServiceState.transitCityCode ?? '',
          serviceAirport: getServiceAirport(),
          serviceDate: bookingServiceState.selectedTransitDate ?? '',
          tripType: '',
          trip: '2',
          travelSectorType:
              int.tryParse(bookingServiceState.selectedTravelSectorId ?? ''),
        );
        break;
      case id_3:
        getFlightsRequestModel = GetFlightsRequestModel(
          serviceType: bookingServiceState.selectedServiceId ?? '',
          originAirport: bookingServiceState.transitCityCode ?? '',
          destinationAirport: bookingServiceState.roundGoingToCode ?? '',
          serviceAirport: getServiceAirport(),
          serviceDate: bookingServiceState.selectedTransitDate ?? '',
          tripType: '',
          trip: '2',
          travelSectorType:
              int.tryParse(bookingServiceState.selectedTravelSectorId ?? ''),
        );
        break;

      default:
        getFlightsRequestModel = GetFlightsRequestModel(
          serviceType: bookingServiceState.selectedServiceId ?? '',
          originAirport: bookingServiceState.fromCityCode ?? '',
          destinationAirport: bookingServiceState.toCityCode ?? '',
          serviceAirport: getServiceAirport(),
          serviceDate: bookingServiceState.selectedDate ?? '',
          tripType: '',
          trip: '1',
          travelSectorType:
              int.tryParse(bookingServiceState.selectedTravelSectorId ?? ''),
        );
    }
    return getFlightsRequestModel.toJson();
  }

  void showToastMessage(BuildContext context) {
    SnackBarUtil.showSnackBar(
      context,
      'Departure and arrival cities can’t be the same',
    );
  }

  void onTravellersSelectedCallBack(
    Travellers value,
    TextEditingController controller,
  ) {
    bookingServiceState.travellers = value;
    controller.text = bookingServiceState.travellers.totalTravellers > 1
        ? '${bookingServiceState.travellers.totalTravellers} ${'guests'.localize(context)}'
        : '${bookingServiceState.travellers.totalTravellers} ${'guest'.localize(context)}';

    adLog('No of Guests ${bookingServiceState.travellers}');
  }

  bool isSelected({bool isTransit = false}) {
    return isTransit
        ? bookingServiceState.selectedServiceController.text.isNotEmpty &&
            bookingServiceState
                .selectedTravelSectorController.text.isNotEmpty &&
            bookingServiceState
                .selectedDateOfTravelController.text.isNotEmpty &&
            bookingServiceState.selectedOriginCityController.text.isNotEmpty &&
            bookingServiceState
                .selectedDestinationCityController.text.isNotEmpty &&
            bookingServiceState.selectedFlightController.text.isNotEmpty &&
            bookingServiceState.transitToController.text.isNotEmpty &&
            bookingServiceState.dateController.text.isNotEmpty
        : bookingServiceState.selectedServiceController.text.isNotEmpty &&
            bookingServiceState
                .selectedTravelSectorController.text.isNotEmpty &&
            bookingServiceState
                .selectedDateOfTravelController.text.isNotEmpty &&
            bookingServiceState.selectedOriginCityController.text.isNotEmpty &&
            bookingServiceState
                .selectedDestinationCityController.text.isNotEmpty;
  }

  bool isValidate() {
    adLog('isValidateCalled ${bookingServiceState.selectedServiceId}');
    return bookingServiceState.selectedServiceId == id_1.toString() ||
            bookingServiceState.selectedServiceId == id_4.toString()
        ? isAllDepartureFieldSelected()
        : isAllTransitFieldSelected();
  }

  bool isAllDepartureFieldSelected() {
    bool isValidate = false;
    if (bookingServiceState.selectedOriginCityController.text.isEmpty) {
      // originCityFocusNode.requestFocus();
      bookingServiceState.originCityValueNotifier.value =
          'select_origin'.localize(context);
      isValidate = false;
    }
    if (bookingServiceState.selectedDestinationCityController.text.isEmpty) {
      // destinationCityFocusNode.requestFocus();
      bookingServiceState.destinationCityValueNotifier.value =
          'select_destination'.localize(context);
      isValidate = false;
    }
    if (bookingServiceState.selectedFlightController.text.isEmpty) {
      // flightsFocusNode.requestFocus();
      bookingServiceState.flightNotifier.value =
          'select_flights'.localize(context);
      isValidate = false;
    } else {
      isValidate = true;
    }
    return isValidate;
  }

  bool isAllTransitFieldSelected() {
    bool isValidate = false;
    if (bookingServiceState.selectedOriginCityController.text.isEmpty) {
      bookingServiceState.originCityFocusNode.requestFocus();
      bookingServiceState.originCityValueNotifier.value =
          'select_origin'.localize(context);
      isValidate = false;
    }
    if (bookingServiceState.selectedDestinationCityController.text.isEmpty) {
      bookingServiceState.destinationCityFocusNode.requestFocus();
      bookingServiceState.destinationCityValueNotifier.value =
          bookingServiceState.selectedServiceId.toString() == id_2.toString()
              ? 'select_transit'.localize(context)
              : 'select_destination'.localize(context);
      isValidate = false;
    }
    if (bookingServiceState.selectedFlightController.text.isEmpty) {
      bookingServiceState.flightsFocusNode.requestFocus();
      bookingServiceState.flightNotifier.value =
          'select_flights'.localize(context);
      isValidate = false;
    }
    if (bookingServiceState.transitToController.text.isEmpty) {
      bookingServiceState.transitNotifier.value =
          bookingServiceState.selectedServiceId.toString() == id_2.toString()
              ? 'select_destination'.localize(context)
              : 'select_origin'.localize(context);
      bookingServiceState.transitCityFocusNode.requestFocus();
      isValidate = false;
    }
    if (bookingServiceState.flightController.text.isEmpty) {
      bookingServiceState.transitFlightNotifier.value =
          'select_flights'.localize(context);
      bookingServiceState.transitFlightFocusNode.requestFocus();
      isValidate = false;
    } else {
      isValidate = true;
    }

    return isValidate;
  }

  bool isAllRoundTripFieldSelected() {
    if (bookingServiceState.transitToController.text.isEmpty) {
      bookingServiceState.transitNotifier.value = 'please select';
      bookingServiceState.transitCityFocusNode.requestFocus();
      return false;
    } else if (bookingServiceState.flightController.text.isEmpty) {
      bookingServiceState.transitFlightNotifier.value = 'please select';
      bookingServiceState.transitFlightFocusNode.requestFocus();
      return false;
    } else {
      return true;
    }
  }

  void fillForm() {
    adLog('isFormFilled');
    bookingServiceState.selectedServiceController.text =
        bookingServiceState.serviceBookingData.selectedService?.serviceTitle ??
            '';
    bookingServiceState.selectedServiceId = bookingServiceState
            .serviceBookingData.selectedService?.serviceId
            .toString() ??
        '';
    bookingServiceState.selectedOriginCityController.text = bookingServiceState
            .serviceBookingData.selectedCityDetailFrom?.cityName ??
        '';
    bookingServiceState.fromCityCode = bookingServiceState
            .serviceBookingData.selectedCityDetailFrom?.cityCode
            .toString() ??
        '';
    bookingServiceState.selectedDestinationCityController.text =
        bookingServiceState.serviceBookingData.selectedCityDetailTo?.cityName ??
            '';
    bookingServiceState.toCityCode = bookingServiceState
            .serviceBookingData.selectedCityDetailTo?.cityCode
            .toString() ??
        '';
    bookingServiceState.selectedTravelSectorController.text =
        bookingServiceState
                .serviceBookingData.selectedTravelSector?.travelSectorTitle ??
            '';
    bookingServiceState.selectedTravelSectorId = bookingServiceState
            .serviceBookingData.selectedTravelSector?.travelSectorId
            .toString() ??
        '';
    bookingServiceState.travelSectorList.clear();
    bookingServiceState
      ..listTravelSector = bookingServiceState.getTravelSectorListData()
      ..travelSectorListCount =
          bookingServiceState.listTravelSector?.length ?? 0;

    if (bookingServiceState.serviceBookingData.selectedService?.serviceId ==
        id_2) {
      for (int index = 0;
          index < bookingServiceState.travelSectorListCount;
          index++) {
        if (bookingServiceState.listTravelSector?[index].isTransit == true) {
          bookingServiceState.travelSectorList.add(
            bookingServiceState.listTravelSector?[index] ?? TravelSectorModel(),
          );
        }
      }
    } else {
      for (int index = 0;
          index < bookingServiceState.travelSectorListCount;
          index++) {
        if (bookingServiceState.listTravelSector?[index].isTransit == false) {
          bookingServiceState.travelSectorList.add(
            bookingServiceState.listTravelSector?[index] ?? TravelSectorModel(),
          );
        }
      }
    }

    bookingServiceState.travellersController.text =
        '${bookingServiceState.serviceBookingData.travellers?.totalTravellers ?? 1}${' Guests'}';

    bookingServiceState.selectedDateOfTravelController.text = formatDateTime(
      dateTimeType:
          bookingServiceState.serviceBookingData.dateOfJourney?.dateOfJourney,
      dateTimeFormat: dataTimeFormatDayMonth,
    );

    bookingServiceState.dateOfJourneyModel = DateOfJourneyModel(
      dateOfJourney:
          bookingServiceState.serviceBookingData.dateOfJourney?.dateOfJourney ??
              DateTime.now(),
      dateSelected: true,
      dayMonth: formatDateTime(
        dateTimeType:
            bookingServiceState.serviceBookingData.dateOfJourney?.dateOfJourney,
        dateTimeFormat: dataTimeFormatDayMonth,
      ),
    );

    bookingServiceState.selectedFlightController.text = bookingServiceState
            .serviceBookingData.selectedFlightDetailModel?.flightFinalNumber
            .toString() ??
        '';
    bookingServiceState
      ..pranaamADFlights =
          bookingServiceState.serviceBookingData.selectedFlightDetailModel
      ..selectedDate = formatDateTime(
        dateTimeFormat: dataTimeFormatddMMyyyy,
        dateString: bookingServiceState.pranaamADFlights?.serviceDateTime,
      )
      ..selectedTime = formatTime(
        bookingServiceState.pranaamADFlights?.serviceDateTime ?? '',
      );

    bookingServiceState.guestsController.text = bookingServiceState
            .serviceBookingData.travellers?.totalTravellers
            .toString() ??
        '';
    bookingServiceState
      ..travellers =
          bookingServiceState.serviceBookingData.travellers ?? Travellers()
      ..arrivalCityDetailModel =
          bookingServiceState.serviceBookingData.selectedCityDetailTo
      ..departureCityDetailModel =
          bookingServiceState.serviceBookingData.selectedCityDetailFrom;

    adLog(getServiceAirport());
    fillRoundTripTransitForm();
  }

  void setServiceTime() {
    Future.delayed(Duration.zero, () => _setServiceTimeForFuture());
  }

  void _setServiceTimeForFuture() {
    bookingServiceState.flightTimeTopSpacing
      ..value = context.k_10
      ..value = 0;
    bookingServiceState.flightFirstTimeTextLabel.value = getFirstTimeLabel();
    bookingServiceState.flightSecondTimeTextLabel.value = getSecondTimeLabel();

    if (bookingServiceState.selectedServiceId == id_2.toString() ||
        bookingServiceState.selectedServiceId == id_3.toString()) {
      adLog('serviceID If ${bookingServiceState.selectedServiceId}');

      if (bookingServiceState.flightController.text.isNotEmpty) {
        adLog('secondFlightText ${bookingServiceState.flightController.text}');

        bookingServiceState.flightSecondTimeTextValue.value =
            getSecondFlightTime() ?? '';
      } else {
        adLog(
          'secondFlightEmptyText ${bookingServiceState.flightController.text}',
        );

        bookingServiceState.flightSecondTimeTextValue.value = '';
      }
      bookingServiceState.flightSecondTimeTextValue.value =
          bookingServiceState.flightController.text.isNotEmpty
              ? getSecondFlightTime() ?? ''
              : '';
    } else {
      adLog('serviceID else ${bookingServiceState.selectedServiceId}');

      bookingServiceState.flightSecondTimeTextValue.value =
          getSecondFlightTime() ?? '';
    }
    adLog('secondTime${bookingServiceState.flightSecondTimeTextValue.value}');
    bookingServiceState.flightFirstTimeTextValue.value = reviewArrivalTime(
      '${bookingServiceState.pranaamADFlights?.serviceTime}:00',
    );
    adLog('firstTime${bookingServiceState.flightFirstTimeTextValue.value}');

    bookingServiceState.flightTimeTopSpacing.value = context.k_10;
  }

  String getFirstTimeLabel() {
    return bookingServiceState.selectedServiceId == id_1.toString() ||
            bookingServiceState.selectedServiceId == id_4.toString()
        ? 'Service Time: '
        : bookingServiceState.selectedServiceId == id_3.toString()
            ? 'Departure Service Time: '
            : 'Transit Service Time: ';
  }

  String getSecondTimeLabel() {
    return bookingServiceState.selectedServiceId == id_1.toString()
        ? 'Departure Time: '
        : bookingServiceState.selectedServiceId == id_4.toString()
            ? 'Arrival Time: '
            : bookingServiceState.selectedServiceId == id_2.toString()
                ? 'Departure Service Time: '
                : 'Arrival Service Time: ';
  }

  String? getSecondFlightTime() {
    return bookingServiceState.selectedServiceId == id_1.toString() ||
            bookingServiceState.selectedServiceId == id_4.toString()
        ? reviewArrivalTime(
            '${bookingServiceState.pranaamADFlights?.flightTime}:00',
          )
        : reviewArrivalTime(
            '${bookingServiceState.roundTripRoundTripFlights?.serviceTime}:00',
          );
  }

  void fillRoundTripTransitForm() {
    if (bookingServiceState.serviceBookingData.selectedService?.serviceId ==
            id_2 ||
        bookingServiceState.serviceBookingData.selectedService?.serviceId ==
            id_3) {
      if (bookingServiceState.serviceBookingData.selectedService?.serviceId ==
          id_2) {
        adLog('fillTransitForm');

        bookingServiceState.transitDetailModel =
            bookingServiceState.serviceBookingData.arriveFrom;
        bookingServiceState.transitToController.text =
            bookingServiceState.serviceBookingData.arriveFrom?.cityName ?? '';
        bookingServiceState.transitCityCode =
            bookingServiceState.serviceBookingData.arriveFrom?.cityCode;
      } else {
        bookingServiceState.roundDetailModel =
            bookingServiceState.serviceBookingData.goingTo;
        bookingServiceState.transitToController.text =
            bookingServiceState.serviceBookingData.arriveFrom?.cityName ?? '';
        bookingServiceState.transitCityCode =
            bookingServiceState.serviceBookingData.arriveFrom?.cityCode;

        bookingServiceState.goingToController.text =
            bookingServiceState.serviceBookingData.goingTo?.cityName ?? '';
        bookingServiceState.roundGoingToCode =
            bookingServiceState.serviceBookingData.goingTo?.cityCode;
      }
      bookingServiceState.dateController.text = formatDateTime(
        dateTimeType: bookingServiceState
            .serviceBookingData.roundTripTransitDate?.dateOfJourney,
        dateTimeFormat: dataTimeFormatDayMonth,
      );
      bookingServiceState.transitDateModel = DateOfJourneyModel(
        dateOfJourney: bookingServiceState
                .serviceBookingData.roundTripTransitDate?.dateOfJourney ??
            DateTime.now(),
        dateSelected: true,
        dayMonth: formatDateTime(
          dateTimeType: bookingServiceState
              .serviceBookingData.roundTripTransitDate?.dateOfJourney,
          dateTimeFormat: dataTimeFormatDayMonth,
        ),
      );

      bookingServiceState.flightController.text = bookingServiceState
              .serviceBookingData.roundTripTransitFlights?.flightFinalNumber
              .toString() ??
          '';
      bookingServiceState
        ..roundTripRoundTripFlights =
            bookingServiceState.serviceBookingData.roundTripTransitFlights
        ..selectedTransitDate = formatDateTime(
          dateTimeFormat: dataTimeFormatddMMyyyy,
          dateString: bookingServiceState
              .serviceBookingData.roundTripTransitDate?.dateOfJourney
              .toString(),
        );
      bookingServiceState.travellersController.text =
          (bookingServiceState.serviceBookingData.travellers?.totalTravellers ??
                  1)
              .toString();
      bookingServiceState.selectedTransitTime = formatTime(
        bookingServiceState
                .serviceBookingData.roundTripTransitDate?.dateOfJourney
                .toString() ??
            '',
      );
    }
    setServiceTime();
  }

  // this method is used to update the header title of [selectedDestinationCityController]
  void getSelectionHeading(int serviceId) {
    adLog('getSelectionHeading started ServiceId:$serviceId');
    switch (serviceId) {
      case id_2:
        bookingServiceState.selectionHeading.value = 'transit_to';
        break;
      default:
        bookingServiceState.selectionHeading.value = 'going_to';
        break;
    }
  }

  /// this method is used to check whether pranaam or all airportsList to populate on
  // [selectedDestinationCityController] and [transitToController]
  bool isDestinationControllerPranaamAirport() {
    return bookingServiceState.selectedServiceId.toString() ==
            id_4.toString() ||
        bookingServiceState.selectedServiceId.toString() == id_2.toString();
  }

  /// this method is used to check whether pranaam or all airportsList to populate on
  // [selectedOriginCityController].
  bool isOriginControllerPranaamAirport() {
    return bookingServiceState.selectedServiceId.toString() ==
            id_1.toString() ||
        bookingServiceState.selectedServiceId.toString() == id_3.toString();
  }

  bool isOriginDomesticAirport() {
    return bookingServiceState.selectedTravelSectorId.toString() ==
            id_3.toString() ||
        bookingServiceState.selectedTravelSectorId.toString() ==
            id_6.toString() ||
        bookingServiceState.selectedTravelSectorId.toString() ==
            id_1.toString();
  }

  bool isDestinationDomesticAirport() {
    return bookingServiceState.selectedTravelSectorId.toString() ==
        id_3.toString();
  }

  bool isTransitDomesticAirport() {
    return bookingServiceState.selectedTravelSectorId.toString() ==
            id_6.toString() ||
        bookingServiceState.selectedTravelSectorId.toString() ==
            id_5.toString();
  }

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    final result = super.build(context);
    //added to avoid the warning
    adLog(result.toString());
    return BookingScreenWidgetView(this);
  }
}
