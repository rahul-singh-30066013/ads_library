import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';

class VerifyEmailCallBackModel {
  final bool? changeScreenValue;
  final String? emailIdControllerValue;
  final ADTapCallbackWithValue? emailVerify;
  final String? sourceId;
  final bool? fromBottomSheet;

  VerifyEmailCallBackModel({
    this.changeScreenValue,
    this.emailIdControllerValue,
    this.emailVerify,
    this.sourceId,
    this.fromBottomSheet,
  });
}
