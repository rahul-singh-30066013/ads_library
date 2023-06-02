import 'package:adani_airport_mobile/modules/pranaam_service/model/pranaam_dashboard_site_core/pranaam_dashboard_site_core_response.dart'
    as pranaam_dashboard;
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

class BannerView extends StatelessWidget {
  final pranaam_dashboard.DashboardItem item;

  const BannerView({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return item.widgetItems.isNotEmpty
        ? Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Image.network(
            item.widgetItems.first.imageSrc,
            fit: BoxFit.fill,
          ),
        ).paddingBySide(
            left: (item.itemMargin.left).sp,
            right: (item.itemMargin.right).sp,
            top: (item.itemMargin.top).sp,
            bottom: (item.itemMargin.bottom).sp,
          )
        : const SizedBox.shrink();
  }
}
