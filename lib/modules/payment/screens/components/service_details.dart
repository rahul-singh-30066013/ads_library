/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class ServiceDetails extends StatelessWidget {
  const ServiceDetails({
    Key? key,
    required this.pranaamAppDataStateManagement,
    required this.serviceType,
    required this.travelSectorType,
    required this.serviceDate,
    required this.flightTime,
    required this.arrivalTime,
    required this.serviceTime,
    required this.flightName,
  }) : super(key: key);
  final String serviceType;
  final String travelSectorType;
  final String serviceDate;
  final String flightTime;
  final String arrivalTime;
  final String serviceTime;
  final String flightName;

  final PranaamAppDataStateManagement? pranaamAppDataStateManagement;

  @override
  Widget build(BuildContext context) {
    final tripDetails =
        pranaamAppDataStateManagement?.cartDataResponse?.tripDetail;
    final standAloneService = isStandAloneService(
      pranaamAppDataStateManagement?.cartDataResponse?.pranaamBookingType ?? '',
    );
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.k_16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Service Details',
            style: ADTextStyle700.size18,
          ),
          ADSizedBox(
            height: context.k_20,
          ),
          Text(
            'Service at',
            style: ADTextStyle400.size14.setTextColor(context.adColors.black),
          ),
          ADSizedBox(
            height: context.k_4,
          ),
          Text(
            '${standAloneService ? getCityName(
                tripDetails?.serviceAirport ?? '',
                context.read<SiteCoreStateManagement>(),
              ) : pranaamAppDataStateManagement?.serviceBookingData.serviceAirport} ${tripDetails?.flightTerminal == 'N/A' || tripDetails?.flightTerminal == '' ? '' : '(${tripDetails?.flightTerminal})'}',
            style: ADTextStyle500.size16.setTextColor(context.adColors.black),
          ),
          ADSizedBox(height: context.k_20),
          Text(
            'Sector',
            style: ADTextStyle400.size14.setTextColor(context.adColors.black),
          ),
          ADSizedBox(
            height: context.k_4,
          ),
          Text(
            '$serviceType ( $travelSectorType )',
            style: ADTextStyle500.size16.setTextColor(context.adColors.black),
          ),
          ADSizedBox(height: context.k_20),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Service Date',
                      style: ADTextStyle400.size14.setTextColor(
                        context.adColors.blackColor,
                      ),
                    ),
                    ADSizedBox(
                      height: context.k_4,
                    ),
                    Text(
                      formatDateTime(
                        dateTimeFormat: dataTimeFormatDateMonthDay,
                        dateString: serviceDate,
                      ),
                      style: ADTextStyle500.size16
                          .setTextColor(context.adColors.black),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Flight',
                      style: ADTextStyle400.size14.setTextColor(
                        context.adColors.blackColor,
                      ),
                    ),
                    ADSizedBox(
                      height: context.k_4,
                    ),
                    Text(
                      flightName,
                      style: ADTextStyle500.size16
                          .setTextColor(context.adColors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
          ADSizedBox(height: context.k_20),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$serviceType ${'time'.localize(context)}',
                      style: ADTextStyle400.size14.setTextColor(
                        context.adColors.blackColor,
                      ),
                    ),
                    ADSizedBox(
                      height: context.k_4,
                    ),
                    Text(
                      reviewArrivalTime(flightTime),
                      style: ADTextStyle500.size16
                          .setTextColor(context.adColors.black),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Service Time',
                      style: ADTextStyle400.size14.setTextColor(
                        context.adColors.blackColor,
                      ),
                    ),
                    ADSizedBox(
                      height: context.k_4,
                    ),
                    Text(
                      reviewServiceTime(serviceDate),
                      style: ADTextStyle500.size16
                          .setTextColor(context.adColors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
