/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/airport_landing_screen/models/web_view_model.dart';
import 'package:adani_airport_mobile/modules/loyalty/model/loyalty_dashboard_site_core_response.dart';
import 'package:adani_airport_mobile/modules/loyalty/screen_helper/automation_keys/loyalty_automation_keys.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///this class is used to provide faq section view on loyalty dashboard
class FAQView extends StatefulWidget {
  const FAQView({Key? key, required this.field}) : super(key: key);

  final Fields field;

  @override
  State<FAQView> createState() => _FAQViewState();
}

class _FAQViewState extends State<FAQView> {
  ///local variables
  final double _faqButtonHeight = 52.sp;
  final double _faqButtonWidth = 150.sp;
  final ValueNotifier<int> _isExpanded = ValueNotifier<int>(-1);
  final double lineSpacing = 1.4;

  @override
  void dispose() {
    _isExpanded.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.field.list.isNotEmpty
        ? Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.field.title,
                  style: ADTextStyle700.size22,
                ).paddingBySide(
                  left: context.k_16,
                  right: context.k_16,
                ),
              ),
              ADSizedBox(
                height: context.k_32,
              ),
              Divider(
                height: 0,
                thickness: 1,
                color: context.adColors.dividerColor,
              ).paddingBySide(
                left: context.k_16,
                right: context.k_16,
              ),
              ADSizedBox(
                height: context.k_4,
              ),
              ValueListenableBuilder(
                valueListenable: _isExpanded,
                builder: (
                  BuildContext context,
                  value,
                  Widget? child,
                ) {
                  return ListView.builder(
                    key: Key(
                      'builder ${_isExpanded.value.toString()}',
                    ),
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: widget.field.list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          dividerColor: context.adColors.transparentColor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ExpansionTile(
                              key: Key(index.toString()),
                              initiallyExpanded: index == _isExpanded.value,
                              tilePadding: EdgeInsets.zero,
                              trailing: ValueListenableBuilder(
                                valueListenable: _isExpanded,
                                builder: (
                                  BuildContext context,
                                  value,
                                  Widget? child,
                                ) {
                                  return _isExpanded.value == index
                                      ? Icon(
                                          Icons.minimize,
                                          color: context.adColors.blackColor,
                                        ).paddingBySide(
                                          top: context.k_12,
                                          bottom: context.k_28,
                                        )
                                      : Icon(
                                          Icons.add,
                                          color: context.adColors.blackColor,
                                        ).paddingBySide(
                                          top: context.k_16,
                                          bottom: context.k_28,
                                        );
                                },
                              ),
                              onExpansionChanged: (value) => {
                                if (value)
                                  {
                                    _isExpanded.value = index,
                                    gaEvents(index),
                                  }
                                else
                                  _isExpanded.value = -1,
                              },
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ADSizedBox(
                                    height: context.k_28,
                                  ),
                                  Text(
                                    widget.field.list[index].title,
                                    style: ADTextStyle500.size16,
                                  ),
                                  ADSizedBox(
                                    height: context.k_28,
                                  ),
                                ],
                              ),
                              children: <Widget>[
                                Text(
                                  widget.field.list[index].body,
                                  style: ADTextStyle400.size16.copyWith(
                                    height: lineSpacing,
                                  ),
                                ).paddingBySide(
                                  bottom: context.k_26,
                                ),
                              ],
                            ),
                            Divider(
                              height: 0,
                              thickness: 1,
                              color: context.adColors.dividerColor,
                            ),
                          ],
                        ),
                      );
                    },
                  ).paddingBySide(
                    left: context.k_16,
                    right: context.k_16,
                  );
                },
              ),
              ADSizedBox(
                height: context.k_32,
              ),
              ADSizedBox(
                width: _faqButtonWidth,
                height: _faqButtonHeight,
                child: widget.field.ctaText.isNotEmpty
                    ? ElevatedButton(
                        key: const Key(
                          LoyaltyAutomationKeys.knowMorekey,
                        ),
                        onPressed: () => {
                          ///index -1 expansion
                          gaEvents(-1),
                          navigateToScreenUsingNamedRouteWithArguments(
                            context,
                            webViewContainer,
                            argumentObject: WebViewModel(
                              title: 'all_faq'.localize(context),
                              url:
                                  '${Uri.encodeFull(widget.field.ctaURL)}?isapp=true',
                            ),
                          ),
                        },
                        style: ElevatedButton.styleFrom(
                          primary: context.adColors.whiteTextColor,
                          onPrimary: context.adColors.blackColor,
                          shape: const StadiumBorder(),
                          elevation: 0,
                          onSurface: context.adColors.blackColor,
                          side: BorderSide(
                            color: context.adColors.blackColor,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            widget.field.ctaText,
                            style: ADTextStyle600.size14.setTextColor(
                              context.adColors.blackColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ).paddingBySide(
                          top: context.k_16,
                          bottom: context.k_16,
                        ),
                      )
                    : const ADSizedBox.shrink(),
              ),
              ADSizedBox(
                height: context.k_56,
              ),
            ],
          )
        : const ADSizedBox.shrink();
  }

  /// GA event method
  void gaEvents(int index) {
    if (index >= 0) {
      final map = {
        Parameters.category.name: 'rewards',
        Parameters.sub_category.name: 'help_and_support',
        Parameters.label.name: widget.field.list[index].title,
        Parameters.business_unit.name: selectedAirportsData?.city,
        Parameters.faq_category.name: 'Adani Rewards',
      };
      ClickEvents.view_faq.logEvent(parameters: map);
    } else {
      final map = {
        Parameters.category.name: 'rewards',
        Parameters.sub_category.name: 'help_and_support',
        Parameters.business_unit.name: selectedAirportsData?.city,
      };
      ClickEvents.view_see_all.logEvent(parameters: map);
    }
  }
}
