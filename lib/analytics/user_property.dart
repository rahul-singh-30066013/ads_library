/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

// ignore_for_file: constant_identifier_names

import 'package:adani_airport_mobile/analytics/analytics.dart';

enum UserProperty {
  is_guest,
  user_property,
}

extension UserPropertyExtension on UserProperty {
  void set({required Object value}) {
    Analytics().logUserProperty(property: name, value: value);
  }
}
