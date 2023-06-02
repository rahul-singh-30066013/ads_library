/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:freezed_annotation/freezed_annotation.dart';

part 'duty_free_material_group_banner.freezed.dart';
part 'duty_free_material_group_banner.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class DutyFreeMaterialGroupBanner with _$DutyFreeMaterialGroupBanner {
  const factory DutyFreeMaterialGroupBanner({
    @Default('') String title,
    @Default('') String description,
    @Default('') String imageSrc,
    @Default('') String ctaLink,
    @Default('') String ctaText,
  }) = _DutyFreeMaterialGroupBanner;

  factory DutyFreeMaterialGroupBanner.fromJson(Map<String, dynamic> json) =>
      _$DutyFreeMaterialGroupBannerFromJson(json);
}
