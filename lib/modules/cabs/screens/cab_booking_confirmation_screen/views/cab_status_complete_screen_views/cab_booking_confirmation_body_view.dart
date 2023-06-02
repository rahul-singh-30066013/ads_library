/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/models/response_models/filtered_vendor_data_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_confirmation_screen/views/cab_booking_cancel_indicator_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_confirmation_screen/views/cab_cancel_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_confirmation_screen/views/cab_cancellation_policy_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_confirmation_screen/views/cab_confirmation_strip_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_confirmation_screen/views/cab_download_invoice_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_confirmation_screen/views/cab_driver_details.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_confirmation_screen/views/cab_payment_mode_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_confirmation_screen/views/cab_show_booking_id_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_confirmation_screen/views/cab_show_status_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_confirmation_screen/views/cab_total_refund_amount_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_confirmation_screen/views/cab_user_info_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_confirmation_screen/views/cabs_timeline_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_detail_screen/views/cab_fare_details_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_detail_screen/views/car_info_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_detail_screen/views/important_information_new_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_detail_screen/views/important_information_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_srp_loading_screen/views/pickup_and_destination_address_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cabs_srp_screen/views/cab_reward_points_view.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/cab_booking_confirmation_state.dart';
import 'package:adani_airport_mobile/modules/cabs/utilities/enums/cab_booking_order_status.dart';
import 'package:adani_airport_mobile/utils/animation/shake_widget.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class CabBookingConfirmationBodyView extends StatelessWidget {
  final CabBookingConfirmationState cabBookingConfirmationState;
  final bool isFromPayment;

  const CabBookingConfirmationBodyView({
    Key? key,
    required this.cabBookingConfirmationState,
    required this.isFromPayment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double bottomSpace = (context.k_48 + context.k_4) +
        ((isFromPayment &&
                ((cabBookingConfirmationState.cabBookingOrderStatus ==
                        CabBookingOrderStatus.confirmed) ||
                    (cabBookingConfirmationState.cabBookingOrderStatus ==
                        CabBookingOrderStatus.scheduled)))
            ? context.k_64 + context.k_20
            : 0);
    return ListView(
      padding: EdgeInsets.zero,
      physics: const ClampingScrollPhysics(),
      children: [
        if ((cabBookingConfirmationState.cabBookingOrderStatus ==
                CabBookingOrderStatus.confirmed) &&
            (cabBookingConfirmationState
                    .cabOrderDetailResponseModel?.tripInfo?.isShowFCTimer ??
                false))
          CabBookingCancelIndicatorView(
            cabBookingConfirmationState: cabBookingConfirmationState,
            bookingDate: cabBookingConfirmationState
                .cabOrderDetailResponseModel?.bookingInfo?.bookingDate,
            successCallBack: () => {
              context.read<CabBookingConfirmationState>().isFromPayment = true,
              cabBookingConfirmationState.getCabBookingOrderDetails(
                context: context,
              ),
            },
            orderReferenceId: cabBookingConfirmationState
                    .commonOrderDetailBaseResponse?.orderReferenceId ??
                '',
          ),
        if (isFromPayment &&
            !(cabBookingConfirmationState.cabBookingOrderStatus ==
                CabBookingOrderStatus.ontheway) &&
            !(cabBookingConfirmationState.cabBookingOrderStatus ==
                CabBookingOrderStatus.completed))
          CabShowBookingIdView(
            title: 'booking_id'.localize(context),
            id: cabBookingConfirmationState
                    .commonOrderDetailBaseResponse?.orderReferenceId ??
                '',
          ).paddingBySide(left: context.k_16, right: context.k_16),
        if ((isFromPayment &&
                (cabBookingConfirmationState.cabBookingOrderStatus ==
                        CabBookingOrderStatus.cancelled ||
                    cabBookingConfirmationState.cabBookingOrderStatus ==
                        CabBookingOrderStatus.failed ||
                    cabBookingConfirmationState.cabBookingOrderStatus ==
                        CabBookingOrderStatus.pending)) ||
            (cabBookingConfirmationState.cabBookingOrderStatus ==
                CabBookingOrderStatus.completed) ||
            (cabBookingConfirmationState.cabBookingOrderStatus ==
                CabBookingOrderStatus.ontheway) ||
            !isFromPayment)
          CabShowStatusView(
            isFromPayment: isFromPayment,
            cabBookingOrderStatus:
                cabBookingConfirmationState.cabBookingOrderStatus,
          ).paddingBySide(left: context.k_16, right: context.k_16),
        CabShowBookingIdView(
          title: 'reference_id'.localize(context),
          id: cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.bookingInfo?.bookingID ??
              '',
        ).paddingBySide(left: context.k_16, right: context.k_16),
        if (cabBookingConfirmationState.cabBookingOrderStatus ==
                CabBookingOrderStatus.scheduled &&
            !(cabBookingConfirmationState
                    .cabOrderDetailResponseModel?.cabInfo?.isKiosk ??
                false))
          CabConfirmationStripView(
            time: cabBookingConfirmationState.cabOrderDetailResponseModel
                    ?.vehicleDetails?.rideDetailSharedTime ??
                '',
          ).paddingBySide(
            top: context.k_20,
            left: context.k_16,
            right: context.k_16,
          ),
        if (cabBookingConfirmationState.cabBookingOrderStatus ==
                CabBookingOrderStatus.cancelled ||
            cabBookingConfirmationState.cabBookingOrderStatus ==
                CabBookingOrderStatus.failed)
          const CabTotalRefundAmountView().paddingBySide(
            left: context.k_16,
            right: context.k_16,
            top: context.k_20,
          ),
        if ((cabBookingConfirmationState.cabBookingOrderStatus ==
                    CabBookingOrderStatus.confirmed ||
                cabBookingConfirmationState.cabBookingOrderStatus ==
                    CabBookingOrderStatus.scheduled) &&
            ((cabBookingConfirmationState
                        .cabOrderDetailResponseModel?.cabInfo?.isKiosk ??
                    false) &&
                (cabBookingConfirmationState
                        .cabOrderDetailResponseModel?.bookingInfo?.kioskInfo !=
                    null)))
          CabsTimelineView(
            supplier: cabBookingConfirmationState
                    .cabOrderDetailResponseModel?.supplierInfo?.name ??
                '',
            wayToKioskText:
                '${cabBookingConfirmationState.cabOrderDetailResponseModel?.bookingInfo?.kioskInfo?.locateInstruction ?? ''} - ${cabBookingConfirmationState.cabOrderDetailResponseModel?.bookingInfo?.kioskInfo?.locationDetail ?? ''} - ${cabBookingConfirmationState.cabOrderDetailResponseModel?.bookingInfo?.kioskInfo?.landmark ?? ''}',
            showYourOTPText: cabBookingConfirmationState
                    .cabOrderDetailResponseModel
                    ?.bookingInfo
                    ?.kioskInfo
                    ?.kioskInstruction ??
                '',
            getTheCabTextText: cabBookingConfirmationState
                    .cabOrderDetailResponseModel
                    ?.bookingInfo
                    ?.kioskInfo
                    ?.boardingMsg ??
                '',
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
            top: context.k_40,
          ),
        Text(
          'booking_details'.localize(context),
          style: ADTextStyle700.size22.setTextColor(
            context.adColors.blackTextColor,
          ),
        ).paddingBySide(
          left: context.k_16,
          right: context.k_16,
          top: context.k_48 + context.k_4,
        ),
        if ((cabBookingConfirmationState.cabBookingOrderStatus ==
                    CabBookingOrderStatus.confirmed ||
                cabBookingConfirmationState.cabBookingOrderStatus ==
                    CabBookingOrderStatus.ontheway) &&
            ((cabBookingConfirmationState.cabOrderDetailResponseModel
                        ?.bookingInfo?.carNumber?.isNotEmpty ??
                    false) ||
                (cabBookingConfirmationState.cabOrderDetailResponseModel
                        ?.bookingInfo?.driverName?.isNotEmpty ??
                    false) ||
                (cabBookingConfirmationState.cabOrderDetailResponseModel
                        ?.bookingInfo?.driverPhone?.isNotEmpty ??
                    false)))
          Column(
            children: [
              CabDriverDetails(
                cabOrderDetailResponseModel:
                    cabBookingConfirmationState.cabOrderDetailResponseModel,
                carNumber: cabBookingConfirmationState
                        .cabOrderDetailResponseModel?.bookingInfo?.carNumber ??
                    '',
                carName: cabBookingConfirmationState.cabOrderDetailResponseModel
                        ?.bookingInfo?.carModelName ??
                    '',
                driverName: cabBookingConfirmationState
                        .cabOrderDetailResponseModel?.bookingInfo?.driverName ??
                    '',
                driverPhone: cabBookingConfirmationState
                        .cabOrderDetailResponseModel
                        ?.bookingInfo
                        ?.driverPhone ??
                    '',
                currencyCode: cabBookingConfirmationState
                    .commonOrderDetailBaseResponse?.orderDetail?.currencyCode,
              ).paddingBySide(
                top: context.k_20,
                bottom: context.k_20,
              ),
              Divider(
                color: context.adColors.tileBorderColor,
                height: 1.sp,
                thickness: 1.sp,
              ),
            ],
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
          ),
        CarInfoView(
          bookingDate: cabBookingConfirmationState
              .cabOrderDetailResponseModel?.tripInfo?.bookingDate,
          providerImage: cabBookingConfirmationState
              .cabOrderDetailResponseModel?.securityKey?.providerImage,
          vehicleImage: cabBookingConfirmationState
              .cabOrderDetailResponseModel?.vehicleDetails?.vehicleImage,
          vehicleType: cabBookingConfirmationState
              .cabOrderDetailResponseModel?.vehicleDetails?.vehicleType,
          vehicleTypeID: cabBookingConfirmationState
              .cabOrderDetailResponseModel?.vehicleDetails?.adlCabCategory,
          cabInfo:
              cabBookingConfirmationState.cabOrderDetailResponseModel?.cabInfo,
        ).paddingBySide(
          top: context.k_20,
          left: context.k_16,
          right: context.k_16,
        ),
        PickupAndDestinationAddressView(
          pickUpLocationText: cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.pickup?.locationCode ??
              '',
          destinationLocationText: cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.drop?.locationCode ??
              '',
        ).paddingBySide(
          top: context.k_36,
          left: context.k_16,
          right: context.k_16,
        ),
        if (((cabBookingConfirmationState.cabBookingOrderStatus ==
                        CabBookingOrderStatus.confirmed ||
                    cabBookingConfirmationState.cabBookingOrderStatus ==
                        CabBookingOrderStatus.scheduled) &&
                isFromPayment) &&
            (cabBookingConfirmationState.isEarnPointsLoading ||
                (cabBookingConfirmationState
                            .commonOrderDetailBaseResponse?.earning?.total ??
                        0) >
                    0))
          CabRewardPointsView(
            loyaltyPoints: cabBookingConfirmationState
                    .commonOrderDetailBaseResponse?.earning?.total ??
                0,
            isFromConfirmation: true,
            isEarnPointsLoading:
                cabBookingConfirmationState.isEarnPointsLoading,
            isRewardEarned: cabBookingConfirmationState
                .commonOrderDetailBaseResponse?.isRewardEarned,
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
            top: context.k_48 + context.k_4,
          ),
        if ((cabBookingConfirmationState.cabBookingOrderStatus ==
                    CabBookingOrderStatus.confirmed ||
                cabBookingConfirmationState.cabBookingOrderStatus ==
                    CabBookingOrderStatus.scheduled) &&
            cabBookingConfirmationState.isImportantInformationAvailable)
          ImportantInformationNewView(
            carInfoDetail: cabBookingConfirmationState
                .filteredVendorDataResponseModel?.result?.infoDetails,
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
            top: context.k_48 + context.k_4,
          ),
        if ((cabBookingConfirmationState.cabBookingOrderStatus ==
                    CabBookingOrderStatus.confirmed ||
                cabBookingConfirmationState.cabBookingOrderStatus ==
                    CabBookingOrderStatus.scheduled) &&
            cabBookingConfirmationState.isStepsToBoardAvailable)
          ImportantInformationView(
            impInfo: ImportantInformation(
              title: 'steps_to_board'.localize(context),
              info: cabBookingConfirmationState
                  .filteredVendorDataResponseModel?.result?.stepsToBoard,
            ),
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
            top: context.k_48 + context.k_4,
          ),
        Column(
          children: [
            if (cabBookingConfirmationState.isDownloadInvoiceAvailable)
              CabDownLoadInvoiceView(
                cabBookingConfirmationState: cabBookingConfirmationState,
              ),
            if (!isFromPayment &&
                !(cabBookingConfirmationState.cabBookingOrderStatus ==
                    CabBookingOrderStatus.cancelled) &&
                !(cabBookingConfirmationState.cabBookingOrderStatus ==
                    CabBookingOrderStatus.completed) &&
                !(cabBookingConfirmationState.cabBookingOrderStatus ==
                    CabBookingOrderStatus.ontheway) &&
                !(cabBookingConfirmationState.cabBookingOrderStatus ==
                    CabBookingOrderStatus.pending) &&
                !(cabBookingConfirmationState.cabBookingOrderStatus ==
                    CabBookingOrderStatus.failed))
              Column(
                children: [
                  if (!cabBookingConfirmationState.isDownloadInvoiceAvailable)
                    Divider(
                      color: context.adColors.tileBorderColor,
                      height: 1.sp,
                      thickness: 1.sp,
                    ),
                  const CabCancelView(),
                ],
              ),
          ],
        ).paddingBySide(
          left: context.k_16,
          right: context.k_16,
          top: ((cabBookingConfirmationState.isDownloadInvoiceAvailable) ||
                  (!isFromPayment &&
                      !(cabBookingConfirmationState.cabBookingOrderStatus ==
                          CabBookingOrderStatus.cancelled) &&
                      !(cabBookingConfirmationState.cabBookingOrderStatus ==
                          CabBookingOrderStatus.completed) &&
                      !(cabBookingConfirmationState.cabBookingOrderStatus ==
                          CabBookingOrderStatus.ontheway) &&
                      !(cabBookingConfirmationState.cabBookingOrderStatus ==
                          CabBookingOrderStatus.pending) &&
                      !(cabBookingConfirmationState.cabBookingOrderStatus ==
                          CabBookingOrderStatus.failed)))
              ? context.k_48 + context.k_4
              : 0,
        ),
        if (((!isFromPayment &&
                    (cabBookingConfirmationState.cabBookingOrderStatus ==
                            CabBookingOrderStatus.confirmed ||
                        cabBookingConfirmationState.cabBookingOrderStatus ==
                            CabBookingOrderStatus.scheduled)) ||
                (cabBookingConfirmationState.cabBookingOrderStatus ==
                        CabBookingOrderStatus.ontheway ||
                    cabBookingConfirmationState.cabBookingOrderStatus ==
                        CabBookingOrderStatus.completed)) &&
            (cabBookingConfirmationState.isEarnPointsLoading ||
                (cabBookingConfirmationState
                            .commonOrderDetailBaseResponse?.earning?.total ??
                        0) >
                    0))
          CabRewardPointsView(
            loyaltyPoints: cabBookingConfirmationState
                    .commonOrderDetailBaseResponse?.earning?.total ??
                0,
            isFromConfirmation: true,
            isEarnPointsLoading:
                cabBookingConfirmationState.isEarnPointsLoading,
          ).paddingBySide(
            top: context.k_48 + context.k_4,
            left: context.k_16,
            right: context.k_16,
          ),
        Column(
          children: [
            CabFareDetailsView(
              shakeKey: GlobalKey<ShakeWidgetState>(),
              priceInfo: cabBookingConfirmationState
                  .cabOrderDetailResponseModel?.priceInfo,
              couponDiscount: cabBookingConfirmationState
                  .commonOrderDetailBaseResponse
                  ?.isPromoApplied(),
              rewardPoints: cabBookingConfirmationState
                  .commonOrderDetailBaseResponse
                  ?.isLoyaltyApplied(),
              totalAmount: cabBookingConfirmationState
                      .cabOrderDetailResponseModel?.priceInfo?.discountPrice ??
                  0,
              showBottomDivider: false,
            ),
            if ((!isFromPayment &&
                    (cabBookingConfirmationState.cabBookingOrderStatus ==
                            CabBookingOrderStatus.confirmed ||
                        cabBookingConfirmationState.cabBookingOrderStatus ==
                            CabBookingOrderStatus.scheduled ||
                        cabBookingConfirmationState.cabBookingOrderStatus ==
                            CabBookingOrderStatus.cancelled)) ||
                (cabBookingConfirmationState.cabBookingOrderStatus ==
                        CabBookingOrderStatus.ontheway ||
                    cabBookingConfirmationState.cabBookingOrderStatus ==
                        CabBookingOrderStatus.completed))
              const CabPaymentModeView()
            else
              Divider(
                color: context.adColors.tileBorderColor,
                height: 1.sp,
                thickness: 1.sp,
              ),
          ],
        ).paddingBySide(
          right: context.k_16,
          left: context.k_16,
          top: (((!isFromPayment &&
                          (cabBookingConfirmationState.cabBookingOrderStatus ==
                                  CabBookingOrderStatus.confirmed ||
                              cabBookingConfirmationState
                                      .cabBookingOrderStatus ==
                                  CabBookingOrderStatus.scheduled)) ||
                      (cabBookingConfirmationState.cabBookingOrderStatus ==
                              CabBookingOrderStatus.ontheway ||
                          cabBookingConfirmationState.cabBookingOrderStatus ==
                              CabBookingOrderStatus.completed)) &&
                  (cabBookingConfirmationState.cabBookingOrderStatus ==
                          CabBookingOrderStatus.completed
                      ? (cabBookingConfirmationState
                                  .cabOrderDetailResponseModel
                                  ?.priceInfo
                                  ?.loyaltyPoints
                                  ?.earnedRewardPoints ??
                              0) >
                          0
                      : (cabBookingConfirmationState
                                  .cabOrderDetailResponseModel
                                  ?.priceInfo
                                  ?.loyaltyPoints
                                  ?.pendingRewardPoints ??
                              0) >
                          0))
              ? context.k_40
              : context.k_48 + context.k_4,
        ),
        const CabUserInfoView().paddingBySide(
          left: context.k_16,
          right: context.k_16,
          top: context.k_48 + context.k_4,
        ),
        if ((!(cabBookingConfirmationState.cabBookingOrderStatus ==
                    CabBookingOrderStatus.ontheway) &&
                !(cabBookingConfirmationState.cabBookingOrderStatus ==
                    CabBookingOrderStatus.completed) &&
                !(cabBookingConfirmationState.cabBookingOrderStatus ==
                    CabBookingOrderStatus.cancelled)) &&
            !(cabBookingConfirmationState.cabBookingOrderStatus ==
                CabBookingOrderStatus.failed) &&
            !(cabBookingConfirmationState.cabBookingOrderStatus ==
                CabBookingOrderStatus.pending) &&
            cabBookingConfirmationState.isCancellationPolicyAvailable)
          CabCancellationPolicyView(
            cabBookingConfirmationState: cabBookingConfirmationState,
          ).paddingBySide(
            top: context.k_48 + context.k_4,
          ),
        ADSizedBox(
          height: bottomSpace,
        ),
      ],
    );
  }
}
