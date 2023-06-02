/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/material.dart';

///Common model to display price details for each module
class PriceDetailModel {
  final String key;
  final String value;
  final Color color;
  final bool? showInfoIcon;

  PriceDetailModel({
    required this.key,
    required this.value,
    required this.color,
    this.showInfoIcon,
  });
}
