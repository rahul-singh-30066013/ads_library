/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/air_itinerary_pricing_info.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/gst_details.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/insurance.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/itinerary_contact_detail.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/itinerary_meta_data.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/pax_info_list.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/priced_itinerary.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/pricing_summary.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/zero_cancellation_summary.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/promo_coupon.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/display_model/flight_review_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/display_model/mini_rule_display_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/data_model/flight_list_isolate_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/flights_display_model.dart';

/// this class is used to receive response for view itinerary
class FlightViewItineraryResponseModel {
  FlightViewItineraryResponseModel({
    this.pricedItineraries,
    this.paxInfoList,
    this.contactDetail,
    this.itineraryId,
    this.pricingSummary,
    this.insurance,
    this.isMultiCity,
    this.gstDetails,
    this.itineraryMetaData,
    this.isInternational,
    this.tripType,
    this.loyaltyPotentialPoint,
    this.promoCoupon,
    this.zeroCancellationSummary,
  });

  String get journeyStartDate =>
      pricedItineraries
          ?.first.itinerary.firstFlightDetails.flightDepartureDate ??
      '';

  FlightViewItineraryResponseModel.fromJson(
    FlightListIsolateModel isolateModel,
  ) {
    final List<FlightReviewDetailInfo> _flightReviewDetailInfo = [];
    final List<FareDetailsInfo> _fareDetailsInfoList = [];

    final List<BaggageMiniRule> baggageMiniRuleListToAdd = [];
    final List<CancellationMiniRule> cancellationMiniRuleListToAdd = [];
    final List<DataChangeMiniRule> dataChangeMiniRuleListToAdd = [];

    if (isolateModel.jsonData['paxInfoList'] != null) {
      paxInfoList = [];
      for (final object in isolateModel.jsonData['paxInfoList'] as List) {
        final PaxInfoList paxInfoListItem = PaxInfoList.fromJson(object,null,);
        paxInfoList?.add(paxInfoListItem);
      }
    }

    MiniRuleDisplayModel? miniRuleDisplayModel;
    if (isolateModel.jsonData['pricedItineraries'] != null) {
      pricedItineraries = [];
      for (final object in isolateModel.jsonData['pricedItineraries'] as List) {
        final PricedItinerary pricedItinerariesItem =
            PricedItinerary.fromJson(object);
        final FlightReviewDetailInfo flightReviewDetailInfo =
            FlightReviewDetailInfo.fromPricedItinerary(
          itinerary: pricedItinerariesItem,
          paxInfoList: paxInfoList,
          airlineInfo: isolateModel.airlineInfo,
          isInternationalReturn: false,
        );
        _flightReviewDetailInfo.add(flightReviewDetailInfo);

        if (pricedItinerariesItem.isInternationRoundTrip) {
          final FlightReviewDetailInfo flightReviewDetailInfo =
              FlightReviewDetailInfo.fromPricedItinerary(
            itinerary: pricedItinerariesItem,
            paxInfoList: paxInfoList,
            airlineInfo: isolateModel.airlineInfo,
            isInternationalReturn: true,
          );
          _flightReviewDetailInfo.add(flightReviewDetailInfo);
        }

        if (pricedItinerariesItem.miniRule != null) {
          miniRuleDisplayModel = MiniRuleDisplayModel.fromPricedItinerary(
            itinerary: pricedItinerariesItem,
            airlineInfo: isolateModel.airlineInfo,
            isInternationalReturn: false,
          );

          final List<BaggageMiniRule> baggageMiniRuleList =
              miniRuleDisplayModel.baggageMiniRuleList ?? [];
          final BaggageMiniRule baggageMiniRule = baggageMiniRuleList.first;
          final CancellationMiniRule cancellationMiniRule =
              miniRuleDisplayModel.cancellationMiniRuleList?.first ??
                  CancellationMiniRule();
          final DataChangeMiniRule dataChangeMiniRule =
              miniRuleDisplayModel.dataChangeMiniRuleList?.first ??
                  DataChangeMiniRule();
          baggageMiniRuleListToAdd.add(baggageMiniRule);
          cancellationMiniRuleListToAdd.add(cancellationMiniRule);
          dataChangeMiniRuleListToAdd.add(dataChangeMiniRule);

          if (pricedItinerariesItem.isInternationRoundTrip) {
            miniRuleDisplayModel = MiniRuleDisplayModel.fromPricedItinerary(
              itinerary: pricedItinerariesItem,
              airlineInfo: isolateModel.airlineInfo,
              isInternationalReturn: true,
            );

            final List<BaggageMiniRule> baggageMiniRuleList =
                miniRuleDisplayModel.baggageMiniRuleList ?? [];
            final BaggageMiniRule baggageMiniRule = baggageMiniRuleList.first;
            final CancellationMiniRule cancellationMiniRule =
                miniRuleDisplayModel.cancellationMiniRuleList?.first ??
                    CancellationMiniRule();
            final DataChangeMiniRule dataChangeMiniRule =
                miniRuleDisplayModel.dataChangeMiniRuleList?.first ??
                    DataChangeMiniRule();
            baggageMiniRuleListToAdd.add(baggageMiniRule);
            cancellationMiniRuleListToAdd.add(cancellationMiniRule);
            dataChangeMiniRuleListToAdd.add(dataChangeMiniRule);
          }
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
        pricedItineraries?.add(pricedItinerariesItem);
      }
    }
    contactDetail = isolateModel.jsonData['contactDetail'] != null
        ? ItineraryContactDetail.fromJson(
            isolateModel.jsonData['contactDetail'],
          )
        : null;
    itineraryId = isolateModel.jsonData['itineraryId'];
    pricingSummary = isolateModel.jsonData['pricingSummary'] != null
        ? PricingSummary.fromJson(isolateModel.jsonData['pricingSummary'])
        : null;
    promoCoupon = isolateModel.jsonData['promoCoupon'] != null
        ? PromoCoupon.fromJson(isolateModel.jsonData['promoCoupon'])
        : null;
    insurance = isolateModel.jsonData['insurance'] != null
        ? Insurance.fromJson(isolateModel.jsonData['insurance'])
        : null;
    isMultiCity = isolateModel.jsonData['isMultiCity'];
    gstDetails = isolateModel.jsonData.containsKey('gstDetails') &&
            isolateModel.jsonData['gstDetails'] != null
        ? GstDetails.fromJson(isolateModel.jsonData['gstDetails'])
        : null;
    itineraryMetaData = isolateModel.jsonData['itineraryMetaData'] != null
        ? ItineraryMetaData.fromJson(isolateModel.jsonData['itineraryMetaData'])
        : null;
    isInternational = isolateModel.jsonData['isInternational'];
    tripType = isolateModel.jsonData['tripType'];
    loyaltyPotentialPoint = isolateModel.jsonData['loyaltyPotentialPoint'];
    miniRuleDisplayModel = MiniRuleDisplayModel.fromListUpdate(
      baggageMiniRuleList: baggageMiniRuleListToAdd,
      cancellationMiniRuleList: cancellationMiniRuleListToAdd,
      dataChangeMiniRuleList: dataChangeMiniRuleListToAdd,
    );
    flightReviewDetailModel = FlightReviewDetailModel(
      flightReviewDetailInfo: _flightReviewDetailInfo,
      flightFareInfo: _fareDetailsInfoList,
      miniRuleDisplayModel: miniRuleDisplayModel,
    );
    insurance = isolateModel.jsonData['insurance'] != null
        ? Insurance.fromJson(
            isolateModel.jsonData['insurance'],
          )
        : null;
    zeroCancellationSummary =
        isolateModel.jsonData['zeroCancellationSummary'] != null
            ? ZeroCancellationSummary.fromJson(
                isolateModel.jsonData['zeroCancellationSummary'],
              )
            : null;
  }
  List<PricedItinerary>? pricedItineraries;
  List<PaxInfoList>? paxInfoList;
  ItineraryContactDetail? contactDetail;
  String? itineraryId;
  PricingSummary? pricingSummary;
  bool? isMultiCity;
  GstDetails? gstDetails;
  ItineraryMetaData? itineraryMetaData;
  bool? isInternational;
  String? tripType;
  FlightReviewDetailModel? flightReviewDetailModel;
  num? loyaltyPotentialPoint;
  PromoCoupon? promoCoupon;
  Insurance? insurance;
  ZeroCancellationSummary? zeroCancellationSummary;
}
