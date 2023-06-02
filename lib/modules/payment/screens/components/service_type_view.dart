/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/service_booking/service_booking_details.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/utils/stand_alone_service_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

const int serviceTypeCardColor = 0xfff5faff;

class ServiceTypeView extends StatefulWidget {
  const ServiceTypeView({
    Key? key,
    required this.onInfoTap,
  }) : super(key: key);
  final GestureTapCallback onInfoTap;

  @override
  State<ServiceTypeView> createState() => _ServiceTypeViewState();
}

class _ServiceTypeViewState extends State<ServiceTypeView> {
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
    return GestureDetector(
      onTap: widget.onInfoTap,
      child: Container(
        padding: EdgeInsets.all(context.k_16),
        margin: EdgeInsets.symmetric(
          horizontal: context.k_16,
        ),
        decoration: BoxDecoration(
          color: const Color(serviceTypeCardColor),
          borderRadius: BorderRadius.circular(context.k_4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          pranaamAppDataStateManagement
                                  .cartDataResponse?.packageDetail.name ??
                              '',
                          style: ADTextStyle700.size16.setTextColor(
                            context.adColors.blackColor,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        ' (${getTotalPassengers(pranaamAppDataStateManagement.cartDataResponse)} ${getGuests()})',
                        style: ADTextStyle400.size14.setTextColor(
                          context.adColors.greyTextColor,
                        ),
                      ),
                      ADSizedBox(
                        width: context.k_10,
                      ),
                    ],
                  ),
                  ADSizedBox(
                    height: context.k_6,
                  ),
                  Text(
                    '${getCityName(
                      pranaamAppDataStateManagement
                              .cartDataResponse?.tripDetail.serviceAirport ??
                          '',
                      context.read<SiteCoreStateManagement>(),
                    )} • ${getServiceName(pranaamAppDataStateManagement) == 1 || getServiceName(pranaamAppDataStateManagement) == id_3 ? 'Departure' : 'Arrival'} • ${formatDateTime(
                      dateTimeFormat: dateConfirmationFormat,
                      dateString: pranaamAppDataStateManagement
                          .cartDataResponse?.tripDetail.serviceDateTime,
                    )}, ${formatPaymentServiceTime(pranaamAppDataStateManagement.cartDataResponse?.tripDetail.serviceDateTime ?? '')}',
                    style: ADTextStyle400.size14,
                  ),
                  if (getServiceType(
                        pranaamAppDataStateManagement
                            .cartDataResponse?.tripDetail.serviceType,
                      ) ==
                      roundTripServiceId)
                    Column(
                      children: [
                        ADSizedBox(
                          height: context.k_8,
                        ),
                        Text(
                          '${getCityName(
                            pranaamAppDataStateManagement.cartDataResponse
                                    ?.tripDetail.serviceAirport ??
                                '',
                            context.read<SiteCoreStateManagement>(),
                          )} • ${getServiceName(pranaamAppDataStateManagement) == id_1 || getServiceName(pranaamAppDataStateManagement) == id_3 ? 'Arrival' : 'Departure'} • ${formatDateTime(
                            dateTimeFormat: dateConfirmationFormat,
                            dateString: pranaamAppDataStateManagement
                                .cartDataResponse
                                ?.tripDetail
                                .roundTripSecServiceDateTime,
                          )}, ${formatPaymentServiceTime(pranaamAppDataStateManagement.cartDataResponse?.tripDetail.roundTripSecServiceDateTime ?? '')}',
                          style: ADTextStyle400.size14,
                        ),
                      ],
                    ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(
                'lib/assets/images/svg/icons/shopping/i_common.svg',
                height: context.k_18,
                color: context.adColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getGuests() {
    final int adults = pranaamAppDataStateManagement
            .serviceBookingData.travellers?.totalTravellers ??
        0;
    return adults > 1 ? 'guests' : 'guest';
  }
}
