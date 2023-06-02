/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async';

import 'package:adani_airport_mobile/modules/cabs/models/request_models/cab_booking_cancellation_request.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cab_googleanalytics.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_cancellation_screen/view/cab_booking_order_cancel_pop_up.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/cab_booking_confirmation_state.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class CabBookingCancelIndicatorView extends StatefulWidget {
  final int? bookingDate;
  final String orderReferenceId;
  final ADTapCallback? successCallBack;
  final CabBookingConfirmationState cabBookingConfirmationState;

  const CabBookingCancelIndicatorView({
    Key? key,
    required this.bookingDate,
    required this.successCallBack,
    required this.cabBookingConfirmationState,
    required this.orderReferenceId,
  }) : super(key: key);

  @override
  State<CabBookingCancelIndicatorView> createState() =>
      _CabBookingCancelIndicatorViewState();
}

class _CabBookingCancelIndicatorViewState
    extends State<CabBookingCancelIndicatorView> with WidgetsBindingObserver {
  final double progressWidth = 102.sp;

  Timer? _timer;
  int _start = 0;
  int progress = 90;
  int difference = 0;

  @override
  void initState() {
    super.initState();
    progress = widget.cabBookingConfirmationState.cabOrderDetailResponseModel
                ?.bookingInfo?.freeCancellationTime.isNullOrEmpty ??
            true
        ? progress
        : int.parse(
            widget.cabBookingConfirmationState.cabOrderDetailResponseModel
                    ?.bookingInfo?.freeCancellationTime ??
                '$progress',
          );
    startTimer();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        startTimer();
        break;
      case AppLifecycleState.inactive:
        cancelTimer();
        break;
      case AppLifecycleState.paused:
        cancelTimer();
        break;
      case AppLifecycleState.detached:
        cancelTimer();
        break;
    }
  }

  Future<void> startTimer() async {
    final currentDateTime =
        (DateTime.now().millisecondsSinceEpoch / 1000).round();
    difference = currentDateTime - (widget.bookingDate ?? 0);
    if (difference <= progress && difference > 0) {
      _start = progress - difference;
      _timer?.cancel();
      const oneSec = Duration(seconds: 1);
      _timer = Timer.periodic(
        oneSec,
        (Timer timer) => {
          if (_start < 0)
            {
              setState(() {
                cancelTimer();
              }),
            }
          else
            {
              setState(() {
                _start--;
              }),
            },
        },
      );
    } else {
      setState(() {
        _start = 0;
      });
    }
  }

  void cancelTimer() {
    _start = 0;
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }
  }

  @override
  void dispose() {
    cancelTimer();
    final observe = WidgetsBinding.instance.removeObserver(this);
    adLog(observe.toString());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _start > 0 &&
            (widget.cabBookingConfirmationState.cabOrderDetailResponseModel
                    ?.tripInfo?.isShowFCTimer ??
                false)
        ? Container(
            decoration: BoxDecoration(
              color: context.adColors.cardBgColor,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  context.k_8,
                ),
              ),
            ),
            padding: EdgeInsets.symmetric(
              vertical: context.k_16,
              horizontal: context.k_20,
            ),
            margin: EdgeInsets.only(
              top: context.k_20,
              bottom: context.k_16,
              left: context.k_16,
              right: context.k_16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: _start.toString(),
                            style: ADTextStyle500.size14.setTextColor(
                              context.adColors.blackTextColor,
                            ),
                          ),
                          TextSpan(
                            text: ' sec',
                            style: ADTextStyle400.size14.setTextColor(
                              context.adColors.blackTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ADSizedBox(height: context.k_6),
                    Stack(
                      children: [
                        Container(
                          width: progressWidth,
                          height: context.k_6,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color: context.adColors.greyReviewShade,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                context.k_4,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: (progressWidth / progress) * _start,
                          height: context.k_6,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            gradient: adGradientColorType3,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                context.k_4,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                InkWell(
                  onTap: () => cancelConfirmation(context),
                  child: Text(
                    '_cancel_booking'.localize(context),
                    style: ADTextStyle400.size14.copyWith(
                      color: context.adColors.blackTextColor,
                      decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          )
        : const SizedBox.shrink();
  }

  void cancelConfirmation(
    BuildContext context,
  ) {
    showModalBottomSheet(
      useRootNavigator: true,
      backgroundColor: context.adColors.whiteTextColor,
      elevation: context.k_8,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(context.k_22),
        ),
      ),
      context: context,
      builder: (dialogContext) {
        return CabBookingOrderCancelPopUp(
          cabBookingCancellationRequest: CabBookingCancellationRequest(
            orderReferenceId: widget.orderReferenceId,
          ),
          detailString:
              'are_you_sure_you_want_to_cancel_your_booking'.localize(context),
          titleString: 'cancel_booking'.localize(context),
          yesCallBack: () => {
            CabGoogleAnalytics().sendGAParametersCabBookingFreeCancellation(
              widget.cabBookingConfirmationState,
              _start,
            ),
            widget.successCallBack?.call(),
          },
          buttonTitle: 'yes'.localize(context),
        );
      },
    ).then((value) => null);
  }
}
