/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/search_cab_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cabs_srp_screen/views/cab_item_detail.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class CabSrpViewDetail extends StatelessWidget {
  const CabSrpViewDetail({
    Key? key,
    required this.selectedCabItinerary,
  }) : super(key: key);
  final CabItinerary? selectedCabItinerary;

  @override
  Widget build(BuildContext context) {
    final carImageWidth = context.widthOfScreen * 0.213333;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (selectedCabItinerary?.vehicleCategory?.vehicleImage
                    ?.contains('.svg') ??
                false)
              SvgPicture.network(
                selectedCabItinerary?.vehicleCategory?.vehicleImage ?? '',
                height: context.k_40 + context.k_2,
                width: carImageWidth,
              )
            else
              ADCachedImage(
                imageUrl:
                    selectedCabItinerary?.vehicleCategory?.vehicleImage ?? '',
                boxFit: BoxFit.contain,
                height: context.k_40 + context.k_2,
                width: carImageWidth,
              ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    selectedCabItinerary?.vehicleCategory?.vehicleType ?? '',
                    style: ADTextStyle700.size16.setTextColor(
                      context.adColors.blackTextColor,
                    ),
                  ),
                  ADSizedBox(
                    height: context.k_6,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: selectedCabItinerary
                              ?.vehicleCategory?.adlCabCategory ??
                              '',
                          style: ADTextStyle400.size14.setTextColor(
                            context.adColors.blackTextColor,
                          ),
                        ),
                        if (selectedCabItinerary?.cabInfo?.isAC ?? false)
                          TextSpan(
                            text: ' \u2022 ',
                            style: ADTextStyle700.size16.setTextColor(
                              context.adColors.circleGreyTextColor,
                            ),
                          ),
                        if (selectedCabItinerary?.cabInfo?.isAC ?? false)
                          TextSpan(
                            text: 'ac'.localize(context),
                            style: ADTextStyle400.size14.setTextColor(
                              context.adColors.blackTextColor,
                            ),
                          ),
                        TextSpan(
                          text: ' \u2022 ',
                          style: ADTextStyle700.size16.setTextColor(
                            context.adColors.circleGreyTextColor,
                          ),
                        ),
                        TextSpan(
                          text: '_seats'.localize(context).replaceAll(
                            '_',
                            selectedCabItinerary?.cabInfo?.maxCapacity
                                ?.toString() ??
                                    '',
                              ),
                          style: ADTextStyle400.size14.setTextColor(
                            context.adColors.blackTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ).paddingBySide(
                left: context.k_15,
                right: context.k_15,
              ),
            ),
            Text(
              FlightUtils.getAmountWithTwoDecimalPoint(
                double.parse(
                  '${selectedCabItinerary?.priceInfo?.totalAmount ?? 0}',
                ),
              ),
              style: ADTextStyle700.size16
                  .setTextColor(context.adColors.blackTextColor),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(context.k_8)),
            color: context.adColors.cardBackgroundColor,
          ),
          width: double.infinity,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'route_distance_is_'.localize(context).replaceAll(
                    '_',
                    selectedCabItinerary?.cabInfo?.kmDistance ?? '',
                  ),
                  style: ADTextStyle400.size14
                      .setTextColor(context.adColors.blackTextColor),
                ),
                TextSpan(
                  text: ' \u2022 ',
                  style: ADTextStyle700.size16
                      .setTextColor(context.adColors.circleGreyTextColor),
                ),
                TextSpan(
                  text: 'approx_'.localize(context).replaceAll(
                    '_',
                    selectedCabItinerary?.cabInfo?.duration ?? '',
                  ),
                  style: ADTextStyle400.size14
                      .setTextColor(context.adColors.blackTextColor),
                ),
              ],
            ),
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
            top: context.k_12,
            bottom: context.k_12,
          ),
        ).paddingBySide(top: context.k_30),
        Text(
          'spacious_car'.localize(context),
          style: ADTextStyle700.size18
              .setTextColor(context.adColors.blackTextColor),
        ).paddingBySide(top: context.k_30),
        CabItemDetail(
          iconName: SvgAssets.kilometerIcon,
          titleName: 'extra_km_fare',
          detailWidget: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  style: ADTextStyle600.size14.setTextColor(
                    context.adColors.blackTextColor,
                  ),
                  text: '${selectedCabItinerary?.cabInfo?.extraKMPrice} ',
                ),
                TextSpan(
                  text: 'after'.localize(context),
                  style: ADTextStyle400.size14.setTextColor(
                    context.adColors.blackTextColor,
                  ),
                ),
                TextSpan(
                  style: ADTextStyle600.size14.setTextColor(
                    context.adColors.blackTextColor,
                  ),
                  text: ' ${selectedCabItinerary?.cabInfo?.kmDistance}',
                ),
              ],
            ),
          ),
        ).paddingBySide(top: context.k_20),
        CabItemDetail(
          iconName: SvgAssets.fuelIcon,
          titleName: 'fuel_type',
          detailWidget: Text(
            selectedCabItinerary?.cabInfo?.fuelType ?? '',
            style: ADTextStyle600.size14.setTextColor(
              context.adColors.blackTextColor,
            ),
          ),
        ).paddingBySide(top: context.k_15),
        if (selectedCabItinerary?.cabInfo?.cancellationText?.isNotEmpty ??
            false)
          CabItemDetail(
            iconName: SvgAssets.cancellationTimeIcon,
            titleName: 'cancellation',
            detailWidget: Text(
              selectedCabItinerary?.cabInfo?.cancellationText ?? '',
              style: ADTextStyle400.size14.setTextColor(
                context.adColors.blackTextColor,
              ),
            ),
          ).paddingBySide(top: context.k_15),
        ADSizedBox(
          width: double.infinity,
          height: context.k_48 + context.k_2,
          child: ElevatedButton(
            onPressed: () => navigatorPopScreenWithData(
              context,
              true,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: context.adColors.blueColor,
              shape: const StadiumBorder(),
            ),
            child: Text(
              'book'.localize(context),
              style: ADTextStyle700.size16.setTextColor(
                context.adColors.whiteTextColor,
              ),
            ),
          ),
        ).paddingBySide(
          top: context.k_30,
        ),
      ],
    ).paddingBySide(
      left: context.k_16,
      right: context.k_16,
    );
  }
}
