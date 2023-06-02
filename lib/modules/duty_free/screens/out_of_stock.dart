import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';

class OutOfStock extends StatelessWidget {
  const OutOfStock({Key? key, this.textStyle, this.fixedSize}) : super(key: key);

  final TextStyle? textStyle;
  final Size? fixedSize;
  static const Color outOfStockColor = Color(0xfff3f3f3);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: outOfStockColor,
        elevation: 0,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.k_28),
        ),
        fixedSize: fixedSize,
      ),
      //onPressed: null,
      onPressed: () => {adLog('message')},
      child: Text(
        'out_of_stock'.localize(context),
        textAlign: TextAlign.center,
        style: textStyle ??
            ADTextStyle400.size16.setTextColor(
              context.adColors.darkGreyTextColor,
            ),
      ),
    );
  }
}
