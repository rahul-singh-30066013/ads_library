/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class OpenSettingView extends StatefulWidget {
  final ADTapCallback onTap;
  final String title;

  const OpenSettingView({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  State<OpenSettingView> createState() => _OpenSettingViewState();
}

class _OpenSettingViewState extends State<OpenSettingView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title,
            style: ADTextStyle400.size16.setTextColor(
              context.adColors.neutralInfoMsg,
            ),
          ),
          ADSizedBox(
            height: context.k_30,
          ),
          Row(
            children: [
              Expanded(
                child: ADSizedBox(
                  height: context.k_48,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(context.k_24),
                        ),
                        side: BorderSide(
                          color: context.adColors.blackTextColor,
                        ),
                      ),
                      backgroundColor: context.adColors.whiteTextColor,
                    ),
                    child: Text(
                      'no_thanks'.localize(context),
                      style: ADTextStyle400.size16
                          .setTextColor(context.adColors.blackTextColor),
                    ),
                  ),
                ),
              ),
              ADSizedBox(
                width: context.k_20,
              ),
              Expanded(
                child: ADSizedBox(
                  height: context.k_48,
                  child: ElevatedButton(
                    onPressed: () => {
                      widget.onTap.call(),
                      Navigator.pop(context),
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(context.k_24),
                        ),
                      ),
                      backgroundColor: context.adColors.blackTextColor,
                    ),
                    child: Text(
                      'ok'.localize(context),
                      style: ADTextStyle700.size16.setTextColor(
                        context.adColors.whiteTextColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ).paddingBySide(
        left: context.k_16,
        right: context.k_16,
      ),
    );
  }
}
