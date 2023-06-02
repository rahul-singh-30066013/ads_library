/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

const double k_0_4 = 0.4;
const double k_16 = 16;

class ADCounterButton extends StatelessWidget {
  ///This class can be used to create the counter button based on the style guide
  ///state can be maintain from the outside add in [onIncrementTapHandler]
  /// and subtract in [onDecrementTapHandler]
  /// below is the example that how to use:
  ///
  ///        ADCounterButton(
  ///           onDecrementTapHandler: (int value) {
  ///             //Add the decrement logic here
  ///             //model.newValue = value - 1
  ///             print(value);
  ///           },
  ///           onIncrementTapHandler: (value) {
  ///             //Add the increment logic here
  ///             //model.newValue = value + 1
  ///             print(value);
  ///           },
  ///           //pass latest value to show in the center
  ///           counterNumber: 0,
  ///         ),
  ///
  /// *[onDecrementTapHandler] use this function to decrement the value
  /// *[onIncrementTapHandler] use this function to increment the value
  /// *[counterNumber] pass the instance of int number to show at the center label
  /// after increment or decrement
  /// *[maxCounterLimit] pass the Max counter limit so that decrement/increment
  /// styling can work based on that default value is 9
  const ADCounterButton({
    Key? key,
    required this.onDecrementTapHandler,
    required this.onIncrementTapHandler,
    required this.onErrorTapHandler,
    this.counterNumber = 0,
    required this.maxCounterLimit,
  }) : super(key: key);

  ///use this function to decrement the value
  final ADCounterTapCallback onDecrementTapHandler;

  ///use this function to increment the value
  final ADCounterTapCallback onIncrementTapHandler;

  ///use this function to increment the value
  final ADCounterTapCallback onErrorTapHandler;

  ///pass the instance of int number to show at the center label
  ///after increment or decrement
  final int counterNumber;

  ///pass the Max counter limit so that decrement/increment
  ///styling can work based on that default value is 9
  final int maxCounterLimit;

  //return string of the counter number
  String _calculateCounterValueToDisplay() {
    final number = _calculateCounterValue();
    return '$number';
  }

  //return the counter number
  int _calculateCounterValue() {
    return counterNumber >= maxCounterLimit ? maxCounterLimit : counterNumber;
  }

  //check if decrement action is should be enabled or disabled
  bool _decrementActionEnabled() {
    return counterNumber != 0;
  }

  @override
  Widget build(BuildContext context) {
    final double scaledWidth = 80.sp;
    final double scaledHeight = 42.sp;
    return GestureDetector(
      onTap: () => adLog('testing'),
      child: Container(
        width: scaledWidth,
        height: scaledHeight,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(28)),
          color: context.adColors.blueColor.withOpacity(1),
        ),
        child: Row(
          children: [
            Expanded(
              child: IconButton(
                onPressed: _decrementActionEnabled()
                    ? () => onDecrementTapHandler(_calculateCounterValue())
                    : null,
                highlightColor: context.adColors.transparentColor,
                splashColor: context.adColors.transparentColor,
                hoverColor: context.adColors.transparentColor,
                icon: Container(
                  width: context.k_30,
                  height: context.k_36,
                  child: Icon(
                    Icons.remove_outlined,
                    color: _decrementActionEnabled()
                        ? context.adColors.whiteTextColor
                        : context.adColors.black.withOpacity(k_0_4),
                    size: k_16,
                  ),
                ),
              ),
            ),
            Text(
              _calculateCounterValueToDisplay(),
              style: ADTextStyle500.size14
                  .setTextColor(context.adColors.whiteTextColor),
            ),
            Expanded(
              child: IconButton(
                onPressed: () => counterNumber == maxCounterLimit
                    ? onErrorTapHandler(counterNumber)
                    : onIncrementTapHandler(_calculateCounterValue()),
                highlightColor: context.adColors.transparentColor,
                splashColor: context.adColors.transparentColor,
                hoverColor: context.adColors.transparentColor,
                icon: Container(
                  color: Colors.transparent,
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: Icon(
                    Icons.add_outlined,
                    color: counterNumber == maxCounterLimit
                        ? context.adColors.black.withOpacity(
                            k_0_4,
                          )
                        : context.adColors.whiteTextColor,
                    size: context.k_16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
