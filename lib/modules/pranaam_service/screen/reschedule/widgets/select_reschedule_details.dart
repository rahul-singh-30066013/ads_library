/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/common_order_detail/pranaam_detail.dart'
    as pranaam_detail;
import 'package:adani_airport_mobile/modules/flight_booking/screens/calender/views/date_range_view.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/bottom_sheet_utils.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_reschedule_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/service_booking/service_booking_details.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/views/pranaam_flight_list.dart';
import 'package:adani_airport_mobile/modules/session/screens/login/views/drop_down_generic.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_draggable_scrollable_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_draggable_scrollable_sheet_body.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class SelectRescheduleDetails extends StatelessWidget {
  final pranaam_detail.PranaamDetail? pranaamDetail;
  final bool isRoundTrip;
  final bool showNote;
  const SelectRescheduleDetails({
    Key? key,
    required this.pranaamDetail,
    required this.isRoundTrip,
    required this.showNote,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final SiteCoreStateManagement siteCoreStateManagement =
        context.read<SiteCoreStateManagement>();
    final PranaamRescheduleStateManagement rescheduleStateManagement =
        context.read<PranaamRescheduleStateManagement>();
    final tripDetails = pranaamDetail?.tripDetails;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (tripDetails?.serviceTypeId == id_3 ||
            tripDetails?.serviceTypeId == id_2)
          Row(
            children: [
              Text(
                getCityName(
                  isRoundTrip
                      ? rescheduleStateManagement
                              .getOriginAirportCodeForTransitAndRoundTrip(
                            pranaamDetail,
                          ) ??
                          ''
                      : tripDetails?.originAirport ?? '',
                  context.read<SiteCoreStateManagement>(),
                ),
                style: ADTextStyle500.size16
                    .setTextColor(context.adColors.blackTextColor),
              ),
              Icon(
                Icons.arrow_forward,
                color: context.adColors.blackTextColor,
                size: context.k_18,
              ).paddingBySide(left: context.k_8, right: context.k_8),
              Text(
                getCityName(
                  isRoundTrip
                      ? rescheduleStateManagement
                              .getDestAirportCodeForTransitAndRoundTrip(
                            context,
                            pranaamDetail,
                          ) ??
                          ''
                      : tripDetails?.destinationAirport ?? '',
                  context.read<SiteCoreStateManagement>(),
                ),
                style: ADTextStyle500.size16
                    .setTextColor(context.adColors.blackTextColor),
              ),
            ],
          ),
        if (tripDetails?.serviceTypeId == id_3 ||
            tripDetails?.serviceTypeId == id_2)
          ADSizedBox(
            height: context.k_20,
          ),
        DropDownGeneric(
          needRightPadding: false,
          svgIcon: SvgAssets.calenderIcon,
          type: 'date'.localize(context),
          onTap: () => BottomSheetUtils.showBottomSheetDialog(
            context,
            ADDraggableScrollableBottomSheet(
              initialChildSize: BottomSheetUtils.getBottomSheetHeightRatio(
                context,
              ),
              childWidget: DateRangeView(
                calendarStartDate: isRoundTrip
                    ? rescheduleStateManagement.arrivalDateTime
                    : DateTime.now(),
                showAmount: false,
                isPranaam: true,
                departureDate: isRoundTrip
                    ? rescheduleStateManagement.departureDateTime
                    : rescheduleStateManagement.arrivalDateTime,
              ),
            ),
          ).then((value) {
            if (value != null) {
              rescheduleStateManagement.updateDate(
                value,
                isRoundTrip
                    ? rescheduleStateManagement.departureDateController
                    : rescheduleStateManagement.arrivalDateController,
                pranaamDetail,
                context,
                isRoundTrip: isRoundTrip,
                flightController: isRoundTrip
                    ? rescheduleStateManagement.departureFlightController
                    : rescheduleStateManagement.arrivalFlightController,
              );
            }
          }),
          controller: isRoundTrip
              ? rescheduleStateManagement.departureDateController
              : rescheduleStateManagement.arrivalDateController,
        ),
        SizedBox(
          height: context.k_20,
        ),
        DropDownGeneric(
          needRightPadding: false,
          type: 'flights'.localize(context),
          onTap: () => {
            if (isSelected(
              isRoundTrip: isRoundTrip,
              rescheduleStateManagement: rescheduleStateManagement,
            ))
              {
                showDraggableListBottomSheetForFlightSearchList(
                  context: context,
                  headerTitle: 'flights',
                  flightControler: isRoundTrip
                      ? rescheduleStateManagement.departureFlightController
                      : rescheduleStateManagement.arrivalFlightController,
                ).then((value) {
                  // searchTextController.clear();
                  // state.bookingServiceState.buildSearchList(
                  //   '',
                  //   state.bookingServiceState.flightDetailModelList,
                  // );
                  adLog('value');
                }),
              },
          },
          controller: isRoundTrip
              ? rescheduleStateManagement.departureFlightController
              : rescheduleStateManagement.arrivalFlightController,
        ),
        SizedBox(
          height: context.k_32,
        ),
        Text(
          'Guests',
          style: ADTextStyle600.size18
              .setTextColor(context.adColors.blackTextColor),
        ),
        ADSizedBox(
          height: context.k_8,
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: pranaamDetail?.travelers?.length,
          itemBuilder: (context, index) => (pranaamDetail
                      ?.travelers?[index].passengerStatus
                      ?.toLowerCase() !=
                  'cancelled')
              ? ListTile(
                  // side: BorderSide(
                  //   color: context.adColors.black,
                  // ),
                  // checkboxShape: RoundedRectangleBorder(
                  //   side: BorderSide(color: context.adColors.black),
                  //   borderRadius: BorderRadius.circular(context.k_4),
                  // ),
                  // visualDensity: const VisualDensity(horizontal: -4),
                  dense: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: context.k_2),
                  // controlAffinity: ListTileControlAffinity.leading,
                  title: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${getSalutationsTitleById(
                          pranaamDetail?.travelers?[index].salutationId
                                  .toString() ??
                              '',
                          siteCoreStateManagement.salutation,
                        )} ${pranaamDetail?.travelers?[index].firstName} '
                        '${pranaamDetail?.travelers?[index].lastName}',
                        style: ADTextStyle400.size16
                            .setTextColor(context.adColors.blackTextColor),
                      ),
                      ADSizedBox(
                        width: context.k_8,
                      ),
                      Text(
                        ServiceBookingDetails.getInstance().getPassengerType[
                                pranaamDetail
                                    ?.travelers?[index].passengerTypeId] ??
                            '',
                        style: ADTextStyle400.size12
                            .setTextColor(context.adColors.greyTextColor),
                      ),
                    ],
                  ),
                  // activeColor: context.adColors.black,
                  // checkColor: context.adColors.whiteTextColor,
                  // value: true,
                  // onChanged: null,
                )
              : const SizedBox(),
        ),
        ADSizedBox(
          height: context.k_32,
        ),
        if (showNote)
          Text(
            'Note: Reschedule (full/partial) can only be done once.',
            style: ADTextStyle400.size12
                .setTextColor(context.adColors.greyTextColor),
          ).paddingBySide(left: context.k_4),
        // if(showNote) SizedBox(height: context.k_36,),
        if (!showNote)
          Divider(
            height: 1,
            color: context.adColors.tileBorderColor,
          ),
      ],
    );
  }

  Future<void> showDraggableListBottomSheetForFlightSearchList({
    required BuildContext context,
    required String headerTitle,
    required TextEditingController flightControler,
  }) =>
      ADDraggableScrollableSheetBody.showDraggableScrollableBottomSheet(
        context: context,
        child: DraggableScrollableSheet(
          initialChildSize: ADDraggableScrollableSheetBody.minChildSize,
          maxChildSize: ADDraggableScrollableSheetBody.maxChildSize,
          minChildSize: ADDraggableScrollableSheetBody.minChildSize,
          expand: false,
          builder: (
            BuildContext context,
            ScrollController scrollController,
          ) {
            final PranaamRescheduleStateManagement rescheduleStateManagement =
                context.read<PranaamRescheduleStateManagement>();
            return ADDraggableScrollableSheetBody(
              headerTitle: headerTitle,
              childWidget: PranaamFlightList(
                selectedFlight: isRoundTrip
                    ? rescheduleStateManagement.selectedDepartureFlightNumber
                    : rescheduleStateManagement.selectedArrivalFlightNumber,

                /// Add selected flight code
                response: isRoundTrip
                    ? rescheduleStateManagement.pranaamDepartureFlightsResponse
                    : rescheduleStateManagement.pranaamArrivalFlightsResponse,
                callback: (value) => {
                  adLog('$value'),
                  rescheduleStateManagement.selectFlightCallback(
                    value,
                    pranaamDetail,
                    isRoundTrip: isRoundTrip,
                    context: context,
                  ),
                  flightControler.text = isRoundTrip
                      ? rescheduleStateManagement.selectedDepartureFlightNumber
                      : rescheduleStateManagement.selectedArrivalFlightNumber,
                },
              ),
            );
          },
        ),
      );
  bool isSelected({
    required bool isRoundTrip,
    required PranaamRescheduleStateManagement rescheduleStateManagement,
  }) {
    if (!isRoundTrip) {
      return rescheduleStateManagement
              .pranaamArrivalFlightsResponse.value.viewStatus !=
          Status.none;
    } else {
      adLog('is roundTrip');
      return rescheduleStateManagement
                  .pranaamDepartureFlightsResponse.value.viewStatus !=
              Status.none &&
          rescheduleStateManagement.selectedArrivalFlight != null;
    }
  }
}
