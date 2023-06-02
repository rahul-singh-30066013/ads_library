/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/models/helping_models/selected_date_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/response_models/search_cab_response_model.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cabs_srp_screen/views/cab_listing_shimmer_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cabs_srp_screen/views/cab_reward_points_view.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cabs_srp_screen/views/cabs_list_view_expansion_item.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cabs_srp_screen/views/schedule_date_time_widget.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/select_destination_screen/views/cabs_not_found_view.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/cabs_srp_state.dart';
import 'package:adani_airport_mobile/modules/cabs/utilities/constants/cab_constants.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/views/no_data_found_error_screen.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class CabsListsView extends StatelessWidget {
  final double vendorImageWidth = 112.sp;
  final CabsSrpState cabSrpState;

  CabsListsView({
    Key? key,
    required this.cabSrpState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<CabsSrpState, ADResponseState>(
      selector: (context, cabsSrpState) => cabsSrpState.cabListingState,
      builder: (context, state, Widget? child) {
        return Selector<CabsSrpState, CabItinerary?>(
          selector: (context, cabsSrpState) =>
              cabsSrpState.selectedCabItinerary,
          builder: (context, selectedCabItinerary, Widget? child) {
            switch (state.viewStatus) {
              case Status.loading:
                return const CabListingShimmerView();
              case Status.error:
                return Center(
                  child: NoDataFoundErrorScreen(
                    errorTitle: state.message ?? 'ADLMS02'.localize(context),
                    onRetryTap: () => cabSrpState.getCabItineraries(),
                  ),
                );
              case Status.complete:
                return cabSrpState.cabListingState.successCode ==
                        CabBookingErrorCode.cabB11.name
                    ? Center(
                        child: CabsNotFoundView(
                          imagePath:
                              'lib/assets/images/cab_booking/no_cab_available.png',
                          title:
                              'cabs_not_available_at_this_moment_for_this_location'
                                  .localize(context),
                          subTitle: 'schedule_for_later'.localize(context),
                          buttonTittle: '',
                          isCabNotAvailable: true,
                          subTitleAction: () => _pickDateAndTime(context),
                        ),
                      )
                    : ListView(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        children: [
                          Selector<CabsSrpState, bool>(
                            selector: (context, cabsSrpState) =>
                                cabsSrpState.isShowCabs,
                            builder: (context, isShowCabs, Widget? child) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Visibility(
                                    visible: (cabSrpState.cabLoyaltyPercentage
                                                ?.isNotEmpty ??
                                            false) &&
                                        isShowCabs,
                                    child: CabRewardPointsView(
                                      loyaltyPercentage:
                                          cabSrpState.cabLoyaltyPercentage ??
                                              '',
                                    ).paddingBySide(
                                      left: context.k_16,
                                      right: context.k_16,
                                      top: context.k_24,
                                    ),
                                  ),
                                  Visibility(
                                    visible: !isShowCabs,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(
                                          'lib/assets/images/cab_booking/cab_time_slot_not_available.png',
                                        ).paddingBySide(
                                          left: context.k_32,
                                          right: context.k_32,
                                        ),
                                        Text(
                                          '${'no_cab_available_for_selected_time'.localize(context)} ${'next_cab_available_at'.localize(context).replaceAll('#', '\n${convertDateTimeToString(cabSrpState.cabAvailableForLaterTime ?? 0)}')}',
                                          style: ADTextStyle700.size22
                                              .setTextColor(
                                            context.adColors.blackTextColor,
                                          ),
                                          textAlign: TextAlign.center,
                                        ).paddingBySide(
                                          top: context.k_28,
                                        ),
                                        InkWell(
                                          onTap: () =>
                                              cabSrpState.updateOnClickOnShow(),
                                          child: Text(
                                            'show_cabs'.localize(context),
                                            style: ADTextStyle500.size16
                                                .setTextColor(
                                                  context
                                                      .adColors.blackTextColor,
                                                )
                                                .copyWith(
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                          ),
                                        ).paddingBySide(
                                          top: context.k_15,
                                        ),
                                      ],
                                    ).paddingBySide(
                                      left: context.k_40 + context.k_2,
                                      right: context.k_40 + context.k_2,
                                      top: context.k_64 + context.k_48,
                                    ),
                                  ),
                                  ADSizedBox(height: context.k_24),
                                  Visibility(
                                    visible: isShowCabs,
                                    child: ListView.builder(
                                      itemCount:
                                          cabSrpState.cabItineraries.length,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return CabsListViewExpansionItem(
                                          cabSrpState: cabSrpState,
                                          selectedCabItinerary:
                                              selectedCabItinerary,
                                          cabItinerariesIndex: index,
                                        ).paddingBySide(
                                          bottom: context.k_40 + context.k_4,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      );
              default:
            }
            return const SizedBox();
          },
        );
      },
    );
  }

  void _pickDateAndTime(BuildContext context) {
    adShowBottomSheetWithData(
      context: context,
      childWidget: ScheduleDateTimeWidget(
        initialDateTime: cabSrpState.selectedDate,
      ),
      headerTitle: 'schedule_ride'.localize(context),
      isPaddingRequired: false,
    ).then((selectedDate) {
      if (selectedDate != null) {
        final selectedDateModel = selectedDate as SelectedDateModel;
        if (selectedDateModel.isNeedToUpdate ?? false) {
          cabSrpState.updateScheduleTime(selectedDateModel.selectedDate);
        }
      }
    });
  }

  String convertDateTimeToString(int millis) {
    final DateTime selectedDate =
        DateTime.fromMillisecondsSinceEpoch(millis * 1000);
    final date = DateFormat('dd MMM').format(selectedDate);
    final time = DateFormat('hh:mm a').format(selectedDate);
    return '$date | $time'.replaceAll('AM', 'am').replaceAll('PM', 'pm');
  }
}
