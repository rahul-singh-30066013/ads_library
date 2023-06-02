/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/dashboard_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/gradient_configuration.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/grid_configuration.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/sub_item_colors.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/tab_configuration.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'duty_free_dashboard_item.freezed.dart';
part 'duty_free_dashboard_item.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class DutyFreeDashboardItem with _$DutyFreeDashboardItem {
  const factory DutyFreeDashboardItem(
    int? widgetId,
    String? widgetType,
    String? variable,
    double? aspectRatio,
    ItemMargin? itemMargin,
    ItemMargin? subItemMargin,
    double? subItemWidth,
    double? subItemRadius,
    String? title,
    String? subTitle,
    ActionTitle? actionTitle,
    int? gridColumn,
    String? deepLink,
    List<DutyFreeItem>? widgetItems,
    List<dynamic>? customItems,
    CarouselParam? carouselParam, {
    GridConfiguration? gridConfiguration,
    TabConfiguration? tabConfiguration,
    @Default(true) bool enableCircle,
    @Default('') String backgroundColor,
    GradientConfiguration? gradientConfiguration,
    @Default(SubItemColors()) SubItemColors subItemColors,
  }) = _DutyFreeDashboardItem;

  factory DutyFreeDashboardItem.fromJson(Map<String, dynamic> json) =>
      _$DutyFreeDashboardItemFromJson(json);
}
