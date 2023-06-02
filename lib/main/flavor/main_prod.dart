/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/airport_main.dart';
import 'package:adani_airport_mobile/main/configuration/app_build_config.dart';
import 'package:adani_airport_mobile/main/configuration/base_config.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';

/// Class is having flavour dimension for Prod build.It will have PROD
/// config like apiEndpoint app name etc.
void main() {
  Environment.instance.setConfig(AppFlavor.prod);

  final AppBuildConfig releaseConfig = AppBuildConfig(
    appName: appName,
    appEnvironment: Environment.instance,
  );

  runMainWith(releaseConfig);
}
