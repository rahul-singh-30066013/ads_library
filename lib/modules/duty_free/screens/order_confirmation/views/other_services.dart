/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/airport_landing_screen/models/web_view_model.dart';
import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/duty_free_dashboard_builder.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///this class is used to handle new Electronic Type View
class OtherServices extends StatelessWidget {
  const OtherServices({
    Key? key,
    required this.item,
    this.onTapHandler,
  }) : super(key: key);

  ///*[item] this is reference of DashboardItem
  ///*[onTapHandler] this is click listener on tab
  final DutyFreeDashboardItem item;
  final ADTapCallbackWithValue? onTapHandler;

  @override
  Widget build(BuildContext context) {
    return CreateList(
      itemData: item.widgetItems,
      item: item,
      onTapHandler: onTapHandler,
    );
  }
}

class CreateList extends StatelessWidget {
  final DutyFreeDashboardItem item;
  final List<DutyFreeItem>? itemData;
  final ADTapCallbackWithValue? onTapHandler;

  const CreateList({
    Key? key,
    required this.item,
    required this.itemData,
    this.onTapHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int maxLine = 2;
    final double defaultHeight = 135.sp;
    final itemWidth = (item.subItemWidth ?? 1) * context.widthOfScreen;
    const containerAspectRatio = 1.2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'other_services_title'.localize(context),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: ADTextStyle700.size22,
          textAlign: TextAlign.left,
        ).paddingBySide(left: context.k_16, right: context.k_16),
        Container(
          height: (itemWidth * (item.aspectRatio ?? 1)) +
              context.k_40 +
              (ADTextStyle700.size18.fontSize ?? 0) +
              ((ADTextStyle400.size16
                          .copyWith(fontSize: fifteenFontSize)
                          .fontSize ??
                      0) *
                  maxLine) +
              (ADTextStyle400.size16
                      .copyWith(fontSize: fifteenFontSize)
                      .fontSize ??
                  0) +
              defaultHeight,
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: context.k_20,
              );
            },
            padding: EdgeInsets.only(
              top: context.k_20,
              left: context.k_16,
              right: context.k_16,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: itemData?.length ?? 0,
            itemBuilder: (context, index) {
              final itemValue = itemData?[index];
              return TouchableOpacity(
                onTap: () => onTap(
                  context,
                  '${itemValue?.ctaLink ?? ''}${(itemValue?.ctaLink ?? '').contains('?') ? '&' : '?'}isApp=true',
                  itemValue?.title ?? '',
                ),
                child: SizedBox(
                  width: itemWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                          context.scaled(
                            context.k_8,
                          ),
                        ),
                        child: Container(
                          height: itemWidth * containerAspectRatio,
                          width: itemWidth,
                          color: context.adColors.containerGreyBg,
                          child: ADCachedImage(
                            height: itemWidth * (item.aspectRatio ?? 1),
                            width: itemWidth,
                            boxFit: BoxFit.contain,
                            imageUrl: itemData?[index].mobileImage ?? '',
                          ),
                        ),
                      ),
                      ADSizedBox(
                        height: context.k_20,
                      ),
                      Text(
                        itemValue?.title ?? '',
                        style: ADTextStyle700.size18
                            .setTextColor(context.adColors.blackTextColor),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      ADSizedBox(height: context.k_10),
                      Text(
                        itemValue?.description ?? '',
                        style: ADTextStyle400.size16
                            .setTextColor(context.adColors.blackTextColor)
                            .copyWith(
                              fontSize: fifteenFontSize,
                            ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: maxLine,
                      ),
                      ADSizedBox(height: context.k_10),
                      if ((itemData?[index].uniqueId.isNotEmpty ?? false) ||
                          (itemData?[index].ctaUrl.isNotEmpty ?? false))
                        Text(
                          'know_more'.localize(context),
                          overflow: TextOverflow.ellipsis,
                          style: ADTextStyle400.size16.copyWith(
                            color: context.adColors.blackTextColor,
                            decoration: TextDecoration.underline,
                            fontSize: fifteenFontSize,
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void onTap(BuildContext context, String url, String title) {
    context.read<DutyFreeState>().dutyFreeEventState.otherServices(title);
    navigateToScreenUsingNamedRouteWithArguments(
      context,
      webViewContainer,
      argumentObject: WebViewModel(
        title: title,
        url: url,
      ),
    );
  }
}
