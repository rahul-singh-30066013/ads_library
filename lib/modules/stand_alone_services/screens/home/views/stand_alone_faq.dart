/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/pranaam_dashboard_site_core/pranaam_dashboard_site_core_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///this class is used to provide faq section view on loyalty dashboard
class StandAloneFaq extends StatefulWidget {
  ///*[onTapHandler] a function in which we will write the click functionality
  ///*[data] DutyFreeDashboardItem that needs to be shown content

  const StandAloneFaq({
    Key? key,
    this.onTapHandler,
    required this.data,
  }) : super(key: key);

  ///a function in which we will write the click functionality
  final ADTapCallback? onTapHandler;
  final DashboardItem data;

  @override
  State<StandAloneFaq> createState() => _StandAloneFaqState();
}

class _StandAloneFaqState extends State<StandAloneFaq>
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
            widget.data.title,
            style: ADTextStyle700.size22,
          ),
        ),
        ADSizedBox(
          height: widget.data.subItemMargin.top,
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
              itemCount: widget.data.widgetItems.length,
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
                        trailing: Icon(
                          _isExpanded.value == index
                              ? Icons.minimize
                              : Icons.add,
                          color: context.adColors.blackColor,
                        ).paddingBySide(
                          top: _isExpanded.value == index
                              ? context.k_8
                              : context.k_16,
                          bottom: context.k_28,
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
                              widget.data.widgetItems[index].title,
                              style: _isExpanded.value == index
                                  ? ADTextStyle500.size16
                                  : ADTextStyle400.size16,
                            ),
                            ADSizedBox(
                              height: context.k_16,
                            ),
                          ],
                        ),
                        children: <Widget>[
                          Text(
                            widget.data.widgetItems[index].description,
                            style: ADTextStyle400.size16.copyWith(
                              height: lineSpacing,
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
        if (widget.data.actionTitle.name != '')
          ADSizedBox(
            height: widget.data.subItemMargin.bottom.sp,
          ),
        if (widget.data.actionTitle.name != '')
          Align(
            alignment: Alignment.centerLeft,
            child: TouchableOpacity(
              onTap: () => openWebView(
                title: widget.data.title,
                url: widget.data.actionTitle.deeplink,
                context: context,
              ),
              child: Text(
                widget.data.actionTitle.name,
                style: ADTextStyle400.size16.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
      ],
    ).paddingBySide(
      top: widget.data.itemMargin.top.sp,
      left: widget.data.itemMargin.left.sp,
      right: widget.data.itemMargin.right.sp,
      bottom: widget.data.itemMargin.bottom.sp,
    );
  }
}
