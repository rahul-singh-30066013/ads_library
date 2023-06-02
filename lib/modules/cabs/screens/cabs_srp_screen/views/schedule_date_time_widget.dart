/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/models/helping_models/selected_date_model.dart';
import 'package:adani_airport_mobile/modules/cabs/screens/cabs_srp_screen/views/cab_listing_bottom_widget.dart';
import 'package:adani_airport_mobile/modules/cabs/utilities/constants/cab_constants.dart';
import 'package:adani_airport_mobile/utils/force_upgrade/app_constant_remote.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class ScheduleDateTimeWidget extends StatelessWidget {
  ScheduleDateTimeWidget({
    Key? key,
    required this.initialDateTime,
  }) : super(key: key);
  final DateTime? initialDateTime;
  final ValueNotifier<String> selectedDateString = ValueNotifier('');
  final double datePickerHeight = 200.sp;
  final double buttonWidth = 343.sp;
  final double buttonWidthWithoutResets = 196.sp;
  final double padding_128 = 128.sp;
  final double thicknessHeight = 1;
  final double radiusCircle = 27;

  @override
  Widget build(BuildContext context) {
    DateTime? selectedDateTime;
    final DateTime minimumDate = DateTime.now().add(
      Duration(
        minutes: (AppConstantRemote()
                    .appConstantRemoteModel
                    ?.scheduleMinimumTimeMinutes ??
                CabConstants.scheduleMinimumTimeMinutes)
            .toInt(),
      ),
    );
    final DateTime lastDate = DateTime.now().add(
      Duration(
        minutes: (AppConstantRemote()
                    .appConstantRemoteModel
                    ?.scheduleMaximumTimeMinutes ??
                CabConstants.scheduleMaximumTimeMinutes)
            .toInt(),
      ),
    );
    selectedDateTime =
        (initialDateTime?.difference(minimumDate).isNegative ?? true)
            ? minimumDate
            : initialDateTime;
    selectedDateString.value = displayDateAndTime(
      selectedDateTime ?? minimumDate,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            ValueListenableBuilder(
              valueListenable: selectedDateString,
              builder: (context, String value, child) {
                return Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    value,
                    style: ADTextStyle400.size14
                        .setTextColor(context.adColors.blackTextColor),
                  ),
                );
              },
            ),
          ],
        ).paddingBySide(
          top: context.k_10,
          left: context.k_16,
          right: context.k_16,
        ),
        SizedBox(
          height: datePickerHeight,
          child: CupertinoDatePicker(
            onDateTimeChanged: (value) => {
              selectedDateTime = value,
              selectedDateString.value = displayDateAndTime(value),
            },
            minimumDate: DateTime(
              minimumDate.year,
              minimumDate.month,
              minimumDate.day,
              minimumDate.hour,
              minimumDate.minute,
            ),
            initialDateTime:
                (initialDateTime?.difference(minimumDate).isNegative ?? true)
                    ? DateTime(
                        minimumDate.year,
                        minimumDate.month,
                        minimumDate.day,
                        minimumDate.hour,
                        minimumDate.minute,
                      )
                    : initialDateTime,
            maximumDate: DateTime(
              lastDate.year,
              lastDate.month,
              lastDate.day,
              lastDate.hour,
              lastDate.minute,
              lastDate.second,
            ),
          ),
        ),
        Divider(
          color: context.adColors.lightGreyGridSeparatorColor,
          thickness: thicknessHeight,
        ),
        SizedBox(
          height: context.k_12,
        ),
        SizedBox(
          height: context.k_48,
          width: context.widthOfScreen,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: initialDateTime != null,
                child: Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.adColors.whiteTextColor,
                      shape: StadiumBorder(
                        side: BorderSide(
                          color: context.adColors.blackTextColor,
                          width: 1.sp,
                        ),
                      ),
                    ),
                    onPressed: () => {
                      navigatorPopScreenWithData(
                        context,
                        const SelectedDateModel(
                          isNeedToUpdate: true,
                          selectedDate: null,
                        ),
                      ),
                    },
                    child: Center(
                      child: Text(
                        'reset_to_now'.localize(context),
                        maxLines: 1,
                        style: ADTextStyle500.size16
                            .setTextColor(context.adColors.blackTextColor),
                      ),
                    ),
                  ).paddingBySide(right: context.k_10),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => {
                    navigatorPopScreenWithData(
                      context,
                      SelectedDateModel(
                        isNeedToUpdate: true,
                        selectedDate: (selectedDateTime
                                    ?.difference(minimumDate)
                                    .isNegative ??
                                true)
                            ? minimumDate
                            : selectedDateTime as DateTime,
                      ),
                    ),
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.adColors.blackTextColor,
                    shape: const StadiumBorder(),
                  ),
                  child: Center(
                    child: Text(
                      'confirm'.localize(context),
                      style: ADTextStyle700.size16.setTextColor(
                        context.adColors.whiteTextColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ).paddingBySide(left: context.k_16, right: context.k_16),
        ),
      ],
    );
  }
}
