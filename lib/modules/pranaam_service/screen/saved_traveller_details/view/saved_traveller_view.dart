/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/screen/saved_traveller_details/saved_traveller_detail_screen.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';

class SavedTravellerView extends StatelessWidget {
  final String text;
  final bool isChecked;
  final ADGenericCallback onCheckedChange;

  const SavedTravellerView({
    Key? key,
    required this.text,
    required this.isChecked,
    required this.onCheckedChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    return Column(
      children: [
        CheckboxListTile(
          activeColor: context.adColors.blackTextColor,
          contentPadding: EdgeInsets.zero,
          //    <-- label
          value: isChecked,
          onChanged: (newValue) => onCheckedValueChanged(
            SavedTraveller(travellerName: text, isSelected: newValue ?? false),
          ),
          title: Text(
            text,
            style: isChecked
                ? ADTextStyle500.size16.setTextColor(
                    context.adColors.blackTextColor,
                  )
                : ADTextStyle400.size16.setTextColor(
                    context.adColors.blackTextColor,
                  ),
          ),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        Divider(
          height: context.k_20,
          color: context.adColors.dividerColor,
        ),
      ],
    );
  }

  void onCheckedValueChanged(newValue) {
    onCheckedChange(newValue);
  }
}

String getTravellerName(int index) {
  SavedTraveller savedTravellerList;
  savedTravellerList = savedTravellersList[index];
  return savedTravellerList.travellerName;
}

bool isChecked(int index) {
  SavedTraveller savedTravellerList;
  savedTravellerList = savedTravellersList[index];
  return savedTravellerList.isSelected;
}

class SavedTraveller {
  final String travellerName;

  SavedTraveller({required this.travellerName, required this.isSelected});

  final bool isSelected;
}
