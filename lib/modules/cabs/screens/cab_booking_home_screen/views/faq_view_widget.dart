/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///this class is used to provide faq section view on loyalty dashboard
class FAQViewWidget extends StatefulWidget {
  ///*[onTapHandler] a function in which we will write the click functionality
  ///*[data] DutyFreeDashboardItem that needs to be shown content

  const FAQViewWidget({
    Key? key,
    required this.onTapHandler,
    required this.data,
  }) : super(key: key);

  ///a function in which we will write the click functionality
  final ADTapCallback onTapHandler;
  final DutyFreeDashboardItem data;

  @override
  State<FAQViewWidget> createState() => _FAQViewWidgetState();
}

class _FAQViewWidgetState extends State<FAQViewWidget>
    with AutomaticKeepAliveClientMixin {
  final ValueNotifier<int> _isExpanded = ValueNotifier<int>(-1);
  final double lineSpacing = 1.4;

  @override
  void dispose() {
    _isExpanded.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    final result = super.build(context);
    adLog(result.toString());
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.data.title ?? '',
            style: ADTextStyle700.size22
                .copyWith(color: context.adColors.blackTextColor),
          ),
        ),
        ADSizedBox(
          height: widget.data.subItemMargin?.top.sp ?? 0,
        ),
        Divider(
          height: 0,
          thickness: 1,
          color: context.adColors.dividerColor,
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
              itemCount: widget.data.widgetItems?.length ?? 0,
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
                                    color: context.adColors.blackTextColor,
                                  ).paddingBySide(
                                    top: context.k_12,
                                    bottom: context.k_28,
                                  )
                                : Icon(
                                    Icons.add,
                                    color: context.adColors.blackTextColor,
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
                            }
                          else
                            _isExpanded.value = -1,
                        },
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ADSizedBox(
                              height: context.k_16,
                            ),
                            Text(
                              widget.data.widgetItems?[index].title ?? '',
                              style: (_isExpanded.value == index
                                      ? ADTextStyle700.size16
                                      : ADTextStyle400.size16)
                                  .copyWith(
                                color: context.adColors.blackTextColor,
                              ),
                            ),
                            ADSizedBox(
                              height: context.k_16,
                            ),
                          ],
                        ),
                        children: <Widget>[
                          Text(
                            widget.data.widgetItems?[index].description ?? '',
                            style: ADTextStyle400.size16.copyWith(
                              height: lineSpacing,
                              color: context.adColors.blackTextColor,
                            ),
                          ).paddingBySide(
                            bottom: context.k_28,
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
            );
          },
        ),
        ADSizedBox(
          height: widget.data.subItemMargin?.bottom.sp ?? 0,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: TouchableOpacity(
            onTap: () => widget.onTapHandler.call(),
            child: Text(
              widget.data.actionTitle?.name ?? '',
              style: ADTextStyle400.size16.copyWith(
                decoration: TextDecoration.underline,
                color: context.adColors.blackTextColor,
              ),
            ),
          ),
        ),
      ],
    ).paddingBySide(
      top: widget.data.itemMargin?.top.sp ?? 0,
      left: widget.data.itemMargin?.left.sp ?? 0,
      right: widget.data.itemMargin?.right.sp ?? 0,
      bottom: widget.data.itemMargin?.bottom.sp ?? 0,
    );
  }
}
