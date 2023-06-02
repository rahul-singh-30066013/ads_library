import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_image_response.freezed.dart';

part 'profile_image_response.g.dart';

@freezed
class ProfileImageResponse with _$ProfileImageResponse {
  const factory ProfileImageResponse({
    String? byteArray,
    String? name,
    String? contentType,
  }) = _ProfileImageResponse;

  factory ProfileImageResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileImageResponseFromJson(json);
}
