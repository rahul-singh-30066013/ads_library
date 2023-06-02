/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/flight_booking/utils/constant.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/flight_utils.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/helping_models/flight_status_detail_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/helping_models/flight_status_storage_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/response_models/flight_status_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/models/response_models/saved_flight_model.dart';
import 'package:adani_airport_mobile/modules/flight_status/screens/flight_status_detail_screen/views/dashed_line_view.dart';
import 'package:adani_airport_mobile/modules/flight_status/state_management/saved_flight_state.dart';
import 'package:adani_airport_mobile/modules/flight_status/utils/enums/flight_status.dart';
import 'package:adani_airport_mobile/modules/flight_status/utils/enums/flight_type.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class SavedFlightTile extends StatefulWidget {
  const SavedFlightTile({
    Key? key,
    required this.confirmDismiss,
    required this.index,
    required this.flights,
    required this.isSwiped,
    this.savedFlightState,
    required this.updateTap,
    required this.scrollController,
  }) : super(key: key);

  final int index;
  final List<SavedFlightListData> flights;
  final Future<bool> Function(BuildContext, int) confirmDismiss;
  final Function(bool) isSwiped;
  final SavedFlightState? savedFlightState;
  final ADTapCallbackWithValue updateTap;
  final ScrollController scrollController;

  @override
  State<SavedFlightTile> createState() => _SavedFlightTileState();
}

class _SavedFlightTileState extends State<SavedFlightTile> {
  final double height = 200.sp;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.scrollController.addListener(() {
        final isSwiped = widget.isSwiped(
          !(widget.scrollController.position.pixels !=
              widget.scrollController.position.maxScrollExtent),
        );
        adLog('isSwiped $isSwiped');
      });
    });
    return SingleChildScrollView(
      controller: widget.scrollController,
      physics: const PageScrollPhysics(),
      scrollDirection: Axis.horizontal,
      primary: false,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.k_16,
        ),
        child: Row(
          children: [
            SavedFlightTileWidget(
              onResetTap: () => widget.scrollController.jumpTo(0),
              index: widget.index,
              leftRightPadding: context.k_32,
              flights: widget.flights,
              updateTap: widget.updateTap,
            ),
            Container(
              margin: EdgeInsets.only(left: context.k_30, right: context.k_14),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Color(0xffe3463b),
              ),
              child: IconButton(
                onPressed: () => widget
                    .confirmDismiss(context, widget.index)
                    .then(
                      (value) => value
                          ? widget.scrollController.jumpTo(
                              widget.scrollController.position.minScrollExtent,
                            )
                          : widget.scrollController.animateTo(
                              widget.scrollController.position.minScrollExtent,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeOut,
                            ),
                    ),
                icon: Selector<SavedFlightState, bool>(
                  selector: (context, state) =>
                      widget.savedFlightState?.savedFlightResponse
                          .flights[widget.index].isSelected ??
                      false,
                  builder: (
                    BuildContext context,
                    value,
                    Widget? child,
                  ) {
                    return value
                        ? ADDotProgressView(
                            color: context.adColors.blackColor,
                            size: context.k_4,
                          )
                        : SvgPicture.asset(
                            'lib/assets/images/svg/icons/flight/delete.svg',
                            color: context.adColors.whiteTextColor,
                            height: context.k_20,
                          );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SavedFlightTileWidget extends StatelessWidget {
  const SavedFlightTileWidget({
    Key? key,
    required this.index,
    required this.leftRightPadding,
    required this.flights,
    this.isFromHome = false,
    this.updateTap,
    required this.onResetTap,
  }) : super(key: key);

  final int index;
  final double leftRightPadding;
  final List<SavedFlightListData> flights;
  final bool isFromHome;
  final ADTapCallbackWithValue? updateTap;
  final ADTapCallback onResetTap;

  void onTileTap(BuildContext context) {
    onResetTap();
    moveToSavedDetails(context);
  }

  @override
  Widget build(BuildContext context) {
    final airlineInfo = FlightUtils.airlineInfo?[flights[index].airlineCode];
    Color statusColor = context.adColors.neutralInfoMsg;
    const double paddingForHome = 30;

    ///TODO:- will replace later with site core color value
    if ((flights[index].status.toString().toLowerCase() ==
            FlightStatus.landed.name) ||
        (flights[index].status.toString().toLowerCase() ==
            FlightStatus.departed.name)) {
      statusColor = context.adColors.greenColor;
    } else if (flights[index].status.toLowerCase() ==
        FlightStatus.cancelled.name) {
      statusColor = context.adColors.mediumPink;
    }
    return InkWell(
      onTap: () => onTileTap(context),
      child: Container(
        width: context.widthOfScreen -
            leftRightPadding -
            (isFromHome ? paddingForHome : 0),
        padding: EdgeInsets.symmetric(
          horizontal: context.k_16,
          vertical: context.k_18,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: context.adColors.dividerColor),
          borderRadius: BorderRadius.all(Radius.circular(context.k_8)),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${flights[index].type} ${FlightUtils.getConvertedDateStringForSaved(
                      flights[index].scheduledDate,
                    )}',
                    style: ADTextStyle400.size14,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: context.k_6),
                      clipBehavior: Clip.hardEdge,
                      width: context.k_24,
                      height: context.k_24,
                      decoration: BoxDecoration(
                        color: airlineInfo?.icon == null
                            ? context.adColors.paleGrey
                            : null,
                        borderRadius: BorderRadius.all(
                          Radius.circular(context.k_6),
                        ),
                      ),
                      child: airlineInfo?.icon != null
                          ? Image.network(
                              airlineInfo?.icon ?? '',
                            )
                          : SvgPicture.asset(
                              'lib/assets/images/svg/icons/flight/Flight.svg',
                              color: context.adColors.darkGreyTextColor,
                            ).paddingAllSide(context.k_4),
                    ),
                    Text(flights[index].flightNo),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: context.k_18,
            ),
            Divider(
              height: 1,
              color: context.adColors.lightGreyGridSeparatorColor,
            ),
            SizedBox(
              height: context.k_16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    context
                            .read<SiteCoreStateManagement>()
                            .airportCityMap[flights[index].origin?.code]
                            ?.cityName ??
                        '',
                    style: ADTextStyle400.size16,
                  ),
                ),
                Flexible(
                  child: Text(
                    context
                            .read<SiteCoreStateManagement>()
                            .airportCityMap[flights[index].destination?.code]
                            ?.cityName ??
                        '',
                    style: ADTextStyle400.size16,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: context.k_8,
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        flights[index].origin?.code ?? '',
                        style: ADTextStyle600.size24,
                      ),
                      SizedBox(
                        width: context.k_10,
                      ),
                      if (flights[index].type == 'Departure')
                        Container(
                          alignment: Alignment.center,
                          width: context.k_28,
                          height: context.k_28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(context.k_4),
                            ),
                            color: const Color(0xffffcf09),
                          ),
                          child: Text(
                            flights[index].terminal,
                            style: ADTextStyle600.size12,
                          ),
                        ),
                    ],
                  ),
                ),
                const FlightDashedIconWidget(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        flights[index].destination?.code ?? '',
                        style: ADTextStyle600.size24,
                      ),
                      if (flights[index].type == 'Arrival')
                        Row(
                          children: [
                            SizedBox(
                              width: context.k_10,
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: context.k_28,
                              height: context.k_28,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(context.k_4),
                                ),
                                color: const Color(0xffffcf09),
                              ),
                              child: Text(
                                flights[index].terminal,
                                style: ADTextStyle600.size12,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: context.k_16,
            ),
            Divider(
              height: 1,
              color: context.adColors.lightGreyGridSeparatorColor,
            ),
            SizedBox(
              height: context.k_16,
            ),
            Row(
              children: [
                Text(
                  flights[index].scheduledTime,
                  style: ADTextStyle500.size14,
                ),
                SizedBox(
                  width: context.k_10,
                ),
                Text(
                  flights[index].remarkes.isNotEmpty
                      ? flights[index].remarkes
                      : flights[index].status.isNotEmpty
                          ? flights[index].status
                          : '',
                  style: ADTextStyle500.size14.setTextColor(statusColor),
                ),
                const Spacer(),
                InkWell(
                  onTap: () => moveToSavedDetails(context),
                  child: Text(
                    'Details',
                    style: ADTextStyle400.size14
                        .copyWith(decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void moveToSavedDetails(BuildContext context) {
    final DateTime date =
        DateFormat(Constant.dateFormat5).parse(flights[index].scheduledDate);
    final flightType = flights[index].type == 'Arrival'
        ? FlightType.arrival
        : FlightType.departure;
    final segment = FlightStatusSegment(
      cardId: flights[index].cardId,
      airlinecode: flights[index].airlineCode,
      flightnumber: flights[index].flightNo,
      scheduledate: flights[index].scheduledDate,
      scheduletime: flights[index].scheduledTime,
      iataroute: flightType == FlightType.arrival
          ? flights[index].origin?.name ?? ''
          : flights[index].destination?.name ?? '',
      iataroutecode: flightType == FlightType.arrival
          ? flights[index].origin?.code ?? ''
          : flights[index].destination?.code ?? '',
      iatalocalairport: flightType == FlightType.arrival
          ? flights[index].destination?.name ?? ''
          : flights[index].origin?.name ?? '',
      iatalocalairportcode: flightType == FlightType.arrival
          ? flights[index].destination?.code ?? ''
          : flights[index].origin?.code ?? '',
      terminal: flights[index].terminal,
      status: flights[index].status,
      flightkind: flights[index].type,
    );
    final FlightStatusStorageModel flightStatusStorageModel =
        FlightStatusStorageModel(
      date: date,
      flightType: flightType,
      lastUpdatedTime: DateTime.now(),
      cityCode: flightType == FlightType.arrival
          ? flights[index].destination?.code ?? ''
          : flights[index].origin?.code ?? '',
    );
    navigateToScreenUsingNamedRouteWithArguments(
      context,
      flightStatusDetailScreen,
      argumentObject: FlightStatusDetailModel(
        /// call back variable used for updating list of saved flight
        refreshTap: (value) => updateTap?.call(value),
        flightStatusStorageModel: flightStatusStorageModel,
        flightNumber: flights[index].flightNo,
        selectedFlightStatusSegment: segment,
        isNeedToUpdate: true,
      ),
    );
  }
}

class FlightDashedIconWidget extends StatelessWidget {
  const FlightDashedIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ADSizedBox(
          width: context.k_18,
          child: DashedLineView(
            color: context.adColors.circleGreyTextColor,
            dashWidth: context.k_4,
          ),
        ),
        ADSizedBox(
          width: context.k_24,
          height: context.k_24,
          child: SvgPicture.asset(
            'lib/assets/images/svg/icons/flight/Flight.svg',
            color: context.adColors.darkGreyTextColor,
          ),
        ).paddingBySide(left: context.k_6, right: context.k_4),
        ADSizedBox(
          width: context.k_18,
          child: DashedLineView(
            color: context.adColors.circleGreyTextColor,
            dashWidth: context.k_4,
          ),
        ),
      ],
    );
  }
}
