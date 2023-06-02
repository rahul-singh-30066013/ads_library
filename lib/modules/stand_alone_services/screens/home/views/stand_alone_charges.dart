import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/pranaam_dashboard_site_core/pranaam_dashboard_site_core_response.dart'
    as pranaam_dashboard;
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class StandAloneCharges extends StatelessWidget {
  final pranaam_dashboard.DashboardItem item;

  const StandAloneCharges({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color greyBorderColor = Color(0xffdee2e6);
    return item.widgetItems.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                (item.widgetItems.firstOrNull?.pranaamPackage.title.isEmpty ??
                        true)
                    ? 'charges'.localize(context)
                    : item.widgetItems.firstOrNull?.pranaamPackage.title ?? '',
                style: ADTextStyle700.size22,
              ).paddingBySide(left: context.k_10),
              ADSizedBox(
                height: context.k_20,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: item
                    .widgetItems.firstOrNull?.pranaamPackage.cards.items.length,
                itemBuilder: (context, index) {
                  final widthOfImage = 80.sp;
                  final data =
                      item.widgetItems.firstOrNull?.pranaamPackage.cards.items;
                  return Container(
                    padding: EdgeInsets.all(context.k_20),
                    margin: EdgeInsets.only(
                      bottom: index != ((data?.length ?? 0) - 1)
                          ? (item.subItemMargin.bottom).sp
                          : 0,
                      right: (item.subItemMargin.right).sp,
                      left: (item.subItemMargin.left).sp, //context.k_10,
                      top: (item.subItemMargin.top).sp,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(context.k_8),
                      border: Border.all(color: greyBorderColor),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.widgetItems.first.pranaamPackage.cards
                                    .items[index].title,
                                style: ADTextStyle700.size16,
                              ).paddingBySide(bottom: context.k_6),
                              Text(
                                item.widgetItems.first.pranaamPackage.cards
                                    .items[index].cardDesc,
                                style: ADTextStyle400.size14.setTextColor(
                                  context.adColors.greyTextColor,
                                ),
                                softWrap: true,
                              ).paddingBySide(bottom: context.k_6),
                              Text(
                                '₹${item.widgetItems.first.pranaamPackage.cards.items[index].finalPrice}',
                                style: ADTextStyle700.size16,
                              ),
                            ],
                          ),
                        ),
                        ADSizedBox(
                          width: context.k_20,
                        ),
                        ADCachedImage(
                          imageUrl: item.widgetItems.first.pranaamPackage.cards
                              .items[index].mobileImage,
                          width: widthOfImage,
                          height: widthOfImage,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ).paddingBySide(
            top: (item.itemMargin.top).sp,
            left: (item.itemMargin.left).sp,
            right: (item.itemMargin.right).sp,
            bottom: (item.itemMargin.bottom).sp,
          )
        : const SizedBox.shrink();
  }
}
