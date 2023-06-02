/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */


import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_dashboard_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/dashboard/how_to_shop_item.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_layout_builder.dart';
import 'package:superapp_mobile_style_guide/shimmer/ad_shimmer_widget.dart';

///this class is used to handle how to shop widget which include in Duty Free Screen
///[shouldBeKeptAlive], variable is used to maintain scrollindex while scrolling
class DutyFreeHowToShop extends StatefulWidget {
  const DutyFreeHowToShop({
    Key? key,
    required this.item,
    this.onTapHandler,
    this.shouldBeKeptAlive = true,
  }) : super(key: key);
  final DutyFreeDashboardItem item;
  final ADTapCallbackWithValue? onTapHandler;
  final bool shouldBeKeptAlive;

  @override
  _DutyFreeHowToShopState createState() => _DutyFreeHowToShopState();
}

class _DutyFreeHowToShopState extends State<DutyFreeHowToShop>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  bool get wantKeepAlive => widget.shouldBeKeptAlive;

  @override
  Widget build(BuildContext context) {
    final Widget superBuild = super.build(context);
    adLog('$superBuild');
    return CreateShopList(
      item: widget.item,
      onTapHandler: widget.onTapHandler,
    );
  }
}
// 0xff286ef1

class CreateShopList extends StatefulWidget {
  final DutyFreeDashboardItem item;
  final ADTapCallbackWithValue? onTapHandler;

  const CreateShopList({
    Key? key,
    required this.item,
    required this.onTapHandler,
  }) : super(key: key);

  @override
  State<CreateShopList> createState() => _CreateShopListState();
}

class _CreateShopListState extends State<CreateShopList> {
  static const Color backColor1 = Color(0xff286ef1);

  BoxDecoration boxDecorationGradient(
    Color backgroundColor,
    Color backgroundColor2,
  ) {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter, //Starting point
        end: Alignment.bottomCenter, //Ending point
        stops: const [0.68, 0],
        colors: [backgroundColor, backgroundColor2], // List of colors
      ),
    );
  }

  int selectedIndex = 0;
  String changedItem = '';

  @override
  Widget build(BuildContext context) {
    final List<DutyFreeItem> shopTime = widget.item.widgetItems ?? [];
    // final List<Travellers> travellers = [];
    final List<String> travellerList = [];
    // final int travellersLength = travellers.length;
    const double containerHeight = 0.96;
    // const double containerHeight_25 = 0.45;
    // for (int travellerValue = 0;
    //     travellerValue < travellersLength;
    //     travellerValue++) {
    //   travellerList
    //       .add(travellers[travellerValue].title.validateWithDefaultValue());
    // }
    if (selectedIndex == 0 && travellerList.isNotEmpty) {
      changedItem = travellerList.first;
    }
    const double extraAspectRatioHowToShop = 0.16;
    return Container(
      height: (context.widthOfScreen *
              ((widget.item.aspectRatio ?? containerHeight) +
                  extraAspectRatioHowToShop))
          .sp,
      width: context.widthOfScreen,
      margin: EdgeInsets.only(
        bottom: widget.item.itemMargin?.bottom.sp ?? 0,
        top: widget.item.itemMargin?.top.sp ?? 0,
      ),
      padding: EdgeInsets.only(
        bottom: widget.item.itemMargin?.bottom.sp ?? 0,
        top: widget.item.itemMargin?.top.sp ?? 0,
      ),
      // margin: EdgeInsets.only(top: context.k_20),
      decoration: boxDecorationGradient(
        backColor1,
        context.adColors.whiteTextColor,
      ),
      child: Column(
        children: [
          // ADSizedBox(
          //   height: context.k_40,
          // ),
          Align(
            // padding: EdgeInsets.only(right: context.k_28),
            child: Text(
              widget.item.title ?? '...',
              style: ADTextStyle700.size22
                  .copyWith(color: context.adColors.whiteTextColor),
            ),
          ),
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.only(
                left: widget.item.subItemMargin?.left.sp ?? 0,
                right: widget.item.subItemMargin?.right.sp ?? 0,
                top: widget.item.subItemMargin?.top.sp ?? 0,
                // bottom: widget.item.itemMargin?.bottom.sp ?? 0,
              ),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: shopTime.length,
              itemBuilder: (_context, index) {
                return HowToShopItem(
                  title: shopTime[index].title.validateWithDefaultValue(),
                  description:
                      shopTime[index].description.validateWithDefaultValue(),
                  index: index + 1,
                  indexColor: context.adColors.whiteTextColor,
                  indexBackgroundColor: backColor1,
                  backgroundColor: context.adColors.whiteTextColor,
                  textColor: context.adColors.blackTextColor,
                  marginLeft: widget.item.subItemMargin?.left ?? 0,
                  marginRight: widget.item.subItemMargin?.right ?? 0,
                  subItemWidth: widget.item.subItemWidth ?? 0,
                  mobileImage: shopTime[index].mobileImage,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void dashLinedOnChange(String? newValue) {
    if (!newValue.isNullOrEmpty) {
      setState(() {
        changedItem = '$newValue';
        selectedIndex = 1;
      });
    }
  }
}

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double containerWidth_150 = 150.w;
    final double containerWidth_160 = 160.w;
    final double containerHeight_250 = 250.h;
    const int itemCount = 6;
    final double shimmerWidth_100 = 100.w;
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ADShimmerWidget.shimmerShape(
                type: ShimmerType.rectangleBox,
                width: containerWidth_150,
                height: context.k_20,
              ),
              ADShimmerWidget.shimmerShape(
                type: ShimmerType.rectangleBox,
                width: shimmerWidth_100,
                height: context.k_20,
              ),
            ],
          ),
          Container(
            height: containerHeight_250,
            child: ADShimmerBuilder(
              shimmerBuilderType: ShimmerBuilderType.listHorizontal,
              shimmerWidget: ADShimmerWidget.shimmerShape(
                type: ShimmerType.rectangleBox,
                height: containerHeight_250,
                width: containerWidth_160,
              ),
              itemCount: itemCount,
            ),
          ),
        ],
      ),
    );
  }
}
