/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/cabs/models/google_places_models/destination_search_address_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/airport_terminal_detail_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/navigate_parameters_model.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/selected_date_model.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_home_screen/views/cab_booking_builder/cab_source_container_widget.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cab_booking_home_screen/views/cab_booking_builder/radio_widget.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cabs_srp_screen/views/schedule_date_time_widget.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/cab_booking_state.dart';
import 'package:adani_airport_mobile/modules/cabs/utilities/constants/cab_constants.dart';
import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/force_upgrade/app_constant_remote.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class OriginChangeWidget extends StatefulWidget {
  final CabBookingState cabBookingState;
  final DutyFreeDashboardItem dashBoardItem;
  final ADTapCallback searchTap;
  final ADGenericCallback<NavigateParametersModel> navigatorTap;

  const OriginChangeWidget({
    Key? key,
    required this.dashBoardItem,
    required this.cabBookingState,
    required this.searchTap,
    required this.navigatorTap,
  }) : super(key: key);

  @override
  State<OriginChangeWidget> createState() => _OriginChangeWidgetState();
}

class _OriginChangeWidgetState extends State<OriginChangeWidget>
    with TickerProviderStateMixin {
  final double heightArrowIconContainer = 42.sp;
  final int containerBorderColors = 0xffd9d9d9;
  final int nowButtonColors = 0xffeeeeee;
  final double buttonHeight = 52.sp;
  bool swapActionAnimator = false;
  AnimationController? controller;
  final double rotation_0 = 0;
  final double rotation_5 = 0.5;
  final duration = 3000;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double timeButtonWidth = 125.sp;
    return Selector<CabBookingState, bool>(
      selector: (context, cabBookingState) => cabBookingState.isFromAirport,
      builder: (context, isFromAirport, child) {
        return Column(
          children: [
            Visibility(
              visible: !(AppConstantRemote()
                      .appConstantRemoteModel
                      ?.isOneWayEnable ??
                  CabConstants.isOneWayEnable),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: context.k_14,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: context.k_64 + context.k_64 + context.k_10,
                        child: Center(
                          child: RadioWidget(
                            onTapHandler: (value) => updateIsFromAirport(
                              updatedIsFromAirportValue: value,
                            ),
                            isFromAirport: isFromAirport,
                            isFromSource: true,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.k_64 + context.k_64 + context.k_10,
                        child: Center(
                          child: RadioWidget(
                            onTapHandler: (value) => updateIsFromAirport(
                              updatedIsFromAirportValue: value,
                            ),
                            isFromAirport: isFromAirport,
                            isFromSource: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Selector<CabBookingState, SearchAddressModel?>(
                  selector: (context, viewHolder) =>
                      viewHolder.selectedAddressDetailModel,
                  builder: (context, selectedDestinations, child) {
                    return Selector<CabBookingState,
                        AirportTerminalDetailModel?>(
                      selector: (context, viewHolder) =>
                          viewHolder.selectedAirportTerminalDetailModel,
                      builder: (context, selectedAirportDetail, child) {
                        return Column(
                          children: [
                            CabSourceContainerWidget(
                              selectedAirportDetail: selectedAirportDetail,
                              selectedAddressDetail: selectedDestinations,
                              isFromAirport: isFromAirport,
                              isFromSource: isFromAirport ? true : false,
                              onTap: (value) => widget.navigatorTap(
                                NavigateParametersModel(
                                  isFromAirport: isFromAirport,
                                  isAirportLocationTap: value ? true : false,
                                ),
                              ),
                            ),
                            CabSourceContainerWidget(
                              selectedAirportDetail: selectedAirportDetail,
                              selectedAddressDetail: selectedDestinations,
                              isFromSource: isFromAirport ? false : true,
                              isFromAirport: isFromAirport,
                              onTap: (value) => widget.navigatorTap(
                                NavigateParametersModel(
                                  isFromAirport: isFromAirport,
                                  isAirportLocationTap: value ? true : false,
                                ),
                              ),
                            ).paddingBySide(
                              top: context.k_16,
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                Visibility(
                  visible: !(AppConstantRemote()
                          .appConstantRemoteModel
                          ?.isOneWayEnable ??
                      CabConstants.isOneWayEnable),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(containerBorderColors),
                      ),
                      borderRadius: BorderRadius.circular(
                        context.k_26,
                      ),
                      color: Colors.white,
                    ),
                    width: heightArrowIconContainer,
                    height: heightArrowIconContainer,
                    child: Material(
                      borderRadius:
                          BorderRadius.all(Radius.circular(context.k_30)),
                      child: InkWell(
                        borderRadius:
                            BorderRadius.all(Radius.circular(context.k_30)),
                        onTap: () => {
                          _arrowRotationTap(),
                          context.read<CabBookingState>().updateSelections(
                                isFromAirport ? false : true,
                              ),
                        },
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: RotationTransition(
                            turns: Tween(begin: rotation_0, end: rotation_5)
                                .animate(
                              controller ??
                                  AnimationController(
                                    vsync: this,
                                  ),
                            ),
                            child: SvgPicture.asset(
                              SvgAssets.arrowIcon,
                              width: context.k_16,
                              height: context.k_16,
                              color: context.adColors.blackTextColor,
                            ).paddingAllSide(context.k_10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    height: buttonHeight,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          const StadiumBorder(),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          context.adColors.blueColor,
                        ),
                      ),
                      onPressed: widget.searchTap,
                      child: Text(
                        'search_cabs'.localize(context),
                        style: ADTextStyle700.size16
                            .setTextColor(context.adColors.whiteTextColor),
                      ),
                    ).paddingBySide(right: context.k_10),
                  ),
                ),
                TouchableOpacity(
                  onTap: () => _pickDateAndTime(context),
                  child: Selector<CabBookingState, DateTime?>(
                    selector: (context, viewHolder) => viewHolder.selectedDate,
                    builder: (context, value, child) {
                      return Container(
                        width: timeButtonWidth,
                        height: buttonHeight,
                        decoration: BoxDecoration(
                          color: Color(nowButtonColors),
                          border: Border.all(
                            color: Color(nowButtonColors),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              context.k_32,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (value == null)
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      SvgAssets.timeIcon,
                                      width: context.k_18,
                                      height: context.k_18,
                                      color: context.adColors.blackTextColor,
                                    ).paddingBySide(right: context.k_6),
                                    Text(
                                      'text_now'.localize(context),
                                      style: ADTextStyle500.size16.setTextColor(
                                        context.adColors.blackTextColor,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )
                              else
                                Text(
                                  displayDateAndTime(
                                    value,
                                    isLineChangeNeed: true,
                                  ),
                                  style: ADTextStyle500.size14,
                                  textAlign: TextAlign.center,
                                ),
                              ADSizedBox(
                                width: context.k_8,
                              ),
                              RotatedBox(
                                quarterTurns: 1,
                                child: SvgPicture.asset(
                                  SvgAssets.arrowRight,
                                  width: context.k_12,
                                  height: context.k_12,
                                  color: context.adColors.blackTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ).paddingBySide(
              top: context.k_24,
            ),
          ],
        ).paddingBySide(
          left: widget.dashBoardItem.itemMargin?.left.sp ?? 0,
          right: widget.dashBoardItem.itemMargin?.right.sp ?? 0,
          top: widget.dashBoardItem.itemMargin?.top.sp ?? 0,
          bottom: widget.dashBoardItem.itemMargin?.bottom.sp ?? 0,
        );
      },
    );
  }

  void _arrowRotationTap() {
    swapActionAnimator = !swapActionAnimator;
    swapActionAnimator
        ? controller?.forward(from: 0)
        : controller?.reverse(from: 1);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _pickDateAndTime(BuildContext context) {
    adShowBottomSheetWithData(
      context: context,
      childWidget: ScheduleDateTimeWidget(
        initialDateTime: widget.cabBookingState.selectedDate,
      ),
      headerTitle: 'schedule_ride'.localize(context),
      isPaddingRequired: false,
    ).then((selectedDate) {
      if (selectedDate != null) {
        final selectedDateModel = selectedDate as SelectedDateModel;
        if (selectedDateModel.isNeedToUpdate ?? false) {
          widget.cabBookingState
              .updateScheduleTime(selectedDateModel.selectedDate);
        }
      }
    });
  }

  void updateIsFromAirport({
    required bool updatedIsFromAirportValue,
  }) {
    if (context.read<CabBookingState>().isFromAirport !=
        updatedIsFromAirportValue) {
      _arrowRotationTap();
      context
          .read<CabBookingState>()
          .updateSelections(updatedIsFromAirportValue);
    }
  }

  String displayDateAndTime(
    DateTime selectedDate, {
    bool isLineChangeNeed = false,
  }) {
    final selectedDateTime = DateFormat('hh:mm')
        .parse('${selectedDate.hour}:${selectedDate.minute}');
    final date = isLineChangeNeed
        ? DateFormat('d MMM').format(selectedDate)
        : DateFormat('EEE d MMM').format(selectedDate);
    final time = DateFormat('hh:mm a').format(selectedDateTime);
    return (isLineChangeNeed ? '$date\n$time' : '$date $time')
        .replaceAll('AM', 'am')
        .replaceAll('PM', 'pm');
  }
}
