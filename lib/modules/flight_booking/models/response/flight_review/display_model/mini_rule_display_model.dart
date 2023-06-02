/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/flight_segment.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/mini_rule.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_review/data_model/itinerary/priced_itinerary.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/site_core/model/airline/airline_info.dart';

///MiniRuleDisplayModel class used to show data related mini rules on review page
class MiniRuleDisplayModel {
  MiniRuleDisplayModel({
    this.baggageMiniRuleList,
    this.cancellationMiniRuleList,
    this.dataChangeMiniRuleList,
    this.isRefundable,
  });
  bool? isRefundable;
  List<BaggageMiniRule>? baggageMiniRuleList;
  List<CancellationMiniRule>? cancellationMiniRuleList;
  List<DataChangeMiniRule>? dataChangeMiniRuleList;

  factory MiniRuleDisplayModel.fromPricedItinerary({
    required PricedItinerary itinerary,
    required Map<String, AirLineInfo?>? airlineInfo,
    required bool isInternationalReturn,
  }) {
    final List<BaggageMiniRule> baggageMiniRuleListToAdd = [];
    final List<CancellationMiniRule> cancellationMiniRuleListToAdd = [];
    final List<DataChangeMiniRule> dataChangeMiniRuleListToAdd = [];
    final MiniRule? miniRule = itinerary.miniRule;
    if (miniRule != null) {
      final List<FlightSegment>? flightSegment = isInternationalReturn
          ? itinerary
                  .airItinerary?.originDestinationOption?.last.flightSegment ??
              []
          : itinerary
                  .airItinerary?.originDestinationOption?.first.flightSegment ??
              [];
      final String fromLocation =
          flightSegment?.first.departureAirport?.locationCode ?? 'N/A';
      final String toLocation =
          flightSegment?.last.arrivalAirport?.locationCode ?? 'N/A';
      if (flightSegment != null && flightSegment.isNotEmpty) {
        final List<BaggageInfo> baggageInfoList = [];
        final List<CancellationInfoItems> cancellationInfoList = [];
        final List<DataChangeInfoItems> dataChangeInfoList = [];
        for (int flight = 0; flight < flightSegment.length; flight++) {
          final FlightSegment flightDetailObj = flightSegment[flight];
          //to prepare baggage info item for mini rule
          final BaggageInfo baggageInfo = BaggageInfo(
            fromLocationCode:
                flightDetailObj.departureAirport?.locationCode ?? 'N/A',
            toLocationCode:
                flightDetailObj.arrivalAirport?.locationCode ?? 'N/A',
            cabinAllowedWeight: flightDetailObj.cabinBaggage ?? '',
            checkingAllowedWeight: flightDetailObj.chekinBaggage ?? '',
            airlineCode:
                '${flightDetailObj.operatingAirline?.code}-${flightDetailObj.operatingAirline?.flightNumber ?? 'N/A'}',
            airlineName:
                airlineInfo?[flightDetailObj.operatingAirline?.code]?.name ??
                    flightDetailObj.operatingAirline?.name ??
                    'N/A',
            passengerType: 'ADT',
            baggageInfoNote: flightDetailObj.baggageInfoNote,
          );
          baggageInfoList.add(baggageInfo);
        }
        //to prepare cancellation info item for mini rule
        cancellationInfoList.addAll(
          setCancellationList(miniRule),
        );
        //to prepare data change info item for mini rule
        final double clearTripChangeCharge =
            miniRule.cleartripCharges?.amend ?? 0;
        final double airlineChangeCharge = miniRule.airlineCharges?.amend ?? 0;
        final DataChangeInfoItems airlineData = DataChangeInfoItems(
          dataChangeAmount: FlightUtils.getPriceFormatWithSymbol(
            price: airlineChangeCharge.toDouble(),
          ),
          dataChangeItemDescription: 'airline_data_change_fee',
          chargesAmount: airlineChangeCharge.toDouble(),
        );
        dataChangeInfoList.add(airlineData);
        final DataChangeInfoItems clearTripData = DataChangeInfoItems(
          dataChangeAmount: FlightUtils.getPriceFormatWithSymbol(
            price: clearTripChangeCharge.toDouble(),
          ),
          dataChangeItemDescription: 'clear_trip_data_change_fee',
          chargesAmount: clearTripChangeCharge.toDouble(),
        );
        dataChangeInfoList.add(clearTripData);
        final BaggageMiniRule baggageMiniRule = BaggageMiniRule(
          fromLocationCity: fromLocation,
          toLocationCity: toLocation,
          baggageInfoList: baggageInfoList,
        );
        baggageMiniRuleListToAdd.add(baggageMiniRule);
        final CancellationMiniRule cancellationMiniRule = CancellationMiniRule(
          toLocationCity: toLocation,
          fromLocationCity: fromLocation,
          description: miniRule.dPlusX?.dPlusXNote ?? miniRule.note ?? '',
          cancellationInfoList: cancellationInfoList,
        );
        cancellationMiniRuleListToAdd.add(cancellationMiniRule);
        final DataChangeMiniRule dataChangeMiniRule = DataChangeMiniRule(
          toLocationCity: toLocation,
          fromLocationCity: fromLocation,
          description: miniRule.dPlusX?.dPlusXNote ?? miniRule.note ?? '',
          dataChangeInfoList: dataChangeInfoList,
        );
        dataChangeMiniRuleListToAdd.add(dataChangeMiniRule);
      }
    }
    return MiniRuleDisplayModel(
      baggageMiniRuleList: baggageMiniRuleListToAdd,
      cancellationMiniRuleList: cancellationMiniRuleListToAdd,
      dataChangeMiniRuleList: dataChangeMiniRuleListToAdd,
      isRefundable: miniRule?.isRefundable ?? false,
    );
  }
  factory MiniRuleDisplayModel.fromListUpdate({
    required List<BaggageMiniRule> baggageMiniRuleList,
    required List<CancellationMiniRule> cancellationMiniRuleList,
    required List<DataChangeMiniRule> dataChangeMiniRuleList,
  }) {
    return MiniRuleDisplayModel(
      baggageMiniRuleList: baggageMiniRuleList,
      cancellationMiniRuleList: cancellationMiniRuleList,
      dataChangeMiniRuleList: dataChangeMiniRuleList,
    );
  }
//this method is used to prepare cancellation info item for mini rule
  static List<CancellationInfoItems> setCancellationList(
    MiniRule miniRule,
  ) {
    final List<CancellationInfoItems> cancellationInfoList = [];
    final List<Cancel> cancelList = miniRule.dPlusX?.cancel ?? [];
    final double clearTripCancelCharge = miniRule.cleartripCharges?.cancel ?? 0;
    final double airlineCancelCharge = miniRule.airlineCharges?.cancel ?? 0;
    final CancellationInfoItems airlineCan = CancellationInfoItems(
      cancellationAmount: FlightUtils.getPriceFormatWithSymbol(
        price: airlineCancelCharge.toDouble(),
      ),
      cancellationItemDescription: 'airline_fee',
      chargesAmount: airlineCancelCharge.toDouble(),
    );
    cancellationInfoList.add(airlineCan);
    final CancellationInfoItems clearTripCan = CancellationInfoItems(
      cancellationAmount: FlightUtils.getPriceFormatWithSymbol(
        price: clearTripCancelCharge.toDouble(),
      ),
      cancellationItemDescription: 'clear_trip_fee',
      chargesAmount: clearTripCancelCharge.toDouble(),
    );
    cancellationInfoList.add(clearTripCan);
    if (cancelList.isNotEmpty) {
      for (int itemCancel = 0; itemCancel < cancelList.length; itemCancel++) {
        final Cancel cancel = cancelList[itemCancel];
        cancellationInfoList.add(
          CancellationInfoItems(
            cancellationAmount: FlightUtils.getPriceFormatWithSymbol(
              price: double.parse(cancel.amount.toString()),
            ),
            cancellationItemDescription: '#${cancel.range}',
          ),
        );
      }
    }
    return cancellationInfoList;
  }
}

class BaggageMiniRule {
  BaggageMiniRule({
    this.fromLocationCity,
    this.toLocationCity,
    this.baggageInfoList,
  });
  String? fromLocationCity;
  String? toLocationCity;
  List<BaggageInfo>? baggageInfoList;
}

class BaggageInfo {
  BaggageInfo({
    this.fromLocationCode,
    this.toLocationCode,
    this.airlineCode,
    this.airlineName,
    this.cabinAllowedWeight,
    this.checkingAllowedWeight,
    this.passengerType,
    this.baggageInfoNote,
  });
  String? fromLocationCode;
  String? toLocationCode;
  String? airlineName;
  String? airlineCode;
  String? passengerType;
  String? checkingAllowedWeight;
  String? cabinAllowedWeight;
  String? baggageInfoNote;
}

class CancellationMiniRule {
  CancellationMiniRule({
    this.fromLocationCity,
    this.toLocationCity,
    this.cancellationInfoList,
    this.description,
  });
  String? fromLocationCity;
  String? toLocationCity;
  String? description;
  List<CancellationInfoItems>? cancellationInfoList;
}

class CancellationInfoItems {
  CancellationInfoItems({
    this.cancellationItemDescription,
    this.cancellationAmount,
    this.chargesAmount,
  });
  String? cancellationItemDescription;
  String? cancellationAmount;
  double? chargesAmount;
}

class DataChangeMiniRule {
  DataChangeMiniRule({
    this.fromLocationCity,
    this.toLocationCity,
    this.dataChangeInfoList,
    this.description,
  });
  String? fromLocationCity;
  String? toLocationCity;
  String? description;
  List<DataChangeInfoItems>? dataChangeInfoList;
}

class DataChangeInfoItems {
  DataChangeInfoItems({
    this.dataChangeItemDescription,
    this.dataChangeAmount,
    this.chargesAmount,
  });
  String? dataChangeItemDescription;
  String? dataChangeAmount;
  double? chargesAmount;
}
