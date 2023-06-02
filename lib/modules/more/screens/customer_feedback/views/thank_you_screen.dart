/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/more/state_management/feedback_state_management.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// this class is use for showing view for bottom sheet
class ThankYouScreen extends StatelessWidget {
  final ADTapCallback done;
  final String postTypeValue;
  final String incidentNo;
  final FeedbackStateManagement feedbackStateManagement;

  const ThankYouScreen({
    Key? key,
    required this.done,
    required this.feedbackStateManagement,
    required this.postTypeValue,
    required this.incidentNo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> _msg = [];
    if (checkPopUpSuccessMsg()) {
      _msg =
          getMessage(postTypeValue).split('\r\n\r\n')[1].split('{Ticket No.}');
    } else {
      _msg.add(
        feedbackStateManagement.elementsField?.issueTypeList
                ?.firstWhere((item) => item.issueText == postTypeValue)
                .popUpSuccessMsg ??
            '',
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ADSizedBox(
          height: context.k_16,
        ),
        Text(
          postTypeValue != 'Appreciation'
              ? getMessage(postTypeValue).split('\r\n\r\n').first
              : feedbackStateManagement.elementsField?.issueTypeList
                      ?.firstWhere((item) => item.issueText == postTypeValue)
                      .popUpTitle ??
                  '',
          style: ADTextStyle700.size22.setTextColor(
            context.adColors.neutralInfoMsg,
          ),
        ),
        ADSizedBox(
          height: context.k_15,
        ),
        RichText(
          text: TextSpan(
            children: List.generate(
              _msg.length,
              (index) => TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: _msg[index],
                    style: ADTextStyle400.size16.setTextColor(
                      context.adColors.neutralInfoMsg,
                    ),
                  ),
                  if (_msg.length > 1 && index != _msg.length - 1)
                    TextSpan(
                      text: ' $incidentNo',
                      style: ADTextStyle700.size16.setTextColor(
                        context.adColors.neutralInfoMsg,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          HapticFeedback.vibrate();
                          Clipboard.setData(
                            ClipboardData(text: incidentNo),
                          ).then((_) {
                            SnackBarUtil.showSnackBar(
                              context,
                              'Ticket No. saved to Clipboard',
                            );
                          });
                        },
                    ),
                ],
              ),
            ),
          ),
        ),
        ADSizedBox(
          height: context.k_30,
        ),
        Row(
          children: [
            Expanded(
              child: ADSizedBox(
                height: context.k_56,
                child: ElevatedButton(
                  onPressed: () => doneClick(context: context),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(context.k_28),
                      ),
                      side: BorderSide(color: context.adColors.neutralInfoMsg),
                    ),
                    primary: context.adColors.neutralInfoMsg,
                    onPrimary: context.adColors.lightGreyTextColor,
                  ),
                  child: Text(
                    'done'.localize(context),
                    style: ADTextStyle600.size16
                        .setTextColor(context.adColors.whiteTextColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ).paddingBySide(
      left: context.k_16,
      right: context.k_16,
    );
  }

  String getMessage(String postTypeValue) {
    return feedbackStateManagement.elementsField?.issueTypeList
            ?.firstWhere(
              (item) => item.issueText == postTypeValue,
            )
            .popUpSuccessMsg ??
        '';
  }

  bool checkPopUpSuccessMsg() {
    final String msg = feedbackStateManagement.elementsField?.issueTypeList
            ?.firstWhere(
              (item) => item.issueText == postTypeValue,
            )
            .popUpSuccessMsg ??
        '';
    return msg.contains('\r\n\r\n');
  }

  void doneClick({required BuildContext context}) {
    done();
    navigatorPopScreen(context);
  }
}
