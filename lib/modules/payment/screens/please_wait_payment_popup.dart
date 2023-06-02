/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/state_management/payment_method_state.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/play_sound.dart';
import 'package:adani_mobile_utility/app_utils/navigator/ad_material_page_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

const gradient1 = Color(0xff6B5CA6);
const gradient2 = Color(0xff923993);
const gradient3 = Color(0xffF05636);
const gradient4 = Color(0xffF05636);

class PleaseWaitPaymentPopup extends StatefulWidget {
  const PleaseWaitPaymentPopup({
    required this.paymentModule,
    Key? key,
    required this.isPaymentDone,
    this.confirmationWidget,
    this.paymentStatus,
  }) : super(key: key);

  final PaymentModule paymentModule;
  final bool isPaymentDone;
  final PaymentStatus? paymentStatus;

  ///widget to be pushed to display on confirmation screen
  ///null in case when we are showing loading popup
  ///required when [isPaymentDone] is set true
  final Widget? confirmationWidget;

  @override
  State<PleaseWaitPaymentPopup> createState() => _PleaseWaitPaymentPopupState();
}

class _PleaseWaitPaymentPopupState extends State<PleaseWaitPaymentPopup> {
  final double loaderHeight = 230.sp;

  @override
  void initState() {
    if (widget.isPaymentDone) {
      if (widget.paymentStatus == PaymentStatus.confirmed ||
          widget.paymentStatus == PaymentStatus.upgraded ||
          widget.paymentStatus == PaymentStatus.rescheduled) {
        PlaySound.playAudioSound('payment_successful.mp3');
      }
      Future.delayed(
        const Duration(
          seconds: 3,
        ),
        () => Navigator.of(context, rootNavigator: true).pushReplacement(
          ADMaterialPageRoute(
            fullscreenDialog: true,
            childWidget: widget.confirmationWidget ?? const SizedBox(),
          ),
        ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              if (widget.isPaymentDone)
                Container(
                  width: double.infinity,
                  height: loaderHeight,
                  color: context.adColors.whiteTextColor,
                  child: Lottie.asset(
                    widget.paymentStatus == PaymentStatus.pending ||
                            widget.paymentStatus ==
                                PaymentStatus.upgrade_pending ||
                            widget.paymentStatus ==
                                PaymentStatus.reschedule_pending
                        ? 'lib/assets/gif/lottie/booking_pending.json'
                        : widget.paymentStatus == PaymentStatus.failed ||
                                widget.paymentStatus ==
                                    PaymentStatus.upgrade_failed ||
                                widget.paymentStatus ==
                                    PaymentStatus.reschedule_failed
                            ? 'lib/assets/gif/lottie/booking_failed.json'
                            : 'lib/assets/gif/lottie/confirmation_tick.json',
                    repeat: false,
                  ),
                ),
              if (!widget.isPaymentDone)
                Container(
                  width: double.infinity,
                  height: loaderHeight,
                  color: context.adColors.whiteTextColor,
                  alignment: Alignment.center,
                  child: Lottie.asset(
                    'lib/assets/gif/lottie/adani_one_confirmation_loader.json',
                  ),
                ),
            ],
          ),
          Text(
            widget.isPaymentDone ? getStatusHeader() : 'Hold on!',
            style: ADTextStyle700.size22.setTextColor(context.adColors.black),
            textAlign: TextAlign.center,
          ).paddingBySide(bottom: context.k_10),
          if (widget.paymentModule == PaymentModule.dutyFree &&
              !widget.isPaymentDone)
            Text(
              'we_are_verifying_your_order_status'.localize(context),
              style: ADTextStyle400.size14
                  .setTextColor(context.adColors.greyTextColor),
              textAlign: TextAlign.center,
            ).paddingBySide(
              left: context.k_20,
              right: context.k_20,
              bottom: context.k_40,
            )
          else if (!widget.isPaymentDone)
            Text(
              'we_are_verifying_your_booking_status'.localize(context),
              style: ADTextStyle400.size14
                  .setTextColor(context.adColors.greyTextColor),
              textAlign: TextAlign.center,
            ).paddingBySide(
              left: context.k_20,
              right: context.k_20,
              bottom: context.k_40,
            ),
        ],
      ),
    );
  }

  String getStatusHeader() {
    switch (widget.paymentStatus) {
      case PaymentStatus.pending:
        return 'Booking Pending!';

      case PaymentStatus.upgraded:
        return 'Booking Upgraded!';
      case PaymentStatus.rescheduled:
        return 'Booking Rescheduled!';
      case PaymentStatus.upgrade_pending:
        return 'Upgrade Pending!';
      case PaymentStatus.reschedule_pending:
        return 'Reschedule Pending!';
      case PaymentStatus.reschedule_failed:
        return 'Reschedule Failed!';
      case PaymentStatus.upgrade_failed:
        return 'Upgrade Failed!';
      case PaymentStatus.failed:
        return 'Booking Failed!';
      default:
        return widget.paymentModule != PaymentModule.dutyFree
            ? 'Booking Confirmed!'
            : 'Order Placed!';
    }
  }
}

// ignore_for_file: constant_identifier_names
enum PaymentStatus {
  pending,
  failed,
  confirmed,
  upgraded,
  rescheduled,
  upgrade_pending,
  reschedule_pending,
  upgrade_failed,
  reschedule_failed
}
