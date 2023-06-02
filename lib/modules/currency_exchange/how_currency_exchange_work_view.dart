import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class HowCurrencyExchangeWorkView extends StatelessWidget {
  final num index;
  final String title;
  final String description;
  final String img;

  const HowCurrencyExchangeWorkView({
    required this.index,
    required this.title,
    required this.description,
    required this.img,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double containerWidth = 216.sp;
    const double lineSpacing = 1.6;
    final double iconHeight = 58.sp;
    final double iconWidth = 58.sp;
    const int maxLines = 4;
    const Color whiteShadowColor = Color(0x0a000000);
    return Container(
      width: containerWidth,
      height: context.heightOfScreen,
      padding: EdgeInsets.symmetric(
        horizontal: context.k_16,
        vertical: context.k_24,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        border: Border.all(color: const Color(0xffe2e2e2)),
        borderRadius: const BorderRadius.all(Radius.circular(1)),
        boxShadow: [
          BoxShadow(
            color: whiteShadowColor,
            blurRadius: context.k_4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          ADSizedBox(height: context.k_20),
          ADSizedBox(
            height: iconHeight,
            width: iconWidth,
            child: Image.network(
              img,
            ),
          ),
          ADSizedBox(height: context.k_30),
          Text(
            title,
            textAlign: TextAlign.center,
            style: ADTextStyle700.size18
                .setTextColor(context.adColors.blackTextColor),
          ),
          ADSizedBox(
            height: context.k_8,
          ),
          Text(
            description,
            style: ADTextStyle400.size14.copyWith(
              color: context.adColors.darkGreyTextColor,
              height: lineSpacing,
            ),
            textAlign: TextAlign.center,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ).paddingBySide(
      right: context.k_20,
    );
  }
}
