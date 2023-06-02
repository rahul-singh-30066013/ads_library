/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/pranaam_dashboard_site_core/pranaam_dashboard_site_core_response.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/carousel/carousel_controller.dart';
import 'package:superapp_mobile_style_guide/carousel/carousel_options.dart';
import 'package:superapp_mobile_style_guide/carousel/carousel_slider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:visibility_detector/visibility_detector.dart';

final double imageHeight = 500.sp;
double padding_4 = 4.sp;
double padding_5 = 5.sp;
double padding_6 = 6.sp;
double padding_8 = 8.sp;
double padding_10 = 10.sp;
double padding_12 = 12.sp;
double padding_15 = 15.sp;
double padding_16 = 16.sp;
double padding_32 = 32.sp;
const double k_0_9 = 0.9;
double k_0_4 = 0.4.sp;
double k_0_2_5 = 0.5.sp;
double k_0_3_0 = 0.3.sp;
double k_0_0_8_2 = 0.082.sp;
double k_0_2_3_2 = 0.232.sp;
double padding_175 = 175.sp;
double padding_101 = 101.sp;
double padding_110 = 110.sp;
double padding_170 = 170.sp;
double padding_30 = 30.sp;
double padding_50 = 50.sp;
double padding_150 = 150.sp;

///This class is for creating carousal slider with three buttons in top of the view.
class ADCarouselSliderWithButton extends StatefulWidget {
  const ADCarouselSliderWithButton({
    Key? key,
    required this.item,
    this.onTapHandler,
    this.autoPlay = true,
  }) : super(key: key);

  final DashboardItem item;
  final void Function(DashboardItem item, BuildContext context, int index)?
      onTapHandler;
  final bool autoPlay;
  @override
  _ADCarouselSliderWithButtonState createState() =>
      _ADCarouselSliderWithButtonState();
}

class _ADCarouselSliderWithButtonState extends State<ADCarouselSliderWithButton>
    with AutomaticKeepAliveClientMixin<ADCarouselSliderWithButton> {
  int current = 0;
  String title = '';
  String pranaamImage = 'lib/assets/images/dashboard/pranaam_trans.png';
  final ADCarouselController _controller = ADCarouselController();
  double aspectRatio = 0;

  void tapHandler(int index) {
    setState(() {
      current = index;
      title = widget.item.widgetItems[current].title;
      pranaamImage = title.isNotEmpty
          ? 'lib/assets/images/dashboard/pranaam_trans.png'
          : '';
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    // SystemChrome.setSystemUIOverlayStyle([SystemUiOverlayStyle.dark]);
    final result = super.build(context);
    //added to avoid the warning
    adLog(result.toString());
    aspectRatio = widget.item.aspectRatio;
    final double bottomMargin = 20.sp;
    const numberOfSeconds = 5;
    const visibility = 0.5;
    return InkWell(
      onTap: () => widget.onTapHandler?.call(widget.item, context, current),
      child: Stack(
        children: [
          VisibilityDetector(
            onVisibilityChanged: (visibilityInfo) =>
                visibilityInfo.visibleFraction < visibility
                    ? _controller.stopAutoPlay()
                    : _controller.startAutoPlay(),
            key: const Key('adCarouselSliderWithButton'),
            child: ADCarouselSlider(
              carouselController: _controller,
              items: (widget.item.widgetItems).map(
                (e) {
                  const lineHeight = 1.5;
                  return Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      ADCachedImage(
                        imageUrl: e.mobileImage,
                        boxFit: BoxFit.fill,
                        width: context.widthOfScreen,
                        height: context.widthOfScreen * aspectRatio,
                        // width: double.infinity,
                        //height: context.widthOfScreen * aspectRatio,
                      ),
                      Positioned(
                        bottom: padding_50,
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Text(
                                widget.item.widgetItems[current].description,
                                style: ADTextStyle700.size26.setTextColor(
                                  context.adColors.whiteTextColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: context.k_8,
                            ),
                            SizedBox(
                              width: context.widthOfScreen * k_0_9,
                              child: Text(
                                widget.item.widgetItems[current].subTitle,
                                style: ADTextStyle500.size16
                                    .setTextColor(
                                      context.adColors.whiteTextColor,
                                    )
                                    .copyWith(
                                      height: lineHeight,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: context.k_26,
                            ),
                            ElevatedButton(
                              onPressed: () => widget.onTapHandler
                                  ?.call(widget.item, context, current),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  vertical: context.k_10,
                                  horizontal: context.k_24,
                                ), backgroundColor: context.adColors.whiteTextColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(42),
                                  ),
                                  side: BorderSide(
                                    color: context.adColors.whiteTextColor,
                                  ),
                                ),
                                elevation: 0,
                              ),
                              child: Text(
                                widget.item.widgetItems[current].ctaText,
                                style: ADTextStyle500.size14
                                    .setTextColor(
                                      context.adColors.filterBlackText,
                                    )
                                    .copyWith(
                                      height: context.k_20 / context.k_14,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ).toList(),
              options: ADCarouselOptions(
                enableInfiniteScroll: widget.autoPlay,
                autoPlayInterval: const Duration(seconds: numberOfSeconds),
                autoPlay: widget.autoPlay,
                height: context.widthOfScreen * aspectRatio,
                //height: double.infinity,
                // enlargeCenterPage: true,
                disableCenter: true,
                viewportFraction: 1,
                onPageChanged: (index, reason) => tapHandler(index),
              ),
            ),
          ),
          if (widget.item.widgetItems.length > 1)
            Positioned(
              bottom: bottomMargin,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    (widget.item.widgetItems).asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: padding_8,
                      height: padding_8,
                      margin: EdgeInsets.symmetric(horizontal: padding_4),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: context.adColors.whiteTextColor,
                        ),
                        borderRadius: BorderRadius.circular(padding_12),
                        color: context.adColors.whiteTextColor.withOpacity(
                          current == entry.key ? k_0_9 : 0,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
