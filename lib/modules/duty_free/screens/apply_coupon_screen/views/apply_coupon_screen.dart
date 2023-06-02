/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screens/apply_coupon_screen/views/apply_coupon_controller.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/apply_coupon_screen/views/apply_coupon_widget_view.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';

///
///This is the entry point of apply coupon screen which further redirects to [ApplyCouponController]
///Widget View is implemented to separate business logic and layout.
///Business Logic is in [ApplyCouponController]
///Layout is in [ApplyCouponWidgetView]
///

class ApplyCouponScreen extends StatefulWidget {
  final double baseFareAmount;
  final ADGenericCallback adGenericCallback;

  const ApplyCouponScreen({
    Key? key,
    required this.baseFareAmount,
    required this.adGenericCallback,
  }) : super(key: key);

  @override
  ApplyCouponController createState() => ApplyCouponController();
}
