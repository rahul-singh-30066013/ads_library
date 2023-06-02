/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/models/response_models/filtered_vendor_data_response_model.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class ImportantInformationBottomSheetView extends StatelessWidget {
  final InfoDetails? carInfoDetail;
  final int initialIndex;

  const ImportantInformationBottomSheetView({
    Key? key,
    required this.carInfoDetail,
    this.initialIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<CabImpInfo?> cabImpInfoList = [];
    if (carInfoDetail?.cabDetailedImpInfo?.lines?.isNotEmpty ?? false) {
      cabImpInfoList.add(carInfoDetail?.cabDetailedImpInfo);
    }
    if (carInfoDetail?.cabCancellationPolicy?.lines?.isNotEmpty ?? false) {
      cabImpInfoList.add(carInfoDetail?.cabCancellationPolicy);
    }
    return DefaultTabController(
      length: cabImpInfoList.length,
      initialIndex: initialIndex,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            labelColor: context.adColors.blackTextColor,
            unselectedLabelColor: context.adColors.greyTextColor,
            labelStyle: ADTextStyle500.size16,
            indicatorColor: context.adColors.blackTextColor,
            unselectedLabelStyle: ADTextStyle400.size16
                .setTextColor(context.adColors.greyTextColor),
            tabs: List.generate(
              cabImpInfoList.length,
              (_index) => Tab(text: cabImpInfoList[_index]?.title),
            ),
          ),
          const Divider(
            height: 1,
          ),
          Expanded(
            child: TabBarView(
              children: List.generate(
                cabImpInfoList.length,
                (_index) => CabImportantInfoTabView(
                  importantInfo: cabImpInfoList[_index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CabImportantInfoTabView extends StatelessWidget {
  final CabImpInfo? importantInfo;

  const CabImportantInfoTabView({Key? key, required this.importantInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: importantInfo?.lines?.isNotEmpty ?? false
          ? ListView.builder(
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: context.k_16,
                vertical: context.k_20,
              ),
              itemCount: importantInfo?.lines?.length,
              itemBuilder: (context, index) {
                final Lines? impInfoLine = importantInfo?.lines?[index];
                return ((impInfoLine?.title?.isNotEmpty ?? false) ||
                        (impInfoLine?.description?.isNotEmpty ?? false))
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (impInfoLine?.title?.isNotEmpty ?? false)
                            Text(
                              impInfoLine?.title ?? '',
                              style: ADTextStyle700.size18.setTextColor(
                                context.adColors.blackTextColor,
                              ),
                            ),
                          if ((impInfoLine?.title?.isNotEmpty ?? false) &&
                              (impInfoLine?.description?.isNotEmpty ?? false))
                            SizedBox(
                              height: context.k_15,
                            ),
                          if (impInfoLine?.description?.isNotEmpty ?? false)
                            Html(
                              data:
                                  '<html style="font-size: 16px;color:rgb(${context.adColors.blackTextColor.red},${context.adColors.blackTextColor.green},${context.adColors.blackTextColor.blue});">${impInfoLine?.description ?? ''}</html>',
                              style: {
                                'body': Style(
                                  padding: EdgeInsets.zero,
                                  margin: Margins.zero,
                                ),
                              },
                              shrinkWrap: true,
                            ),
                          if (index != (importantInfo?.lines?.length ?? 0) - 1)
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
            )
          : Center(
              child: Text(
                'no_data_available'.localize(context),
                style: ADTextStyle400.size14
                    .setTextColor(context.adColors.blackTextColor),
              ),
            ),
    );
  }
}
