import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class RefundContainer extends StatelessWidget {
  const RefundContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.k_20),
      margin: EdgeInsets.all(context.k_20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.k_4),
        color: const Color(0xfff4f9ff),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Refund Amount View',
            style: ADTextStyle700.size16,
          ).paddingBySide(bottom: context.k_12),
          Text(
            'Any amount deducted will be refunded to your payment source',
            style: ADTextStyle400.size14,
          ),
        ],
      ),
    );
  }
}
