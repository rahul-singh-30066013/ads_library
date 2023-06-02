import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class ConvertUnUsedPoints extends StatelessWidget {
  const ConvertUnUsedPoints({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double height = 403;
    const double imageHeight = 135;
    const double imageWidth = 198;
    const double lineSpacing = 1.5;

    return Container(
      height: height,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        color: Color(0xff0d67ca),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ADSizedBox(
            height: context.k_20,
          ),
          Text(
            '''Don't let your Reward Points expire!''',
            style: ADTextStyle700.size18
                .setTextColor(context.adColors.whiteTextColor),
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
          ),
          ADSizedBox(
            height: context.k_10,
          ),
          Text(
            'Convert your unused points today and redeem them for exciting rewards on Adani One.',
            style: ADTextStyle400.size14
                .setTextColor(context.adColors.whiteTextColor)
                .copyWith(height: lineSpacing),
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
          ),
          ADSizedBox(
            height: context.k_20,
          ),
          Center(
            child: SizedBox(
              height: imageHeight,
              width: imageWidth,
              child: Image.network(
                '',
                fit: BoxFit.fill,
              ),
            ),
          ),
          ADSizedBox(
            height: context.k_48,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CommonPointsView(
                points: 'Book Flights,\nCabs & services',
              ),
              CommonPointsView(
                points: 'Get exclusive\nDiscounts & Offers',
              ),
              CommonPointsView(
                points: 'Earn with every\nspend',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CommonPointsView extends StatelessWidget {
  final double errorImageHeight_28 = 28.sp;
  final double errorImageWidth_28 = 28.sp;
  final double k_50 = 0.5;
  final String points;

  CommonPointsView({Key? key, required this.points}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          SvgAssets.offers,
          height: errorImageHeight_28,
          width: errorImageWidth_28,
          color: context.adColors.whiteTextColor,
        ),
        ADSizedBox(
          height: context.k_10,
        ),
        Text(
          points,
          style: ADTextStyle500.size12.copyWith(
            color: context.adColors.whiteTextColor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ).paddingBySide(
      bottom: context.k_30,
    );
  }
}
