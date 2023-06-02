/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:math' as math;

import 'package:adani_airport_mobile/modules/common_order_detail/pranaam_detail.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/my_account/widget_view/pranaam_order_detail_controller.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/booking_and_cancellation_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_order_status.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/service_booking/service_booking_details.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:superapp_mobile_style_guide/cached_image/ad_cached_image.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///Grey coloured Container which will have package and flight details.

/// QR image Width
double qrImageWidth = 150.sp;

/// QR image Height
double qrImageHeight = 150.sp;

/// Cancel Text Color
const Color cancelledQrRed = Color(0xffc96d6d);

/// Rotation value for cancel
const int rotationValue = 6;

/// Cancel section display
const isCancel = true;

class TopContainerCancellationView extends StatefulWidget {
  const TopContainerCancellationView({
    Key? key,
    required this.pranaamOrderDetailController,
    required this.isRoundTrip,
  }) : super(key: key);
  final PranaamOrderDetailController pranaamOrderDetailController;
  final bool isRoundTrip;

  @override
  State<TopContainerCancellationView> createState() =>
      _TopContainerCancellationViewState();
}

class _TopContainerCancellationViewState
    extends State<TopContainerCancellationView> {
  BookingAndCancellationState? bookingAndCancellationState;

  @override
  void initState() {
    bookingAndCancellationState = context.read<BookingAndCancellationState>();
    super.initState();
  }

  String _getQrMessage(String bookingType) {
    switch (bookingType.toLowerCase()) {
      case wheelChairBookingType:
        return 'show_qr_wheelchair'.localize(context);
      case porterBookingType:
        return 'show_qr_porter'.localize(context);
      default:
        return 'show_qr_pranaam_executive'.localize(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    ///TODO : add to style guide
    const Color containerColor = Color(0xfff5f5f5);
    final containerHeight = 250.sp;
    final smallContainerHeight = 150.sp;
    final imageHeight = 90.sp;
    final imageWidth = 90.sp;
    final marginBottom = 75.sp;
    const Color cancelledQrRed = Color(0xffc96d6d);

    final booking = bookingAndCancellationState
        ?.bookingDetailsResponse?.orderDetail?.pranaamDetail;

    final packageDetail = isStandAloneService(booking?.pranaamBookingType ?? '')
        ? booking?.standaloneProductDetails
        : booking?.packageDetail;

    return PranaamOrderStatus.getStatus(
                  bookingAndCancellationState?.bookingDetailsResponse?.status ??
                      '',
                ) ==
                PranaamOrderStatus.PENDING ||
            PranaamOrderStatus.getStatus(
                  bookingAndCancellationState?.bookingDetailsResponse?.status ??
                      '',
                ) ==
                PranaamOrderStatus.FAILED
        ? Container(
            color: containerColor,
            height: smallContainerHeight,
            padding: EdgeInsets.only(
              top: context.k_34,
              left: context.k_16,
              right: context.k_16,
            ),
            child: TopRow(
              booking: booking,
              imageWidth: imageWidth,
              imageHeight: imageHeight,
              packageDetail: packageDetail,
            ),
          )
        : Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: marginBottom),
                    color: containerColor,
                    height: containerHeight,
                    padding: EdgeInsets.only(
                      top: context.k_34,
                      left: context.k_16,
                      right: context.k_16,
                    ),
                    child: TopRow(
                      booking: booking,
                      imageWidth: imageWidth,
                      imageHeight: imageHeight,
                      packageDetail: packageDetail,
                    ),
                  ),
                  Container(
                    width: qrImageWidth,
                    height: qrImageHeight,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(context.k_4),
                          decoration: BoxDecoration(
                            color: context.adColors.whiteTextColor,
                            borderRadius: BorderRadius.circular(context.k_4),
                            border: Border.all(
                              color: context.adColors.greyCircleColor,
                            ),
                          ),
                          width: qrImageWidth,
                          height: qrImageHeight,
                          child: QrImage(
                            foregroundColor: widget
                                    .pranaamOrderDetailController
                                    .getBookingDetailsState
                                    .bookingCancelledStatus
                                    .value
                                ? context.adColors.dashedDividerColor
                                : null,
                            data: widget.isRoundTrip
                                ? widget
                                        .pranaamOrderDetailController
                                        .getBookingDetailsState
                                        .bookingDetailsResponse
                                        ?.orderDetail
                                        ?.pranaamDetail
                                        ?.roundTripDetail
                                        ?.tripBookingNumber ??
                                    ''
                                : widget
                                        .pranaamOrderDetailController
                                        .getBookingDetailsState
                                        .bookingDetailsResponse
                                        ?.orderDetail
                                        ?.pranaamDetail
                                        ?.tripDetails
                                        ?.tripBookingNumber ??
                                    '',
                            size: double.infinity,
                            errorStateBuilder: (cxt, err) {
                              return Center(
                                child: Text(
                                  'somethingWentWrong'.localize(context),
                                  style: ADTextStyle400.size18,
                                ),
                              );
                            },
                          ),
                        ),
                        Transform.rotate(
                          angle: -math.pi / rotationValue,
                          child: widget
                                  .pranaamOrderDetailController
                                  .getBookingDetailsState
                                  .bookingCancelledStatus
                                  .value
                              ? Container(
                                  height: context.k_48,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: cancelledQrRed,
                                      width: context.k_4,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(context.k_6),
                                    ),
                                    color: context.adColors.whiteTextColor,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'cancelled'
                                          .localize(context)
                                          .toUpperCase(),
                                      style: ADTextStyle700.size22
                                          .setTextColor(cancelledQrRed),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                              : const ADSizedBox(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ADSizedBox(
                height: context.k_12,
              ),
              if (!widget.pranaamOrderDetailController.getBookingDetailsState
                  .bookingCancelledStatus.value)
                Text(
                  _getQrMessage(
                    widget
                            .pranaamOrderDetailController
                            .getBookingDetailsState
                            .bookingDetailsResponse
                            ?.orderDetail
                            ?.pranaamDetail
                            ?.pranaamBookingType ??
                        '',
                  ),
                  style: ADTextStyle400.size14
                      .setTextColor(context.adColors.blackTextColor),
                  textAlign: TextAlign.center,
                ).paddingBySide(
                  left: context.k_40,
                  right: context.k_40,
                  bottom: context.k_12,
                ),
              if (widget.isRoundTrip
                  ? (widget
                          .pranaamOrderDetailController
                          .getBookingDetailsState
                          .bookingDetailsResponse
                          ?.orderDetail
                          ?.pranaamDetail
                          ?.roundTripDetail
                          ?.tripBookingNumber
                          ?.isNotEmpty ??
                      false)
                  : (widget
                          .pranaamOrderDetailController
                          .getBookingDetailsState
                          .bookingDetailsResponse
                          ?.orderDetail
                          ?.pranaamDetail
                          ?.tripDetails
                          ?.tripBookingNumber
                          ?.isNotEmpty ??
                      false))
                Text(
                  'Reference ID - ${widget.isRoundTrip ? widget.pranaamOrderDetailController.getBookingDetailsState.bookingDetailsResponse?.orderDetail?.pranaamDetail?.roundTripDetail?.tripBookingNumber : widget.pranaamOrderDetailController.getBookingDetailsState.bookingDetailsResponse?.orderDetail?.pranaamDetail?.tripDetails?.tripBookingNumber}',
                  style: ADTextStyle400.size14
                      .setTextColor(context.adColors.blackTextColor),
                  textAlign: TextAlign.center,
                ).paddingBySide(
                  left: context.k_40,
                  right: context.k_40,
                  bottom: context.k_12,
                ),
            ],
          );
  }
}

class TopRow extends StatelessWidget {
  const TopRow({
    Key? key,
    required this.booking,
    required this.imageWidth,
    required this.imageHeight,
    required this.packageDetail,
  }) : super(key: key);

  final PranaamDetail? booking;
  final double imageWidth;
  final double imageHeight;
  final PackageDetail? packageDetail;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isStandAloneService(booking?.pranaamBookingType ?? ''))
          ClipRRect(
            borderRadius: BorderRadius.circular(context.k_8),
            child: SizedBox(
              width: imageWidth,
              height: imageHeight,
              child: packageDetail?.packageImageUrl != null &&
                      packageDetail?.packageImageUrl != ''
                  ? ADCachedImage(
                      imageUrl: packageDetail?.packageImageUrl ??
                          'lib/assets/images/pranaam/porter2.png',
                    )
                  : Image.asset(
                      'lib/assets/images/pranaam/porter2.png',
                    ),
            ),
          )
        else
          packageDetail?.packageImageUrl != null &&
                  packageDetail?.packageImageUrl != ''
              ? SizedBox(
                  width: imageWidth,
                  height: imageHeight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(context.k_8),
                    child: ADCachedImage(
                      imageUrl: packageDetail?.packageImageUrl ??
                          'lib/assets/images/pranaam/pranaam_booking.png',
                      height: imageHeight,
                      width: imageWidth,
                      boxFit: BoxFit.fitHeight,
                    ),
                  ),
                )
              : Image.asset(
                  'lib/assets/images/pranaam/pranaam_booking.png',
                  height: imageHeight,
                  width: imageWidth,
                  fit: BoxFit.fitHeight,
                ),
        ADSizedBox(
          width: context.k_20,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ADSizedBox(
                height: context.k_8,
              ),
              Flexible(
                child: Text(
                  '${packageDetail?.name}',
                  style: ADTextStyle600.size16
                      .setTextColor(context.adColors.neutralInfoMsg),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ADSizedBox(
                    height: context.k_6,
                  ),
                  Row(
                    children: [
                      Text(
                        booking?.tripDetails?.serviceAirportName ?? '',
                        // getCityName(
                        //   booking?.tripDetails.serviceAirport ?? 'AMD',
                        //   context.read<SiteCoreStateManagement>(),
                        // ),
                        style: ADTextStyle400.size16.setTextColor(
                          context.adColors.blackTextColor,
                        ),
                      ),
                      Text(
                        !isStandAloneService(
                          booking?.pranaamBookingType ?? '',
                        )
                            ? ((booking?.travelers?.length ?? 0) > 1)
                                ? ' (${booking?.travelers?.length} ${'guests'.localize(context)})'
                                : ' (${booking?.travelers?.length} ${'guest'.localize(context)})'
                            : ((packageDetail?.itemCount ?? 0) > 1)
                                ? ' (${packageDetail?.itemCount} ${'porters'.localize(context)})'
                                : ' (${packageDetail?.itemCount} ${'porter_title'.localize(context)})',
                        style: ADTextStyle400.size16.setTextColor(
                          context.adColors.blackTextColor,
                        ),
                      ),
                    ],
                  ),
                  ADSizedBox(
                    height: context.k_6,
                  ),
                  Text(
                    '${ServiceBookingDetails.getInstance().getTravelSectorName(booking?.tripDetails?.travelSectorId as int)} (${ServiceBookingDetails.getInstance().getServiceName(booking?.tripDetails?.serviceTypeId as int)})',
                    style: ADTextStyle400.size16.setTextColor(
                      context.adColors.blackTextColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
