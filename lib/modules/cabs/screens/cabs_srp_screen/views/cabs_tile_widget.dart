/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/models/response_models/search_cab_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cabs_srp_screen/views/cab_srp_view_detail.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/cabs_srp_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class CabsTileWidget extends StatelessWidget {
  const CabsTileWidget({
    Key? key,
    required this.cabSrpState,
    required this.selectedCabItinerary,
    required this.expandedPosition,
    required this.selectedProviderInfo,
    required this.isInstantBooking,
    required this.cabItinerary,
    required this.bookTap,
  }) : super(key: key);
  final CabsSrpState cabSrpState;
  final CabItinerary? selectedCabItinerary;
  final int? expandedPosition;
  final SecurityKey? selectedProviderInfo;
  final bool? isInstantBooking;
  final CabItinerary cabItinerary;
  final ADTapCallback? bookTap;

  @override
  Widget build(BuildContext context) {
    const maxLines = 2;
    final carImageWidth = context.widthOfScreen * 0.1706666;
    return Container(
      decoration: selectedCabItinerary == cabItinerary
          ? BoxDecoration(
              border: Border.all(
                width: context.k_2,
                color: context.adColors.blackTextColor,
              ),
              borderRadius: BorderRadius.circular(
                context.k_12,
              ),
            )
          : BoxDecoration(
              border: Border.all(
                width: context.k_2,
                color: context.adColors.transparentColor,
              ),
            ),
      height: context.k_64 + context.k_26,
      child: InkWell(
        borderRadius: BorderRadius.circular(
          context.k_12,
        ),
        onTap: () => cabSrpState.updateCabSelectionWith(
          cabItinerary,
          selectedProviderInfo,
          isInstantBooking,
          expandedPosition,
        ),
        child: Center(
          child: Row(
            children: [
              if (cabItinerary.vehicleCategory?.vehicleImage
                      ?.contains('.svg') ??
                  false)
                SvgPicture.network(
                  cabItinerary.vehicleCategory?.vehicleImage ?? '',
                  height: context.k_40,
                  width: carImageWidth,
                )
              else
                ADCachedImage(
                  imageUrl: cabItinerary.vehicleCategory?.vehicleImage ?? '',
                  boxFit: BoxFit.contain,
                  height: context.k_40,
                  width: carImageWidth,
                ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      cabItinerary.vehicleCategory?.vehicleType ?? '',
                      maxLines: maxLines,
                      style: (selectedCabItinerary == cabItinerary
                              ? ADTextStyle700.size16
                              : ADTextStyle600.size16)
                          .setTextColor(context.adColors.blackTextColor),
                    ),
                    Text(
                      cabItinerary.vehicleCategory?.adlCabCategory
                              ?.toUpperCase() ??
                          '',
                      maxLines: maxLines,
                      style: ADTextStyle400.size12
                          .setTextColor(context.adColors.blackTextColor),
                    ).paddingBySide(top: context.k_6),
                  ],
                ).paddingBySide(
                  left: context.k_15,
                  right: context.k_15,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    FlightUtils.getAmountWithTwoDecimalPoint(
                      double.parse(
                        '${cabItinerary.priceInfo?.totalAmount ?? 0}',
                      ),
                    ),
                    style: (selectedCabItinerary == cabItinerary
                            ? ADTextStyle700.size16
                            : ADTextStyle600.size16)
                        .setTextColor(
                      context.adColors.blackTextColor,
                    ),
                  ),
                  if (selectedCabItinerary == cabItinerary &&
                      selectedCabItinerary?.cabInfo != null)
                    InkWell(
                      onTap: () => _showBookingDetailBottomSheet(
                        context,
                        selectedCabItinerary,
                        bookTap,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: context.k_6,
                        ),
                        child: Text(
                          'viewDetails'.localize(context),
                          style: ADTextStyle500.size12.copyWith(
                            color: context.adColors.blackTextColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    )
                  else
                    const SizedBox(),
                ],
              ),
            ],
          ),
        ).paddingBySide(left: context.k_12, right: context.k_12),
      ),
    ).paddingBySide(
      left: context.k_16,
      right: context.k_16,
    );
  }

  void _showBookingDetailBottomSheet(
    BuildContext context,
    CabItinerary? selectedCabItinerary,
    ADTapCallback? bookTap,
  ) {
    adShowBottomSheetWithData(
      context: context,
      childWidget: CabSrpViewDetail(
        selectedCabItinerary: selectedCabItinerary,
      ),
      headerTitle: 'cab_details'.localize(context),
    ).then((onBookTap) {
      if (onBookTap ?? false) {
        bookTap?.call();
      }
    });
  }
}
