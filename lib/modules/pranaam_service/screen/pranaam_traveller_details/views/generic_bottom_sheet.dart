/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/review_screen_type.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class GenericBottomSheet extends StatelessWidget {
  final ADGenericCallback onBottomSheetItemSelect;
  final String bottomSheetHeader;
  final List<BottomSheetRowModel> bottomSheetList;
  final String? selectedItem;
  final GenericBottomSheetScreenType? screenType;
  final bool localizeText;

  /// This is used to draw bottom sheet having cross icon.
  ///
  /// GenericBottomSheet(
  ///                       onBottomSheetItemSelect: (value) =>
  ///                       onBottomSheetSelect(controller, value),
  ///                       bottomSheetHeader: 'bottomSheetHeader',
  ///                       bottomSheetList: bottomSheetCountryList,
  ///                       screenType: GenericBottomSheetScreenType.flightTraveller,
  ///                     )
  const GenericBottomSheet({
    Key? key,
    required this.onBottomSheetItemSelect,
    required this.bottomSheetHeader,
    required this.bottomSheetList,
    this.selectedItem,
    this.screenType = GenericBottomSheetScreenType.pranaamService,
    this.localizeText = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: bottomSheetList.length,
        itemBuilder: (context, index) {
          return screenType == GenericBottomSheetScreenType.flightTraveller
              ? FlightBottomSheetListItem(
                  onBottomSheetItemSelect: onBottomSheetItemSelect,
                  text: bottomSheetList[index].text,
                  selectedItem: selectedItem,
                  localizeText: localizeText,
                )
              : BottomSheetListItem(
                  onBottomSheetItemSelect: onBottomSheetItemSelect,
                  text: bottomSheetList[index].text,
                  selectedItem: selectedItem,
                  cityName: bottomSheetList[index].cityName,
                );
        },
      ),
    );
  }
}

//this class will used to show list item  in bottom sheet from  other than flight module(if not localised and prefix without dot
class BottomSheetListItem extends StatelessWidget {
  const BottomSheetListItem({
    Key? key,
    required this.onBottomSheetItemSelect,
    required this.text,
    this.selectedItem,
    this.cityName,
  }) : super(key: key);

  final ADGenericCallback onBottomSheetItemSelect;
  final String text;
  final String? selectedItem;
  final String? cityName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onBottomSheetItemSelect(text),
      child: Container(
        color: text == selectedItem ? context.adColors.lightBlue : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cityName ?? '',
                    style: ADTextStyle700.size16,
                  ),
                  SizedBox(
                    height: context.k_6,
                  ),
                  Text(
                    text,
                    style: ADTextStyle400.size16,
                  ),
                ],
              ),
            ),
            Divider(
              height: context.k_2,
              color: context.adColors.greyTextColor,
            ),
            Visibility(
              visible: text == selectedItem,
              child: SvgPicture.asset(SvgAssets.refundableCheck),
            ),
          ],
        ).paddingBySide(
          left: context.k_20,
          right: context.k_20,
          top: context.k_10,
          bottom: context.k_10,
        ),
      ).paddingBySide(
        bottom: context.k_10,
      ),
    );
  }
}

//this class will used to show list item  in bottom sheet from  flight traveller screen
class FlightBottomSheetListItem extends StatelessWidget {
  const FlightBottomSheetListItem({
    Key? key,
    required this.onBottomSheetItemSelect,
    required this.text,
    required this.localizeText,
    this.selectedItem,
  }) : super(key: key);

  final ADGenericCallback onBottomSheetItemSelect;
  final String text;
  final String? selectedItem;
  final bool localizeText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onBottomSheetItemSelect(text),
      child: Container(
        color: text == selectedItem ? context.adColors.lightBlue : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              localizeText ? text.localize(context) : text,
              style: text == selectedItem
                  ? ADTextStyle700.size16
                  : ADTextStyle400.size16,
            ),
            Visibility(
              visible: text == selectedItem,
              child: SvgPicture.asset(SvgAssets.refundableCheck),
            ),
          ],
        ).paddingBySide(
          left: context.k_16,
          right: context.k_16,
          top: context.k_14,
          bottom: context.k_14,
        ),
      ),
    );
  }
}

class BottomSheetRowModel {
  final String text;
  final String code;
  final String cityName;

  BottomSheetRowModel({required this.text, this.code = '', this.cityName = ''});
}
