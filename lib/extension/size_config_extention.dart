import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

const double designDefaultScreenWidth = 375;
const double designDefaultScreenHeight = 667;

///This class is made to drive all kind of view sizes based on
///different screen sizes.
extension SizeConfigUtil on BuildContext {
  // FINDING: Don't use MediaQuery globally to find the screen width/height.
  // It cause rebuild of all the widgets binded to this.

  // MediaQueryData get mediaQueryData => MediaQuery.of(this);
  // Size get sizeOfScreen => mediaQueryData.size;

  /// same as [mediaQueryData.size.width]
  double get widthOfScreen => ADSizeConfig().screenWidth;

  /// same as [mediaQueryData.size.height]
  double get heightOfScreen => ADSizeConfig().screenHeight;

  /// getter to access the theme on the context
  ThemeData get theme => Theme.of(this);

  /// getter to access the ColorScheme on the context
  ColorScheme get adColors => Theme.of(this).colorScheme;

  ///This function is used to scale any type of view or font with reference
  ///to the basic design size defined in the style guide
  ///Default Width = 375 & Default Height = 667
  ///Return scaled size from the defined size based on different screen sizes.
  double scaled(double size) {
    return ADSizeConfig().scaleWidth * size;
  }

  double get k_2 => 2.sp;
  double get k_4 => 4.sp;
  double get k_6 => 6.sp;
  double get k_8 => 8.sp;
  double get k_10 => 10.sp;
  double get k_11 => 11.sp;
  double get k_12 => 12.sp;
  double get k_13 => 13.sp;
  double get k_14 => 14.sp;
  double get k_15 => 15.sp;
  double get k_16 => 16.sp;
  double get k_17 => 17.sp;
  double get k_18 => 18.sp;
  double get k_19 => 19.sp;
  double get k_20 => 20.sp;
  double get k_22 => 22.sp;
  double get k_24 => 24.sp;
  double get k_26 => 26.sp;
  double get k_28 => 28.sp;
  double get k_30 => 30.sp;
  double get k_32 => 32.sp;
  double get k_34 => 34.sp;
  double get k_36 => 36.sp;
  double get k_38 => 38.sp;
  double get k_40 => 40.sp;
  double get k_48 => 48.sp;
  double get k_56 => 56.sp;
  double get k_60 => 60.sp;
  double get k_64 => 64.sp;
}

/// custom dark theme data class will adjust all the properties as per theme
/// mode, as internally we are defing colorscheme , text style etc as per
/// theme mode.
extension CustomDarkThemeData on BuildContext {
  ThemeData get darkTheme => ThemeData.dark();

  ThemeData get lightTheme => ThemeData.light();
}

extension SizeExtension on num {
  double get w => ADSizeConfig().setWidth(this);

  double get h => ADSizeConfig().setHeight(this);

  double get r => ADSizeConfig().radius(this);

  double get sp => ADSizeConfig().setSp(this);

  ///smart size :  it check your value if it is bigger than your value set your value
  ///for example you have set 16.sm() , if for your screen 16.sp() bigger than 16 it will  set 16 not 16.sp()
  ///I think that it is good for save size balance on big sizes of screen
  double get smin => min(toDouble(), sp);

  double get smax => max(toDouble(), sp);

  ///Multiple of screen width
  double get sw => ADSizeConfig().screenWidth * this;

  ///Multiple of screen height
  double get sh => ADSizeConfig().screenHeight * this;
}

class ADSizeConfig {
  static Size defaultSize =
  const Size(designDefaultScreenWidth, designDefaultScreenHeight);

  static late ADSizeConfig _instance;

  /// Size of the phone in UI Design , dp
  late Size uiSize;

  late Orientation _orientation;

  late double _pixelRatio;
  late double _textScaleFactor;
  late double _screenWidth;
  late double _screenHeight;
  late double _statusBarHeight;
  late double _bottomBarHeight;

  factory ADSizeConfig() {
    return _instance;
  }

  ADSizeConfig._();

  static void init(BoxConstraints constraints) {
    _instance = ADSizeConfig._()
      ..uiSize = defaultSize
      .._screenWidth = constraints.maxWidth
      .._screenHeight = constraints.maxHeight;

    final windowP = WidgetsBinding.instance?.window ?? window;
    _instance._pixelRatio = windowP.devicePixelRatio;
    _instance._statusBarHeight = windowP.padding.top;
    _instance._bottomBarHeight = windowP.padding.bottom;
    _instance._textScaleFactor = windowP.textScaleFactor;
  }

  ///Get screen orientation
  Orientation get orientation => _orientation;

  /// The number of font pixels for each logical pixel.
  double get textScaleFactor => 1;

  /// The size of the media in logical pixels (e.g, the size of the screen).
  double get pixelRatio => _pixelRatio;

  /// The horizontal extent of this size.
  double get screenWidth => _screenWidth;

  ///The vertical extent of this size. dp
  double get screenHeight => _screenHeight;

  /// The offset from the top, in dp
  double get statusBarHeight => _statusBarHeight / _pixelRatio;

  /// The offset from the bottom, in dp
  double get bottomBarHeight => _bottomBarHeight / _pixelRatio;

  /// The ratio of actual width to UI design
  double get scaleWidth =>
      _screenWidth < uiSize.width ? 1 : _screenWidth / uiSize.width;

  ///  /// The ratio of actual height to UI design
  double get scaleHeight =>
      _screenHeight < uiSize.height ? 1 : _screenHeight / uiSize.height;

  double get scaleText => min(scaleWidth, scaleHeight);

  /// Adapted to the device width of the UI Design.
  /// Height can also be adapted according to this to ensure no deformation ,
  /// if you want a square
  double setWidth(num width) => width * scaleWidth;

  /// Highly adaptable to the device according to UI Design
  /// It is recommended to use this method to achieve a high degree of adaptation
  /// when it is found that one screen in the UI design
  /// does not match the current style effect, or if there is a difference in shape.
  double setHeight(num height) => height * scaleHeight;

  ///Adapt according to the smaller of width or height
  double radius(num r) => r * scaleText;

  ///Font size adaptation method
  ///- [fontSize] The size of the font on the UI design, in dp.
  /// divide by text scale factor, doesn't impact our calculations.
  /// in case user change font size in accessibility in the device,
  /// it will not increase font size that's why we are dividing with text scale
  /// facto
  double setSp(num fontSize) => fontSize * scaleText;
}