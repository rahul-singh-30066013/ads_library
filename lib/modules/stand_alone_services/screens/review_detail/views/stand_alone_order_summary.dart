import 'package:adani_airport_mobile/modules/pranaam_service/screen/confirmation/view/product_view.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class StandAloneOrderSummary extends StatelessWidget {
  const StandAloneOrderSummary({
    Key? key,
    required this.image,
    required this.name,
    required this.packagePrice,
    required this.packageType,
    required this.quantity,
  }) : super(key: key);
  final String image;
  final String name;
  final String packagePrice;
  final String packageType;
  final String quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.k_16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ADSizedBox(
            height: context.k_20,
          ),
          Text(
            'order_summary'.localize(context),
            style: ADTextStyle700.size22,
          ),
          ADSizedBox(
            height: context.k_16,
          ),
          ProductView(
            standAloneName: name,
            standAloneImage: image,
            isAddOn: true,
            image: image,
            packagePrice: packagePrice,
            packageType: packageType,
            quantity: quantity,
          ),
        ],
      ),
    );
  }
}
