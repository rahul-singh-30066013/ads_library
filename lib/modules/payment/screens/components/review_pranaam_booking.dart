/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/payment/screens/components/service_details.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/person_name_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/travellers_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/confirmation/view/order_summary_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/my_account/view/guests_details_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/state_management/stand_alone_review_detail_state_management.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/utils/stand_alone_service_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class ReviewPranaamBooking extends StatefulWidget {
  const ReviewPranaamBooking({
    Key? key,
  }) : super(key: key);

  @override
  State<ReviewPranaamBooking> createState() => _ReviewPranaamBookingState();
}

class _ReviewPranaamBookingState extends State<ReviewPranaamBooking> {
  PranaamAppDataStateManagement? pranaamAppDataStateManagement;

  @override
  void initState() {
    pranaamAppDataStateManagement =
        context.read<PranaamAppDataStateManagement>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        // RichText(
        //   text: TextSpan(
        //     children: [
        //       TextSpan(
        //         style: ADTextStyle700.size18,
        //         text: 'My Shopping Cart ',
        //       ),
        //       TextSpan(
        //         style: ADTextStyle400.size18.copyWith(
        //           color: context.adColors.greyTextColor,
        //         ),
        //         text: '(${getAddonAddedByUserCount(
        //           pranaamAppDataStateManagement?.cartDataResponse,
        //         ).toString()} ${ifItemIsPlural()})',
        //       ),
        //     ],
        //   ),
        // ).paddingBySide(
        //   left: context.k_16,
        //   right: context.k_16,
        //   top: context.k_16,
        // ),
        const OrderSummaryView(
          showHeading: false,
        ),
        Divider(
          thickness: context.k_8,
          color: context.adColors.containerGreyBg,
          height: context.k_40,
        ),
        ADSizedBox(
          height: context.k_20,
        ),
        ServiceDetails(
          pranaamAppDataStateManagement: pranaamAppDataStateManagement,
          flightName: pranaamAppDataStateManagement
                  ?.cartDataResponse?.tripDetail.flightName ??
              '',
          serviceTime: pranaamAppDataStateManagement
                  ?.cartDataResponse?.tripDetail.serviceDateTime ??
              '',
          serviceDate: pranaamAppDataStateManagement
                  ?.cartDataResponse?.tripDetail.serviceDateTime ??
              '',
          arrivalTime: pranaamAppDataStateManagement
                  ?.cartDataResponse?.tripDetail.flightTime ??
              '',
          travelSectorType: pranaamAppDataStateManagement
                  ?.cartDataResponse?.tripDetail.travelSector ??
              '',
          flightTime: pranaamAppDataStateManagement
                  ?.cartDataResponse?.tripDetail.flightTime ??
              '',
          serviceType: pranaamAppDataStateManagement
                  ?.cartDataResponse?.tripDetail.serviceType ??
              '',
        ),
        if (getServiceType(pranaamAppDataStateManagement
                ?.cartDataResponse?.tripDetail.serviceType,) ==
            roundTripServiceId)
          Column(
            children: [
              Divider(
                color: context.adColors.containerGreyBg,
                height: context.k_56,
              ),
              ServiceDetails(
                pranaamAppDataStateManagement: pranaamAppDataStateManagement,
                flightName: pranaamAppDataStateManagement?.cartDataResponse
                        ?.tripDetail.transitRoundTripSecFlightName ??
                    '',
                serviceTime: pranaamAppDataStateManagement?.cartDataResponse
                        ?.tripDetail.roundTripSecServiceDateTime ??
                    '',
                serviceDate: pranaamAppDataStateManagement?.cartDataResponse
                        ?.tripDetail.roundTripSecServiceDateTime ??
                    '',
                arrivalTime: pranaamAppDataStateManagement?.cartDataResponse
                        ?.tripDetail.transitRoundTripSecFlightTime ??
                    '',
                travelSectorType: pranaamAppDataStateManagement
                        ?.cartDataResponse?.tripDetail.travelSector ??
                    '',
                flightTime: pranaamAppDataStateManagement?.cartDataResponse
                        ?.tripDetail.transitRoundTripSecFlightTime ??
                    '',
                serviceType: pranaamAppDataStateManagement
                        ?.cartDataResponse?.tripDetail.serviceType ??
                    '',
              ),
            ],
          ),
        Divider(
          thickness: context.k_8,
          color: context.adColors.containerGreyBg,
          height: context.k_56,
        ),
        GuestsDetailsView(
          travellers: !isStandAloneService(
            pranaamAppDataStateManagement
                    ?.cartDataResponse?.pranaamBookingType ??
                '',
          )
              ? pranaamAppDataStateManagement?.pranaamCreateBooking.travellers ?? []
              : [
                  TravellersModel(
                    personName: PersonNameModel(
                      salutationText: context
                          .read<StandAloneReviewDetailStateManagement>()
                          .salutationController
                          .controller.text,
                      firstName: context
                          .read<StandAloneReviewDetailStateManagement>()
                          .firstNameController
                          .controller.text,
                      lastName: context
                          .read<StandAloneReviewDetailStateManagement>()
                          .lastNameController
                          .controller.text,
                    ),
                  ),
                ],
        ),
        ADSizedBox(
          height: context.k_40,
        ),
      ],
    );
  }

  String ifItemIsPlural() {
    return getAddonAddedByUserCount(
              pranaamAppDataStateManagement?.cartDataResponse,
            ) >
            1
        ? 'items'
        : 'item';
  }
}
