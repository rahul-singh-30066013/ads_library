/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///class used to have app name and app environment for app.
class AppBuildConfig extends ChangeNotifier {
  AppBuildConfig({
    required this.appName,
    required this.appEnvironment,
  });

  String appName;
  Environment appEnvironment;
}
