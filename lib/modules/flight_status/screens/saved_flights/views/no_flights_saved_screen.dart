/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/flight_status/state_management/saved_flight_state.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class NoFlightsSavedScreen extends StatelessWidget {
  NoFlightsSavedScreen({Key? key}) : super(key: key);
  final imageHeight = 100.sp;
  final int pageSize = 10;

  void callGaEventForSaveFlightOptionSelect({
    required String label,
  }) {
    final Map<String, Object?> obj = {
      Parameters.category.name: 'flight_status',
      Parameters.sub_category.name: 'saved_flight',
      Parameters.label.name: label,
    };
    ClickEvents.saved_flight_option_select.logEvent(parameters: obj);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ADSizedBox(
          height: context.k_64,
        ),
        SvgPicture.asset(
          'lib/assets/images/svg/icons/no_saved_flights.svg',
          height: imageHeight,
          fit: BoxFit.fitHeight,
        ).paddingBySide(
          left: context.k_30,
          right: context.k_30,
        ),
        ADSizedBox(
          height: context.k_26,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.k_16),
          child: Text(
            'no_saved_flights_yet'.localize(context),
            style: ADTextStyle700.size18,
          ),
        ),
        ADSizedBox(
          height: context.k_10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.k_16),
          child: Text(
            'pack_your_bags_for_well_planned_travel'.localize(context),
            style: ADTextStyle400.size16,
            textAlign: TextAlign.center,
          ),
        ),
        ADSizedBox(
          height: context.k_40,
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: context.k_16,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: context.adColors.dividerColor,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            children: [
              InkWell(
                customBorder: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                ),
                onTap: () => {
                  callGaEventForSaveFlightOptionSelect(
                    label: 'add_flight_manually'.localize(context),
                  ),
                  navigateToScreenWithRootNavigatorResult(
                    context,
                    addFlightInformation,
                  ).then(
                    (value) =>
                        context.read<SavedFlightState>().getSavedFlightApi(
                              pageIndex: 1,
                              pageSize: pageSize,
                              language: 'en',
                            ),
                  ),
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.k_20,
                    vertical: context.k_16,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'lib/assets/images/svg/icons/more/add.svg',
                        color: context.adColors.greyTextColor,
                      ),
                      ADSizedBox(
                        width: context.k_16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'add_flight_manually'.localize(context),
                            style: ADTextStyle500.size16,
                          ),
                          ADSizedBox(
                            height: context.k_4,
                          ),
                          Text(
                            'by_airline_flight'.localize(context),
                            style: ADTextStyle400.size12,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: context.k_16,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 1,
                indent: context.k_20,
                endIndent: context.k_20,
              ),
              InkWell(
                onTap: () => {
                  callGaEventForSaveFlightOptionSelect(
                    label: 'book_a_new'.localize(context),
                  ),
                  navigateToScreenUsingNamedRoute(context, flightBooking),
                },
                customBorder: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.k_20,
                    vertical: context.k_16,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'lib/assets/images/svg/icons/flight/flight_tilted.svg',
                        color: context.adColors.greyTextColor,
                      ),
                      ADSizedBox(
                        width: context.k_16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'book_a_new'.localize(context),
                            style: ADTextStyle500.size16,
                          ),
                          ADSizedBox(
                            height: context.k_4,
                          ),
                          Text(
                            'find_the_best'.localize(context),
                            style: ADTextStyle400.size12,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: context.k_16,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
