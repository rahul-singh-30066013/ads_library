/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */
import 'package:adani_airport_mobile/modules/cabs/models/response_models/cab_cart_detail_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_detail_screen/views/car_info_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_srp_loading_screen/views/pickup_and_destination_address_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/payment_method_state.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class ReviewCabBookingDetailsBottomSheet extends StatefulWidget {
  final CabCartDetailResponseModel? cabCartDetailResponseModel;
  final PaymentMethodState? paymentMethodState;

  const ReviewCabBookingDetailsBottomSheet({
    Key? key,
    required this.cabCartDetailResponseModel,
    required this.paymentMethodState,
  }) : super(key: key);

  @override
  State<ReviewCabBookingDetailsBottomSheet> createState() =>
      _ReviewBookingDetailsBottomSheetState();
}

class _ReviewBookingDetailsBottomSheetState
    extends State<ReviewCabBookingDetailsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CarInfoView(
            isFromPreBooking: true,
            isRideNow: widget.cabCartDetailResponseModel?.cartDetail?.tripInfo
                    ?.isRideNow ??
                false,
            bookingDate: widget
                .cabCartDetailResponseModel?.cartDetail?.tripInfo?.bookingDate,
            providerImage: widget.cabCartDetailResponseModel?.cartDetail
                ?.securityKey?.providerImage,
            vehicleImage: widget.cabCartDetailResponseModel?.cartDetail
                ?.vehicleDetails?.vehicleImage,
            vehicleType: widget.cabCartDetailResponseModel?.cartDetail
                ?.vehicleDetails?.vehicleType,
            vehicleTypeID: widget.cabCartDetailResponseModel?.cartDetail
                ?.vehicleDetails?.adlCabCategory,
            cabInfo: widget.cabCartDetailResponseModel?.cartDetail?.cabInfo,
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
          ),
          SizedBox(
            height: context.k_34,
          ),
          PickupAndDestinationAddressView(
            pickUpLocationText: widget.cabCartDetailResponseModel?.cartDetail
                    ?.pickup?.locationCode ??
                '',
            destinationLocationText: widget.cabCartDetailResponseModel
                    ?.cartDetail?.drop?.locationCode ??
                '',
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
            bottom: context.k_48,
          ),
          /* CabFareDetailsView(
            shakeKey: GlobalKey<ShakeWidgetState>(),
            priceInfo: widget.paymentMethodState?.cabCartDetailResponseModel
                ?.cartDetail?.priceInfo,
            cabFare: widget.paymentMethodState?.cabCartDetailResponseModel
                ?.cartDetail?.priceInfo?.totalAmount
                ?.toDouble(),
            couponDiscount: widget
                .paymentMethodState
                ?.cabCartDetailResponseModel
                ?.cartDetail
                ?.promoDetails
                ?.promoValue
                ?.toDouble(),
            totalAmount: widget.paymentMethodState?.getTotalAmount(),
            rewardPoints: ((widget.paymentMethodState?.isRedeemPointsChecked ??
                            false)
                        ? widget.paymentMethodState?.rewardPoint.value ?? 0
                        : 0) >
                    (widget.paymentMethodState?.totalAmountToDisplayAtBottom ??
                        0)
                ? widget.paymentMethodState?.totalAmountToDisplayAtBottom ?? 0
                : (widget.paymentMethodState?.isRedeemPointsChecked ?? false)
                    ? widget.paymentMethodState?.rewardPoint.value ?? 0
                    : 0,
            totalAmountTitle: 'total_amount'.localize(context),
            detail: false,
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
            bottom: context.k_48,
          ),*/
        ],
      ),
    );
  }
}
