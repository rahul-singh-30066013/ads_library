/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/pranaam_dashboard_site_core/pranaam_dashboard_site_core_response.dart'
    as pranaam_dashboard;
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

class AboutPranaam extends StatefulWidget {
  const AboutPranaam({Key? key, required this.item}) : super(key: key);

  final pranaam_dashboard.DashboardItem item;

  ///[item], variable is used to maintain dashboard reference
  @override
  State<AboutPranaam> createState() => _AboutPranaamState();
}

class _AboutPranaamState extends State<AboutPranaam> {
  final ValueNotifier<bool> _isExpanded = ValueNotifier(false);

  @override
  void dispose() {
    _isExpanded.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final widgetItem = widget.item.widgetItems.isNotEmpty
        ? widget.item.widgetItems.first
        : const pranaam_dashboard.WidgetItem();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widgetItem.title,
          style: ADTextStyle700.size22
              .copyWith(color: context.adColors.blackTextColor),
        ).paddingBySide(
          left: context.k_16,
          right: context.k_16,
          bottom: context.k_13,
        ),
        ValueListenableBuilder(
          valueListenable: _isExpanded,
          builder: (context, bool value, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                itemCount: value
                    ? widgetItem.appDesc.length
                    : widgetItem.appDesc.isNotEmpty
                        ? 1
                        : 0,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  const lineHeight = 1.5;
                  return Text(
                    widgetItem.appDesc[index],
                    style: ADTextStyle400.size16.copyWith(
                      color: context.adColors.blackTextColor,
                      height: lineHeight,
                    ),
                  ).paddingBySide(
                    left: context.k_16,
                    right: context.k_16,
                    bottom: context.k_19,
                  );
                },
              ),
              if (widgetItem.appDesc.length > 1)
                TouchableOpacity(
                  onTap: () => _isExpanded.value = !_isExpanded.value,
                  child: value
                      ? Text(
                          'read_less'.localize(context),
                          style: ADTextStyle400.size16
                              .copyWith(color: context.adColors.blackTextColor)
                              .copyWith(
                                decoration: TextDecoration.underline,
                              ),
                        ).paddingBySide(
                          right: context.k_16,
                        )
                      : Text(
                          widgetItem.appbtnText.validateWithDefaultValue(
                            defaultValue: 'read_more'.localize(context),
                          ),
                          style: ADTextStyle400.size16
                              .copyWith(color: context.adColors.blackTextColor)
                              .copyWith(
                                decoration: TextDecoration.underline,
                              ),
                        ).paddingBySide(
                          right: context.k_16,
                        ),
                ).paddingBySide(
                  left: context.k_16,
                  right: context.k_16,
                  bottom: context.k_48,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
