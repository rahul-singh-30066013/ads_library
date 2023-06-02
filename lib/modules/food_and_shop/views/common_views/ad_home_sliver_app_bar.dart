/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:io' show Platform;

import 'package:adani_airport_mobile/modules/flight_booking/screens/screen_helper/automation_keys/shop_list_automation_keys.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

///this class is use to show sliverAppBar at home
class ADHomeSliverAppBar extends StatelessWidget {
  final Widget title;
  final Widget flexibleSpace;
  final double expandedHeight;
  final ADTapCallback backTap;
  final ADTapCallback searchTap;
  final ADTapCallback favoriteTap;

  const ADHomeSliverAppBar({
    Key? key,
    required this.title,
    required this.flexibleSpace,
    required this.expandedHeight,
    required this.backTap,
    required this.searchTap,
    required this.favoriteTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      title: title,
      backgroundColor: context.theme.scaffoldBackgroundColor,
      leading: GestureDetector(
        behavior: HitTestBehavior.translucent,
        key: const Key(ShopListAutomationKeys.shopListBackTapKey),
        onTap: backTap,
        child: Icon(
          Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back_outlined,
          color: context.adColors.neutralInfoMsg,
        ).paddingBySide(left: context.k_4),
      ), //_customBackButton(context),
      expandedHeight: expandedHeight,
      flexibleSpace: flexibleSpace,
      actions: [
        GestureDetector(
          onTap: searchTap,
          behavior: HitTestBehavior.translucent,
          child: Icon(
            Icons.search_outlined,
            color: context.adColors.neutralInfoMsg,
            key: const Key(ShopListAutomationKeys.searchTapKey),
          ).paddingBySide(right: context.k_40),
        ),
        // IconButton(
        // onPressed: favoriteTap,
        // icon:
        GestureDetector(
          onTap: favoriteTap,
          behavior: HitTestBehavior.translucent,
          child: Icon(
            Icons.favorite_border,
            color: context.adColors.neutralInfoMsg,
            key: const Key(ShopListAutomationKeys.favTapKey),
          ).paddingBySide(right: context.k_20),
        ),
        // ),
      ],
    );
  }
}
