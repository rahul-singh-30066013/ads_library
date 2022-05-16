import 'package:ads_library/extension/ad_colors.dart';
import 'package:flutter/material.dart';

///Defined all the Donut Chart Types  based on the Adani style guide
enum ADDonutChartEnum {
  fullDonut,
  halfDonut,
}

///Common enums and function to create textStyle object.
class AppTextStyles {
  static double widthOfScreen = 375;
  static double heightOfScreen = 667;
}

///All the basic Bold TextStyles which define in the adani style guide.
class ADTextStyle700 {
  static TextStyle size32 = _textStyle(32);
  static TextStyle size28 = _textStyle(28);
  static TextStyle size26 = _textStyle(26);
  static TextStyle size24 = _textStyle(24);
  static TextStyle size22 = _textStyle(22);
  static TextStyle size20 = _textStyle(20);
  static TextStyle size18 = _textStyle(18);
  static TextStyle size16 = _textStyle(16);
  static TextStyle size14 = _textStyle(14);
  static TextStyle size12 = _textStyle(12);
  static TextStyle size10 = _textStyle(10);
  static TextStyle size8 = _textStyle(8);
  // static double widthOfScreen =
  //     WidgetsBinding.instance!.window.physicalSize.width /
  //         WidgetsBinding.instance!.window.devicePixelRatio;

  //fontSize:AppTextStyles.widthOfScreen / designDefaultScreenWidth * width,

  static TextStyle _textStyle(
      double size,
      ) {
    return TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        color: ADColors.black.shade900);
  }
}

///All other Bold TextStyles which define in the adani style guide.
@Deprecated(
    'Use ADTextStyle700.size16.copyWith(color: context.adColors.yourColorName in project file')
class ADTextStyleVariants700 {
  ///SF Pro Display Bold

  static TextStyle size18Black8 =
  ADTextStyle700.size20.copyWith(color: ADColors.black.shade700);

  static TextStyle size12Green =
  ADTextStyle700.size12.copyWith(color: ADColors.green);

  static TextStyle size24White =
  ADTextStyle700.size24.copyWith(color: ADColors.white);

  static TextStyle size24Black =
  ADTextStyle700.size24.copyWith(color: ADColors.black);

  static TextStyle size16 =
  ADTextStyle700.size16.copyWith(color: ADColors.white);
  static TextStyle size16Grey =
  ADTextStyle700.size16.copyWith(color: ADColors.grey);

  static TextStyle size12White =
  ADTextStyle700.size12.copyWith(color: ADColors.white);

  static TextStyle size12Grey =
  ADTextStyle700.size12.copyWith(color: ADColors.grey);

  static TextStyle size32White =
  ADTextStyle700.size32.copyWith(color: ADColors.white);

  static TextStyle size28White = ADTextStyle700.size28.copyWith(
    color: ADColors.white,
  );
  static TextStyle size12TextGreen =
  ADTextStyle700.size12.copyWith(color: const Color(0xff32a851));

  static TextStyle size14black =
  ADTextStyle700.size14.copyWith(color: const Color(0xff222222));

  static TextStyle size12LightGrey = ADTextStyle700.size12
      .copyWith(color: const Color.fromRGBO(193, 194, 199, .9));
}

///All the basic Semi Bold TextStyles which define in the adani style guide.
class ADTextStyle600 {
  static TextStyle size32 = _textStyle(32);
  static TextStyle size28 = _textStyle(28);
  static TextStyle size26 = _textStyle(26);
  static TextStyle size24 = _textStyle(24);
  static TextStyle size22 = _textStyle(22);
  static TextStyle size20 = _textStyle(20);
  static TextStyle size18 = _textStyle(18);
  static TextStyle size16 = _textStyle(16);
  static TextStyle size14 = _textStyle(14);
  static TextStyle size12 = _textStyle(12);
  static TextStyle size10 = _textStyle(10);
  static TextStyle size8 = _textStyle(8);

  // static double widthOfScreen =
  //     WidgetsBinding.instance!.window.physicalSize.width /
  //         WidgetsBinding.instance!.window.devicePixelRatio;

  //fontSize:AppTextStyles.widthOfScreen / designDefaultScreenWidth * width,
  static TextStyle _textStyle(double size) {
    return TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        color: ADColors.black.shade900);
  }
}

///All other Semi Bold TextStyles which define in the adani style guide.
@Deprecated(
    'Use ADTextStyle600.size16.copyWith(color: context.adColors.yourColorName in project file')
class ADTextStyleVariants600 {
  ///SF Pro Display Semi Bold

  static TextStyle size14Red =
  ADTextStyle600.size14.copyWith(color: const Color(0xffe60000));

  static TextStyle size14Brown =
  ADTextStyle600.size14.copyWith(color: const Color(0xff9c6c58));

  static TextStyle size12TagColor =
  ADTextStyle600.size12.copyWith(color: const Color(0xff220000));

  static TextStyle size12Green10 =
  ADTextStyle600.size12.copyWith(color: ADColors.green.shade900);

  static TextStyle size12DarkBlue =
  ADTextStyle600.size12.copyWith(color: const Color(0xff0d67ca));

  static TextStyle size14Grey =
  ADTextStyle600.size14.copyWith(color: const Color(0xff666666));

  static TextStyle size14Black =
  ADTextStyle600.size14.copyWith(color: const Color(0xff222222));

  static TextStyle size16GreyWithLineDecorate = ADTextStyle600.size16.copyWith(
      color: const Color(0xff666666), decoration: TextDecoration.lineThrough);
  static TextStyle size18Grey =
  ADTextStyle600.size14.copyWith(color: const Color(0xff222222));

  static TextStyle size14Blue =
  ADTextStyle600.size14.copyWith(color: const Color(0xff0d67ca));

  static TextStyle size18blue =
  ADTextStyle600.size18.copyWith(color: const Color(0xff0d67ca));

  static TextStyle size18White =
  ADTextStyle600.size18.copyWith(color: ADColors.white);

  static TextStyle size16White =
  ADTextStyle600.size16.copyWith(color: ADColors.white);

  static TextStyle size16blue =
  ADTextStyle600.size16.copyWith(color: const Color(0xff0d67ca));

  static TextStyle size16GreenPriceTag =
  ADTextStyle600.size16.copyWith(color: const Color(0xff1d740a));

  static TextStyle size18Green10 =
  ADTextStyle600.size18.copyWith(color: ADColors.green.shade900);

  static TextStyle size24White =
  ADTextStyle600.size24.copyWith(color: ADColors.white);

  static TextStyle size12Black =
  ADTextStyle600.size12.copyWith(color: const Color(0xff222222));
  static TextStyle size18darkBlue =
  ADTextStyle600.size18.copyWith(color: const Color(0xff397af1));

  ///todo color directely use  (Color(0xff333333))
  static TextStyle size18zBlack =
  ADTextStyle500.size18.copyWith(color: const Color(0xff333333));

  static TextStyle size20zBlack =
  ADTextStyle500.size20.copyWith(color: const Color(0xff333333));

  static TextStyle size12LightGrey = ADTextStyle600.size12
      .copyWith(color: const Color.fromRGBO(193, 194, 199, .9));
}

///All the basic Medium TextStyles which define in the adani style guide.
class ADTextStyle500 {
  static TextStyle size32 = _textStyle(32);
  static TextStyle size28 = _textStyle(28);
  static TextStyle size26 = _textStyle(26);
  static TextStyle size24 = _textStyle(24);
  static TextStyle size22 = _textStyle(22);
  static TextStyle size20 = _textStyle(20);
  static TextStyle size18 = _textStyle(18);
  static TextStyle size16 = _textStyle(16);
  static TextStyle size14 = _textStyle(14);
  static TextStyle size12 = _textStyle(12);
  static TextStyle size10 = _textStyle(10);
  static TextStyle size8 = _textStyle(8);

  // static double widthOfScreen =
  //     WidgetsBinding.instance!.window.physicalSize.width /
  //         WidgetsBinding.instance!.window.devicePixelRatio;

  //fontSize:AppTextStyles.widthOfScreen / designDefaultScreenWidth * width,
  static TextStyle _textStyle(double size) {
    return TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
        color: ADColors.black.shade900);
  }
}

///All other Medium TextStyles which define in the adani style guide.
@Deprecated(
    'Use ADTextStyle500.size16.copyWith(color: context.adColors.yourColorName in project file')
class ADTextStyleVariants500 {
  ///SF Pro Display Medium
  static TextStyle size12Black6 =
  ADTextStyle500.size12.copyWith(color: ADColors.black.shade500);

  static TextStyle size12Blue6 =
  ADTextStyle500.size12.copyWith(color: ADColors.blue.shade500);

  static TextStyle size12Blue10 =
  ADTextStyle500.size12.copyWith(color: ADColors.blue.shade900);

  static TextStyle size12Blue =
  ADTextStyle500.size12.copyWith(color: const Color(0xff027bff));

  static TextStyle size16Black6 =
  ADTextStyle500.size12.copyWith(color: ADColors.black.shade500);

  static TextStyle size16Blue10 =
  ADTextStyle500.size16.copyWith(color: ADColors.blue.shade900);

  static TextStyle size16White =
  ADTextStyle500.size16.copyWith(color: ADColors.white);

  static TextStyle size16Black4 =
  ADTextStyle500.size16.copyWith(color: ADColors.black.shade300);

  static TextStyle size14Blue10 =
  ADTextStyle500.size14.copyWith(color: ADColors.blue.shade900);

  static TextStyle size14Black7 =
  ADTextStyle500.size14.copyWith(color: ADColors.black.shade600);

  static TextStyle size14zBlack =
  ADTextStyle500.size14.copyWith(color: const Color(0xff333333));

  static TextStyle size14BlackPrimary =
  ADTextStyle500.size14.copyWith(color: const Color(0xff333333));

  static TextStyle size14White =
  ADTextStyle500.size14.copyWith(color: ADColors.white);

  static TextStyle size12Grey =
  ADTextStyle500.size12.copyWith(color: const Color(0xff666666));

  static TextStyle size12LightGrey = ADTextStyle500.size12
      .copyWith(color: const Color.fromRGBO(193, 194, 199, .9));

  static TextStyle size14Grey =
  ADTextStyle500.size14.copyWith(color: const Color(0xff666666));

  static TextStyle size12DarkGrey =
  ADTextStyle500.size12.copyWith(color: const Color(0xff555555));

  static TextStyle size12GreyStrikeThrough = ADTextStyle500.size12.copyWith(
      color: const Color(0xff666666), decoration: TextDecoration.lineThrough);

  static TextStyle size14GreyStrikeThrough = ADTextStyle500.size14.copyWith(
      color: const Color(0xff666666), decoration: TextDecoration.lineThrough);

  static TextStyle size16Grey2 =
  ADTextStyle500.size16.copyWith(color: const Color(0xff555555));

  static TextStyle size16Blue6 =
  ADTextStyle500.size16.copyWith(color: ADColors.blue.shade600);

  static TextStyle size16Black =
  ADTextStyle500.size16.copyWith(color: const Color(0xff222222));

  static TextStyle size12CircleGrey =
  ADTextStyle500.size12.copyWith(color: const Color(0xff888888));

  static TextStyle size18Grey =
  ADTextStyle500.size18.copyWith(color: const Color(0xff888888));

  static TextStyle size12White =
  ADTextStyle500.size12.copyWith(color: ADColors.white);

  static TextStyle size18White =
  ADTextStyle500.size18.copyWith(color: ADColors.white);

  static TextStyle size32White =
  ADTextStyle500.size32.copyWith(color: ADColors.white);

  static TextStyle size18RustyOrange =
  ADTextStyle500.size18.copyWith(color: const Color(0xd4d44817));

  static TextStyle size16RustyOrange =
  ADTextStyle500.size16.copyWith(color: const Color(0xd4d44817));

  static TextStyle size12RustyOrange =
  ADTextStyle500.size12.copyWith(color: const Color(0xd4d44817));

  static TextStyle size20White =
  ADTextStyle500.size20.copyWith(color: ADColors.white);

  static TextStyle size18zBlack =
  ADTextStyle500.size18.copyWith(color: const Color(0xff333333));

  static TextStyle size12GreenOffer =
  ADTextStyle500.size12.copyWith(color: const Color(0xff18aa26));

  static TextStyle size14Teal =
  ADTextStyle500.size14.copyWith(color: const Color(0xff002f47));

  static const weekdayStyle = TextStyle(
      color: Color(0xff222222),
      fontWeight: FontWeight.w500,
      fontFamily: 'SFProDisplay',
      fontStyle: FontStyle.normal,
      fontSize: 14);
}

///All the basic Regular TextStyles which define in the adani style guide.
class ADTextStyle400 {
  static TextStyle size32 = _textStyle(32);
  static TextStyle size28 = _textStyle(28);
  static TextStyle size26 = _textStyle(26);
  static TextStyle size24 = _textStyle(24);
  static TextStyle size22 = _textStyle(22);
  static TextStyle size20 = _textStyle(20);
  static TextStyle size18 = _textStyle(18);
  static TextStyle size16 = _textStyle(16);
  static TextStyle size14 = _textStyle(14);
  @Deprecated('only use even size')
  static TextStyle size13 = _textStyle(13);
  static TextStyle size12 = _textStyle(12);
  @Deprecated('only use even size')
  static TextStyle size11 = _textStyle(11);
  static TextStyle size10 = _textStyle(10);
  static TextStyle size8 = _textStyle(8);

  // static double widthOfScreen =
  //     WidgetsBinding.instance!.window.physicalSize.width /
  //         WidgetsBinding.instance!.window.devicePixelRatio;

  //fontSize:AppTextStyles.widthOfScreen / designDefaultScreenWidth * width,
  static TextStyle _textStyle(double size) {
    return TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        color: ADColors.black.shade900);
  }

  static const weekdayStyle = TextStyle(
      color: Color(0xff222222),
      fontWeight: FontWeight.w500,
      fontFamily: 'SFProDisplay',
      fontStyle: FontStyle.normal,
      fontSize: 14);
}

///All other Regular TextStyles which define in the adani style guide.
@Deprecated(
    'Use ADTextStyle400.size16.copyWith(color: context.adColors.yourColorName in project file\n\nBefore you change define the color in CustomColorScheme color_scheme_extension.dart')
class ADTextStyleVariants400 {
  ///SF Pro Display Regular

  static TextStyle size12Grey =
  ADTextStyle400.size12.copyWith(color: const Color(0xff666666));

  static TextStyle size12DarkGrey =
  ADTextStyle400.size12.copyWith(color: const Color(0xff555555));

  static TextStyle size12Red =
  ADTextStyle400.size12.copyWith(color: const Color(0xffe60000));

  static TextStyle size12Green =
  ADTextStyle400.size12.copyWith(color: const Color(0xff177f38));

  static TextStyle size14Grey =
  ADTextStyle400.size14.copyWith(color: const Color(0xff666666));

  static TextStyle size14InactiveGrey =
  ADTextStyle400.size14.copyWith(color: const Color(0xff666666));

  static TextStyle size14Green =
  ADTextStyle400.size14.copyWith(color: const Color(0xff32a851));

  static TextStyle size16Grey =
  ADTextStyle400.size16.copyWith(color: const Color(0xff666666));

  static TextStyle size12Black8 =
  ADTextStyle400.size12.copyWith(color: ADColors.black.shade700);

  static TextStyle size16Blue =
  ADTextStyle400.size16.copyWith(color: ADColors.blue.shade900);

  static TextStyle size16Black6 =
  ADTextStyle400.size16.copyWith(color: ADColors.black.shade500);

  static TextStyle size12White =
  ADTextStyle400.size12.copyWith(color: ADColors.white);

  static TextStyle size12TextGreen =
  ADTextStyle400.size12.copyWith(color: const Color(0xff32a851));

  static TextStyle size12GreyTextColor =
  ADTextStyle400.size12.copyWith(color: const Color(0xff999999));

  static TextStyle size12BlackPrimary =
  ADTextStyle400.size12.copyWith(color: const Color(0xff333333));

  static TextStyle size18HintGrey =
  ADTextStyle400.size18.copyWith(color: const Color(0xff8a8a8f));

  static TextStyle size18Black =
  ADTextStyle400.size18.copyWith(color: const Color(0xff222222));

  static TextStyle size18Grey =
  ADTextStyle400.size18.copyWith(color: const Color(0xff666666));

  static TextStyle size14black =
  ADTextStyle400.size14.copyWith(color: const Color(0xff222222));

  static TextStyle size12black =
  ADTextStyle400.size12.copyWith(color: const Color(0xff222222));

  static TextStyle size12RustyOrange =
  ADTextStyle400.size12.copyWith(color: const Color(0xd4d44817));

  static TextStyle size12GreenOffer =
  ADTextStyle400.size12.copyWith(color: const Color(0xff18aa26));

  static TextStyle size12LightGrey = ADTextStyle400.size12
      .copyWith(color: const Color.fromRGBO(193, 194, 199, .9));

  static const weekendStyle = TextStyle(
      color: Color(0xFF5A5A5A),
      fontWeight: FontWeight.w400,
      fontFamily: 'SFProDisplay',
      fontStyle: FontStyle.normal,
      fontSize: 14);

  static const holidayTextStyle = TextStyle(
      color: Color(0xFF5C6BC0),
      fontWeight: FontWeight.w400,
      fontFamily: 'SFProDisplay',
      fontStyle: FontStyle.normal,
      fontSize: 14);

  static const disabledTextStyle = TextStyle(
      color: Color(0xFFBFBFBF),
      fontWeight: FontWeight.w400,
      fontFamily: 'SFProDisplay',
      fontStyle: FontStyle.normal,
      fontSize: 14);

  static const outsideTextStyle = TextStyle(
      color: Color(0xff666666),
      fontWeight: FontWeight.w400,
      fontFamily: 'SFProDisplay',
      fontStyle: FontStyle.normal,
      fontSize: 14);

  static const withinRangeTextStyle = TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: 'SFProDisplay',
      fontStyle: FontStyle.normal,
      fontSize: 14);

  static const rangeStartTextStyle = TextStyle(
      color: Color(0xFFFAFAFA),
      fontWeight: FontWeight.w400,
      fontFamily: 'SFProDisplay',
      fontStyle: FontStyle.normal,
      fontSize: 14);

  static TextStyle size14White =
  ADTextStyle400.size14.copyWith(color: ADColors.white);

  static TextStyle size14black400 =
  ADTextStyle400.size14.copyWith(color: const Color(0xff222222));

  static TextStyle size16zBlack =
  ADTextStyle500.size16.copyWith(color: const Color(0xff333333));
}
