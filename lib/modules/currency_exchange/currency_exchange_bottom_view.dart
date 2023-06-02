import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class CurrencyExchangeBottomView extends StatelessWidget {
  CurrencyExchangeBottomView({Key? key}) : super(key: key);
  final double buttonHeight = 192.sp;
  final double buttonWidth = 38.sp;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          child: Container(
            height: context.k_2,
            margin: EdgeInsets.only(
              bottom: context.k_2,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: context.adColors.greyReviewShade,
                  offset: const Offset(0, 1),
                  blurRadius: context.k_2,
                ),
              ],
            ),
          ),
        ),
        ADSizedBox(
          height: context.k_20,
        ),
        Align(
          child: GestureDetector(
            onTap: () => {},
            child: Container(
              width: buttonHeight,
              height: buttonWidth,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(19),
                ),
                color: Color(0xff0d67ca),
              ),
              child: Center(
                child: Text(
                  'Convert Now',
                  style: ADTextStyle600.size14.setTextColor(
                    context.adColors.whiteTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        ADSizedBox(
          height: context.k_26,
        ),
      ],
    );
  }
}
