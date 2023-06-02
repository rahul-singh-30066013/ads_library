import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_dashboard_site_core_response.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class CorporateEmpView extends StatelessWidget {
  final WidgetItem widgetItem;
  const CorporateEmpView({Key? key, required this.widgetItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double height = 90;
    const double imageHeight = 60;
    const double imageWidth = 60;

    return GestureDetector(
      onTap: () => {},
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(context.k_6),
          ),
          border: Border.all(
            color: context.adColors.widgetDividerLine,
          ),
        ),
        child: Row(
          children: [
            ADSizedBox(
              width: context.k_22,
            ),
            SizedBox(
              height: imageHeight,
              width: imageWidth,
              child: Image.network(
                widgetItem.mobileImage,
                fit: BoxFit.fill,
              ),
            ).paddingBySide(
              bottom: context.k_16,
            ),
            ADSizedBox(
              width: context.k_22,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widgetItem.title,
                  style: ADTextStyle600.size18
                      .setTextColor(context.adColors.blackColor),
                ),
                ADSizedBox(
                  height: context.k_6,
                ),
                Text(
                  widgetItem.buttonText,
                  style: ADTextStyle500.size14
                      .setTextColor(context.adColors.neutralInfoMsg)
                      .copyWith(
                        decoration: TextDecoration.underline,
                      ),
                ),
              ],
            ).paddingBySide(
              top: context.k_20,
              bottom: context.k_20,
            ),
          ],
        ),
      ),
    );
  }
}
