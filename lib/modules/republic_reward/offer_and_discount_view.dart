/*
 * Copyright (c) 2023 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:math';

import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/duty_free_dashboard_builder.dart';
import 'package:adani_airport_mobile/modules/loyalty/utils/constants/widget_type_enum.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/debounce.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

const double imageHeight = 196;

class OfferAndDiscountView extends StatefulWidget {
  const OfferAndDiscountView({
    Key? key,
    required this.item,
    required this.onTap,
    required this.themeEnabled,
    this.shouldBeKeptAlive = true,
  }) : super(key: key);

  ///*[item] this is reference of DashboardItem
  ///*[shouldBeKeptAlive] this is used to maintain index of item while scrolling
  final DutyFreeDashboardItem item;
  final bool shouldBeKeptAlive;
  final Function(int index) onTap;

  final bool themeEnabled;

  @override
  _OfferAndDiscountViewState createState() => _OfferAndDiscountViewState();
}

class _OfferAndDiscountViewState extends State<OfferAndDiscountView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => widget.shouldBeKeptAlive;

  @override
  Widget build(BuildContext context) {
    final Widget superBuild = super.build(context);
    adLog('$superBuild');
    return CreateList(
      itemData: widget.item.widgetItems,
      item: widget.item,
      onTap: widget.onTap,
      themeEnabled: widget.themeEnabled,
    );
  }
}

class CreateList extends StatefulWidget {
  final DutyFreeDashboardItem item;
  final List<DutyFreeItem>? itemData;
  final Function(int index) onTap;
  final String? subTitle;

  final bool themeEnabled;

  const CreateList({
    Key? key,
    required this.item,
    required this.itemData,
    required this.onTap,
    required this.themeEnabled,
    this.subTitle,
  }) : super(key: key);

  @override
  State<CreateList> createState() => _CreateListState();
}

class _CreateListState extends State<CreateList> {
  bool isShowEnabled = false;

  void showMoreButtonAction() {
    setState(() {
      isShowEnabled = !isShowEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    const maxItems = 6;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ADSizedBox(
          height: widget.item.itemMargin?.top.sp ?? 0,
        ),
        if (widget.item.title?.isNotEmpty ?? false)
          Text(
            widget.item.title ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: ADTextStyle700.size22,
            textAlign: TextAlign.left,
          ).paddingBySide(
            right: widget.item.itemMargin?.right.sp ?? 0,
          ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 24,
            crossAxisSpacing: 16,
            mainAxisExtent: 320,
          ),
          padding: EdgeInsets.only(
            top: widget.item.subItemMargin?.top.sp ?? 0,
          ),
          // scrollDirection: Axis.horizontal,
          itemCount: isShowEnabled
              ? (widget.itemData?.length ?? 0)
              : min(
                  widget.itemData?.length ?? 0,
                  maxItems,
                ),
          itemBuilder: (context, index) {
            return ImageWidget(
              itemData: widget.itemData?[index],
            );
          },
        ).paddingBySide(
          top: context.k_20,
        ),
        ADSizedBox(
          height: context.k_30,
        ),
        if (!isShowEnabled)
          ADSizedBox(
            width: context.widthOfScreen,
            height: context.k_48,
            child: ElevatedButton(
              onPressed: () => {
                showMoreButtonAction(),
              },
              style: ElevatedButton.styleFrom(
                side: BorderSide(
                  color: context.adColors.blackTextColor,
                ),
                primary: context.adColors.whiteTextColor,
                shape: const StadiumBorder(),
                maximumSize: Size(double.infinity, context.k_64),
              ),
              child: Text(
                isShowEnabled
                    ? 'view_less'.localize(context)
                    : 'view_more'.localize(context),
                style: ADTextStyle700.size16.setTextColor(
                  context.adColors.black,
                ),
              ),
            ),
          ),
      ],
    ).paddingBySide(
      left: widget.item.itemMargin?.left.sp ?? 0,
      right: widget.item.itemMargin?.right.sp ?? 0,
    );
  }
}

class ImageWidget extends StatelessWidget {
  final DutyFreeItem? itemData;

  const ImageWidget({
    Key? key,
    required this.itemData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int maxLine = 2;

    return TouchableOpacity(
      onTap: () => {
        if (!DeBounce.isRedundantClick())
          {
            navigateToScreenUsingNamedRouteWithArguments(
              context,
              offerDetail,
              rootNavigator: false,
              argumentObject: OfferKeyModel(
                id: itemData?.promoCode,
                title: itemData?.title,
              ),
            ),
          },
        FocusScope.of(context).unfocus(),
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              context.scaled(
                context.k_12,
              ),
            ),
            child: Container(
              height: imageHeight,
              color: context.adColors.containerGreyBg,
              child: ADCachedImage(
                imageUrl: itemData?.imageSrc ?? '',
              ),
            ),
          ),
          ADSizedBox(
            height: context.k_20,
          ),
          Text(
            itemData?.title ?? '',
            style: ADTextStyle700.size18.setTextColor(
              context.adColors.blackTextColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (itemData?.description.isNotEmpty ?? false)
            ADSizedBox(
              height: context.k_10,
            ),
          if (itemData?.description.isNotEmpty ?? false)
            Text(
              itemData?.description ?? '',
              style: ADTextStyle400.size16.setTextColor(
                context.adColors.blackTextColor,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: maxLine,
            ),
          ADSizedBox(height: context.k_10),
          Text(
            itemData?.subTitle ?? 'know_more'.localize(context),
            overflow: TextOverflow.ellipsis,
            style: ADTextStyle400.size16.copyWith(
              color: context.adColors.blackTextColor,
              decoration: TextDecoration.underline,
              fontSize: fifteenFontSize,
            ),
          ),
        ],
      ),
    );
  }
}
