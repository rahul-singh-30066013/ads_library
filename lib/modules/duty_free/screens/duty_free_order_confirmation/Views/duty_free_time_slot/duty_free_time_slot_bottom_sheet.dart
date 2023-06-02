/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/country_list_bottom_sheet/search_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/views/no_data_found_error_screen.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class DutyFreeTimeSlotBottomSheet extends StatefulWidget {
  const DutyFreeTimeSlotBottomSheet({
    Key? key,
    required this.startTime,
    required this.gap,
    required this.selectedTime,
    required this.onTap,
  }) : super(key: key);
  final DateTime startTime;
  final String selectedTime;
  final int gap;
  final void Function(String displayTime) onTap;

  @override
  State<DutyFreeTimeSlotBottomSheet> createState() =>
      _DutyFreeTimeSlotBottomSheetState();
}

class _DutyFreeTimeSlotBottomSheetState
    extends State<DutyFreeTimeSlotBottomSheet> {
  final Color selectedColor = const Color(0xffeef4fb);
  final double textFontSize = 15.sp;
  final double textLetterSpacing = -0.3;

  ValueNotifier<List<String>> filterTimeSlots = ValueNotifier(
    List.empty(growable: true),
  );

  void searchTime(String value, List<String> timeSlots) {
    filterTimeSlots.value = value.isEmpty
        ? timeSlots
        : timeSlots.where((element) => element.contains(value)).toList();
  }

  void clearAndRefresh(List<String> timeSlots) {
    filterTimeSlots.value = timeSlots;
    searchTextController.clear();
  }

  void onTapAction(String sectedTime, BuildContext context) {
    widget.onTap(sectedTime);
    navigatorPopScreen(context);
  }

  @override
  Widget build(BuildContext context) {
    const int noOfGrid = 2;
    // final times = getTimes(startTime, endTime, step)
    //     .map((tod) => tod.toString())
    //     .toList();
    // print(times);
    // main()
    final List<String> timeSlots = main(widget.startTime);
    filterTimeSlots.value = timeSlots;

    return Column(
      children: [
        SearchView(
          hintText: 'search'.localize(context),
          inputFormatter: [
            FilteringTextInputFormatter.allow(RegExp('[0-9:]+')),
          ],
          onChanged: (value) => searchTime(value, timeSlots),
          onFieldSubmitted: (value) => adLog('fff'),
          onIconButtonPressed: () => clearAndRefresh(timeSlots),
          textInputType: TextInputType.datetime,
        ).paddingBySide(
          top: context.k_10,
          bottom: context.k_20,
          left: context.k_8,
          right: context.k_8,
        ),
        ValueListenableBuilder(
          valueListenable: filterTimeSlots,
          child: Container(),
          builder: (context, List<String> slots, child) => slots.isEmpty
              ? NoDataFoundErrorScreen(
                  paddingBetweenImageAndErrorTitle: context.k_20,
                  paddingBetweenErrorMessageAndRetry: context.k_30,
                  errorTitle: 'no_data_available'.localize(context),
                  // onRetryTap: () => clearAndRefresh(timeSlots),
                )
              : Expanded(
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: noOfGrid,
                      mainAxisExtent: context.k_64,
                    ),
                    itemCount: slots.length,
                    itemBuilder: (context, index) {
                      final convertedTime =
                          Utils.convertTimeToAmPm(slots[index]); // final time =
                      //     '${DateFormat.Hm().format(slots[index])} - ${DateFormat.Hm().format(slots[index].add(step))}';
                      final bool selectedIndex =
                          slots[index] == widget.selectedTime;

                      return OutlinedButton(
                        onPressed: () => onTapAction(slots[index], context),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.zero,
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            selectedIndex
                                ? selectedColor
                                : context.adColors.whiteTextColor,
                          ),
                          side: MaterialStateProperty.all(
                            BorderSide(
                              color: selectedIndex
                                  ? selectedColor
                                  : context.adColors.greyReviewShade,
                            ),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(context.k_6),
                            ),
                          ),
                        ),
                        child: Text(
                          convertedTime,
                          style: selectedIndex
                              ? ADTextStyle600.size14
                                  .setTextColor(context.adColors.blackTextColor)
                                  .copyWith(fontSize: textFontSize)
                              : ADTextStyle400.size14
                                  .setTextColor(
                                    context.adColors.blackTextColor,
                                  )
                                  .copyWith(
                                    fontSize: textFontSize,
                                    letterSpacing: textLetterSpacing,
                                  ),
                        ),
                      ).paddingAllSide(context.k_8);
                    },
                  ),
                ),
        ),
      ],
    );
  }

  // Iterable<TimeOfDay> getTimes(
  List<String> main(DateTime time) {
    // final DateTime now = DateTime.now();
    //  int gap = widget.gap ;
    const min60 = 60;
    int minute = time.minute;
    // minute = 0;
    int hour = time.hour;
    final anHourLessGap = min60 - widget.gap;

    for (var min = 0; min < min60; min += widget.gap) {
      if (minute <= min) {
        minute = min;
        break;
      } else if (minute > anHourLessGap) {
        hour += 1;
        minute = 0;
        break;
      }
    }

    DateTime startTime =
        DateTime(time.year, time.month, time.day, hour, minute);
    final DateTime endTime =
        DateTime(time.year, time.month, time.day, 23, 60 - widget.gap);
    final Duration step = Duration(minutes: widget.gap);
    final List<String> timeSlots = [
      '${DateFormat.Hm().format(startTime)} - ${DateFormat.Hm().format(startTime.add(step))}',
    ];

    while (startTime.isBefore(endTime)) {
      final DateTime timeIncrement = startTime.add(step);
      final stringTime =
          '${DateFormat.Hm().format(timeIncrement)} - ${DateFormat.Hm().format(timeIncrement.add(step))}';

      timeSlots.add(stringTime);
      startTime = timeIncrement;
    }
    return timeSlots;
  }
}
// '${DateFormat.Hm().format(timeIncrement)} - ${DateFormat.Hm().format(timeIncrement.add(step))}',
