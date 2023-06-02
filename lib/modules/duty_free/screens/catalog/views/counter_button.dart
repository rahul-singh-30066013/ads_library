/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';

//TODO: constant
const double k_0_4 = 0.4;
const int k_92 = 92;
const maxCounterLimit = 2;

class CounterButton extends StatelessWidget {
  ///This class can be used to create the counter button based on the style guide
  ///state can be maintain from the outside add in [onIncrementTapHandler]
  /// and subtract in [onDecrementTapHandler]
  /// below is the example that how to use:
  ///
  ///        CounterButton(
  ///           onDecrementTapHandler: (int value) {
  ///             //Add the decrement logic here
  ///             //model.newValue = value - 1
  ///             print(value);
  ///           },
  ///           onIncrementTapHandler: (value) {
  ///             //Add the increment logic here
  ///             //model.newValue = value + 1
  ///             print(value);
  ///           },onErrorTapHandler: (value) {
  ///             print(value);
  ///           },
  ///           //pass latest value to show in the center
  ///           counterNumber: 0,
  ///         ),
  ///
  /// *[onDecrementTapHandler] use this function to decrement the value
  /// *[onIncrementTapHandler] use this function to increment the value
  /// *[onErrorTapHandler] use this function the returns error in max limit exceed.
  /// *[counterNumber] pass the instance of int number to show at the center label
  /// after increment or decrement
  /// *[maxCounterLimit] pass the Max counter limit so that decrement/increment
  /// styling can work based on that default value is 9
  ///

  const CounterButton({
    Key? key,
    required this.onDecrementTapHandler,
    required this.onIncrementTapHandler,
    required this.onErrorTapHandler,
    this.counterNumber = 0,
    required this.maxCounterLimit,
  }) : super(key: key);

  final int maxCounterLimit;

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

  //return string of the counter number
  String _calculateCounterValueToDisplay() {
    final number = _calculateCounterValue();
    return '$number';
  }

  //return the counter number
  int _calculateCounterValue() {
    return counterNumber >= maxCounterLimit ? maxCounterLimit : counterNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: k_92.sp,
      height: context.k_36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(context.k_28)),
        border: Border.all(color: context.adColors.black),
        color: context.adColors.whiteTextColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: counterNumber != 0
                  ? () => onDecrementTapHandler(_calculateCounterValue())
                  : null,
              child: Container(
                color: Colors.transparent,
                height: double.infinity,
                width: double.infinity,
                child: Container(
                  width: context.k_30,
                  height: context.k_36,
                  child: Icon(
                    Icons.remove_outlined,
                    color: counterNumber != 0
                        ? context.adColors.greyTextColor
                        : context.adColors.black.withOpacity(k_0_4),
                    size: context.k_26,
                  ),
                ),
              ),
            ),
          ),
          Text(
            _calculateCounterValueToDisplay(),
            style: ADTextStyle700.size18.setTextColor(context.adColors.black),
          ),
          Visibility(
            visible: counterNumber != maxCounterLimit,
            child: Expanded(
              child: GestureDetector(
                onTap: () => onIncrementTapHandler(_calculateCounterValue()),
                child: Container(
                  color: Colors.transparent,
                  height: double.infinity,
                  width: double.infinity,
                  child: Container(
                    width: context.k_30,
                    height: context.k_36,
                    child: Icon(
                      Icons.add_outlined,
                      color: context.adColors.greyTextColor,
                      size: context.k_26,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: counterNumber == maxCounterLimit,
            child: Expanded(
              child: GestureDetector(
                onTap: () => onErrorTapHandler(counterNumber),
                child: Container(
                  color: Colors.transparent,
                  height: double.infinity,
                  width: double.infinity,
                  child: Container(
                    width: context.k_30,
                    height: context.k_36,
                    child: Icon(
                      Icons.add_outlined,
                      color: context.adColors.black.withOpacity(k_0_4),
                      size: context.k_26,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
