import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class RepublicImageWithText extends StatelessWidget {
  const RepublicImageWithText({
    Key? key,
    required this.item,
  }) : super(key: key);
  final DutyFreeDashboardItem item;

  @override
  Widget build(BuildContext context) {
    final double zeroPoint54 = item.aspectRatio ?? 0.5;
    const double spacing = 1.4;

    return Column(
      children: [
        Container(
          height: context.widthOfScreen * zeroPoint54,
          width: context.widthOfScreen,
          color: context.adColors.containerGreyBg,
          child: ADCachedImage(
            imageUrl: item.widgetItems?.first.mobileImagesrc ?? '',
          ),
        ),
        Text(
          item.widgetItems?.first.description ?? '',
          style: ADTextStyle400.size16
              .setTextColor(context.adColors.black)
              .copyWith(height: spacing),
        ).paddingBySide(
          left: context.k_16,
          right: context.k_16,
          top: context.k_30,
        ),
      ],
    );
  }
}
