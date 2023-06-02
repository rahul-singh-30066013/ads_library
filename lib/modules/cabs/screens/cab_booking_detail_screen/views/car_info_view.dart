/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/models/response_models/search_cab_response_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

// ignore: must_be_immutable
class CarInfoView extends StatelessWidget {
  final int? bookingDate;
  String? providerImage;
  final String? vehicleImage;
  final String? vehicleType;
  final String? vehicleTypeID;
  final bool isFromPreBooking;
  final bool isRideNow;
  final CabInfo? cabInfo;

  CarInfoView({
    Key? key,
    this.bookingDate,
    this.providerImage,
    this.vehicleImage,
    this.vehicleType,
    this.vehicleTypeID,
    this.isFromPreBooking = false,
    this.isRideNow = false,
    this.cabInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final carImageWidth = context.widthOfScreen * 0.293333;

    final millis = bookingDate ?? 0;
    final dateTime = DateTime.fromMillisecondsSinceEpoch(millis * 1000);
    final date = DateFormat('dd MMM yyyy').format(dateTime);
    final time = DateFormat('hh:mm a')
        .format(dateTime)
        .replaceAll('AM', 'am')
        .replaceAll('PM', 'pm');
    providerImage = (providerImage?.contains('png.png') ?? false)
        ? providerImage?.replaceAll('png.png', '.svg')
        : providerImage;

    ///TODO need to define dynamic
    final double _margin_5 = 5.sp;
    const double _frontSize_15 = 15;
    const int _timeStripeColor = 0xffffd866;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.network(
          providerImage ?? '',
          height: context.k_26,
          fit: BoxFit.fitHeight,
        ),
        SizedBox(
          height: context.k_20,
        ),
        Row(
          children: [
            if (vehicleImage?.contains('.svg') ?? false)
              SvgPicture.network(
                vehicleImage ?? '',
                height: context.k_64,
                width: carImageWidth,
              )
            else
              ADCachedImage(
                imageUrl: vehicleImage ?? '',
                boxFit: BoxFit.contain,
                height: context.k_64,
                width: carImageWidth,
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  vehicleType ?? '',
                  style: ADTextStyle700.size16.setTextColor(
                    context.adColors.blackTextColor,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: vehicleTypeID ?? '',
                        style: ADTextStyle400.size16.setTextColor(
                          context.adColors.blackTextColor,
                        ),
                      ),
                      if (cabInfo?.isAC ?? false)
                        TextSpan(
                          text: ' \u2022 ',
                          style: ADTextStyle700.size16.setTextColor(
                            context.adColors.circleGreyTextColor,
                          ),
                        ),
                      if (cabInfo?.isAC ?? false)
                        TextSpan(
                          text: 'ac'.localize(context),
                          style: ADTextStyle400.size16.setTextColor(
                            context.adColors.blackTextColor,
                          ),
                        ),
                      if ((cabInfo?.maxCapacity ?? 0) > 0)
                        TextSpan(
                          text: ' \u2022 ',
                          style: ADTextStyle700.size16.setTextColor(
                            context.adColors.circleGreyTextColor,
                          ),
                        ),
                      if ((cabInfo?.maxCapacity ?? 0) > 0)
                        TextSpan(
                          text: '_seats'.localize(context).replaceAll(
                                '_',
                                cabInfo?.maxCapacity?.toString() ?? '',
                              ),
                          style: ADTextStyle400.size16.setTextColor(
                            context.adColors.blackTextColor,
                          ),
                        ),
                    ],
                  ),
                ).paddingBySide(top: context.k_4),
                Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(context.k_4)),
                    color: const Color(_timeStripeColor),
                  ),
                  child: Row(
                    children: [
                      Text(
                        date,
                        style: ADTextStyle500.size14
                            .setTextColor(
                              context.adColors.blackTextColor,
                            )
                            .copyWith(fontSize: _frontSize_15),
                      ),
                      Text(
                        ' \u2022 ',
                        style: ADTextStyle500.size14
                            .setTextColor(
                              context.adColors.darkGreyTextColor,
                            )
                            .copyWith(fontSize: _frontSize_15),
                      ),
                      Text(
                        isFromPreBooking && isRideNow
                            ? 'ride_now'.localize(context)
                            : time,
                        style: ADTextStyle500.size14
                            .setTextColor(
                              context.adColors.blackTextColor,
                            )
                            .copyWith(fontSize: _frontSize_15),
                      ),
                    ],
                  ).paddingBySide(
                    top: _margin_5,
                    bottom: _margin_5,
                    left: context.k_10,
                    right: context.k_10,
                  ),
                ).paddingBySide(
                  top: context.k_4,
                ),
              ],
            ).paddingBySide(
              left: context.k_15,
            ),
          ],
        ),
      ],
    );
  }
}
