import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_item_colors.freezed.dart';
part 'sub_item_colors.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class SubItemColors with _$SubItemColors {
  const factory SubItemColors({
    @Default('0xffffffff') String titleColor,
    @Default('0xffffffff') String subTitleColor,
    @Default('0xffffffff') String descriptionColor,
    @Default('0xffffffff') String ctaColor,
    @Default('') String backGroundColor,
  }) = _SubItemColors;

  factory SubItemColors.fromJson(Map<String, dynamic> json) =>
      _$SubItemColorsFromJson(json);
}
