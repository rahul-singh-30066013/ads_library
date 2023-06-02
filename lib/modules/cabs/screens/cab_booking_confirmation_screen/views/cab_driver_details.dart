/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */
import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/cab_order_detail_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cab_googleanalytics.dart';
import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class CabDriverDetails extends StatelessWidget {
  final String carNumber;
  final String carName;
  final String driverName;
  final String driverPhone;
  final bool isCall;
  final CabOrderDetailResponseModel? cabOrderDetailResponseModel;
  final String? currencyCode;

  const CabDriverDetails({
    Key? key,
    this.isCall = true,
    required this.carNumber,
    required this.carName,
    required this.driverName,
    required this.driverPhone,
    required this.cabOrderDetailResponseModel,
    this.currencyCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double spreadRadius = 0.7;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'lib/assets/images/cab_booking/driver_image.svg',
          height: context.k_64,
          width: context.k_64,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (carNumber.isNotEmpty)
                Text(
                  carNumber,
                  style: ADTextStyle700.size18.setTextColor(
                    context.adColors.neutralInfoMsg,
                  ),
                ).paddingBySide(
                  bottom: context.k_6,
                ),
              if (carName.isNotEmpty)
                Text(
                  carName,
                  style: ADTextStyle400.size14.setTextColor(
                    context.adColors.neutralInfoMsg,
                  ),
                ).paddingBySide(
                  bottom: context.k_6,
                ),
              if (driverName.isNotEmpty)
                Text(
                  driverName,
                  style: ADTextStyle400.size14.setTextColor(
                    context.adColors.neutralInfoMsg,
                  ),
                ),
            ],
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
          ),
        ),
        if (isCall && driverPhone.isNotEmpty)
          TouchableOpacity(
            onTap: () => {
              CabGoogleAnalytics()
                  .sendGAParametersBookingConfirmationCabBookingCallDriver(
                cabOrderDetailResponseModel,
                currencyCode,
              ),
              Utils.redirectToPhoneEmail(
                driverPhone,
              ),
            },
            child: Container(
              width: context.k_40,
              height: context.k_40,
              decoration: BoxDecoration(
                color: context.adColors.whiteTextColor,
                borderRadius: BorderRadius.circular(context.k_20),
                boxShadow: [
                  BoxShadow(
                    color: context.adColors.blueColor,
                    spreadRadius: spreadRadius,
                  ),
                ],
              ),
              child: SvgPicture.asset(
                SvgAssets.callIcon,
                width: context.k_16,
                height: context.k_16,
                fit: BoxFit.scaleDown,
                color: context.adColors.blueColor,
              ),
            ),
          ),
      ],
    );
  }
}
