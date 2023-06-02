import 'dart:convert';

import 'package:adani_airport_mobile/utils/force_upgrade/app_config_model/app_constant_remote_model.dart';
import 'package:adani_airport_mobile/utils/force_upgrade/remote_config_service.dart';

/// this class is use for Remote app constants using firebase
class AppConstantRemote {
  static final AppConstantRemote _appConfig = AppConstantRemote._internal();
  AppConstantRemoteModel? appConstantRemoteModel;

  factory AppConstantRemote() {
    return _appConfig;
  }

  AppConstantRemote._internal();

  Future<AppConstantRemoteModel?> init() async {
    final jsonString =
        RemoteConfigService().getInstance().getString('app_constants');

    if (jsonString.isNotEmpty) {
      appConstantRemoteModel =
          AppConstantRemoteModel.fromJson(json.decode(jsonString));
    }
    return appConstantRemoteModel;
  }
}
