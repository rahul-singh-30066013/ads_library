import 'package:freezed_annotation/freezed_annotation.dart';

part 'tab_configuration.freezed.dart';
part 'tab_configuration.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class TabConfiguration with _$TabConfiguration {
  const factory TabConfiguration({
    @Default('') String tabColor,
    @Default('') String tabSelectedColor,
    @Default('') String tabTextSelectedColor,
    @Default('') String tabTextColor,
  }) = _TabConfiguration;

  factory TabConfiguration.fromJson(Map<String, dynamic> json) =>
      _$TabConfigurationFromJson(json);
}
