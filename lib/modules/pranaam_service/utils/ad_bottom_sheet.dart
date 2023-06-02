/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:ui';

import 'package:adani_airport_mobile/modules/flight_booking/models/response/flight_search/display_model/filters/filter_sort_model.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_bottom_sheet_drag_bar.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_draggable_sheet_header.dart';
import 'package:adani_airport_mobile/utils/play_sound.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// Custom bottom sheet class, used to adjust height of bottom as per the content

Future<void> adShowBottomSheetWithWrap({
  required BuildContext context,
  required Widget childWidget,
  required String headerTitle,
  bool isHeaderRequired = true,
  bool rootNavigator = true,
}) {
  return showModalBottomSheet<dynamic>(
    // enableDrag: true,
    // isDismissible: true,
    isScrollControlled: true,

    useRootNavigator: rootNavigator,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(
          context.k_22,
        ),
        topRight: Radius.circular(context.k_22),
      ),
    ),
    backgroundColor: Colors.white,
    context: context,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: context.k_10),
          child: ADBottomSheetDragBar(
            height: context.k_4,
            width: context.k_40,
          ),
        ),
        if (isHeaderRequired)
          ADDraggableSheetHeader(
            headerTitle: headerTitle.isNotEmpty
                ? headerTitle.validateWithDefaultValue()
                : '',
            closeCallBack: (value) => navigatorPopScreen(context),
          ).paddingBySide(top: context.k_6),
        childWidget,
      ],
    ),
  );
}

Future<void> adShowBottomSheet({
  required BuildContext context,
  required Widget childWidget,
  required String headerTitle,
  bool isHeaderRequired = true,
  bool isPaddingRequired = true,
  ValueNotifier<bool>? valueNotifier,
}) {
  return showModalBottomSheet<dynamic>(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    useRootNavigator: true,
    constraints: BoxConstraints.loose(
      Size(
        context.widthOfScreen,
        context.heightOfScreen - MediaQueryData.fromWindow(window).padding.top,
      ),
    ),
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(
          context.k_22,
        ),
        topRight: Radius.circular(context.k_22),
      ),
    ),
    backgroundColor: Colors.white,
    context: context,
    builder: (context) => ValueListenableBuilder(
      valueListenable: valueNotifier ?? ValueNotifier(false),
      builder: (BuildContext context, model, Widget? child) {
        return AbsorbPointer(
          absorbing: (valueNotifier ?? ValueNotifier(false)).value,
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: context.k_10),
                  child: ADBottomSheetDragBar(
                    height: context.k_4,
                    width: context.k_40,
                  ),
                ),
                if (isHeaderRequired)
                  ADDraggableSheetHeader(
                    headerTitle: headerTitle.validateWithDefaultValue(),
                    closeCallBack: (value) => navigatorPopScreen(context),
                  ).paddingBySide(
                    top: isPaddingRequired ? context.k_6 : 0,
                    bottom: isPaddingRequired ? context.k_20 : 0,
                  ),
                Flexible(child: childWidget),
                ADSizedBox(
                  height: context.k_24,
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

Future<dynamic> adShowBottomSheetWithData({
  required BuildContext context,
  required Widget childWidget,
  required String headerTitle,
  bool isHeaderRequired = true,
  bool isPaddingRequired = true,
  ValueNotifier<bool>? valueNotifier,
}) {
  return showModalBottomSheet<dynamic>(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    useRootNavigator: true,
    constraints: BoxConstraints.loose(
      Size(
        context.widthOfScreen,
        context.heightOfScreen - MediaQueryData.fromWindow(window).padding.top,
      ),
    ),
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(
          context.k_22,
        ),
        topRight: Radius.circular(context.k_22),
      ),
    ),
    backgroundColor: Colors.white,
    context: context,
    builder: (context) => ValueListenableBuilder(
      valueListenable: valueNotifier ?? ValueNotifier(false),
      builder: (BuildContext context, model, Widget? child) {
        return AbsorbPointer(
          absorbing: (valueNotifier ?? ValueNotifier(false)).value,
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: context.k_10),
                  child: ADBottomSheetDragBar(
                    height: context.k_4,
                    width: context.k_40,
                  ),
                ),
                if (isHeaderRequired)
                  ADDraggableSheetHeader(
                    headerTitle: headerTitle.validateWithDefaultValue(),
                    closeCallBack: (value) => navigatorPopScreen(context),
                  ).paddingBySide(
                    top: isPaddingRequired ? context.k_6 : 0,
                    bottom: isPaddingRequired ? context.k_20 : 0,
                  ),
                Flexible(child: childWidget),
                ADSizedBox(
                  height: context.k_24,
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

Future<void> adShowCouponBottomSheet({
  required BuildContext context,
  required Widget childWidget,
  ValueNotifier<bool>? valueNotifier,
}) {
  return showModalBottomSheet<dynamic>(
    enableDrag: false,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    useRootNavigator: true,
    constraints: BoxConstraints.loose(
      Size(
        context.widthOfScreen,
        context.heightOfScreen - MediaQueryData.fromWindow(window).padding.top,
      ),
    ),
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(
          context.k_22,
        ),
        topRight: Radius.circular(context.k_22),
      ),
    ),
    backgroundColor: Colors.white,
    context: context,
    builder: (context) => ValueListenableBuilder(
      valueListenable: valueNotifier ?? ValueNotifier(false),
      builder: (BuildContext context, model, Widget? child) {
        return AbsorbPointer(
          absorbing: (valueNotifier ?? ValueNotifier(false)).value,
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(child: childWidget),
                ADSizedBox(
                  height: context.k_24,
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

Future<void> adTransactionFailedShowBottomSheet({
  required BuildContext context,
  required Widget childWidget,
  required String headerTitle,
  bool isHeaderRequired = true,
  bool isPaddingRequired = true,
  required ADTapCallbackWithValue tapCallbackWithValue,
}) {
  PlaySound.playAudioSound('payment_failure.mp3');
  return showModalBottomSheet<dynamic>(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    useRootNavigator: true,
    constraints: BoxConstraints.loose(
      Size(
        context.widthOfScreen,
        context.heightOfScreen - MediaQueryData.fromWindow(window).padding.top,
      ),
    ),
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(
          context.k_22,
        ),
        topRight: Radius.circular(context.k_22),
      ),
    ),
    backgroundColor: Colors.white,
    context: context,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: context.k_10),
          child: ADBottomSheetDragBar(
            height: context.k_4,
            width: context.k_40,
          ),
        ),
        if (isHeaderRequired)
          ADDraggableSheetHeader(
            headerTitle: headerTitle.validateWithDefaultValue(),
            closeCallBack: (value) => {
              tapCallbackWithValue(false),
              navigatorPopScreen(context),
            },
          ).paddingBySide(
            top: isPaddingRequired ? context.k_6 : 0,
            bottom: isPaddingRequired ? context.k_20 : 0,
          ),
        Flexible(child: childWidget),
        ADSizedBox(
          height: context.k_24,
        ),
      ],
    ),
  );
}

Future<void> adShowFareDetailsBottomSheet({
  required BuildContext context,
  required Widget childWidget,
  required String headerTitle,
  bool isHeaderRequired = true,
  bool rootNavigator = true,
}) {
  return showModalBottomSheet<dynamic>(
    useRootNavigator: rootNavigator,
    constraints: BoxConstraints.loose(
      Size(
        context.widthOfScreen,
        context.heightOfScreen - MediaQueryData.fromWindow(window).padding.top,
      ),
    ),
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(
          context.k_22,
        ),
        topRight: Radius.circular(context.k_22),
      ),
    ),
    backgroundColor: Colors.white,
    context: context,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: context.k_10),
          child: ADBottomSheetDragBar(
            height: context.k_4,
            width: context.k_40,
          ),
        ),
        if (isHeaderRequired)
          ADDraggableSheetHeader(
            headerTitle: headerTitle.validateWithDefaultValue(),
            closeCallBack: (value) => navigatorPopScreen(context),
          ).paddingBySide(top: context.k_6, bottom: context.k_20),
        Flexible(child: childWidget),
      ],
    ),
  );
}

/// bottom sheet for filter

Future<FilterSortStateModel?> adShowFilterBottomSheet({
  required BuildContext context,
  required Widget childWidget,
  required String headerTitle,
//  bool rootNavigator = true,
}) {
  return showModalBottomSheet<FilterSortStateModel>(
    constraints: BoxConstraints.loose(
      Size(
        context.widthOfScreen,
        context.heightOfScreen - MediaQueryData.fromWindow(window).padding.top,
      ),
    ),
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(
          context.k_22,
        ),
        topRight: Radius.circular(context.k_22),
      ),
    ),
    backgroundColor: Colors.white,
    context: context,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: context.k_10),
          child: ADBottomSheetDragBar(
            height: context.k_4,
            width: context.k_40,
          ),
        ),
        ADDraggableSheetHeader(
          headerTitle: headerTitle.validateWithDefaultValue(),
          closeCallBack: (value) => navigatorPopScreen(context),
        ).paddingBySide(top: context.k_6, bottom: context.k_20),
        Flexible(child: childWidget),
        ADSizedBox(
          height: context.k_24,
        ),
      ],
    ),
  );
}

/// bottom sheet for all banks list on payment
Future<dynamic> adShowAllBanksBottomSheet({
  required BuildContext context,
  required Widget childWidget,
  required String headerTitle,
//  bool rootNavigator = true,
}) {
  return showModalBottomSheet<dynamic>(
    constraints: BoxConstraints.loose(
      Size(
        context.widthOfScreen,
        context.heightOfScreen - MediaQueryData.fromWindow(window).padding.top,
      ),
    ),
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(
          context.k_22,
        ),
        topRight: Radius.circular(context.k_22),
      ),
    ),
    backgroundColor: Colors.white,
    context: context,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: context.k_10),
          child: ADBottomSheetDragBar(
            height: context.k_4,
            width: context.k_40,
          ),
        ),
        ADDraggableSheetHeader(
          headerTitle: headerTitle.validateWithDefaultValue(),
          closeCallBack: (value) => navigatorPopScreen(context),
        ),
        Flexible(child: childWidget),
        ADSizedBox(
          height: context.k_24,
        ),
      ],
    ),
  );
}

Future<void> adShowBottomSheetOutSideClickNotFinish({
  required BuildContext context,
  required Widget childWidget,
  required String headerTitle,
  bool isHeaderRequired = true,
  bool isPaddingRequired = true,
  ValueNotifier<bool>? valueNotifier,
}) {
  return showModalBottomSheet<dynamic>(
    enableDrag: false,
    isDismissible: false,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    useRootNavigator: true,
    constraints: BoxConstraints.loose(
      Size(
        context.widthOfScreen,
        context.heightOfScreen - MediaQueryData.fromWindow(window).padding.top,
      ),
    ),
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(
          context.k_22,
        ),
        topRight: Radius.circular(context.k_22),
      ),
    ),
    backgroundColor: Colors.white,
    context: context,
    builder: (context) => ValueListenableBuilder(
      valueListenable: valueNotifier ?? ValueNotifier(false),
      builder: (BuildContext context, model, Widget? child) {
        return AbsorbPointer(
          absorbing: (valueNotifier ?? ValueNotifier(false)).value,
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: context.k_10),
                  child: ADBottomSheetDragBar(
                    height: context.k_4,
                    width: context.k_40,
                  ),
                ),
                if (isHeaderRequired)
                  ADDraggableSheetHeader(
                    headerTitle: headerTitle.validateWithDefaultValue(),
                    closeCallBack: (value) => navigatorPopScreen(context),
                  ).paddingBySide(
                    top: isPaddingRequired ? context.k_6 : 0,
                    bottom: isPaddingRequired ? context.k_20 : 0,
                  ),
                Flexible(child: childWidget),
                ADSizedBox(
                  height: context.k_24,
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
