/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io';

import 'package:adani_airport_mobile/modules/food_and_shop/views/common_views/icon_inside_circle.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';

///this class is use to show sliverAppBar
class ADSliverAppBar extends StatelessWidget {
  /// this is used to define the height of header image
  final double _expansionHeaderHeight = 263.sp;

  /// the widget used to show in the sliver header
  final Widget child;

  ADSliverAppBar({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      actions: [
        IconInsideCircle(
          iconData: Icons.search,
          onPressed: () => onSearchPressed(),
        ),
      ],
      leading: IconInsideCircle(
        iconData: Platform.isIOS
            ? Icons.arrow_back_ios_outlined
            : Icons.arrow_back_outlined,
        onPressed: () => navigatorPopScreen(context),
      ),
      expandedHeight: context.scaled(_expansionHeaderHeight),
      flexibleSpace: FlexibleSpaceBar(
        background: child,
      ),
    );
  }

  void onSearchPressed() {
    ///TODO
  }
}
