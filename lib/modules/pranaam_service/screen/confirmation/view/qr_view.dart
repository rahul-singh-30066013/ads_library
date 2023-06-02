/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

final double qrImageWidth = 150.sp;
final double qrImageHeight = 150.sp;

/// this class is used to draw the qr code which gives information about your booking.
class QrView extends StatelessWidget {
  const QrView({Key? key, required this.qrCodeString}) : super(key: key);
  final String qrCodeString;

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(context.k_6),
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
            data: qrCodeString,
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
        ADSizedBox(
          height: context.k_20,
        ),
      ],
    );
  }
}
