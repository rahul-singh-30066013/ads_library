import 'package:ads_library/extension/ad_colors.dart';
import 'package:flutter/material.dart';

/// extension class is used to define colors on the basis of theme
/// i.e dark or light.. purpose of this util class to have parentColor for
/// styles, theme and other widgets.
extension ColorTCPDark on ColorScheme {
  Color get successInfoMsg => brightness == Brightness.light
      ? const Color(0xff00b16b)
      : const Color(0xffe5f7f0);

  Color get importantInfoMsg => brightness == Brightness.light
      ? const Color(0xfff04c23)
      : const Color(0xfffef5e5);

  Color get neutralInfoMsg => brightness == Brightness.light
      ? const Color(0xff333333)
      : const Color(0xffebebeb);

  Color get errorInfoMsg => brightness == Brightness.light
      ? const Color(0xffe60000)
      : const Color(0xfffce5e5);
}

extension ExtraColors on ColorScheme {
  Color get blueCardColor => brightness == Brightness.light
      ? const Color(0xff007aff)
      : const Color(0xff007aff);

  Color get tileBorderColor => brightness == Brightness.light
      ? const Color(0xffe2e2e2)
      : const Color(0xffe2e2e2);

  Color get greyTextColor => brightness == Brightness.light
      ? const Color(0xff666666)
      : const Color(0xff666666);

  Color get whiteTextColor =>
      brightness == Brightness.light ? ADColors.white : ADColors.white;

  Color get defaultColor =>
      brightness == Brightness.light ? ADColors.grey : ADColors.white;

  Color get blackWhiteColor =>
      brightness == Brightness.light ? ADColors.black : ADColors.white;

  Color get circleGreyTextColor => brightness == Brightness.light
      ? const Color(0xff999999)
      : const Color(0xff999999);

  Color get greyCircleColor => brightness == Brightness.light
      ? const Color(0xff888888)
      : const Color(0xff888888);

  Color get greyChartTextColor => brightness == Brightness.light
      ? const Color(0xff4a4a4a)
      : const Color(0xff4a4a4a);

  Color get greenTextColor => brightness == Brightness.light
      ? const Color(0xff32a851)
      : const Color(0xff32a851);

  Color get lightBackgroundGreen => brightness == Brightness.light
      ? const Color(0xffE5F4EA)
      : const Color(0xffE5F4EA);

  Color get blackTextColor => brightness == Brightness.light
      ? const Color(0xff222222)
      : const Color(0xff222222);

  Color get blueTextColor => brightness == Brightness.light
      ? const Color(0xff222222)
      : const Color(0xff222222);

  Color get darkGreyTextColor => brightness == Brightness.light
      ? const Color(0xff555555)
      : const Color(0xff555555);

  Color get geryBorderColor => brightness == Brightness.light
      ? const Color(0xff868686)
      : const Color(0xff868686);

  Color get cardBgColor => brightness == Brightness.light
      ? const Color(0xfffafafa)
      : const Color(0xfffafafa);

  Color get tagTextColor => brightness == Brightness.light
      ? const Color(0xff220000)
      : const Color(0xff220000);

  Color get dividerColor => brightness == Brightness.light
      ? const Color(0xffdedede)
      : const Color(0xffdedede);

  Color get dashedDividerColor => brightness == Brightness.light
      ? const Color(0xff979797)
      : const Color(0xff979797);

  Color get whatsAppIconColor => brightness == Brightness.light
      ? const Color(0xff0aaf62)
      : const Color(0xff0aaf62);

  Color get textBrownColor => brightness == Brightness.light
      ? const Color(0xff9c6c58)
      : const Color(0xff9c6c58);

  Color get errorCardBorderColor => brightness == Brightness.light
      ? const Color(0xffe9c5c5)
      : const Color(0xffe9c5c5);

  Color get infoCardBorderColor => brightness == Brightness.light
      ? const Color(0xfffae7b5)
      : const Color(0xfffae7b5);

  Color get boxShadowColor => brightness == Brightness.light
      ? const Color(0x1f000000)
      : const Color(0x1f000000);

  Color get violetColor => brightness == Brightness.light
      ? const Color(0x1f8a5a96)
      : const Color(0x1f8a5a96);

  Color get lightPinkColor => brightness == Brightness.light
      ? const Color(0x1fFFBCFD)
      : const Color(0x1fFFBCFD);

  Color get lightGreenColor => brightness == Brightness.light
      ? const Color(0xff18aa26)
      : const Color(0xff18aa26);

  Color get darkGreenColor => brightness == Brightness.light
      ? const Color(0xff177f38)
      : const Color(0xff177f38);

  Color get baggageCardBg => brightness == Brightness.light
      ? const Color(0xfff8ffff)
      : const Color(0xfff8ffff);

  Color get containerGreyBg => brightness == Brightness.light
      ? const Color(0xfff8f8f8)
      : const Color(0xfff8f8f8);

  Color get lightRedColor => brightness == Brightness.light
      ? const Color(0xffc00000)
      : const Color(0xffc00000);

  Color get lightGreyColor => brightness == Brightness.light
      ? const Color(0xfff1f1f1)
      : const Color(0xfff1f1f1);

  Color get greenStarColor => brightness == Brightness.light
      ? const Color(0xff177f38)
      : const Color(0xff177f38);

  Color get blueColor => brightness == Brightness.light
      ? const Color(0xff0d67ca)
      : const Color(0xff0d67ca);

  Color get black =>
      brightness == Brightness.light ? ADColors.black : ADColors.white;

  Color get blackShade600 => brightness == Brightness.light
      ? ADColors.black.shade600
      : ADColors.white.shade600;

  Color get cardBackgroundColor => brightness == Brightness.light
      ? const Color(0xfff8f8f8)
      : const Color(0xfff8f8f8);

  Color get greyTextColor2 => brightness == Brightness.light
      ? const Color(0xfff8f8f8)
      : const Color(0xfff8f8f8);

  Color get gradientGreenColor => brightness == Brightness.light
      ? const Color(0xff00455b)
      : const Color(0xff00455b);

  Color get gradientRedColor => brightness == Brightness.light
      ? const Color(0xff00455b)
      : const Color(0xff00455b);

  Color get gradientDarkRedColor => brightness == Brightness.light
      ? const Color(0xff6e092a)
      : const Color(0xff6e092a);

  Color get greyReviewShade => brightness == Brightness.light
      ? const Color(0xffcccccc)
      : const Color(0xffcccccc);

  Color get reviewsShade1 => brightness == Brightness.light
      ? const Color(0xab007b48)
      : const Color(0xab007b48);

  Color get reviewsShade2 => brightness == Brightness.light
      ? const Color(0xff56b28c)
      : const Color(0xff56b28c);

  Color get reviewsShade3 => brightness == Brightness.light
      ? const Color(0xff68d0a5)
      : const Color(0xff68d0a5);

  Color get reviewsShade4 => brightness == Brightness.light
      ? const Color(0xffff9c00)
      : const Color(0xffff9c00);

  Color get reviewsShade5 => brightness == Brightness.light
      ? const Color(0xffbd6f6f)
      : const Color(0xffbd6f6f);

  Color get barSeriesColorFirst => brightness == Brightness.light
      ? const Color(0xffffc48d)
      : const Color(0xffffc48d);

  Color get barSeriesColorSecond => brightness == Brightness.light
      ? const Color(0xff7cabff)
      : const Color(0xff7cabff);

  Color get orangeColor => brightness == Brightness.light
      ? const Color(0xfff99f5c)
      : const Color(0xfff99f5c);

  Color get contentBulletColor => brightness == Brightness.light
      ? const Color(0xffd8d8d8)
      : const Color(0xffd8d8d8);

  Color get cardType4bgColor => brightness == Brightness.light
      ? const Color(0xeef5fcff)
      : const Color(0xeef5fcff);

  Color get transparentColor => brightness == Brightness.light
      ? const Color(0x00000000)
      : const Color(0x00000000);

  Color get searchTextFieldGreyHintColor => brightness == Brightness.light
      ? const Color(0xff8a8a8f)
      : const Color(0xff8a8a8f);

  Color get rustyOrangeColor => brightness == Brightness.light
      ? const Color(0xd4d44817)
      : const Color(0xd4d44817);

  Color get headerContainerBg => brightness == Brightness.light
      ? const Color(0xff397af1)
      : const Color(0xff397af1);

  Color get priceTagGreen => brightness == Brightness.light
      ? const Color(0xff1d740a)
      : const Color(0xff1d740a);

  Color get cardBlueBg => brightness == Brightness.light
      ? const Color(0xffeef5fc)
      : const Color(0xffeef5fc);

  Color get widgetDividerLine => brightness == Brightness.light
      ? const Color(0xffe0e0e0)
      : const Color(0xffe0e0e0);

  Color get lightRustyOrangeBg => brightness == Brightness.light
      ? const Color(0xfffaf3f0)
      : const Color(0xfffaf3f0);

  Color get priceOffGreen => brightness == Brightness.light
      ? const Color(0xff18aa26)
      : const Color(0xff18aa26);

  Color get filterBlackText => brightness == Brightness.light
      ? const Color(0xff000000)
      : const Color(0xff000000);

  Color get verticalSeparatorGrey => brightness == Brightness.light
      ? const Color(0xffaaaaaa)
      : const Color(0xffaaaaaa);

  Color get lightSkyBlue => brightness == Brightness.light
      ? const Color(0xffe8f3ff)
      : const Color(0xffe8f3ff);

  Color get tealTextColor => brightness == Brightness.light
      ? const Color(0xff002f47)
      : const Color(0xff002f47);

  Color get cardTealColor => brightness == Brightness.light
      ? const Color(0xffeef3f3)
      : const Color(0xffeef3f3);

  Color get storyViewBarBackgroundColor => brightness == Brightness.light
      ? const Color(0xffd4d3d3)
      : const Color(0xffd4d3d3);

  Color get storyViewBarFillColor => brightness == Brightness.light
      ? const Color(0xff222222)
      : const Color(0xff222222);

  Color get blackColor =>
      brightness == Brightness.light ? ADColors.black : ADColors.black;

  Color get blue900 => brightness == Brightness.light
      ? ADColors.blue.shade900
      : ADColors.blue.shade900;

  Color get blue500 => brightness == Brightness.light
      ? ADColors.blue.shade500
      : ADColors.blue.shade500;

  Color get blue50 => brightness == Brightness.light
      ? ADColors.blue.shade50
      : ADColors.blue.shade50;

  Color get lightBlue =>
      brightness == Brightness.light ? ADColors.lightBlue : ADColors.lightBlue;

  Color get blue =>
      brightness == Brightness.light ? ADColors.blue : ADColors.blue;

  List<Color> get reviewColorsList =>
      brightness == Brightness.light ? reviewColors : reviewColors;

  Color get red900 => brightness == Brightness.light
      ? ADColors.red.shade900
      : ADColors.red.shade900;

  Color get blackShade700 => brightness == Brightness.light
      ? ADColors.black.shade700
      : ADColors.black.shade700;

  Color get blackShade500 => brightness == Brightness.light
      ? ADColors.black.shade500
      : ADColors.black.shade500;

  Color get inactiveGreyColor => brightness == Brightness.light
      ? ADColors.inactiveGreyTextColor
      : ADColors.inactiveGreyTextColor;

  Color get lightGreyTextColor => brightness == Brightness.light
      ? ADColors.lightGreyTextColor
      : ADColors.lightGreyTextColor;

  Color get blackShade400 => brightness == Brightness.light
      ? ADColors.black.shade400
      : ADColors.black.shade400;

  Color get greenColor => brightness == Brightness.light
      ? const Color(0xff13a180)
      : const Color(0xff13a180);

  Color get magenta => brightness == Brightness.light
      ? const Color(0xff2694c1)
      : const Color(0xff2694c1);

  Color get lightGreyBackgroundColor => brightness == Brightness.light
      ? const Color(0xfff7f7f7)
      : const Color(0xfff7f7f7);

  Color get addButtonBorderColor => brightness == Brightness.light
      ? const Color(0xffc1c2c7)
      : const Color(0xffc1c2c7);

  Color get lightGreyGridSeparatorColor => brightness == Brightness.light
      ? const Color(0xffe2e2e2)
      : const Color(0xffe2e2e2);

  Color get adLogoGradient1 => brightness == Brightness.light
      ? const Color(0xff0fb371)
      : const Color(0xff0fb371);

  Color get adLogoGradient2 => brightness == Brightness.light
      ? const Color(0xff2073b8)
      : const Color(0xff2073b8);

  Color get adLogoGradient3 => brightness == Brightness.light
      ? const Color(0xff6b5ca6)
      : const Color(0xff6b5ca6);

  Color get adLogoGradient4 => brightness == Brightness.light
      ? const Color(0xff923993)
      : const Color(0xff923993);

  Color get adLogoGradient5 => brightness == Brightness.light
      ? const Color(0xfff05636)
      : const Color(0xfff05636);

  Color get stepperGreyTextColor => brightness == Brightness.light
      ? const Color(0xff777777)
      : const Color(0xff777777);

  Color get baseShimmerColor => brightness == Brightness.light
      ? Colors.grey[100] ?? Colors.grey
      : Colors.grey[100] ?? Colors.grey;

  Color get highlightShimmerColor => brightness == Brightness.light
      ? Colors.grey[300] ?? Colors.grey
      : Colors.grey[300] ?? Colors.grey;

  LinearGradient get adGradientThemeColor => brightness == Brightness.light
      ? ADColors.adGradientonInfoCard
      : ADColors.adGradientonInfoCard;

  Color get lightGreyShadowColor => brightness == Brightness.light
      ? const Color(0x33898989)
      : const Color(0x33898989);

  Color get mediumPink => brightness == Brightness.light
      ? const Color(0xffed5a6b)
      : const Color(0xffed5a6b);

  Color get textFieldBorderGrey => brightness == Brightness.light
      ? const Color(0xffcacaca)
      : const Color(0xffcacaca);

  Color get searchIconGrey => brightness == Brightness.light
      ? const Color(0xff8e8e93)
      : const Color(0xff8e8e93);

  Color get brownishGrey => brightness == Brightness.light
      ? const Color(0xffc0c0c0)
      : const Color(0xffc0c0c0);

  Color get paleGrey => brightness == Brightness.light
      ? const Color(0xffeaebed)
      : const Color(0xffeaebed);

  Color get shimmerColor => brightness == Brightness.light
      ? const Color(0xffeaeaea)
      : const Color(0xffeaeaea);

  Color get sortFilterButtonColor => brightness == Brightness.light
      ? const Color(0xff293449)
      : const Color(0xff293449);
}
