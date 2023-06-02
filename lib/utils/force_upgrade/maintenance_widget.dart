/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screens/catalog/views/filters_list_view.dart';
import 'package:adani_airport_mobile/utils/force_upgrade/app_config.dart';
import 'package:adani_airport_mobile/utils/progress_animation/ad_dot_progress_view.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

class MaintenanceWidget extends StatefulWidget {
  const MaintenanceWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MaintenanceWidget> createState() => _MaintenanceWidgetState();
}

class _MaintenanceWidgetState extends State<MaintenanceWidget> {
  final sizeConstant = 200.0;
  final heightConstant = 32.0;
  final btnWidth = 256;
  final btnHeight = 48;
  final bottomPaddingConst = 10;
  final buttonHeight = 56.0;
  final buttonWidth = 150.0;
  final borderWidth = 1.0;
  final ValueNotifier<bool> isRetry = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.adColors.whiteTextColor,
      body: WillPopScope(
        onWillPop: () => Future.value(false),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: context.scaled(sizeConstant),
              height: context.scaled(sizeConstant),
              child: Image.asset(
                'lib/assets/images/common/internal_server_error.gif',
              ),
            ),
            const SizedBox(
              height: k_20,
            ),
            Text(
              'Whoops! Something went wrong',
              style: ADTextStyle700.size24.copyWith(
                color: context.adColors.blackTextColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: k_20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: context.k_48),
              child: Text(
                'Hang tight, we’re on it. Please try again soon.',
                textAlign: TextAlign.center,
                style: ADTextStyle400.size14.copyWith(
                  color: context.adColors.greyTextColor,
                ),
              ),
            ),
            SizedBox(height: heightConstant),
            Center(
              child: Container(
                height: buttonHeight,
                width: buttonWidth,
                child: ValueListenableBuilder(
                  builder: (context, bool value, child) => ElevatedButton(
                    onPressed: () => {
                      isRetry.value = true,
                      if (!(AppConfig().appConfigModel?.isMaintenance ?? false))
                        {
                          navigateUsingPushReplacementNamed(
                            context,
                            tabRoute,
                          ),
                        }
                      else
                        {
                          isRetry.value = false,
                        },
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                      ),
                      backgroundColor: ADColors.white,
                      side: BorderSide(
                        width: borderWidth,
                        color: ADColors.black,
                      ),
                    ),
                    child: value
                        ? ADDotProgressView(
                            color: context.adColors.blackTextColor,
                          )
                        : Center(
                            child: Text(
                              'OK, got it!',
                              style: ADTextStyle500.size14
                                  .setTextColor(context.adColors.blackColor),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ).paddingBySide(
                              top: context.k_16,
                              bottom: context.k_16,
                            ),
                          ),
                  ),
                  valueListenable: isRetry,
                ),
              ),
            ),
          ],
        ).paddingBySide(bottom: bottomPaddingConst.sp),
      ),
    );
  }
}
