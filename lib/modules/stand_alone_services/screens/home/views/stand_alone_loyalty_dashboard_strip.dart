import 'package:adani_airport_mobile/modules/components/loyalty_points_component.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/enums/review_screen_type.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/pranaam_dashboard_site_core/pranaam_dashboard_site_core_response.dart'
    as pranaam_dashboard;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

class StandAloneLoyaltyDashboardStrip extends StatelessWidget {
  final pranaam_dashboard.DashboardItem item;
  const StandAloneLoyaltyDashboardStrip({Key? key, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoyaltyPointsComponent(
      points: 1,
      customTextWidget: Text(item.widgetItems.firstOrNull?.title ?? ''),
      loyaltyShowScreenType: LoyaltyShowScreenType.pranaam,
    ).paddingBySide(
      left: item.itemMargin.left.sp,
      right: item.itemMargin.right.sp,
      top: item.itemMargin.top.sp,
      bottom: item.itemMargin.bottom.sp,
    );
  }
}
