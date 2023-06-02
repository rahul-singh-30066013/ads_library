/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/models/request_models/cab_booking_cancellation_request.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/cab_booking_cancellation_pop_up_state.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// Order cancellation bottom sheet popup
class CabBookingOrderCancelPopUp extends StatefulWidget {
  final CabBookingCancellationRequest cabBookingCancellationRequest;
  final ADTapCallback yesCallBack;

  /// Title Text String
  final String titleString;

  /// Detail Text String

  final String detailString;
  final String? buttonTitle;
  static double k_72 = 72.sp;

  const CabBookingOrderCancelPopUp({
    Key? key,
    required this.cabBookingCancellationRequest,
    required this.yesCallBack,
    required this.titleString,
    required this.detailString,
    this.buttonTitle,
  }) : super(key: key);

  @override
  _CabBookingOrderCancelPopUpState createState() =>
      _CabBookingOrderCancelPopUpState();
}

class _CabBookingOrderCancelPopUpState
    extends State<CabBookingOrderCancelPopUp> {
  CabBookingCancellationPopUpState cabBookingCancellationPopUpState =
      CabBookingCancellationPopUpState();

  @override
  void initState() {
    cabBookingCancellationPopUpState.cabBookingCancellationRequest =
        widget.cabBookingCancellationRequest;
    super.initState();
  }

  @override
  void dispose() {
    cabBookingCancellationPopUpState.orderCancellationState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: cabBookingCancellationPopUpState.orderCancellationState,
      builder: (context, Status status, child) {
        return SafeArea(
          child: AbsorbPointer(
            absorbing: status == Status.loading,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: context.scaled(context.k_32),
                ),
                Text(
                  widget.titleString,
                  textAlign: TextAlign.left,
                  style: ADTextStyle700.size22
                      .setTextColor(context.adColors.black),
                ).paddingBySide(left: context.k_16, right: context.k_16),
                SizedBox(
                  height: context.k_20,
                ),
                Text(
                  widget.detailString,
                  textAlign: TextAlign.left,
                  style: ADTextStyle400.size16
                      .setTextColor(context.adColors.black),
                ).paddingBySide(left: context.k_16, right: context.k_16),
                SizedBox(
                  height: context.scaled(context.k_30),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ADSizedBox(
                        height: context.k_48,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(context.k_24),
                              ),
                              side: BorderSide(
                                color: context.adColors.blackTextColor,
                              ),
                            ),
                            backgroundColor: context.adColors.whiteTextColor,
                          ),
                          child: Text(
                            'no'.localize(context),
                            style: ADTextStyle400.size16
                                .setTextColor(context.adColors.blackTextColor),
                          ),
                        ),
                      ),
                    ),
                    ADSizedBox(
                      width: context.k_10,
                    ),
                    Expanded(
                      child: ADSizedBox(
                        height: context.k_48,
                        child: ElevatedButton(
                          onPressed: () => dismissDialogAndPush(context),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(context.k_24),
                              ),
                            ),
                            backgroundColor: context.adColors.blackTextColor,
                          ),
                          child: (status == Status.loading)
                              ? ADDotProgressView(
                                  color: context.adColors.whiteTextColor,
                                  size: context.k_6,
                                )
                              : Text(
                                  widget.buttonTitle ?? 'yes'.localize(context),
                                  style: ADTextStyle700.size16.setTextColor(
                                    context.adColors.whiteTextColor,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                ).paddingBySide(left: context.k_16, right: context.k_16),
                SizedBox(
                  height: context.scaled(context.k_16),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void dismissDialogAndPush(
    BuildContext context,
  ) {
    cabBookingCancellationPopUpState.hitCancelAPI(
      context: context,
      yesCallBack: widget.yesCallBack,
    );
  }
}

// /// This class is used to for create CabBooking Remove Item Header & Footer View
// ///[CabBookingRemoveOrderCancelHeader] is use for create Header View
// class CabBookingRemoveOrderCancelHeader extends StatelessWidget {
//   CabBookingRemoveOrderCancelHeader({
//     Key? key,
//   }) : super(key: key);
//   final double _height = 50.sp;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: _height,
//       child: Row(
//         children: <Widget>[
//           InkWell(
//             splashColor: context.adColors.transparentColor,
//             onTap: () => {
//               Navigator.pop(context),
//             },
//
//             ///Image that will be used to Left Top close button
//             child: Container(
//               width: context.k_34,
//               height: context.k_34,
//               child: Image.asset(
//                 'lib/assets/images/common/cross_black.png',
//                 width: context.scaled(context.k_10),
//                 height: context.scaled(context.k_10),
//               ).paddingAllSide(context.k_10),
//             ),
//           ),
//           SizedBox(
//             width: context.scaled(context.k_4),
//           ),
//         ],
//       ),
//     ).paddingBySide(left: context.k_6, right: context.k_6);
//   }
// }
