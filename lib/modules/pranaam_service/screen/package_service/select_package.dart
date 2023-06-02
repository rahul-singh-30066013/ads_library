/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io';

import 'package:adani_airport_mobile/modules/components/pranaam_loyality_points.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/get_packages/api_response_model/get_packages_response_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/select_package_data.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/package_service/fixed_column.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/package_service/horizontally_scrollable_column.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/package_service/package_details.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///In this screen, user can select the package they want to buy.
/// Once they click on book button, they will be navigated to cart screen.
///This is the list of the facilities that packages can have.
class SelectPackage extends StatefulWidget {
  final bool isFromUpgrade;
  const SelectPackage({
    Key? key,
    this.isFromUpgrade = false,
  }) : super(key: key);
  static double paddingBetweenItem = 22.h;

  @override
  State<SelectPackage> createState() => _SelectPackageState();
}

class _SelectPackageState extends State<SelectPackage> {
  double k_0_3 = 0.303;
  double k_0_4 = 0.394;
  double height = 221.sp;
  final buttonWidth = 42.sp;
  final buttonHeight = 84.sp;
  double sizedBoxHeight = 120.sp;
  double recommendedHeight = 10.sp;
  double horizontalPadding = 18.sp;
  double verticalPadding = 12.sp;

  ///TODO
  Color dividerColor = const Color(0xffeeeeee);
  Color cardColor = const Color(0xfff3f7fc);
  Color yellowColor = const Color(0xffea9b31);
  Color redColor = const Color(0xff980000);
  PranaamAppDataStateManagement? dataState;

  @override
  void initState() {
    dataState = PranaamAppDataStateManagement();
    dataState = context.read<PranaamAppDataStateManagement>();
    adLog(
      'siteCoreRewardsText ${dataState?.srpPackagesElement.params.rewardsText}',
    );
    dataState?.isBookPackageClicked = false;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    return Consumer<PranaamAppDataStateManagement>(
      builder: (context, value, child) {
        return AbsorbPointer(
          absorbing: value.selectedPackageClick,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: IconButton(
                icon: Platform.isIOS
                    ? const Icon(Icons.arrow_back_ios)
                    : const Icon(Icons.arrow_back),
                onPressed: () => editOnBackPressed(),
              ),
              title: Text(
                (!widget.isFromUpgrade)
                    ? 'select_package'.localize(context)
                    : 'upgradePackage'.localize(context),
                style: ADTextStyle700.size22,
                maxLines: 1,
              ),
            ),
            body: Selector<PranaamAppDataStateManagement, SelectPackageData>(
              selector: (context, value) => value.selectPackageData,
              builder: (
                BuildContext context,
                value,
                Widget? child,
              ) {
                adLog('Select Package $value', className: this);
                final Data data = dataState?.packagesResponse.data;
                return ListView(
                  shrinkWrap: true,
                  children: [
                    if (!widget.isFromUpgrade)
                      PackageDetails(value: value.serviceBookingModel),
                    // Padding(
                    //   padding: const EdgeInsets.all(20),
                    //   child: Text(
                    //     'select_the_package_that_suits_you_best'
                    //         .localize(context),
                    //     style: ADTextStyle700.size22,
                    //   ),
                    // ),
                    if (!widget.isFromUpgrade)
                      ADSizedBox(
                        height: context.k_20,
                      ),
                    if (!widget.isFromUpgrade &&
                        data.loyaltyPercentage.isNotEmpty &&
                        double.parse(data.loyaltyPercentage) != 0)
                      PranaamLoyalityPoints(
                        points: '${data.loyaltyPercentage} %',
                      ).paddingBySide(left: context.k_12, right: context.k_12),
                    ADSizedBox(
                      height: context.k_20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///Fixed Column
                        FixedColumn(
                          isFromUpgrade: widget.isFromUpgrade,
                          serviceBookingData: value.serviceBookingModel,
                          servicesList:
                              value.packageMatches == value.packagesList.length
                                  ? value.packageServicesList
                                  : [],
                        ),

                        ///Horizontally Scrollable Column
                        HorizontallyScrollableColumn(
                          isFromUpgrade: widget.isFromUpgrade,
                          servicesTicksList: value.servicesAvailability,
                        ),
                      ],
                    ),
                    Text(
                      'Taxes and surcharges included',
                      style: ADTextStyle400.size12.setTextColor(
                        context.adColors.greyTextColor,
                      ),
                      textAlign: TextAlign.end,
                    ).paddingBySide(
                      top: context.k_16,
                      right: context.k_20,
                      left: context.k_20,
                    ),
                    ADSizedBox(
                      height: context.k_16,
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  void editOnBackPressed() {
    // _pranaamAppDataStateManagement?.editForm(value: true);
    Navigator.of(context).pop(true);
  }
}
