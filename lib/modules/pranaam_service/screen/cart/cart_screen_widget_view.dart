/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/components/sliver_app_bar_base_component.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/cart_screen.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/cart_screen_controller.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/view/cart_screen_body.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/view/cart_screen_bottom_bar.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/service_booking/widget_view/widgetview.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

///This contains the layout of cart screen.

///This is the cart screen which will show the items added in the cart and  add ons items.
const Color _closeIconColor = Color(0xff333333);

class CartScreenWidgetView
    extends WidgetView<CartScreen, CartScreenController> {
  CartScreenWidgetView(
    CartScreenController state, {
    Key? key,
  }) : super(
          state,
          key: key,
        );

  ///TODO
  final Color borderColor = const Color(0xffcacaca);
  final Color iconColor = const Color(0xffbbbbbb);
  final double horizontalPadding = 20.sp;
  final double topPadding = 25.sp;
  final double containerHeight = 100.sp;
  final int flex = 3;
  final int maxLines = 2;
  final double imageWidth = 99.sp;
  final double imageHeight = 86.sp;
  final double addOnsContainerHeight = 435.sp;

  // final double addOnsInnerContainerHeight = 190.sp;
  final int operationId = 2;

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);

    return Scaffold(
      bottomNavigationBar: CartScreenBottomBar(
        state: state,
      ),
      body: widget.showTopBar
          ? SliverAppBarBaseComponent(
              appBarLeftPadding: context.k_4,
              flexibleTitleTopPadding: context.k_20,
              titleTextStyle: ADTextStyle700.size32,
              leadingTitleTextStyle: ADTextStyle700.size22,
              closeScreenWidget: InkWell(
                onTap: () => state.clickOnCrossButton(context),
                child: Padding(
                  padding: EdgeInsets.all(context.k_12),
                  child: SvgPicture.asset(
                    SvgAssets.closeIcon,
                    height: context.k_14,
                    width: context.k_14,
                    color: _closeIconColor,
                  ),
                ),
              ),
              body: CartScreenBody(
                state: state,
              ),
              title: 'cart'.localize(context),
            )
          : CartScreenBody(
              state: state,
            ),
    );
  }
}
