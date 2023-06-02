/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/package_detail.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/service_booking_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///This is the first fixed column in select package screen which shows traveller details and
///facilities provided by packages.

class FixedColumn extends StatefulWidget {
  final ServiceBookingModel serviceBookingData;
  final List<String> servicesList;
  final bool isFromUpgrade;
  const FixedColumn({
    Key? key,
    required this.serviceBookingData,
    required this.servicesList, required this.isFromUpgrade,
  }) : super(key: key);

  @override
  State<FixedColumn> createState() => _FixedColumnState();
}

class _FixedColumnState extends State<FixedColumn> {
  PranaamAppDataStateManagement pranaamAppDataStateManagement =
      PranaamAppDataStateManagement();

  @override
  void initState() {
    pranaamAppDataStateManagement =
        context.read<PranaamAppDataStateManagement>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    final double sizedBoxHeight = 112.sp;
    const double k_0_4 = 0.394;
    final double height = 205.sp;
    const Color dividerColor = Color(0xffeeeeee);
    const Color cardColor = Color(0xfff3f7fc);

    final List<DataRow> facilitiesList = [];
    const maximumLines = 6;

    /*   for (int facilities = 0;
        facilities < widget.servicesList.length;
        facilities++) {
      const maximumLines = 6;
      facilitiesList.add(
        DataRow(
          cells: [
            DataCell(
              Container(
                alignment: Alignment.center,
                height: sizedBoxHeight,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: facilities == widget.servicesList.length - 1
                        ? const BorderSide(
                            color: dividerColor,
                          )
                        : BorderSide.none,
                  ),
                ),
                child: Text(
                  widget.servicesList[facilities],
                  style: ADTextStyle500.size12,
                  overflow: TextOverflow.ellipsis,
                  maxLines: maximumLines,
                ).paddingAllSide(context.k_16),
              ),
            ),
          ],
        ),
      );
    }*/
    final List<PackageDetail> listOfPackages =
        pranaamAppDataStateManagement.packagesList;
    for (int innerIndex = 0;
        innerIndex < listOfPackages.first.availableService.length;
        innerIndex++) {
      facilitiesList.add(
        DataRow(
          cells: [
            DataCell(
              Text(
                listOfPackages
                    .first.availableService[innerIndex].addOnServiceName,
                style: ADTextStyle500.size12,
                overflow: TextOverflow.ellipsis,
                maxLines: maximumLines,
              ).paddingAllSide(context.k_16),
            ),
          ],
        ),
      );
    }
    return SizedBox(
      width: context.widthOfScreen * k_0_4,

      ///This column includes traveller details container and facilities provided.
      child: DataTable(
        headingRowHeight: height,
        horizontalMargin: 0,
        dataRowHeight: sizedBoxHeight,
        border: const TableBorder(
          bottom: BorderSide(
            color: dividerColor,
          ),
        ),
        columns: [
          DataColumn(
            label: Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.k_16,
              ),
              width: context.widthOfScreen * k_0_4,
              decoration: const BoxDecoration(
                color: cardColor,
                border: Border(
                  top: BorderSide(
                    color: dividerColor,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ADSizedBox(
                    height: context.k_22,
                  ),
                  Text(
                    pranaamAppDataStateManagement.serviceAirport ?? '',
                    style: ADTextStyle700.size18,
                    softWrap: true,
                  ),
                  SizedBox(
                    height:     !widget.isFromUpgrade?context.k_18:context.k_8,
                  ),
                  Text(
                    widget.serviceBookingData.selectedService?.serviceTitle ??
                        '',
                  ),
                 if (!widget.isFromUpgrade) Text(
                    '(${widget.serviceBookingData.selectedTravelSector?.travelSectorTitle})',
                    maxLines: maximumLines,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: context.k_8,
                  ),
                ],
              ),
            ),
          ),
        ],
        rows: facilitiesList,
      ),
    );
  }
}
