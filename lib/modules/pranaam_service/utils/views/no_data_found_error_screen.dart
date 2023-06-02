/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/gif_assets.dart';
import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/service_booking/service_booking_details.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class NoDataFoundErrorScreen extends StatelessWidget {
  final ADTapCallback? onRetryTap;
  final String? errorTitle;
  final String? errorMessage;
  final String? hyperlinkTitle;
  final String? svgImage;
  final double? paddingBetweenImageAndErrorTitle;
  final double? paddingBetweenErrorTitleAndErrorMessage;
  final double? paddingBetweenErrorMessageAndRetry;
  final bool? isCenter;

  const NoDataFoundErrorScreen({
    Key? key,
    this.onRetryTap,
    this.errorTitle,
    this.errorMessage,
    this.svgImage,
    this.hyperlinkTitle,
    this.paddingBetweenImageAndErrorTitle,
    this.paddingBetweenErrorTitleAndErrorMessage,
    this.paddingBetweenErrorMessageAndRetry,
    this.isCenter = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contentWidth = context.widthOfScreen * 0.6;

    return Align(
      alignment: isCenter == true ? Alignment.center : Alignment.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ADSizedBox(
            height: context.k_32,
          ),
          Image.asset(
            GifAssets.noResultFound,
            width: contentWidth,
          ),
          ADSizedBox(
            height: paddingBetweenImageAndErrorTitle ?? context.k_20,
          ),
          Flexible(
            child: Text(
              errorTitle ?? 'error_title'.localize(context),
              style: ADTextStyle700.size14
                  .copyWith(overflow: TextOverflow.ellipsis),
              textAlign: TextAlign.center,
              maxLines: id_2,
            ).paddingBySide(
              left: context.k_40,
              right: context.k_40,
            ),
          ),
          if (errorMessage != null)
            Container(
              padding: EdgeInsets.only(
                top: paddingBetweenErrorTitleAndErrorMessage ?? context.k_10,
              ),
              child: Text(
                errorMessage ?? 'error_message'.localize(context),
                style: ADTextStyle700.size12
                    .setTextColor(context.adColors.brownishGrey),
              ),
            ),
          ADSizedBox(
            height: paddingBetweenErrorMessageAndRetry ?? context.k_30,
          ),
          if (onRetryTap != null)
            TextButton(
              onPressed: onRetryTap,
              child: Text(
                hyperlinkTitle ?? 'retry'.localize(context),
                style: ADTextStyle500.size14.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class NoDataFoundErrorScreenWithSVG extends StatelessWidget {
  final ADTapCallback? onRetryTap;
  final String? errorTitle;
  final String? errorMessage;
  final String? hyperlinkTitle;
  final String? svgImage;
  final double? paddingBetweenImageAndErrorTitle;
  final double? paddingBetweenErrorTitleAndErrorMessage;
  final double? paddingBetweenErrorMessageAndRetry;
  final bool? isCenter;

  const NoDataFoundErrorScreenWithSVG({
    Key? key,
    this.onRetryTap,
    this.errorTitle,
    this.errorMessage,
    this.svgImage,
    this.hyperlinkTitle,
    this.paddingBetweenImageAndErrorTitle,
    this.paddingBetweenErrorTitleAndErrorMessage,
    this.paddingBetweenErrorMessageAndRetry,
    this.isCenter = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = 120.sp;
    return Align(
      alignment: isCenter == true ? Alignment.center : Alignment.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ADSizedBox(
            height: context.k_32,
          ),
          SvgPicture.asset(
            svgImage ?? SvgAssets.countryGlobe,
            width: width,
            height: width,
          ),
          ADSizedBox(
            height: paddingBetweenImageAndErrorTitle ?? context.k_20,
          ),
          Flexible(
            child: Text(
              errorTitle ?? 'error_title'.localize(context),
              style: ADTextStyle700.size18
                  .copyWith(overflow: TextOverflow.ellipsis),
              textAlign: TextAlign.center,
              maxLines: id_2,
            ).paddingBySide(
              left: context.k_40,
              right: context.k_40,
            ),
          ),
          if (errorMessage != null)
            Container(
              padding: EdgeInsets.only(
                top: paddingBetweenErrorTitleAndErrorMessage ?? context.k_10,
              ),
              child: Text(
                errorMessage ?? 'error_message'.localize(context),
                style: ADTextStyle700.size12
                    .setTextColor(context.adColors.brownishGrey),
              ),
            ),
          ADSizedBox(
            height: paddingBetweenErrorMessageAndRetry ?? context.k_30,
          ),
          if (onRetryTap != null)
            TextButton(
              onPressed: onRetryTap,
              child: Text(
                hyperlinkTitle ?? 'retry'.localize(context),
                style: ADTextStyle500.size14.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
