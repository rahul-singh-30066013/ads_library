/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/main/configuration/base_config.dart';

/// Environment class is used to assign flavour for app like debug, staging,
/// prod
class Environment {
  Environment._privateConstructor();

  static final Environment _instance = Environment._privateConstructor();

  BaseConfig _configuration = DevConfig();

  static Environment get instance => _instance;

  /// function is used to set Configuration
  void setConfig(AppFlavor environment) {
    _configuration = _getConfig(environment);
  }

  /// function is used to return Configuration
  /// return [BaseConfig]
  BaseConfig get configuration => _configuration;

  BaseConfig _getConfig(AppFlavor appFlavour) {
    switch (appFlavour) {
      case AppFlavor.prod:
        return ProdConfig();
      case AppFlavor.staging:
        return StagingConfig();
      case AppFlavor.uat:
        return UatConfig();
      default:
        return DevConfig();
    }
  }
}
