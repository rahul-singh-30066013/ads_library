/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';

// Use this extension to wrap a widget inside a GestureDetector, to reduce boiler-plate code
extension TappableWidget on Widget {
  Widget onTap(Function() onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: this,
    );
  }
}
