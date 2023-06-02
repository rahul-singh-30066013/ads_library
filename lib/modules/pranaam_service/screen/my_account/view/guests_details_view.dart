/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/booking/create_booking/request/travellers_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/service_booking/service_booking_details.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///This will show the guest details.
const int maxLineGuest = 2;

class GuestsDetailsView extends StatelessWidget {
  // final CreateBookingRequestModel? createBookingModel;
  final List<TravellersModel> travellers;

  const GuestsDetailsView({Key? key, required this.travellers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final CreateBookingRequestModel? createBookingRequestModel =
    //     createBookingModel;
    // if (createBookingRequestModel == null) {
    //   adLog('widget createBookingModel is null', className: this);
    //   return const ADSizedBox.shrink();
    // }

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
            itemCount:travellers.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final TravellersModel traveller = travellers[index];
              return Padding(
                padding: EdgeInsets.symmetric(
                  vertical: context.k_10,
                ),
                child: RichText(
                  maxLines: maxLineGuest,
                  text: TextSpan(
                    style: ADTextStyle400.size12.setTextColor(
                      context.adColors.greyTextColor,
                    ),
                    children: [
                      TextSpan(
                        text:
                            '${traveller.personName.salutationText} ${traveller.personName.firstName} ${traveller.personName.lastName}',
                        style: ADTextStyle500.size16.setTextColor(
                          context.adColors.blackTextColor,
                        ),
                      ),
                      WidgetSpan(
                        child: SizedBox(
                          width: context.k_6, // your of space
                        ),
                      ),
                      TextSpan(
                        text: ServiceBookingDetails.getInstance()
                                    .getPassengerType[
                        traveller.passengerTypeId] ??
                            '',
                        style: ADTextStyle400.size12.setTextColor(
                          context.adColors.greyTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
