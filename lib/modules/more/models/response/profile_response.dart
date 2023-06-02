import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_response.freezed.dart';
part 'profile_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ProfileResponse with _$ProfileResponse {
  const factory ProfileResponse({
    bool? isProfileUpdated,
    String? message,
  }) = _ProfileResponse;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}
