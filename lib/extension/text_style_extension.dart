import 'package:flutter/material.dart';

extension ADTextStyle on TextStyle {
  /// helper method for change font style for text style using [copyWith]
  TextStyle setFontStyle(FontStyle value) => copyWith(fontStyle: value);

  // helper method for change fontSize for text style [copyWith]
  TextStyle setFontSize(double value) => copyWith(fontSize: value);

  // helper method for change Color for text style [copyWith]
  TextStyle setTextColor(Color value) => copyWith(color: value);

  // helper method for change FontWeight for text style [copyWith]
  TextStyle setFontWeight(FontWeight value) => copyWith(fontWeight: value);

  // helper method for change line gap for text style [copyWith]
  TextStyle setFontHeight(double value) => copyWith(height: value);
}