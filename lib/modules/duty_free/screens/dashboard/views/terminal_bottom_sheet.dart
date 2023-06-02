/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/terminal_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/views/duty_free_remove_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

class TerminalBottomSheet extends StatelessWidget {
  final ADGenericCallback onBottomSheetItemSelect;
  final String bottomSheetHeader;
  final List<TerminalModel> bottomSheetList;
  final TerminalModel? selectedItem;

  /// This is used to draw bottom sheet having cross icon.
  ///
  /// GenericBottomSheet(
  ///                       onBottomSheetItemSelect: (value) =>
  ///                       onBottomSheetSelect(controller, value),
  ///                       bottomSheetHeader: 'bottomSheetHeader',
  ///                       bottomSheetList: bottomSheetCountryList,
  ///                     )
  const TerminalBottomSheet({
    Key? key,
    required this.onBottomSheetItemSelect,
    required this.bottomSheetHeader,
    required this.bottomSheetList,
    this.selectedItem,
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
          return BottomSheetListItem(
            onBottomSheetItemSelect: onBottomSheetItemSelect,
            text: bottomSheetList[index],
            selectedItem: selectedItem,
          );
        },
      ),
    );
  }
}

class BottomSheetListItem extends StatelessWidget {
  const BottomSheetListItem({
    Key? key,
    required this.onBottomSheetItemSelect,
    required this.text,
    this.selectedItem,
  }) : super(key: key);

  final ADGenericCallback onBottomSheetItemSelect;
  final TerminalModel text;
  final TerminalModel? selectedItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => checkAndDisplayClearCartDialog(context),
      child: Container(
        color: text == selectedItem
            ? context.adColors.lightBlue
            : context.adColors.transparentColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text.title,
              style: ADTextStyle400.size16,
            ),
            Visibility(
              visible: text == selectedItem,
              child: Icon(
                Icons.check,
                color: context.adColors.filterBlackText,
              ),
            ),
          ],
        ).paddingBySide(
          left: context.k_20,
          right: context.k_20,
          top: context.k_10,
          bottom: context.k_10,
        ),
      ),
    );
  }

  void checkAndDisplayClearCartDialog(BuildContext context) {
    final DutyFreeState dutyFreeState = context.read<DutyFreeState>();
    if (text == selectedItem) {
      Navigator.of(context).pop();
    } else {
      if (context.read<AppSessionState>().cartType != CartType.noDataInCart &&
          dutyFreeState.dutyFreeCartResponse?.airportCode ==
              selectedAirportsData?.airportCode &&
          text.code !=
              dutyFreeState.dutyFreeCartResponse?.itemDetails.first.storeType
                  .toLowerCase()) {
        clearDutyFreeCartDialog(context);
      } else {
        onBottomSheetItemSelect(text);
        Navigator.of(context).pop();
      }
    }
  }

  void selectItem(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
    onBottomSheetItemSelect(text);
  }

  void clearDutyFreeCartDialog(BuildContext context) {
    final bottomSheet = showModalBottomSheet(
      useRootNavigator: true,
      backgroundColor: context.adColors.whiteTextColor,
      elevation: context.k_8,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(context.k_22),
        ),
      ),
      context: context,
      builder: (dialogContext) {
        return DutyFreeRemoveItem(
          detailString: 'remove_cart_text_terminal_duty_free'.localize(context),
          titleString: 'cart_confirmation'.localize(context),
          yesCallBack: () => selectItem(context),
          noCallBack: () => navigatorPopScreen(dialogContext),
          cancelText: 'yes_i_am'.localize(context),
          confirmText: 'No_i_will_stay'.localize(context),
        );
      },
    );
    adLog(bottomSheet.toString());
  }
}
