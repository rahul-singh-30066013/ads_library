import 'package:freezed_annotation/freezed_annotation.dart';

part 'grid_configuration.freezed.dart';

part 'grid_configuration.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class GridConfiguration with _$GridConfiguration {
  const factory GridConfiguration({
    @Default(0) double crossAxisSpacing,
    @Default(0) double mainAxisSpacing,
    @Default(1) double itemVisibility,
    @Default(false) bool horizontalGrid,
  }) = _GridConfiguration;

  factory GridConfiguration.fromJson(Map<String, dynamic> json) =>
      _$GridConfigurationFromJson(json);
}
