import 'package:freezed_annotation/freezed_annotation.dart';

part 'gradient_configuration.freezed.dart';
part 'gradient_configuration.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class GradientConfiguration with _$GradientConfiguration {
  const factory GradientConfiguration({
    @Default([]) List<String> gradientColors,
    @Default('') String gradientBegin,
    @Default('') String gradientEnd,
  }) = _GradientConfiguration;

  factory GradientConfiguration.fromJson(Map<String, dynamic> json) =>
      _$GradientConfigurationFromJson(json);
}
