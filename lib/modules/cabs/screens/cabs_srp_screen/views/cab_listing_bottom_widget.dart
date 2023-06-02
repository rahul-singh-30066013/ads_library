/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */
import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/cabs/models/helping_models/selected_date_model.dart';
import 'package:adani_airport_mobile/modules/cabs/repository/cab_googleanalytics.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cabs_srp_screen/views/schedule_date_time_widget.dart';
import 'package:adani_airport_mobile/modules/cabs/state_management/cabs_srp_state.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class CabListingBottomWidget extends StatelessWidget {
  CabListingBottomWidget({
    Key? key,
    required this.cabSrpState,
  }) : super(key: key);
  final CabsSrpState cabSrpState;
  final double buttonHeight = 50.sp;

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = context.widthOfScreen * 0.58;
    final double timeButtonWidth = context.widthOfScreen * 0.312;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(height: 1, thickness: 1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Selector<CabsSrpState, bool>(
              selector: (context, cabSrpState) => cabSrpState.isShowCabs,
              builder: (context, isShowCabs, Widget? child) {
                return AbsorbPointer(
                  absorbing: cabSrpState.cabItineraries.isEmpty || !isShowCabs,
                  child: ADSizedBox(
                    width: buttonWidth,
                    height: buttonHeight,
                    child: ElevatedButton(
                      onPressed: () => cabSrpState.createCart(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: cabSrpState.cabItineraries.isEmpty ||
                                !isShowCabs ||
                                cabSrpState.cabListingState.viewStatus ==
                                    Status.loading
                            ? context.adColors.greyReviewShade
                            : context.adColors.blueColor,
                        shape: const StadiumBorder(),
                      ),
                      child: cabSrpState.createBooking
                          ? ADDotProgressView(
                              color: context.adColors.whiteTextColor,
                              size: context.k_6,
                            )
                          : Text(
                              'book'.localize(context),
                              style: ADTextStyle700.size16.setTextColor(
                                context.adColors.whiteTextColor,
                              ),
                            ),
                    ),
                  ),
                );
              },
            ),
            Selector<CabsSrpState, DateTime?>(
              selector: (context, cabSrpState) => cabSrpState.selectedDate,
              builder: (context, selectedDate, Widget? child) {
                return InkWell(
                  splashColor: context.adColors.transparentColor,
                  borderRadius: BorderRadius.all(Radius.circular(context.k_26)),
                  onTap: () => {
                    _pickDateAndTime(context),
                  },
                  child: Container(
                    width: timeButtonWidth,
                    height: buttonHeight,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.adColors.blackTextColor,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          context.k_26,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (selectedDate == null)
                          SvgPicture.asset(
                            SvgAssets.timeIcon,
                            width: context.k_18,
                            height: context.k_18,
                            color: context.adColors.blackTextColor,
                          ).paddingBySide(right: context.k_6),
                        Text(
                          selectedDate == null
                              ? 'text_now'.localize(context)
                              : displayDateAndTime(
                                  selectedDate,
                                  isLineChangeNeed: true,
                                ),
                          style: (selectedDate == null
                                  ? ADTextStyle500.size16
                                  : ADTextStyle500.size14)
                              .setTextColor(context.adColors.blackTextColor),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ).paddingBySide(
          top: context.k_12,
          bottom: context.k_12,
          left: context.k_16,
          right: context.k_16,
        ),
      ],
    );
  }

  void _pickDateAndTime(BuildContext context) {
    if (cabSrpState.selectedDate == null) {
      CabGoogleAnalytics().sendGAParametersScheduleBookInitiated(cabSrpState);
    }
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
          selectedDateModel.selectedDate == null
              ? CabGoogleAnalytics().sendGAParametersResetSchedule(cabSrpState)
              : CabGoogleAnalytics()
                  .sendGAParametersCabBookingScheduleSelect(cabSrpState);
        }
      }
    });
  }
}

String displayDateAndTime(
  DateTime selectedDate, {
  bool isLineChangeNeed = false,
}) {
  final selectedDateTime =
      DateFormat('hh:mm').parse('${selectedDate.hour}:${selectedDate.minute}');
  final date = isLineChangeNeed
      ? DateFormat('d MMM').format(selectedDate)
      : DateFormat('EEE d MMM').format(selectedDate);
  final time = DateFormat('hh:mm a').format(selectedDateTime);
  return (isLineChangeNeed ? '$date\n$time' : '$date $time')
      .replaceAll('AM', 'am')
      .replaceAll('PM', 'pm');
}
