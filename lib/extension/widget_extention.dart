import 'package:flutter/material.dart';

/// Class is used to create extension function for widget[Widget] type class.
/// Helps us to make our code more readable
/// usage Ex : const Text('demo text',).paddingAllSide(80.0) instead
/// const Padding(padding: EdgeInsets.all(8.0),child: Text('Demo Text',),)

extension WidgetPaddingAll on Widget {
  /// function helps us to define padding all from side.
  ///[value] double for padding the widget child in widget class.
  Padding paddingAllSide(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);

  @Deprecated('[Use paddingBySide]')
  Widget paddingFromSides(
      {double? left, double? top, double? right, double? bottom}) =>
      Padding(
        padding: EdgeInsets.fromLTRB(left!, top!, right!, bottom!),
      );

  Padding paddingBySide(
      {double top = 0.0,
        double bottom = 0.0,
        double left = 0.0,
        double right = 0.0}) =>
      Padding(
          padding: EdgeInsets.only(
              bottom: bottom, top: top, left: left, right: right),
          child: this);

  ///[topValue] top double valuefor padding the widget child in widget class.
  @Deprecated('Use [paddingBySide]')
  Widget paddingOnly(double topValue, double bottomValue, double leftValue,
      double rightValue) =>
      Padding(
          padding: EdgeInsets.only(
              bottom: bottomValue,
              top: topValue,
              left: leftValue,
              right: rightValue),
          child: this);
}

///Extension for padding any widget cases
extension WidgetModifier on Widget {
  @Deprecated('Use [WidgetPaddingAll.paddingAllSide]')
  Widget padding([EdgeInsetsGeometry value = const EdgeInsets.all(10)]) {
    return Padding(
      padding: value,
      child: this,
    );
  }
}
