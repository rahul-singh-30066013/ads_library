/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/pranaam_dashboard_site_core/pranaam_dashboard_site_core_response.dart'
    as pranaam_dashboard;
import 'package:adani_airport_mobile/modules/pranaam_service/screen/home/home_dashboard/ad_pranaam_customer_testimony.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/carousel/carousel_package.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:visibility_detector/visibility_detector.dart';

const double crowsalHeight = 0.49;
const double crowsalHeight_9 = 0.9;
const double crowsalHeight_4 = 0.4;
final double imageHeight = 223.sp;
final double imageWidth = 343.sp;
final double descriptionHeight = 130.sp;
const double lineSpacing = 0.5;

/// A widget to create a hotel booking card.
/// [StraightHeight] can be used to make a list of hotels available for booking.
class StraightHeight extends StatefulWidget {
  /// defines height of carousel to be displayed
  final double? carouselHeight;
  final pranaam_dashboard.DashboardItem item;

  /// set true if images need to be changed automatically
  final bool? autoPlayCarousel;

  ///use the typedef [ADTapCallback] a callback for book now button pressed
  final ADTapCallback? onBookNowTap;
  final List<pranaam_dashboard.Option> dealsTypeItems;

  const StraightHeight({
    Key? key,
    required this.dealsTypeItems,
    this.carouselHeight,
    this.onBookNowTap,
    this.autoPlayCarousel,
    required this.item,
  }) : super(key: key);

  @override
  State<StraightHeight> createState() => _StraightHeightState();
}

class _StraightHeightState extends State<StraightHeight> {
  int _current = 0;
  final visibility = 0.5;
  final ADCarouselController _controller = ADCarouselController();

  void setPointer(int indexCount) {
    setState(
      () => {
        _current = indexCount,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    // final aspectRatioFromResponse = widget.item.aspectRatio;
    const imageAspectRatio = 0.95;

    return Container(
      // height: context.widthOfScreen * aspectRatioFromResponse,

      ///TODO need to define in style guide
      color: const Color(0xfff6f2ff),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.item.title,
            style: ADTextStyle700.size22
                .copyWith(color: context.adColors.filterBlackText),
          ).paddingBySide(
            top: widget.item.itemMargin.top,
            left: widget.item.itemMargin.left,
            right: widget.item.itemMargin.right,
          ),
          VisibilityDetector(
            key: const Key('straightFromHeart'),
            onVisibilityChanged: (visibilityInfo) =>
                visibilityInfo.visibleFraction < visibility
                    ? _controller.stopAutoPlay()
                    : _controller.startAutoPlay(),
            child: ADCarouselSlider.builder(
              carouselController: _controller,
              options: ADCarouselOptions(
                autoPlay: widget.autoPlayCarousel ?? false,
                viewportFraction: 1,
                aspectRatio: imageAspectRatio,
                onPageChanged: (index, reason) => setPointer(index),
              ),
              itemCount: widget.dealsTypeItems.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return ADPranaamCustomerTestimony(
                  imageUrl: widget.dealsTypeItems[itemIndex].imgSrc,
                  title: widget.dealsTypeItems[itemIndex].title,
                  description: widget.dealsTypeItems[itemIndex].description,
                ).paddingBySide(
                  left: widget.item.itemMargin.left,
                  right: widget.item.itemMargin.right,
                );

                /* Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.all(Radius.circular(context.k_8)),
                        child: Uri.parse(widget.dealsTypeItems[itemIndex].imgSrc)
                                .isAbsolute
                            ? ADCachedImage(
                                imageUrl: widget.dealsTypeItems[itemIndex].imgSrc,
                                width: context.widthOfScreen,
                                //placeholder: 'lib/assets/images/pranaam/platinum.png',
                              )
                            : Image.network(
                                widget.dealsTypeItems[itemIndex].imgSrc,
                                width: context.widthOfScreen,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    ADSizedBox(
                      height: context.k_20,
                    ),
                    Text(
                      widget.dealsTypeItems[_current].title,
                      style: ADTextStyle700.size18
                          .copyWith(color: context.adColors.filterBlackText),
                    ),
                    ADSizedBox(
                      height: context.k_16,
                    ),
                    ADSizedBox(
                      height: descriptionHeight,
                      child: Text(
                        widget.dealsTypeItems[_current].description,
                        style: ADTextStyle400.size14.copyWith(
                          color: context.adColors.filterBlackText,
                          height: lineSpacing,
                        ),
                      ),
                    ),
                  ],
                ).paddingBySide(
                  left: widget.item.itemMargin.left,
                  right: widget.item.itemMargin.right,
                );*/
              },
            ).paddingBySide(
              top: context.k_22,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: context.k_20,
              bottom: context.k_20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.dealsTypeItems.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: context.k_6,
                    height: context.k_6,
                    margin: EdgeInsets.symmetric(
                      vertical: context.k_8,
                      horizontal: context.k_4,
                    ),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(Radius.circular(context.k_6)),
                      color: context.adColors.blackColor.withOpacity(
                        _current == entry.key
                            ? crowsalHeight_9
                            : crowsalHeight_4,
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
