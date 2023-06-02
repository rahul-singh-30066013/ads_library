import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class CurrencyDetailView extends StatelessWidget {
  const CurrencyDetailView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double lineSpacing = 1.5;
    const double topPadding = 3;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ADSizedBox(
          height: context.k_40,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                style: ADTextStyle500.size16
                    .setTextColor(context.adColors.blackTextColor)
                    .copyWith(height: lineSpacing),
                text:
                    'To transfer your Induslnd Bank Reward Points to Club Vistara Points, cardholders must first register their Club Vistara membership ID with HDFC Bank.\n\n\n',
              ),
              TextSpan(
                style: ADTextStyle400.size16
                    .setTextColor(context.adColors.blackTextColor)
                    .copyWith(height: lineSpacing),
                text:
                    'Please follow the below steps to register and then transfer:',
              ),
            ],
          ),
        ),
        ADSizedBox(
          height: context.k_8,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: context.k_4.toInt(),
          itemBuilder: (BuildContext context, int index) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\u25CF',
                  style: ADTextStyle700.size12
                      .setTextColor(context.adColors.black),
                ).paddingBySide(right: context.k_8, top: topPadding),
                Expanded(
                  child: Text(
                    'Log in to your Net banking account Log in to your Net banking account',
                    style: ADTextStyle400.size14
                        .setTextColor(context.adColors.black)
                        .copyWith(height: lineSpacing),
                  ),
                ),
              ],
            ).paddingBySide(
              bottom: context.k_10,
            );
          },
        ),
      ],
    );
  }
}
