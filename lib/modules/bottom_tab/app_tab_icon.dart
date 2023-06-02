/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/badge/badge.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

const double selectedBorderWidth = 2;
const Color badgeColorCode = Color(0XFFFF453A);
double k_100 = 100.sp;

///this class used to tap cart icon.
class AppTabIcon extends StatelessWidget {
  const AppTabIcon({
    Key? key,
    required this.assetName,
    required this.selectedColor,
    this.cartName,
  }) : super(key: key);
  final String assetName;
  final Color selectedColor;
  final String? cartName;

  void animationStop(BuildContext context) {
    final AppSessionState appSessionState = context.read<AppSessionState>();
    debugPrint('testing...');
    appSessionState.animationVisibility = true;
    debugPrint('testing...');

    WidgetsBinding.instance.addPostFrameCallback((_) {
      appSessionState.notifyListeners();
      Future.delayed(
        const Duration(milliseconds: 1500),
        () => {
          appSessionState.animationVisibility = false,
          appSessionState.notifyListeners(),
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    adLog('app_tab_Icon $cartName');
    context.read<AppSessionState>().animationVisibility = false;
    if (cartName == 'more'.localize(context)) {
      context.read<AppSessionState>().getBalance();
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: context.k_2,
          decoration: BoxDecoration(
            gradient: selectedColor == context.adColors.whiteTextColor
                ? adGradientColorType3
                // ? context.adColors.adGradientThemeColor
                : LinearGradient(
                    colors: [
                      context.adColors.baseShimmerColor,
                      context.adColors.baseShimmerColor,
                    ],
                    // begin: Alignment(-1, -1),
                    // end: Alignment(1, 1),
                    stops: const [
                      0.0,
                      1,
                    ],
                  ),
          ),
        ),
        Expanded(
          child: Container(
            color: context.adColors.whiteTextColor,
            width: double.infinity,
            alignment: Alignment.center,
            child: cartName == 'cart_name'.localize(context)
                ? Selector<AppSessionState, int>(
                    selector: (_, provider) => provider.cartCount,
                    builder: (context, addItemListLength, child) {
                      return addItemListLength > 0
                          ? Stack(
                              alignment: Alignment.center,
                              children: [
                                Selector<AppSessionState, bool>(
                                  selector: (_, provider) =>
                                      provider.animationVisibility,
                                  builder: (context, visibility, child) {
                                    return visibility
                                        ? Image.asset(
                                            SvgAssets.cartAnimation,
                                            width: k_100,
                                            height: k_100,
                                          )
                                        : const SizedBox.shrink();
                                  },
                                ),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Badge(
                                      badgeColor: badgeColorCode,
                                      badgeContent: addItemListLength,
                                      child: ShowIcon(
                                        assetName: assetName,
                                        selectedColor: selectedColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : ShowIcon(
                              assetName: assetName,
                              selectedColor: selectedColor,
                            );
                    },
                  )
                : ShowIcon(
                    assetName: assetName,
                    selectedColor: selectedColor,
                  ),
          ),
        ),
      ],
    );
  }
}

class ShowIcon extends StatefulWidget {
  const ShowIcon({
    Key? key,
    required this.assetName,
    required this.selectedColor,
  }) : super(key: key);

  final String assetName;
  final Color selectedColor;

  @override
  State<ShowIcon> createState() => _ShowIconState();
}

class _ShowIconState extends State<ShowIcon> {
  AssetImage? tabItemGif;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabItemGif = AssetImage(widget.assetName);
  }

  @override
  void dispose() {
    final evict = tabItemGif?.evict();
    adLog(evict.toString());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.selectedColor != context.adColors.whiteTextColor
        ? SvgPicture.asset(
            widget.assetName,
            color: widget.selectedColor,
            width: context.k_20,
            height: context.k_20,
          )
        : Image.asset(
            widget.assetName,
            width: context.k_20,
            height: context.k_20,
          );
  }
}

class ShowGif extends StatefulWidget {
  const ShowGif({
    Key? key,
    required this.assetName,
  }) : super(key: key);

  final String assetName;

  @override
  State<ShowGif> createState() => _ShowGifState();
}

class _ShowGifState extends State<ShowGif> {
  AssetImage? tabItemGif;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabItemGif = AssetImage(widget.assetName);
  }

  @override
  void dispose() {
    final evict = tabItemGif?.evict();
    adLog(evict.toString());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      widget.assetName,
    );
  }
}
