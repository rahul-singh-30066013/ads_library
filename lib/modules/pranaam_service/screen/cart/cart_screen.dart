/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/cart_screen_controller.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/cart_screen_widget_view.dart';
import 'package:flutter/cupertino.dart';

///
///This is the entry point of cart screen which further redirects to [CartScreenController]
///Widget View is implemented to separate business logic and layout.
///Business Logic is in [CartScreenController]
///Layout is in [CartScreenWidgetView]
///
class CartScreen extends StatefulWidget {
  final bool showTopBar;
  final ScrollController? scrollController;
  final bool isFromUpgrade;
  const CartScreen({
    Key? key,
    required this.showTopBar,
    this.scrollController,required this.isFromUpgrade,
  }) : super(key: key);

  @override
  CartScreenController createState() => CartScreenController();
}
