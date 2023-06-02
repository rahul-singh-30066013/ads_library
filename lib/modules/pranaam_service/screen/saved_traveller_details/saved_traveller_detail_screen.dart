/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */


import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/fare_detail_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/flight_review/views/review_flight_status_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/screens/travellers_details/views/flight_source_destination_address.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/review_screen_type.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/saved_traveller_details/view/contact_details_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/saved_traveller_details/view/saved_traveller_view.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/animation/shake_widget.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

final shakeKeyTraveller = GlobalKey<ShakeWidgetState>();
final List flightStatusList = [
  FlightStatusClass(name: 'Cart', statusCode: 2),
  FlightStatusClass(name: 'Guest Details', statusCode: 1),
  FlightStatusClass(name: 'Payment', statusCode: 0),
];

final List savedTravellersList = [
  SavedTraveller(travellerName: 'Mayank Matta', isSelected: true),
  SavedTraveller(travellerName: 'Mohit Arrora', isSelected: false),
  SavedTraveller(travellerName: 'Dheeraj Taneja', isSelected: false),
];

class SavedTravellerDetailScreen extends StatefulWidget {
  const SavedTravellerDetailScreen({Key? key}) : super(key: key);

  @override
  State<SavedTravellerDetailScreen> createState() =>
      _SavedTravellerDetailScreenState();
}

class _SavedTravellerDetailScreenState
    extends State<SavedTravellerDetailScreen> {
  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'booking_payment_cancellation'.localize(context),
          style: ADTextStyle700.size22
              .setTextColor(context.adColors.blackTextColor),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          ADSizedBox(
            height: context.k_20,
          ),
          ReviewFlightStatusView(
            flightStatusList: flightStatusList,
          ),
          ADSizedBox(
            height: context.k_20,
          ),
          Expanded(
            child: ListView(
              children: [
                const FlightSourceDestinationAddress(
                  flightSourceAddress: 'BLR',
                  flightSourceTime: '08:00',
                  flightSourceDayAndDate: 'Wed, 8 Nov 21',
                  flightDestinationAddress: 'DEL',
                  flightDestinationTime: '10:10',
                  flightDestinationDayAndDate: 'Wed, 8 Nov 21',
                  imageIconFlight: '',
                ).paddingBySide(
                  left: context.k_16,
                  right: context.k_16,
                ),
                Text(
                  'enter_name_mention'.localize(context),
                  style: ADTextStyle400.size16
                      .setTextColor(context.adColors.darkGreyTextColor),
                ).paddingBySide(
                  top: context.k_24,
                  left: context.k_16,
                  right: context.k_16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'adults'.localize(context),
                      style: ADTextStyle700.size16
                          .setTextColor(context.adColors.blackTextColor),
                    ),
                    Text(
                      '1/2',
                      style: ADTextStyle400.size14
                          .setTextColor(context.adColors.greyTextColor),
                    ),
                  ],
                ).paddingBySide(
                  top: context.k_24,
                  left: context.k_16,
                  right: context.k_16,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: savedTravellersList.length,
                  itemBuilder: (context, index) {
                    return SavedTravellerView(
                      text: getTravellerName(index),
                      isChecked: isChecked(index),
                      onCheckedChange: (value) => adLog('onTap'),
                    );
                  },
                ).paddingBySide(
                  top: context.k_24,
                  left: context.k_16,
                  right: context.k_16,
                ),
                Row(
                  children: [
                    Text(
                      'Add new adult ',
                      style: ADTextStyle400.size16
                          .setTextColor(context.adColors.blackTextColor)
                          .copyWith(decoration: TextDecoration.underline),
                    ),
                    ADSizedBox(
                      width: context.k_4,
                    ),
                    Icon(
                      Icons.add,
                      color: context.adColors.blackTextColor,
                    ),
                  ],
                ).paddingBySide(
                  top: context.k_24,
                  left: context.k_16,
                  right: context.k_16,
                ),
                Divider(
                  height: context.k_64,
                  thickness: context.k_8,
                  color: context.adColors.containerGreyBg,
                ),
                const ContactDetailsView(),
                Divider(
                  height: context.k_64,
                  thickness: context.k_8,
                  color: context.adColors.containerGreyBg,
                ),
                FareDetailView(
                  shakeKeyReview: shakeKeyTraveller,
                  pricedItineraryList: const [],
                  paxInfoList: const [],
                  reviewScreenType: ReviewScreenType.traveller,
                ),
                Divider(
                  height: context.k_16,
                  thickness: context.k_8,
                  color: context.adColors.containerGreyBg,
                ),
                ADSizedBox(
                  height: context.k_20,
                ),
                CheckboxListTile(
                  activeColor: context.adColors.blackTextColor,
                  contentPadding: EdgeInsets.zero,
                  //    <-- label
                  value: false,
                  onChanged: (newValue) => adLog('value'),
                  title: Text(
                    'saved_traveller_terms_condition'.localize(context),
                    style: ADTextStyle400.size14.setTextColor(
                      context.adColors.greyTextColor,
                    ),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                ).paddingBySide(
                  left: context.k_16,
                  right: context.k_16,
                  bottom: context.k_24,
                ),
                Padding(
                  padding: EdgeInsets.all(context.k_16),
                  child: ElevatedButton(
                    onPressed: () => navigateToScreenUsingNamedRoute(
                      context,
                      pranaamTravellerDetailScreen,
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.k_20,
                        vertical: context.k_16,
                      ), backgroundColor: context.adColors.blueColor,
                      shape: const StadiumBorder(),
                    ),
                    child: Text(
                      'continue'.localize(context),
                      style: ADTextStyle700.size18
                          .setTextColor(context.adColors.whiteTextColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
