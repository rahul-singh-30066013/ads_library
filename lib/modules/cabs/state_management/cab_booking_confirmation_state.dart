/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:convert';

import 'package:adani_airport_mobile/modules/cabs/models/helping_models/cab_live_tracking_navigate_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/request_models/filtered_vendor_data_request_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/cab_order_detail_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/filtered_vendor_data_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cab_googleanalytics.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cabs_booking_repository.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_live_tracking/cab_live_tracking_screen.dart';
import 'package:adani_airport_mobile/modules/cabs/utilities/constants/cab_constants.dart';
import 'package:adani_airport_mobile/modules/cabs/utilities/enums/cab_booking_order_status.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/common_order_detail_base_response.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/earning.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/potential_earning_response_model.dart';
import 'package:adani_airport_mobile/modules/flight_booking/repositories/flight_booking_repository.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';

class CabBookingConfirmationState extends ADBaseViewModel {
  final CabsBookingRepository _cabsBookingRepository = CabsBookingRepository();
  final FlightBookingRepository _flightBookingRepository =
      FlightBookingRepository();
  String orderReferenceId = '';
  CabOrderDetailResponseModel? cabOrderDetailResponseModel;
  CommonOrderDetailBaseResponse? commonOrderDetailBaseResponse;

  FilteredVendorDataResponseModel? filteredVendorDataResponseModel;
  CabBookingOrderStatus cabBookingOrderStatus = CabBookingOrderStatus.confirmed;
  bool isFromPayment = false;
  bool isFromHomeView = false;
  bool isImportantInformationAvailable = false;
  bool isStepsToBoardAvailable = false;
  bool isCancellationPolicyAvailable = false;
  bool isDownloadInvoiceAvailable = false;
  bool isFirstTime = true;
  bool stopBookingStatusApiPolling = false;
  bool isEarnPointsLoading = false;

  ///It will update cabListingState
  ADResponseState? _orderDetailState = ADResponseState.completed('data');

  ADResponseState? get orderDetailState => _orderDetailState;

  void updateOrderDetailState(ADResponseState? response) {
    _orderDetailState = response;
    notifyListeners();
  }

  Future<void> getCabBookingOrderDetails({
    required BuildContext context,
    ADResponseState? response,
    bool needToShowLoading = true,
  }) async {
    if (needToShowLoading) {
      updateOrderDetailState(ADResponseState.loading());
    }
    response ??= await _flightBookingRepository.getOrder(
      orderReferenceId,
    );
    if (response.viewStatus == Status.complete) {
      commonOrderDetailBaseResponse =
          response.data as CommonOrderDetailBaseResponse;
      cabOrderDetailResponseModel =
          commonOrderDetailBaseResponse?.orderDetail?.cabDetail ??
              CabOrderDetailResponseModel();

      final bookingStatus =
          commonOrderDetailBaseResponse?.statusHistory?.last.status ??
              'confirmed';
      cabBookingOrderStatus = CabBookingOrderStatus.values.byName(
        bookingStatus.toLowerCase(),
      );
      orderReferenceId = commonOrderDetailBaseResponse?.orderReferenceId ?? '';
      isDownloadInvoiceAvailable =
          cabOrderDetailResponseModel?.bookingInfo?.isInvoiceDownload ?? false;
      if (cabBookingOrderStatus == CabBookingOrderStatus.completed) {
        CabGoogleAnalytics().sendGAParametersCabBookingJourneyCompleted(
          cabOrderDetailResponseModel,
          commonOrderDetailBaseResponse?.orderDetail?.currencyCode,
        );
      }
      if (cabBookingOrderStatus == CabBookingOrderStatus.cancelled) {
        CabGoogleAnalytics().sendGAParametersCabBookingCancellationConfirmed(
          cabOrderDetailResponseModel,
          commonOrderDetailBaseResponse?.orderDetail?.currencyCode,
        );
      }
    }
    await getVendorInformation(
      context,
      response,
    );
    if (isFirstTime) {
      isFirstTime = false;
      initiateGetOrderDetailsInBackGround(context: context);
    }
  }

  void initiateGetOrderDetailsInBackGround({
    required BuildContext context,
  }) {
    if (cabBookingOrderStatus != CabBookingOrderStatus.completed &&
        cabBookingOrderStatus != CabBookingOrderStatus.cancelled) {
      getBookingStatusInBackGround(context: context);
    }
  }

  Future<void> getBookingStatusInBackGround({
    required BuildContext context,
  }) async {
    Future.delayed(
      const Duration(seconds: 5),
      () async {
        if (!stopBookingStatusApiPolling) {
          final ADResponseState response =
              await _flightBookingRepository.getOrder(
            orderReferenceId,
          );
          if (response.viewStatus == Status.complete) {
            final CommonOrderDetailBaseResponse
                newCommonOrderDetailBaseResponse =
                response.data as CommonOrderDetailBaseResponse;
            final bookingStatus =
                newCommonOrderDetailBaseResponse.statusHistory?.last.status ??
                    'confirmed';
            final CabBookingOrderStatus newCabBookingOrderStatus =
                CabBookingOrderStatus.values.byName(
              bookingStatus.toLowerCase(),
            );

            if ((newCabBookingOrderStatus != cabBookingOrderStatus) ||
                ((newCommonOrderDetailBaseResponse.modifiedOn ?? '') !=
                    (newCommonOrderDetailBaseResponse.modifiedOn ?? ''))) {
              updateGetOrderCartDetails(context: context);
            }
          }
          initiateGetOrderDetailsInBackGround(context: context);
        }
      },
    );
  }

  void updateGetOrderCartDetails({
    required BuildContext context,
  }) {
    getCabBookingOrderDetails(context: context, needToShowLoading: false);
  }

  Future<void> getVendorInformation(
    BuildContext context,
    ADResponseState bookingOrderDetailResponse,
  ) async {
    ///For replacing TAGs from important information json
    final Map<String, String> importantInformationTags = {
      CabConstants.distanceKey:
          cabOrderDetailResponseModel?.cabInfo?.kmDistance ?? '',
      CabConstants.pricePerKmKey:
          cabOrderDetailResponseModel?.cabInfo?.extraKMPrice ?? '',
      CabConstants.cabTypeKey:
          cabOrderDetailResponseModel?.vehicleDetails?.adlCabCategory ?? '',
      CabConstants.luggageBagsKey:
          cabOrderDetailResponseModel?.cabInfo?.luggage ?? '',
      CabConstants.rideDetailSharedTimeKey:
          cabOrderDetailResponseModel?.vehicleDetails?.rideDetailSharedTime ??
              '',
    };
    final vendorInfo = FilteredVendorDataRequestModel(
      language: 'en',
      vendorCode: cabOrderDetailResponseModel?.securityKey?.providerCode,
      airport: cabOrderDetailResponseModel?.tripInfo?.airportCode,
      tripType: cabOrderDetailResponseModel?.tripInfo?.isFromAirport ?? false
          ? CabConstants.a2c
          : CabConstants.c2a,
      cabSchedule: cabOrderDetailResponseModel?.tripInfo?.isRideNow ?? false
          ? CabConstants.rideNow
          : CabConstants.rideLater,
      cabBookingType: cabOrderDetailResponseModel?.cabInfo?.isKiosk ?? false
          ? CabConstants.kiosk
          : CabConstants.driverAllocated,
      cancellationCode: cabOrderDetailResponseModel?.cabInfo?.cancellationKey,
      isPreBooking: false,
    );
    final response = await _cabsBookingRepository.fetchVendorInformation(
      filteredVendorDataRequestModel: vendorInfo,
    );
    if (response.viewStatus == Status.complete) {
      filteredVendorDataResponseModel =
          response.data as FilteredVendorDataResponseModel;
      if (filteredVendorDataResponseModel?.result?.infoDetails != null) {
        String infoDetails = jsonEncode(
          filteredVendorDataResponseModel?.result?.infoDetails?.toJson(),
        );
        for (final MapEntry<String, String> values
            in importantInformationTags.entries) {
          infoDetails = infoDetails.replaceAll(
            values.key,
            values.value,
          );
        }
        filteredVendorDataResponseModel?.result?.infoDetails =
            InfoDetails.fromJson(
          jsonDecode(infoDetails),
        );
      }
      if (isFromHomeView &&
          cabBookingOrderStatus == CabBookingOrderStatus.ontheway) {
        final dummy = Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) =>
                CabLiveTrackingScreen(
              cabLiveTrackingNavigateModel: CabLiveTrackingNavigateModel(
                orderReferenceId:
                    commonOrderDetailBaseResponse?.orderReferenceId,
                cabOrderDetailResponseModel: cabOrderDetailResponseModel,
                filteredVendorDataResponseModel:
                    filteredVendorDataResponseModel,
              ),
            ),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
        adLog(dummy.toString());
      }
    }
    isImportantInformationAvailable = filteredVendorDataResponseModel
            ?.result?.infoDetails?.cabImpInfo?.lines?.isNotEmpty ??
        false;
    isStepsToBoardAvailable =
        (filteredVendorDataResponseModel?.result?.stepsToBoard ?? [])
            .isNotEmpty;
    isCancellationPolicyAvailable = filteredVendorDataResponseModel
            ?.result?.infoDetails?.cabCancellationPolicy?.lines?.isNotEmpty ??
        false;
    updateOrderDetailState(bookingOrderDetailResponse);
    notifyListeners();
    getPotentialEarningSync();
  }

  void getPotentialEarningSync() {
    getPotentialEarning();
  }

  Future<void> getPotentialEarning() async {
    isEarnPointsLoading = true;
    if (commonOrderDetailBaseResponse?.earning == null) {
      final potentialEarningResponse =
          await _flightBookingRepository.getPotentialEarning(
        orderReferenceId,
      );
      if (potentialEarningResponse.viewStatus == Status.complete) {
        final PotentialEarningResponseModel potentialEarningResponseModel =
            potentialEarningResponse.data as PotentialEarningResponseModel;
        commonOrderDetailBaseResponse?.earning = Earning(
          total: potentialEarningResponseModel.totalPotentialEarning,
          reward: potentialEarningResponseModel.rewardPotentialEarning,
          order: potentialEarningResponseModel.orderPotentialEarning,
        );
      }
    }
    isEarnPointsLoading = false;
    notifyListeners();
  }
}
