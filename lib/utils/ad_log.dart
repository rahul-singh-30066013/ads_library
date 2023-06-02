/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:developer';

/// Emit a log event. wrapper above dev log provided by framework
///
/// This function was designed to map closely to the logging information
/// collected by `package:logging`.
///
/// - [message] is the log message
/// - [className] (optional) is the name of the source of the log message
void adLog(String? message, {Object? className}) {
  log(
    '⏰:-> ${DateTime.now()}'
    ' 📘:-> '
    '$message',
    name: className != null
        ? ' 📚️ ${className.runtimeType.toString()}'
        : ' 📚️ AD Airport APP',
  );
}
