/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/bottom_sheet_utils.dart';
import 'package:adani_airport_mobile/modules/offers/model/offer_dashboard_response.dart';
import 'package:adani_airport_mobile/modules/offers/screens/offer_detail_screen.dart';
import 'package:adani_airport_mobile/utils/debounce.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

const int two = 2;
const double containerHeight = 140;
const double imageHeight = 66;
const double imageWidth = 66;

const double aspectRatio = 0.66;
const double viewPagerViewportFraction = 0.9;

class UnlockedOffers extends StatefulWidget {
  const UnlockedOffers({
    Key? key,
    required this.offerItems,
  }) : super(key: key);
  final List<WidgetItem> offerItems;

  @override
  State<UnlockedOffers> createState() => _UnlockedOffersState();
}

class _UnlockedOffersState extends State<UnlockedOffers> {
  @override
  Widget build(BuildContext context) {
    final sliderWidth = context.widthOfScreen;
    return SizedBox(
      width: sliderWidth.toDouble(),
      height: containerHeight.toDouble(),
      child: PageView.builder(
        controller: PageController(
          viewportFraction: viewPagerViewportFraction,
        ),
        itemCount: widget.offerItems.length,
        itemBuilder: (BuildContext context, int index) {
          return ImageWidget(
            item: widget.offerItems[index],
          ).paddingBySide(
            left: index != 0 ? ((context.k_12) / two) : 0,
            right: index != ((widget.offerItems.length) - 1)
                ? ((context.k_12) / two)
                : 0,
          );
        },
      ),
    ).paddingBySide(top: context.k_16);
  }
}

class ImageWidget extends StatelessWidget {
  final WidgetItem item;

  const ImageWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imageUrl = '';
    if (item.offerLogoMobile.isNotEmpty) {
      String url = item.offerLogoMobile;
      if (item.offerLogoMobile.contains('/sitecore/shell')) {
        url = item.offerLogoMobile.replaceAll('/sitecore/shell', '');
      }
      imageUrl = '${Environment.instance.configuration.cmsImageBaseUrl}$url';
    }
    return GestureDetector(
      onTap: () => {
        if (!DeBounce.isRedundantClick()) tCBottomsSheet(context, item),
        FocusScope.of(context).unfocus(),
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              context.scaled(
                context.k_12,
              ),
            ),
          ),
          border: Border.all(
            color: context.adColors.boxShadowColor,
            width: 1.sp,
          ),
        ),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    context.scaled(
                      context.k_4,
                    ),
                  ),
                  child: Container(
                    height: imageHeight,
                    width: imageWidth,
                    child: ADCachedImage(
                      imageUrl: imageUrl,
                    ),
                  ),
                ).paddingBySide(left: context.k_20, top: context.k_20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ADSizedBox(
                        height: context.k_20,
                      ),
                      Text(
                        item.unlockOfferTitle,
                        style: ADTextStyle700.size18
                            .setTextColor(context.adColors.blackTextColor),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      ADSizedBox(
                        height: context.k_10,
                      ),
                      Text(
                        item.bookingConfirmedOfferText,
                        style: ADTextStyle400.size16
                            .setTextColor(context.adColors.darkGreyTextColor),
                        maxLines: context.k_2.toInt(),
                      ),
                      ADSizedBox(
                        height: context.k_10,
                      ),
                      GestureDetector(
                        onTap: () => tCBottomsSheet(context, item),
                        child: Text(
                          item.unlockOfferCTAText,
                          style: ADTextStyle400.size14
                              .setTextColor(context.adColors.blackTextColor)
                              .copyWith(
                                decoration: TextDecoration.underline,
                              ),
                        ),
                      ),
                    ],
                  ).paddingBySide(left: context.k_16, right: context.k_16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void tCBottomsSheet(
    BuildContext context,
    WidgetItem item,
  ) =>
      BottomSheetUtils.showDraggableBottomSheetDialog(
        context,
        // ReschedulePage(),
        OfferDetailScreen(
          offerTitle: item.offerTitle,
          offerUniqueID: item.offerUniqueID,
          isComingFromSheet: true,
        ),
        item.offerTitle,
      );
}
