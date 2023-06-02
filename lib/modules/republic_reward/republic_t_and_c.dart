import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class RepublicTAndC extends StatelessWidget {
  const RepublicTAndC({
    Key? key,
    required this.rewardTAndC,
  }) : super(key: key);
  final List<RepublicRewardTAndC> rewardTAndC;

  @override
  Widget build(BuildContext context) {
    const double spacing = 1.6;
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: rewardTAndC.length,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DotWidget(
              size: context.k_6,
              color: context.adColors.black,
            ).paddingBySide(
              right: context.k_8,
              top: context.k_10,
            ),
            Expanded(
              child: Text(
                rewardTAndC[index].list ?? '',
                style: ADTextStyle400.size16
                    .setTextColor(context.adColors.black)
                    .copyWith(height: spacing),
              ),
            ),
          ],
        ).paddingBySide(
          bottom: context.k_10,
        );
      },
    ).paddingBySide(
      left: context.k_16,
      right: context.k_16,
    );
  }
}
