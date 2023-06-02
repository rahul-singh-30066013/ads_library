/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_fare/data_model/flight_fare_calender_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/city_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/travellers.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/trip_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/flight_booking_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/repositories/flight_booking_repository.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/calender/views/date_range_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/offers/model/offer_dashboard_response.dart';
import 'package:adani_airport_mobile/modules/offers/repositories/offer_repository.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/app_utils/shared_preference/shared_prefs_utils.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';

/// this class is used to manage the state of FlightBookingScreen - on user selection for flight search.
class FlightBookingState extends BaseViewModel {
  Travellers? allTravellers;
  final FlightBookingRepository _flightBookingRepository =
      FlightBookingRepository();
  List<CityDetailModel> mainAirportCityList = [];
  List<CityDetailModel> mainPranaamAirportCityList = [];

  List<CityDetailModel> airportCityFromApiPranaamList = [];
  List<CityDetailModel> showAirportCityList = [];
  List<CityDetailModel> showPranaamAirportCityList = [];
  String pranaamAirportData = '';
  List<CityDetailModel> popularCitiesList = [];
  List<CityDetailModel> otherCitiesList = [];
  List<CityDetailModel> internationalList = [];

  /// Initiate loading state for api hit
  ADResponseState fareCalender = ADResponseState.loading();
  ADResponseState offersState = ADResponseState.loading();
  List<FareCalendars> fareCalendarsList = [];
  List<WidgetItem> filteredOfferList = List.empty();

  /// includes - recent, popular and other cities list
  List<CityDetailModel> searchResultList = [];

  ///*[flightBookingModel] this variable contains the booking details from local db.
  FlightBookingModel flightBookingModel =
      FlightBookingRepository().getFlightBookingModel();
  final List<CityDetailModel> fromRecentSearchList =
      List.filled(3, const CityDetailModel());

  final List<CityDetailModel> toRecentSearchList =
      List.filled(3, const CityDetailModel());

  ///this is used for pranaam booking detail from local db
  final List<CityDetailModel> fromRecentSearchListParnam =
      List.filled(2, const CityDetailModel());
  final List<CityDetailModel> toRecentSearchListParnam =
      List.filled(2, const CityDetailModel());
  final int maxIndex = 2;

  int recentSearchIndex = 2;
  List<CityDetailModel> detailedCityList = [];
  List<CityDetailModel> detailedPranaamCityList = [];

  TripDetailModel getTripDetails() {
    return flightBookingModel.oneWayTrip ?? TripDetailModel();
  }

  /// used to update the trip from oneway to round and round to oneway.
  void updateTrip(TripType tripType) {
    flightBookingModel.tripType = tripType;
    if (FlightUtils.isOnewayTrip(tripType)) {
      flightBookingModel.roundTrip = TripDetailModel(
        ///TODO: 'form' and 'from'
        fromCity: _updateCity(flightBookingModel.oneWayTrip?.toCity, 'form'),
        toCity: _updateCity(flightBookingModel.oneWayTrip?.fromCity, 'to'),
        date: flightBookingModel.roundTrip != null
            ? flightBookingModel.oneWayTrip?.date?.add(const Duration())
            : flightBookingModel.roundTrip?.date,
      );
    } else if (FlightUtils.isRoundTrip(tripType)) {
      flightBookingModel.roundTrip = TripDetailModel(
        ///TODO: 'form' and 'from'
        fromCity: _updateCity(flightBookingModel.oneWayTrip?.toCity, 'form'),
        toCity: _updateCity(flightBookingModel.oneWayTrip?.fromCity, 'to'),
        date: FlightUtils.dateDiffCheck(
                  flightBookingModel.oneWayTrip?.date ?? DateTime.now(),
                  flightBookingModel.roundTrip?.date ?? DateTime.now(),
                ) >=
                0
            ? FlightUtils.nextValidDate(
                sameDate: flightBookingModel.oneWayTrip?.date ?? DateTime.now(),
              )
            : flightBookingModel.roundTrip?.date,
      );
    }
    notifyListeners();
  }

  void updateDate(TripType tripType) {
    if (FlightUtils.isOnewayTrip(tripType)) {
      flightBookingModel.oneWayTrip = TripDetailModel(
        fromCity: flightBookingModel.oneWayTrip?.fromCity,
        toCity: flightBookingModel.oneWayTrip?.toCity,
        date: flightBookingModel.oneWayTrip?.date ?? DateTime.now(),
      );
    } else if (FlightUtils.isRoundTrip(tripType)) {
      flightBookingModel.roundTrip = TripDetailModel(
        fromCity: _updateCity(flightBookingModel.oneWayTrip?.toCity, 'form'),
        toCity: _updateCity(flightBookingModel.oneWayTrip?.fromCity, 'to'),
        date: flightBookingModel.roundTrip != null
            ? flightBookingModel.roundTrip?.date
            : FlightUtils.nextValidDate(
                sameDate: flightBookingModel.oneWayTrip?.date ?? DateTime.now(),
              ),
      );
    }
    notifyListeners();
  }

  void updateSelectedDateFromCalender(CalendarModel calendarModel) {
    if (FlightUtils.isOnewayTrip(calendarModel.tripType)) {
      flightBookingModel.oneWayTrip = TripDetailModel(
        fromCity: flightBookingModel.oneWayTrip?.fromCity,
        toCity: flightBookingModel.oneWayTrip?.toCity,
        date: calendarModel.departureDate,
      );
      updateTrip(calendarModel.tripType ?? TripType.oneWay);
    } else {
      flightBookingModel
        ..oneWayTrip = TripDetailModel(
          fromCity: flightBookingModel.oneWayTrip?.fromCity,
          toCity: flightBookingModel.oneWayTrip?.toCity,
          date: calendarModel.departureDate,
        )
        ..roundTrip = TripDetailModel(
          fromCity: _updateCity(flightBookingModel.oneWayTrip?.toCity, 'form'),
          toCity: _updateCity(flightBookingModel.oneWayTrip?.fromCity, 'to'),
          date: calendarModel.returnDate,
        )
        ..tripType = TripType.roundTrip;

      final date = FlightUtils.dateDiffCheck(
        flightBookingModel.oneWayTrip?.date ?? DateTime.now(),
        flightBookingModel.roundTrip?.date ?? DateTime.now(),
      );
      if (date != 0) {
        updateTrip(calendarModel.tripType ?? TripType.oneWay);
      }
    }

    notifyListeners();
  }

  void updateRoundTrip() {
    flightBookingModel.roundTrip = TripDetailModel(
      fromCity: _updateCity(flightBookingModel.oneWayTrip?.toCity, 'form'),
      toCity: _updateCity(flightBookingModel.oneWayTrip?.fromCity, 'to'),
      date: FlightUtils.nextValidDate(
        sameDate: flightBookingModel.oneWayTrip?.date ?? DateTime.now(),
      ),
    );
    notifyListeners();
  }

  /// used to update the trip from oneway to round and round to oneway.
  void updateToCity1() {
    final TripDetailModel? oneWayTrip = flightBookingModel.oneWayTrip;

    flightBookingModel.oneWayTrip = TripDetailModel(
      date: oneWayTrip?.date,
    );
    notifyListeners();
  }

  /// this is used to switch the cities with each other.
  void rotateCities() {
    final TripDetailModel? oneWayTrip = flightBookingModel.oneWayTrip;

    if (FlightUtils.isRoundTrip(flightBookingModel.tripType)) {
      flightBookingModel.roundTrip = flightBookingModel.oneWayTrip?.copy(
        withDateTime: flightBookingModel.roundTrip?.date,
      );
    }

    flightBookingModel.oneWayTrip = TripDetailModel(
      fromCity: _updateCity(oneWayTrip?.toCity, 'from'),
      toCity: _updateCity(oneWayTrip?.fromCity, 'to'),
      date: oneWayTrip?.date,
    );
    notifyListeners();
  }

  CityDetailModel _updateCity(
    CityDetailModel? cityDetailModel,
    String placeHolder,
  ) {
    return CityDetailModel(
      cityCode: cityDetailModel?.cityCode,
      cityName: cityDetailModel?.cityName,
      keywords: cityDetailModel?.keywords,
      countryName: cityDetailModel?.countryName,
      countryCode: cityDetailModel?.countryCode,
      airportCode: cityDetailModel?.airportCode,
      isDomestic: cityDetailModel?.isDomestic,
      airportName: cityDetailModel?.airportName,
      airportID: cityDetailModel?.airportID,
      isPranaam: cityDetailModel?.isPranaam,
      isPopular: cityDetailModel?.isPopular,
      cityPlaceholder: placeHolder,
    );
  }

  /// used to update the trip from oneway to round and round to oneway.
  void updateFromCity(
    CityDetailModel cityDetailModel,
    BuildContext context,
  ) {
    final TripDetailModel? oneWayTrip = flightBookingModel.oneWayTrip;
    final CityDetailModel cityDetail = oneWayTrip?.toCity?.cityCode != null
        ? CityDetailModel(
            cityCode: oneWayTrip?.toCity?.cityCode,
            cityName: oneWayTrip?.toCity?.cityName,
            keywords: oneWayTrip?.toCity?.keywords,
            airportCode: oneWayTrip?.toCity?.airportCode,
            countryName: oneWayTrip?.toCity?.countryName,
            countryCode: oneWayTrip?.toCity?.countryCode,
            isPopular: oneWayTrip?.toCity?.isPopular,
            isPranaam: oneWayTrip?.toCity?.isPranaam,
            airportID: oneWayTrip?.toCity?.airportID,
            airportName: oneWayTrip?.toCity?.airportName,
            isDomestic: oneWayTrip?.toCity?.isDomestic,
            cityPlaceholder: 'to'.localize(context),
          )
        : CityDetailModel(
            cityCode: '--',
            cityName: 'to'.localize(context),
            keywords: const [],
            cityPlaceholder: 'to'.localize(context),
          );

    flightBookingModel.oneWayTrip = TripDetailModel(
      fromCity: CityDetailModel(
        cityCode: cityDetailModel.cityCode,
        cityName: cityDetailModel.cityName,
        keywords: cityDetailModel.keywords,
        airportCode: cityDetailModel.airportCode,
        countryCode: cityDetailModel.countryCode,
        countryName: cityDetailModel.countryName,
        isPopular: cityDetailModel.isPopular,
        isPranaam: cityDetailModel.isPranaam,
        airportID: cityDetailModel.airportID,
        airportName: cityDetailModel.airportName,
        cityPlaceholder: 'from'.localize(context),
        isDomestic: cityDetailModel.isDomestic,
      ),
      toCity: cityDetail,
      date: oneWayTrip?.date,
    );
    updateTrip(flightBookingModel.tripType);
  }

  void updateTravellers(
    Travellers travellers,
  ) {
    flightBookingModel.travellers = travellers;
    allTravellers = travellers;
    notifyListeners();
  }

  /// used to update the trip from oneway to round and round to oneway.
  void updateToCity(CityDetailModel cityDetailModel, BuildContext context) {
    final TripDetailModel? oneWayTrip = flightBookingModel.oneWayTrip;
    final CityDetailModel cityDetail = oneWayTrip?.fromCity?.cityCode != null
        ? CityDetailModel(
            cityCode: oneWayTrip?.fromCity?.cityCode,
            cityName: oneWayTrip?.fromCity?.cityName,
            keywords: oneWayTrip?.fromCity?.keywords,
            airportCode: oneWayTrip?.fromCity?.airportCode,
            countryName: oneWayTrip?.fromCity?.airportCode,
            countryCode: oneWayTrip?.fromCity?.countryCode,
            isPopular: oneWayTrip?.fromCity?.isPopular,
            isPranaam: oneWayTrip?.fromCity?.isPranaam,
            airportID: oneWayTrip?.fromCity?.airportID,
            airportName: oneWayTrip?.fromCity?.airportName,
            isDomestic: oneWayTrip?.fromCity?.isDomestic,
            cityPlaceholder: 'from'.localize(context),
          )
        : CityDetailModel(
            cityCode: '--',
            cityName: 'from'.localize(context),
            keywords: const [],
            cityPlaceholder: 'from'.localize(context),
          );

    flightBookingModel.oneWayTrip = TripDetailModel(
      fromCity: cityDetail,
      toCity: CityDetailModel(
        cityCode: cityDetailModel.cityCode,
        cityName: cityDetailModel.cityName,
        keywords: cityDetailModel.keywords,
        airportCode: cityDetailModel.airportCode,
        countryName: cityDetailModel.airportCode,
        countryCode: cityDetailModel.countryCode,
        isPopular: cityDetailModel.isPopular,
        isPranaam: cityDetailModel.isPranaam,
        airportID: cityDetailModel.airportID,
        airportName: cityDetailModel.airportName,
        cityPlaceholder: 'to'.localize(context),
        isDomestic: cityDetailModel.isDomestic,
      ),
      date: oneWayTrip?.date,
    );
    updateTrip(flightBookingModel.tripType);
  }

  /// FromWhere = true for flight
  /// FromWhere = false for pranaam
  Future<void> buildSearchList(
    BuildContext context,
    String userSearchTerm,
    isFrom, {
    bool fromWhere = true,
  }) async {
    await updateRecentSearchesList(userSearchTerm, isFrom, fromWhere).then((_) {
      if (isFrom) {
        if (fromRecentSearchList.isNotEmpty &&
            fromRecentSearchList[1].cityCode != null) {
          fromRecentSearchList.first = CityDetailModel(
            cityCode: '-1',
            airportName: 'recent_search'.localize(context),
            cityName: '',
            keywords: const [],
          );
        }
      } else {
        if (toRecentSearchList.isNotEmpty &&
            toRecentSearchList[1].cityCode != null) {
          toRecentSearchList.first = CityDetailModel(
            cityCode: '-1',
            airportName: 'recent_search'.localize(context),
            cityName: '',
            keywords: const [],
          );
        }
      }

      if (userSearchTerm.isNotEmpty) {
        searchResultList = getFilteredCityList(userSearchTerm);

        if (searchResultList.isNotEmpty) {
          detailedCityList = searchResultList;
        } else {
          if (isFrom) {
            detailedCityList = fromRecentSearchList[1].cityCode != null
                ? fromRecentSearchList + popularCitiesList + otherCitiesList
                : popularCitiesList + otherCitiesList;
            if (fromRecentSearchList[maxIndex].cityCode == null) {
              final value = detailedCityList.removeAt(2);
              adLog('$value');
            }
          } else {
            detailedCityList = toRecentSearchList[1].cityCode != null
                ? toRecentSearchList + popularCitiesList + otherCitiesList
                : popularCitiesList + otherCitiesList;
            // Remove null from recent list only if recent search list is added
            if (toRecentSearchList[1].cityCode != null &&
                toRecentSearchList[maxIndex].cityCode == null) {
              final value = detailedCityList.removeAt(2);
              adLog('$value');
            }
          }
        }
      } else {
        if (fromWhere) {
          if (isFrom) {
            detailedCityList = fromRecentSearchList[1].cityCode != null
                ? fromRecentSearchList +
                    popularCitiesList +
                    otherCitiesList +
                    internationalList
                : popularCitiesList + otherCitiesList;
            if (fromRecentSearchList[maxIndex].cityCode == null) {
              final value = detailedCityList.removeAt(maxIndex);
              adLog('$value');
            }
          } else {
            detailedCityList = toRecentSearchList[1].cityCode != null
                ? toRecentSearchList +
                    popularCitiesList +
                    otherCitiesList +
                    internationalList
                : popularCitiesList + otherCitiesList;
            if (toRecentSearchList[maxIndex].cityCode == null) {
              final value = detailedCityList.removeAt(maxIndex);
              adLog('$value');
            }
          }
        } else {
          ///This is used for pranaam_air_port_search_list
          detailedCityList = popularCitiesList + otherCitiesList;
        }
      }
      notifyListeners();
    });
  }

  Future<void> updateRecentSearchesList(
    String userSearchTerm,
    isFrom,
    fromWhere,
  ) async {
    if (fromWhere) {
      if (userSearchTerm.isEmpty) {
        if (isFrom) {
          // final dataObj = <String, Object>{
          //   'key': keyFromRecent,
          //   'dataType': 'string',
          // };
          await SharedPrefsUtils()
              .getValueFromPrefs(keyFromRecent)
              .then((value) {
            if (value.toString().isNotEmpty) {
              final List<dynamic> list = json.decode(value ?? '');
              for (int index = 0; index < list.length; index++) {
                final CityDetailModel data =
                    CityDetailModel.fromJson(list[index]);
                if (index == 1) {
                  fromRecentSearchList[1] = data;
                } else {
                  fromRecentSearchList[maxIndex] = data;
                }
              }
            }
            // _updateAllList();
          });
          // await AdaniMobilePlugin.readSharedPref(dataObj).then((value) {
          //   if (value.toString().isNotEmpty) {
          //     final List<dynamic> list = json.decode(value);
          //     for (int index = 0; index < list.length; index++) {
          //       final CityDetailModel data =
          //           CityDetailModel.fromJson(list[index]);
          //       if (index == 1) {
          //         fromRecentSearchList[1] = data;
          //       } else {
          //         fromRecentSearchList[maxIndex] = data;
          //       }
          //     }
          //   }
          //   // _updateAllList();
          // });
        } else {
          // final dataObj = <String, Object>{
          //   'key': keyToRecent,
          //   'dataType': 'string',
          // };
          await SharedPrefsUtils().getValueFromPrefs(keyToRecent).then((value) {
            if (value.toString().isNotEmpty) {
              final List<dynamic> list = json.decode(value ?? '');
              for (int index = 0; index < list.length; index++) {
                final CityDetailModel data =
                    CityDetailModel.fromJson(list[index]);
                if (index == 1) {
                  toRecentSearchList[1] = data;
                } else {
                  toRecentSearchList[maxIndex] = data;
                }
              }
            }
            //_updateAllList();
          });
          // await AdaniMobilePlugin.readSharedPref(dataObj).then((value) {
          //   if (value.toString().isNotEmpty) {
          //     final List<dynamic> list = json.decode(value);
          //     for (int index = 0; index < list.length; index++) {
          //       final CityDetailModel data =
          //           CityDetailModel.fromJson(list[index]);
          //       if (index == 1) {
          //         toRecentSearchList[1] = data;
          //       } else {
          //         toRecentSearchList[maxIndex] = data;
          //       }
          //     }
          //   }
          //   //_updateAllList();
          // });
        }
      }
    }
  }

  void showModifyList(String userSearchText, BuildContext context) {
    List<CityDetailModel> modifyList = [];
    if (userSearchText.isNotEmpty) {
      modifyList = getFilteredCityList(userSearchText);
      if (modifyList.isEmpty) {
        modifyList = getFilteredCityList('');
      }
      detailedCityList = modifyList;
    } else {
      showAirPortList(context);
    }
  }

  void showAirPortList(BuildContext context) {
    showAirportCityList =
        _flightBookingRepository.getPopularAndRecentCitiesList(context);
    showAirportCityList.addAll(mainAirportCityList);
    detailedCityList = showAirportCityList;
  }

  void detailListEmptyCheck(BuildContext context) {
    if (detailedCityList.isEmpty) {
      detailedCityList = [const CityDetailModel()] +
          _flightBookingRepository.getPopularAndRecentCitiesList(context);
    }
  }

  ///It will provide flight fare data
  Future<void> getFlightsFareCalender() async {
    await _flightBookingRepository
        .fetchFlightFare(
      flightBookingModel: flightBookingModel,
      isArrival: false,
    )
        .then((value) {
      _updateFareListState(value);
    });
  }

  ///It will update flight fare data of ADResponseState
  void _updateFareListState(ADResponseState response) {
    fareCalender = response;
    final FlightFareCalenderResponseModel? fareCalenderResponseModel =
        fareCalender.data;
    fareCalendarsList = fareCalenderResponseModel?.fareCalendars ?? [];
    // FareCalendarDisplayModel(fareCalenderList: fareCalendarsList)
    //     .updateCalenderApiData();
    notifyListeners();
  }

  void readData(SiteCoreStateManagement read, BuildContext context) {
    // siteCoreStateManagement = context.read<SiteCoreStateManagement>();
    adLog('read.mainAirportCityList ${read.airportCityList}');
    if (read.airportCityList.isNotEmpty) {
      popularCitiesList
        ..add(
          CityDetailModel(
            cityCode: '-2',
            airportName: 'popular_cities'.localize(context),
            cityName: '',
            keywords: const [],
          ),
        )
        ..addAll(read.domesticPopular);
      mainAirportCityList.addAll(read.domesticPopular);
    }
    if (read.domesticOtherAirportCityList.isNotEmpty) {
      otherCitiesList
        ..add(
          CityDetailModel(
            cityCode: '-3',
            airportName: 'all_cities'.localize(context),
            cityName: '',
            keywords: const [],
          ),
        )
        ..addAll(read.domesticOtherAirportCityList);
      mainAirportCityList.addAll(read.domesticOtherAirportCityList);
    }

    // if (read.internationAirportCityList.isNotEmpty) {
    //   internationalList
    //     ..add(
    //       const CityDetailModel(
    //         cityCode: '-4',
    //         airportName: 'International',
    //         cityName: '',
    //         keywords: [],
    //       ),
    //     )
    //     ..addAll(read.internationAirportCityList);
    //   mainAirportCityList.addAll(read.internationAirportCityList);
    // }
    detailedCityList = popularCitiesList + otherCitiesList + internationalList;
  }

  void readInternationAirport(
    SiteCoreStateManagement read,
    BuildContext context, {
    bool isPranaam = false,
  }) {
    adLog('read.internationalAirportList ${read.internationAirportCityList}');
    if (isPranaam) {
      if (read.pranaamInternationAirportCityList.isNotEmpty) {
        popularCitiesList
          ..add(
            CityDetailModel(
              cityCode: '-2',
              airportName: 'popular_cities'.localize(context),
              cityName: '',
              keywords: const [],
            ),
          )
          ..addAll(read.pranaamInternationAirportCityList);
        mainAirportCityList.addAll(read.pranaamInternationAirportCityList);
      }
    } else {
      if (read.airportCityList.isNotEmpty) {
        popularCitiesList
          ..add(
            CityDetailModel(
              cityCode: '-2',
              airportName: 'popular_cities'.localize(context),
              cityName: '',
              keywords: const [],
            ),
          )
          ..addAll(read.airportCityList);
        mainAirportCityList.addAll(read.airportCityList);
      }
      if (read.domesticOtherAirportCityList.isNotEmpty) {
        otherCitiesList
          ..add(
            CityDetailModel(
              cityCode: '-3',
              airportName: 'all_cities'.localize(context),
              cityName: '',
              keywords: const [],
            ),
          )
          ..addAll(read.domesticOtherAirportCityList);
        mainAirportCityList.addAll(read.domesticOtherAirportCityList);
      }
      if (read.internationAirportCityList.isNotEmpty) {
        internationalList
          ..add(
            const CityDetailModel(
              cityCode: '-4',
              airportName: 'International',
              cityName: '',
              keywords: [],
            ),
          )
          ..addAll(read.internationAirportCityList);
        mainAirportCityList.addAll(read.internationAirportCityList);
      }
    }
    detailedCityList = popularCitiesList + otherCitiesList + internationalList;
    //   if (read.internationAirportCityList.isNotEmpty) {
    //     popularCitiesList
    //       ..add(
    //         CityDetailModel(
    //           cityCode: '-2',
    //           airportName: 'popular_cities'.localize(context),
    //           cityName: '',
    //           keywords: const [],
    //         ),
    //       )
    //       ..addAll(read.internationAirportCityList);
    //     mainAirportCityList.addAll(read.internationAirportCityList);
    //   }
    // }
    // detailedCityList = popularCitiesList;
  }

  void readPranaamAirport(SiteCoreStateManagement read, BuildContext context) {
    adLog('read.pranaamAirportList ${read.pranaamAirportCityList}');
    if (read.pranaamAirportCityList.isNotEmpty) {
      popularCitiesList
        ..add(
          CityDetailModel(
            cityCode: '-2',
            airportName: 'popular_cities'.localize(context),
            cityName: '',
            keywords: const [],
          ),
        )
        ..addAll(read.pranaamAirportCityList);
      mainAirportCityList.addAll(read.pranaamAirportCityList);
    }
    detailedCityList = popularCitiesList;
  }

  void readPranaamData(
    SiteCoreStateManagement read,
    String pranaamAirPortList,
  ) {
    adLog('read.airportPranaamCityList ${read.airportPranaamCityList}');
    // siteCoreStateManagement = context.read<SiteCoreStateManagement>();
    mainAirportCityList = read.airportPranaamCityList;
    mainPranaamAirportCityList = read.airportPranaamCityList;
    pranaamAirportData = pranaamAirPortList;
  }

  void readDataFromApi(
    SiteCoreStateManagement read,
    String pranaamAirPortList,
  ) {
    // siteCoreStateManagement = context.read<SiteCoreStateManagement>();
    mainAirportCityList = read.airportCityFromApiPranaamList;
    mainPranaamAirportCityList = read.airportCityFromApiPranaamList;
    pranaamAirportData = pranaamAirPortList;
  }

  List<CityDetailModel> getFilteredCityList(String userSearchTerm) {
    final List<CityDetailModel> filteredList = [];
    final List<CityDetailModel> unfilteredList = [];
    final List<CityDetailModel> temp = [];

    for (int ind = 0; ind < mainAirportCityList.length; ind++) {
      if (mainAirportCityList[ind]
          .cityName
          .validateWithDefaultValue()
          .toLowerCase()
          .startsWith(userSearchTerm.toLowerCase().trim())) {
        filteredList.add(mainAirportCityList[ind]);
      } else {
        unfilteredList.add(mainAirportCityList[ind]);
      }
    }

    temp.addAll(unfilteredList);
    for (int ind = 0; ind < temp.length; ind++) {
      if (temp[ind]
          .cityCode
          .validateWithDefaultValue()
          .toLowerCase()
          .startsWith(userSearchTerm.toLowerCase().trim())) {
        filteredList.add(temp[ind]);
        final removeCityCode = unfilteredList.remove(temp[ind]);
        adLog(removeCityCode.toString());
      }
    }

    temp.clear();
    adLog(unfilteredList.length.toString());
    temp.addAll(unfilteredList);
    for (int ind = 0; ind < temp.length; ind++) {
      if (temp[ind]
          .airportName
          .validateWithDefaultValue()
          .toLowerCase()
          .startsWith(userSearchTerm.toLowerCase().trim())) {
        filteredList.add(temp[ind]);
        final removeAirportName = unfilteredList.remove(temp[ind]);
        adLog(removeAirportName.toString());
      }
    }

    temp.clear();
    adLog(unfilteredList.length.toString());
    temp.addAll(unfilteredList);
    for (int ind = 0; ind < temp.length; ind++) {
      if (temp[ind]
          .countryName
          .validateWithDefaultValue()
          .toLowerCase()
          .startsWith(userSearchTerm.toLowerCase().trim())) {
        filteredList.add(temp[ind]);
        final removeAirportName = unfilteredList.remove(temp[ind]);
        adLog(removeAirportName.toString());
      }
    }

    filteredList.addAll(
      unfilteredList.where(
        (airportDetailsModel) => searchInKeywords(
          airportDetailsModel.keywords,
          userSearchTerm.toLowerCase().trim(),
        ),
      ),
    );
    return filteredList;
  }

  bool searchInKeywords(List<String>? keywords, String searchTerm) {
    return keywords != null && keywords.isNotEmpty
        ? keywords
            .where(
              (element) => element
                  .toLowerCase()
                  .contains(searchTerm.toLowerCase().trim()),
            )
            .toList()
            .isNotEmpty
        : [].isNotEmpty;
  }

  Future<void> fetchRecentDataFromPref() async {
    // final dataObj = <String, Object>{
    //   'key': keyToLastSearch,
    //   'dataType': 'string',
    // };

    await SharedPrefsUtils().getValueFromPrefs(keyToLastSearch).then((value) {
      if (value.toString().isNotEmpty) {
        flightBookingModel =
            FlightBookingModel.fromJson(json.decode(value ?? ''));
        final int oneWayDateCheck = FlightUtils.calculateDifference(
          flightBookingModel.oneWayTrip?.date ?? DateTime.now(),
        );
        if (oneWayDateCheck < 0) {
          flightBookingModel.oneWayTrip?.date = DateTime.now();
        }
        if (flightBookingModel.tripType == TripType.roundTrip) {
          final int roundTripDateCheck = FlightUtils.calculateDifference(
            flightBookingModel.roundTrip?.date ?? DateTime.now(),
          );
          if (roundTripDateCheck < 0) {
            flightBookingModel.roundTrip?.date = FlightUtils.nextValidDate(
              sameDate: flightBookingModel.roundTrip?.date ?? DateTime.now(),
            );
          }
        }
        updateTrip(flightBookingModel.tripType);
        updateDate(flightBookingModel.tripType);
        updateTravellers(flightBookingModel.travellers ?? Travellers());
        notifyListeners();
      }
    });

    // await AdaniMobilePlugin.readSharedPref(dataObj).then((value) {
    //   if (value.toString().isNotEmpty) {
    //     flightBookingModel = FlightBookingModel.fromJson(json.decode(value));
    //     final int oneWayDateCheck = calculateDifference(
    //       flightBookingModel.oneWayTrip?.date ?? DateTime.now(),
    //     );
    //     if (oneWayDateCheck < 0) {
    //       flightBookingModel.oneWayTrip?.date = DateTime.now();
    //     }
    //     if (flightBookingModel.tripType == TripType.roundTrip) {
    //       final int roundTripDateCheck = calculateDifference(
    //         flightBookingModel.roundTrip?.date ?? DateTime.now(),
    //       );
    //       if (roundTripDateCheck < 0) {
    //         flightBookingModel.roundTrip?.date = FlightUtils.nextValidDate(
    //           sameDate: flightBookingModel.roundTrip?.date ?? DateTime.now(),
    //         );
    //       }
    //     }
    //     updateTrip(flightBookingModel.tripType);
    //     updateDate(flightBookingModel.tripType);
    //     updateTravellers(flightBookingModel.travellers ?? Travellers());
    //     notifyListeners();
    //   }
    // });
  }

  ///It will fetch  offer data
  Future<void> getAllOffers() async {
    final Map<String, Object> queryParameters = {
      'language': 'en',
      'StoreType': '',
      'appType': 'app',
      'AirportCode': airportPrefixName().toString(),
      'LOB': 'FlightBooking',
      'disablePartnerOffer': true,
    };

    final value = await OfferRepository().fetchOffers(
      queryParameters: queryParameters,
    );
    offersState = value;
    filteredOfferList = (offersState.data as OfferItems)
        .result
        .where(
          (element) =>
              element.promotionType.toLowerCase() == 'flightbooking' &&
              element.promotionCode.isNotEmpty,
        )
        .toList();
    notifyListeners();
  }

  String? airportPrefixName() {
    return selectedAirportsData?.airportPrefixName?.isNullOrEmpty == false
        ? selectedAirportsData?.airportPrefixName
        : 'adani-one-airport';
  }
}
