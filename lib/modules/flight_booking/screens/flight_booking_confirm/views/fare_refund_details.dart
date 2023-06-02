/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/models/web_view_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/duty_free_order_confirmation/Views/duty_free_refund_screen.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_book/data_model/booking_payment_breakup.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_book/data_model/payment_details.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_cancel/refund_breakup.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_booking_cancel/views/on_cancel_refund_breakup.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/review/views/ad_row.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/travel_class.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

//this class will used to show fare refund breakup for booking details
const keyToExpand = PageStorageKey('expansionTile');

class FareRefundDetails extends StatelessWidget {
  final PaymentDetails? paymentDetails;
  final String orderStatus;
  final bool? isEnableZeroCancellation;
  final bool? cancellationClaimActive;
  final String? cancellationClaimURL;
  final String? cancellationClaimDate;
  final String? cancelId;
  final bool? isInfantCancelOnly;
  final FlightBookingType? flightBookingType;

  const FareRefundDetails({
    Key? key,
    required this.orderStatus,
    required this.paymentDetails,
    this.cancelId,
    this.isEnableZeroCancellation,
    this.cancellationClaimActive,
    this.cancellationClaimURL,
    this.cancellationClaimDate,
    this.isInfantCancelOnly,
    this.flightBookingType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<PaymentModes?> refundBreakup =
        paymentDetails?.paymentModes ?? [];
    final getPaymentModesText = getPaymentModeText(paymentDetails, context);
    final totalRefundAmount = _getTotalRefund(refundBreakup);
    final cancellationAirfareCharges =
        (paymentDetails?.cancellationAirfareCharges ?? '0')
            .toString()
            .replaceAll('-', '');
    final cancellationPartnerCharges =
        (paymentDetails?.partnerCancellationCharges ?? '0')
            .toString()
            .replaceAll('-', '');
    final grossCharges = paymentDetails?.getGrossChargesForCancelledPax ?? 0;

    final double? loyaltyPaidForCancelledPax = cancelId.isNullOrEmpty
        ? paymentDetails?.loyaltyApplied
        : (paymentDetails?.loyaltyApplied ?? 0) -
            (paymentDetails?.loyaltyRefunded ?? 0);

    final double? promoPaidForCancelledPax = cancelId.isNullOrEmpty
        ? paymentDetails?.promoApplied
        : (paymentDetails?.promoApplied ?? 0) -
            (paymentDetails?.promoRefunded ?? 0);

    final RefundBreakup cancelRefundBreakup = RefundBreakup(
      airlineCharge: double.parse(cancellationAirfareCharges),
      convenienceFe: paymentDetails?.refundBreakupDetails?.convenienceFee ?? 0,
      grossAmount: grossCharges,
      insuranceAmt: paymentDetails?.refundBreakupDetails?.insuranceAmt ?? 0,
      zeroCancellationFee:
          paymentDetails?.refundBreakupDetails?.cancelationFee ?? 0,
      netAmount: grossCharges,
      partnerFee: double.parse(cancellationPartnerCharges),
      paymentDetails: RefundPaymentDetails(
        bank: paymentDetails?.bankPaidAmount,
        loyalty: loyaltyPaidForCancelledPax,
        promo: promoPaidForCancelledPax,
        waiveOff: paymentDetails?.refundBreakupDetails?.waiveOff ?? 0,
      ),
      refundDetails: RefundPaymentDetails(
        bank: paymentDetails?.refundBreakupDetails?.bank ?? 0,
        loyalty: paymentDetails?.refundBreakupDetails?.loyalty ?? 0,
        promo: paymentDetails?.refundBreakupDetails?.promo ?? 0,
        waiveOff: paymentDetails?.refundBreakupDetails?.waiveOff ?? 0,
      ),
      totalRefundAmount: totalRefundAmount,
    );

    final double _heightOfSaveButton = 54.sp;
    return Container(
      width: context.widthOfScreen,
      decoration: BoxDecoration(
        color: DutyFreeRefundScreen.lightBlueColor,
        borderRadius: BorderRadius.all(
          Radius.circular(
            context.k_4,
          ),
        ),
      ),
      child: orderStatus != 'Confirmed' &&
              (totalRefundAmount <= 0 ||
                  paymentDetails?.refundBreakupDetails == null)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ADSizedBox(
                  height: context.k_20,
                ),
                Text(
                  'refund_information'.localize(context),
                  style: ADTextStyle700.size16,
                ).paddingBySide(
                  left: context.k_16,
                  right: context.k_16,
                ),
                if (orderStatus.toLowerCase() != 'failed')
                  RichText(
                    text: TextSpan(
                      text: '',
                      style: ADTextStyle400.size14,
                      children: [
                        TextSpan(
                          text: 'refund_info_description_1'.localize(context),
                          style: ADTextStyle400.size14,
                        ),
                        TextSpan(
                          text: 'support_email'.localize(context),
                          style: ADTextStyle400.size14.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Utils.email(
                                  'support_email'.localize(context),
                                  context,
                                  isPopTrue: true,
                                ),
                        ),
                        TextSpan(
                          text: '.',
                          style: ADTextStyle400.size14,
                        ),
                      ],
                    ),
                  ).paddingBySide(
                    left: context.k_16,
                    bottom: context.k_12,
                    top: context.k_12,
                    right: context.k_16,
                  )
                else
                  RichText(
                    text: TextSpan(
                      text: '',
                      style: ADTextStyle400.size14,
                      children: [
                        TextSpan(
                          text: 'refund_info_description_2'.localize(context),
                          style: ADTextStyle400.size14,
                        ),
                      ],
                    ),
                  ).paddingBySide(
                    left: context.k_16,
                    bottom: context.k_12,
                    top: context.k_12,
                    right: context.k_16,
                  ),
                if ((isEnableZeroCancellation ?? false) &&
                    !(isInfantCancelOnly ?? false) &&
                    orderStatus.toLowerCase() != 'failed')
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'zero_cancellation'.localize(context),
                            style: ADTextStyle700.size16
                                .setTextColor(context.adColors.black),
                          ).paddingBySide(
                            right: context.k_4,
                          ),
                          SvgPicture.asset(
                            SvgAssets.zeroCancellationIcon,
                            height: context.k_20,
                            width: context.k_22,
                          ),
                        ],
                      ),
                      if (!(cancellationClaimActive ?? false))
                        Text(
                          flightBookingType == FlightBookingType.cancelled
                              ? 'after_cancel_text'.localize(context)
                              : 'option_to_claim_refund'.localize(context),
                          style: ADTextStyle400.size14
                              .setTextColor(context.adColors.black),
                        ).paddingBySide(
                          right: context.k_4,
                          bottom: context.k_20,
                          top: context.k_10,
                        )
                      else
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    '${'refund_amount_of'.localize(context)} ',
                                style: ADTextStyle400.size14.setTextColor(
                                  context.adColors.black,
                                ),
                              ),
                              TextSpan(
                                text: FlightUtils.getPriceFormatWithSymbol(
                                  price:
                                      double.parse(cancellationAirfareCharges),
                                ),
                                style: ADTextStyle500.size14.setTextColor(
                                  context.adColors.black,
                                ),
                              ),
                              TextSpan(
                                text: ' ${'by'.localize(context)} ',
                                style: ADTextStyle400.size14.setTextColor(
                                  context.adColors.black,
                                ),
                              ),
                              TextSpan(
                                text: cancellationClaimDate,
                                style: ADTextStyle500.size14.setTextColor(
                                  context.adColors.black,
                                ),
                              ),
                            ],
                          ),
                        ).paddingBySide(
                          right: context.k_4,
                          bottom: context.k_10,
                          top: context.k_10,
                        ),
                    ],
                  ).paddingBySide(
                    left: context.k_16,
                    top: context.k_10,
                    right: context.k_16,
                  ),
                if ((cancellationClaimActive ?? false) &&
                    !(isInfantCancelOnly ?? false) &&
                    orderStatus.toLowerCase() != 'failed')
                  ElevatedButton(
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      minimumSize: Size(
                        double.infinity,
                        _heightOfSaveButton,
                      ),
                      maximumSize: Size(
                        double.infinity,
                        _heightOfSaveButton,
                      ),
                    ),
                    child: Text(
                      'claim'.localize(context) +
                          FlightUtils.getPriceFormatWithSymbol(
                            price: double.parse(cancellationAirfareCharges),
                          ),
                      style: ADTextStyle700.size18.setTextColor(
                        context.adColors.whiteTextColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ).paddingBySide(
                    left: context.k_16,
                    right: context.k_16,
                    bottom: context.k_20,
                  ),
                if ((cancellationClaimActive ?? false) &&
                    !(isInfantCancelOnly ?? false) &&
                    orderStatus.toLowerCase() != 'failed')
                  ADSizedBox(
                    height: context.k_8,
                  ),
              ],
            )
          : Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTileTheme(
                    contentPadding: const EdgeInsets.all(0),
                    dense: true,
                    horizontalTitleGap: 0,
                    minLeadingWidth: 0,
                    child: ExpansionTile(
                      title: ADRow(
                        leftText: 'total_refund_amount'.localize(context),
                        leftTextStyle: ADTextStyle700.size18.setTextColor(
                          context.adColors.blackTextColor,
                        ),
                        rightText: ' ${FlightUtils.getPriceFormatWithSymbol(
                          price: cancelRefundBreakup.refundDetails?.bank ?? 0,
                        )}',
                        rightTextStyle: ADTextStyle700.size18.setTextColor(
                          context.adColors.blackTextColor,
                        ),
                      ),
                      iconColor: context.adColors.blackTextColor,
                      collapsedIconColor: context.adColors.blackTextColor,
                      maintainState: true,
                      key: keyToExpand,
                      children: [
                        OnCancelRefundBreakUp(
                          refundBreakup: cancelRefundBreakup,
                          paymentModeText: getPaymentModesText,
                          isZeroCancellation: isEnableZeroCancellation,
                          isInfantCancelOnly: isInfantCancelOnly,
                        ).paddingBySide(
                          left: context.k_6,
                          right: context.k_6,
                        ),
                      ],
                    ).paddingBySide(left: context.k_14, right: context.k_14),
                  ),
                  Column(
                    children: [
                      Divider(
                        thickness: 1,
                        height: context.k_2,
                        color: context.adColors.tileBorderColor,
                      ).paddingBySide(
                        top: context.k_12,
                        bottom: (((cancelRefundBreakup.refundDetails?.bank ??
                                        0) >
                                    0) ||
                                (cancelRefundBreakup.refundDetails?.loyalty ??
                                        0) >
                                    0)
                            ? context.k_6
                            : 0,
                      ),
                      SizedBox(
                        height: context.k_10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: SvgPicture.asset(
                                      'lib/assets/images/svg/icons/flight/credit_card.svg',
                                      height: context.k_18,
                                      color: context.adColors.greyCircleColor,
                                    ),
                                  ),
                                  TextSpan(
                                    style: ADTextStyle700.size14.setTextColor(
                                      context.adColors.blackTextColor,
                                    ),
                                    text:
                                        '  ${FlightUtils.getPriceFormatWithSymbol(
                                      price: cancelRefundBreakup
                                              .refundDetails?.bank ??
                                          0,
                                    )} ',
                                  ),
                                  TextSpan(
                                    style: ADTextStyle400.size14.setTextColor(
                                      context.adColors.blackTextColor,
                                    ),
                                    text:
                                        'will_be_refunded_to_your_mode_of_payment'
                                            .localize(context),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ).paddingBySide(top: context.k_2, bottom: context.k_12),
                      if ((cancelRefundBreakup.refundDetails?.loyalty ?? 0) > 0)
                        Row(
                          children: [
                            Expanded(
                              child: RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: SvgPicture.asset(
                                        'lib/assets/images/svg/icons/loyalty/Coin.svg',
                                        height: context.k_18,
                                      ),
                                    ),
                                    TextSpan(
                                      style: ADTextStyle700.size14.setTextColor(
                                        context.adColors.blackTextColor,
                                      ),
                                      text:
                                          '  ${FlightUtils.getFloorAmountInThousandFormat(
                                        price: cancelRefundBreakup
                                                .refundDetails?.loyalty ??
                                            0,
                                      )} ',
                                    ),
                                    TextSpan(
                                      style: ADTextStyle400.size14.setTextColor(
                                        context.adColors.blackTextColor,
                                      ),
                                      text:
                                          'reward_points_will_be_credited_back'
                                              .localize(context),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ).paddingBySide(bottom: context.k_12),
                      Text(
                        'refund_fare_segment_content'.localize(context),
                        style: ADTextStyle400.size14
                            .setTextColor(context.adColors.blackTextColor),
                      ).paddingBySide(
                        bottom: context.k_20,
                      ),
                    ],
                  ).paddingBySide(
                    left: context.k_14,
                    right: context.k_14,
                  ),
                  if ((isEnableZeroCancellation ?? false) &&
                      !(isInfantCancelOnly ?? false))
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'zero_cancellation'.localize(context),
                              style: ADTextStyle700.size16
                                  .setTextColor(context.adColors.black),
                            ).paddingBySide(
                              right: context.k_4,
                            ),
                            SvgPicture.asset(
                              SvgAssets.zeroCancellationIcon,
                              height: context.k_20,
                              width: context.k_22,
                            ),
                          ],
                        ),
                        if (!(cancellationClaimActive ?? false))
                          Text(
                            flightBookingType == FlightBookingType.cancelled
                                ? 'after_cancel_text'.localize(context)
                                : 'option_to_claim_refund'.localize(context),
                            style: ADTextStyle400.size14
                                .setTextColor(context.adColors.black),
                          ).paddingBySide(
                            right: context.k_4,
                            bottom: context.k_20,
                            top: context.k_10,
                          )
                        else
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      '${'refund_amount_of'.localize(context)} ',
                                  style: ADTextStyle400.size14.setTextColor(
                                    context.adColors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: FlightUtils.getPriceFormatWithSymbol(
                                    price: double.parse(
                                      cancellationAirfareCharges,
                                    ),
                                  ),
                                  style: ADTextStyle500.size14.setTextColor(
                                    context.adColors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ${'by'.localize(context)} ',
                                  style: ADTextStyle400.size14.setTextColor(
                                    context.adColors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: cancellationClaimDate,
                                  style: ADTextStyle500.size14.setTextColor(
                                    context.adColors.black,
                                  ),
                                ),
                              ],
                            ),
                          ).paddingBySide(
                            right: context.k_4,
                            bottom: context.k_20,
                            top: context.k_10,
                          ),
                      ],
                    ).paddingAllSide(
                      context.k_10,
                    ),
                  if ((cancellationClaimActive ?? false) &&
                      !(isInfantCancelOnly ?? false))
                    ElevatedButton(
                      onPressed: () =>
                          navigateToScreenUsingNamedRouteWithArguments(
                        context,
                        webViewContainer,
                        argumentObject: WebViewModel(
                          title: '',
                          url: cancellationClaimURL ?? '',
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        minimumSize: Size(
                          double.infinity,
                          _heightOfSaveButton,
                        ),
                        maximumSize: Size(
                          double.infinity,
                          _heightOfSaveButton,
                        ),
                      ),
                      child: Text(
                        'claim'.localize(context) +
                            FlightUtils.getPriceFormatWithSymbol(
                              price: double.parse(cancellationAirfareCharges),
                            ),
                        style: ADTextStyle700.size18.setTextColor(
                          context.adColors.whiteTextColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ).paddingBySide(
                      left: context.k_16,
                      right: context.k_16,
                      bottom: context.k_20,
                    ),
                  ADSizedBox(
                    height: context.k_8,
                  ),
                ],
              ),
            ),
    );
  }

  //get total refund amount
  double _getTotalRefund(List<PaymentModes?> refundBreakup) {
    double total = 0;
    for (final element in refundBreakup) {
      if (element?.transactionType == 'Refund' &&
          element?.transactionCode?.toLowerCase() != 'Promo'.toLowerCase()) {
        total = total + (element?.amount ?? 0);
      }
    }
    return total;
  }

//get payment mode text
  String getPaymentModeText(
    PaymentDetails? paymentDetails,
    BuildContext context,
  ) {
    final paymentModeList = paymentDetails?.getOrderedPaymentModes() ?? [];
    final combinedString = paymentModeList
        .map((val) => val.toLowerCase().localize(context))
        .join(' + ');
    return '${'paid_by'.localize(context)} $combinedString';
  }
}
