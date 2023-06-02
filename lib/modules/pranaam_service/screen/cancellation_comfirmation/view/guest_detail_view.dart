/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/common_order_detail/pranaam_detail.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/service_booking/service_booking_details.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///This will show the guest details.
const int maxLineGuest = 2;
const _cancelColor = Color(0xffdc464b);
const _confirmColor = Color(0xff13a180);
const _rectangleOpacity = 0.07000000029802322;
const _rescheduleColor = Color(0xffe67225);

class GuestDetailView extends StatelessWidget {
  final PranaamDetail? pranaamDetail;

  const GuestDetailView({
    Key? key,
    required this.pranaamDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Traveler> _travellers = pranaamDetail?.travelers ?? [];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.k_16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'guests'.localize(context),
            style: ADTextStyle700.size22,
          ),
          ADSizedBox(
            height: context.k_10,
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: _travellers.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  vertical: context.k_10,
                ),
                child: Row(
                  children: [
                    Text(
                      '${getSalutationsTitleById(
                        _travellers[index].salutationId.toString(),
                        context.read<SiteCoreStateManagement>().salutation,
                      )} ${_travellers[index].firstName} ${_travellers[index].lastName}',
                      style: ADTextStyle500.size16
                          .setTextColor(
                            context.adColors.blackTextColor,
                          )
                          .copyWith(
                            decoration: _travellers[index].passengerStatus ==
                                        'Confirmed' ||
                                    _travellers[index].passengerStatus ==
                                        'Reschedule'
                                ? TextDecoration.none
                                : TextDecoration.lineThrough,
                          ),
                    ),
                    ADSizedBox(
                      width: context.k_8,
                    ),
                    Text(
                      ServiceBookingDetails.getInstance().getPassengerType[
                              _travellers[index].passengerTypeId] ??
                          '',
                      style: ADTextStyle400.size12
                          .setTextColor(
                            context.adColors.greyTextColor,
                          )
                          .copyWith(
                            decoration: _travellers[index].passengerStatus ==
                                        'Confirmed' ||
                                    _travellers[index].passengerStatus ==
                                        'Reschedule'
                                ? TextDecoration.none
                                : TextDecoration.lineThrough,
                          ),
                    ),
                    const Spacer(),
                    if (_travellers[index].passengerStatus == 'Confirmed')
                      Container(
                        width: context.k_64 + context.k_22,
                        height: context.k_24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(context.k_8),
                          ),
                          color: _confirmColor.withOpacity(_rectangleOpacity),
                        ),
                        child: Center(
                          child: Text(
                            'confirmed'.localize(context).toUpperCase(),
                            style: ADTextStyle700.size12
                                .setTextColor(const Color(0xff13a180)),
                          ),
                        ),
                      )
                    else if (_travellers[index].passengerStatus == 'Reschedule')
                      Container(
                        width: context.k_64 + context.k_22,
                        height: context.k_24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(context.k_8),
                          ),
                          color:
                              _rescheduleColor.withOpacity(_rectangleOpacity),
                        ),
                        child: Center(
                          child: Text(
                            'reschedule'.localize(context).toUpperCase(),
                            style: ADTextStyle700.size12
                                .setTextColor(const Color(0xffe67225)),
                          ),
                        ),
                      )
                    else
                      Container(
                        width: context.k_64 + context.k_22,
                        height: context.k_24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(context.k_8),
                          ),
                          color: _cancelColor.withOpacity(_rectangleOpacity),
                        ),
                        child: Center(
                          child: Text(
                            'cancelled_pranaam'.localize(context).toUpperCase(),
                            style: ADTextStyle700.size12
                                .setTextColor(const Color(0xffdc464b)),
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
