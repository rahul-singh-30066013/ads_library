/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/screen/addons/select_add_on_quantity_controller.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';

class SelectAddOnQuantityScreen extends StatefulWidget {
  static const _itemCount = 15;

  const  SelectAddOnQuantityScreen({
    Key? key,
    required this.adGenericCallback,
    this.itemCounts = _itemCount,
    required this.selectedIndexNotifier,
  }) : super(key: key);
  final ADGenericCallback adGenericCallback;
  final int itemCounts;
  final ValueNotifier<int> selectedIndexNotifier;

  @override
  SelectAddOnQuantityController createState() =>
      SelectAddOnQuantityController();
}
