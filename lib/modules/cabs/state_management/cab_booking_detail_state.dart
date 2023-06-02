/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */
import 'dart:convert';

import 'package:adani_airport_mobile/modules/cabs/mixin/apply_coupon.dart';
import 'package:adani_airport_mobile/modules/cabs/models/coupon/cab_booking_apply_coupon_request.dart';
import 'package:adani_airport_mobile/modules/cabs/models/coupon/cab_booking_apply_coupon_response.dart';
import 'package:adani_airport_mobile/modules/cabs/models/request_models/filtered_vendor_data_request_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/cab_cart_detail_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/filtered_vendor_data_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cab_googleanalytics.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cabs_booking_repository.dart';
import 'package:adani_airport_mobile/modules/cabs/utilities/constants/cab_constants.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';

class CabBookingDetailState extends BaseViewModel {
  final CabsBookingRepository cabsBookingRepository = CabsBookingRepository();
  CabCartDetailResponseModel? cabCartDetailResponseModel;
  String? oldAgentId;
  ADResponseState _cabCartDetailState = ADResponseState.init();

  ADResponseState get cabCartDetailState => _cabCartDetailState;
  bool isRemovedCouponClicked = false;
  bool isImportantInformationAvailable = false;
  InfoDetails? carInfoDetail;
  bool isRewardPointsAvailable = false;

  void updateCabCartDetailState(ADResponseState response) {
    if (response.viewStatus == Status.complete) {
      cabCartDetailResponseModel = response.data as CabCartDetailResponseModel;
    }
    _cabCartDetailState = response;
    notifyListeners();
  }

  Future<void> fetchCabCartDetail() async {
    updateCabCartDetailState(ADResponseState.loading());
    final response =
        await cabsBookingRepository.fetchCabCartDetail(oldAgentID: oldAgentId);
    if (response.viewStatus == Status.complete) {
      cabCartDetailResponseModel = response.data as CabCartDetailResponseModel;
      isRewardPointsAvailable =
          (cabCartDetailResponseModel?.cartDetail?.priceInfo?.loyalty ?? 0) > 0;
      await getVendorInformation();
    }
    updateCabCartDetailState(response);
  }

  Future<void> getVendorInformation() async {
    ///For replacing TAGs from important information json
    final Map<String, String> importantInformationTags = {
      CabConstants.distanceKey:
          cabCartDetailResponseModel?.cartDetail?.cabInfo?.kmDistance ?? '',
      CabConstants.pricePerKmKey:
          cabCartDetailResponseModel?.cartDetail?.cabInfo?.extraKMPrice ?? '',
      CabConstants.cabTypeKey: cabCartDetailResponseModel
              ?.cartDetail?.vehicleDetails?.adlCabCategory ??
          '',
      CabConstants.luggageBagsKey:
          cabCartDetailResponseModel?.cartDetail?.cabInfo?.luggage ?? '',
      CabConstants.rideDetailSharedTimeKey: cabCartDetailResponseModel
              ?.cartDetail?.vehicleDetails?.rideDetailSharedTime ??
          '',
    };

    final vendorInfo = FilteredVendorDataRequestModel(
      language: 'en',
      vendorCode:
          cabCartDetailResponseModel?.cartDetail?.securityKey?.providerCode,
      airport: cabCartDetailResponseModel?.cartDetail?.tripInfo?.airportCode,
      tripType:
          cabCartDetailResponseModel?.cartDetail?.tripInfo?.isFromAirport ??
                  false
              ? CabConstants.a2c
              : CabConstants.c2a,
      cabSchedule:
          cabCartDetailResponseModel?.cartDetail?.tripInfo?.isRideNow ?? false
              ? CabConstants.rideNow
              : CabConstants.rideLater,
      cabBookingType:
          cabCartDetailResponseModel?.cartDetail?.cabInfo?.isKiosk ?? false
              ? CabConstants.kiosk
              : CabConstants.driverAllocated,
      cancellationCode:
          cabCartDetailResponseModel?.cartDetail?.cabInfo?.cancellationKey,
      isPreBooking: true,
    );
    final response = await cabsBookingRepository.fetchVendorInformation(
      filteredVendorDataRequestModel: vendorInfo,
    );
    if (response.viewStatus == Status.complete) {
      final filteredVendorDataResponseModel =
          response.data as FilteredVendorDataResponseModel;

      if (filteredVendorDataResponseModel.result?.infoDetails != null) {
        String infoDetails = jsonEncode(
          filteredVendorDataResponseModel.result?.infoDetails?.toJson(),
        );
        for (final MapEntry<String, String> values
            in importantInformationTags.entries) {
          infoDetails = infoDetails.replaceAll(
            values.key,
            values.value,
          );
        }
        carInfoDetail = InfoDetails.fromJson(
          jsonDecode(infoDetails),
        );
      }

      ///For filter cancellation policy for MMT
      /*if (cabCartDetailResponseModel
              ?.cartDetail?.cabInfo?.cancellationKey?.isNotEmpty ??
          false) {
        carInfoDetail?.cabCancellationPolicy?.lines =
            carInfoDetail?.cabCancellationPolicy?.lines
                ?.where(
                  (element) =>
                      element.autoId ==
                      cabCartDetailResponseModel
                          ?.cartDetail?.cabInfo?.cancellationKey,
                )
                .toList();
      }*/
      isImportantInformationAvailable = carInfoDetail != null &&
          (carInfoDetail?.cabImpInfo?.lines?.isNotEmpty ?? false);
    }
  }

  void removeCoupon({
    required BuildContext context,
    required ApplyCoupon applyCoupon,
  }) {
    isRemovedCouponClicked = true;
    notifyListeners();
    cabsBookingRepository
        .removeCoupon(applyCouponRequest: const CabBookingApplyCouponRequest())
        .then(
      (value) async {
        isRemovedCouponClicked = false;
        if (value.data != null) {
          final CabBookingApplyCouponResponse applyCouponResponse =
              CabBookingApplyCouponResponse.fromJson(value.data);
          applyCoupon
              .applyCallBack(applyCouponResponse.cartDetail ?? CartDetail());
          CabGoogleAnalytics()
              .sendGAParametersRemoveCoupon(applyCouponResponse);
        } else {
          const duration = 3000;
          SnackBarUtil.showSnackBar(
            context,
            value.message ?? 'ADLEX01'.localize(context),
            duration,
            EdgeInsets.symmetric(
              horizontal: context.k_16,
              vertical: context.k_64 + context.k_30,
            ),
          );
        }
        notifyListeners();
      },
    );
  }
}
