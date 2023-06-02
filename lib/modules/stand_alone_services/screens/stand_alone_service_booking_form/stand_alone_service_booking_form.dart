import 'dart:io';

import 'package:adani_airport_mobile/modules/pranaam_service/model/pranaam_dashboard_site_core/pranaam_dashboard_site_core_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/service_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/service_booking/travel_sector_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/package_service/horizontally_scrollable_column.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/ga_analytics/stand_alone_ga_analytics.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/ga_analytics/stand_alone_ga_name.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/stand_alone_service_booking_form/views/arrival_departure_form_view.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/stand_alone_service_booking_form/views/flight_service_time_column.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/stand_alone_service_booking_form/views/round_trip_form_view.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/stand_alone_service_booking_form/views/service_type_option_picker.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/stand_alone_service_booking_form/views/stand_alone_quantity_picker.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/screens/stand_alone_service_booking_form/views/travel_sector_option_picker.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/state_management/stand_alone_dashboard_state_management.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/state_management/stand_alone_service_booking_state_management.dart';
import 'package:adani_airport_mobile/modules/stand_alone_services/utils/stand_alone_service_helper.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class StandAloneServiceBookingForm extends StatelessWidget {
  const StandAloneServiceBookingForm({
    Key? key,
    required this.item,
    this.showBack = false,
  }) : super(key: key);
  final DashboardItem item;
  final bool showBack;

  @override
  Widget build(BuildContext context) {
    final standAloneServiceBooking =
        context.read<StandAloneServiceBookingStateManagement>();
    context
        .read<StandAloneDashboardStateManagement>()
        .setBookingWidgetItem(item);
    return SafeArea(
      child: Consumer<StandAloneServiceBookingStateManagement>(
        builder: (_, standAloneServiceBookingState, __) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (showBack)
                    InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () => {
                        navigatorPopScreen(context),
                      },
                      child: Icon(
                        Platform.isIOS
                            ? Icons.arrow_back_ios
                            : Icons.arrow_back,
                        size: context.k_22,
                        color: context.adColors.darkGreyTextColor,
                      ).paddingAllSide(context.k_4),
                    ).paddingBySide(
                      right: context.k_16,
                    ),
                  Text(
                    item.title,
                    style: ADTextStyle700.size22
                        .copyWith(color: context.adColors.blackTextColor),
                  ),
                ],
              ),
              ADSizedBox(
                height: item.itemMargin.top,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ServiceTypeOptionPicker(
                      callback: (ServiceModel value) =>
                          standAloneServiceBooking.handleServiceTypeTap(value),
                      selectedTitle:
                          standAloneServiceBooking.selectedService.serviceTitle,
                    ),
                  ),

                  // const Spacer(
                  //   flex: 2,
                  // ),
                  Expanded(
                    child: TravelSectorOptionPicker(
                      callback: (TravelSectorModel value) =>
                          standAloneServiceBooking.handleTravelSectorTap(value),
                      selectedTitle: standAloneServiceBooking
                              .selectedTravelSector?.travelSectorTitle ??
                          '',
                    ),
                  ),
                ],
              ),
              ArrivalDepartureFormView(
                standAloneServiceBookingState: standAloneServiceBooking,
              ),
              if (standAloneServiceBooking.selectedService.serviceId ==
                  roundTripServiceId)
                RoundTripFormView(
                  standAloneServiceBookingState: standAloneServiceBooking,
                ),
              StandAloneQuantityPicker(
                onPorterSelected: standAloneServiceBooking.handlePorterSelect,
                selectedPorters: standAloneServiceBooking.porterCount,
                errorMsg: standAloneServiceBooking.porterErrorMsg,
              ),
              ADSizedBox(
                height: context.k_20,
              ),
              FlightServiceTimeColumn(
                flightServiceDetails:
                    standAloneServiceBooking.getFlightServiceWidgetDetails(),
              ),
              Container(
                height: context.k_56 - context.k_6,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: context.adColors.blueColor,
                    shape: const StadiumBorder(),
                    padding: EdgeInsets.symmetric(
                      vertical: context.k_14,
                    ),
                  ),
                  onPressed: () => {
                    if (standAloneServiceBookingState
                        .validateBookingForm(context))
                      {
                        StandAloneGaAnalytics().bookNowEvent(
                          context,
                          StandAloneGaName(context).bookNowName(),
                        ),
                        standAloneServiceBookingState
                            .getPackagesDetailApi(context),
                      },
                  },
                  child: Selector<StandAloneServiceBookingStateManagement,
                      ADResponseState>(
                    selector: (
                      BuildContext context,
                      model,
                    ) =>
                        model.getPackageDetailsState,
                    builder: (BuildContext context, value, Widget? child) =>
                        value.viewStatus == Status.loading
                            ? ADDotProgressView(
                                color: context.adColors.whiteTextColor,
                                size: dotSize,
                              )
                            : Text(
                                'Book Now',
                                style: ADTextStyle700.size16.setTextColor(
                                  context.adColors.whiteTextColor,
                                ),
                              ),
                  ),
                ),
              ),
            ],
          ).paddingBySide(
            top: showBack ? context.k_16 : (item.itemMargin.top).sp,
            bottom: (item.itemMargin.bottom).sp,
            left: (item.itemMargin.left).sp,
            right: (item.itemMargin.right).sp,
          );
        },
      ),
    );
  }
}
