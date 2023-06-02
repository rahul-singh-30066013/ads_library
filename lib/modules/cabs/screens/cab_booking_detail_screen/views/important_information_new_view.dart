/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/models/response_models/filtered_vendor_data_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_detail_screen/views/important_information_bottom_sheet_view.dart';
import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class ImportantInformationNewView extends StatelessWidget {
  final InfoDetails? carInfoDetail;

  const ImportantInformationNewView({Key? key, required this.carInfoDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          carInfoDetail?.cabImpInfo?.title ?? '',
          style: ADTextStyle700.size22.setTextColor(
            context.adColors.blackTextColor,
          ),
        ).paddingBySide(bottom: context.k_20),
        ListView.builder(
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: carInfoDetail?.cabImpInfo?.lines?.length ?? 0,
          itemBuilder: (context, index) {
            return carInfoDetail
                        ?.cabImpInfo?.lines?[index].description?.isNotEmpty ??
                    false
                ? Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: context.k_18,
                            height: context.k_18,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: SvgPicture.network(
                                carInfoDetail
                                        ?.cabImpInfo?.lines?[index].image ??
                                    '',
                                color: context.adColors.darkGreyTextColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.k_12,
                          ),
                          Expanded(
                            child: Html(
                              data:
                                  '<html style="font-size: 16px;color:rgb(${context.adColors.blackTextColor.red},${context.adColors.blackTextColor.green},${context.adColors.blackTextColor.blue});">${carInfoDetail?.cabImpInfo?.lines?[index].description ?? ''}</html>',
                              style: {
                                'body': Style(
                                  padding: EdgeInsets.zero,
                                  margin: Margins.zero,
                                ),
                              },
                              shrinkWrap: true,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: context.adColors.dividerColor,
                        height: 1.sp,
                        thickness: 1.sp,
                      ).paddingBySide(
                        top: context.k_20,
                        bottom: context.k_20,
                      ),
                    ],
                  )
                : const ADSizedBox.shrink();
          },
        ),
        if ((carInfoDetail?.cabDetailedImpInfo?.lines?.isNotEmpty ?? false) ||
            (carInfoDetail?.cabCancellationPolicy?.lines?.isNotEmpty ?? false))
          TouchableOpacity(
            onTap: () => {
              adShowBottomSheet(
                context: context,
                childWidget: ImportantInformationBottomSheetView(
                  carInfoDetail: carInfoDetail,
                ),
                headerTitle: 'importantInformation'.localize(context),
              ),
            },
            child: Text(
              'know_more'.localize(context),
              overflow: TextOverflow.ellipsis,
              style: ADTextStyle400.size16.copyWith(
                color: context.adColors.blackTextColor,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
      ],
    );
  }
}
