/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/modules/flight_booking/models/response/coupon_response/coupon_list_response.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/snack_bar_util.dart';
import 'package:adani_airport_mobile/modules/loyalty/utils/constants/widget_type_enum.dart';
import 'package:adani_airport_mobile/modules/offers/model/offer_dashboard_response.dart';
import 'package:adani_airport_mobile/modules/offers/state_management/offers_state_management.dart';
import 'package:adani_airport_mobile/utils/debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

const double imageHeight = 196;
const crossAxisCountValue = 2;
const mainAxisSpacingValue = 24.0;
const crossAxisSpacingValue = 16.0;
const int two = 2;

class OfferGridView extends StatefulWidget {
  const OfferGridView({
    Key? key,
    required this.offerItems,
    required this.offersStateManagement,
  }) : super(key: key);
  final List<WidgetItem> offerItems;
  final OffersStateManagement offersStateManagement;

  @override
  State<OfferGridView> createState() => _OfferSliderViewState();
}

class _OfferSliderViewState extends State<OfferGridView> {
  @override
  Widget build(BuildContext context) {
    const double k_50 = 0.5;
    final selected = widget.offersStateManagement.selectedTab
        .replaceAll(' ', '')
        .replaceAll('-', '')
        .toLowerCase();
    final mainAxisExtent1 = (selected == PromotionTypeEnum.instoreoffer.name) ||
            (selected == 'instoreoffers')
        ? 290.0
        : 328.0;
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCountValue,
        mainAxisSpacing: mainAxisSpacingValue,
        crossAxisSpacing: crossAxisSpacingValue,
        mainAxisExtent: mainAxisExtent1,
      ),
      padding: EdgeInsets.only(top: context.k_4, bottom: context.k_4),
      itemCount: widget.offerItems.length,
      itemBuilder: (BuildContext context, int index) {
        return ImageWidget(
          item: widget.offerItems[index],
          offersStateManagement: widget.offersStateManagement,
        );
      },
    ).paddingBySide(
      bottom: widget.offerItems.length > context.k_2
          ? context.k_64
          : MediaQuery.of(context).size.height * k_50,
    );
  }
}

class ImageWidget extends StatelessWidget {
  final WidgetItem item;
  final OffersStateManagement offersStateManagement;

  const ImageWidget({
    Key? key,
    required this.item,
    required this.offersStateManagement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imageUrl = '';
    if (item.mobileImageSrc.isNotEmpty) {
      String url = item.mobileImageSrc;
      if (item.mobileImageSrc.contains('/sitecore/shell')) {
        url = item.mobileImageSrc.replaceAll('/sitecore/shell', '');
      }
      imageUrl = '${Environment.instance.configuration.cmsImageBaseUrl}$url';
    }
    return GestureDetector(
      onTap: () => {
        if (!DeBounce.isRedundantClick())
          {
            offersStateManagement.fileGAEvent(
              item,
              const CouponDetails(),
            ),
            offersStateManagement.navigate(context, item),
          },
        FocusScope.of(context).unfocus(),
      },
      child: Stack(
        children: [
          Column(
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
                    imageUrl: imageUrl,
                  ),
                ),
              ),
              Text(
                item.promotionTypeLabel,
                style: ADTextStyle400.size12
                    .setTextColor(context.adColors.darkGreyTextColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ).paddingBySide(top: context.k_16),
              Text(
                item.title,
                style: ADTextStyle500.size16
                    .setTextColor(context.adColors.blackTextColor),
                overflow: TextOverflow.ellipsis,
                maxLines: two,
              ).paddingBySide(top: context.k_8),
              ADSizedBox(height: context.k_10),
              GestureDetector(
                onTap: () => {
                  HapticFeedback.mediumImpact(),
                  Clipboard.setData(
                    ClipboardData(text: item.promotionCode),
                  ).then((_) {
                    SnackBarUtil.showSnackBar(
                      context,
                      'Coupon Code Saved to Clipboard',
                    );
                  }),
                },
                child: item.promotionCode.isNotEmpty &&
                        item.promotionCode.length < context.k_8.toInt()
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Use Code - ${item.promotionCode}',
                            style: ADTextStyle400.size14.setTextColor(
                              context.adColors.darkGreyTextColor,
                            ),
                          ),
                          CopyIcon(promotionCode: item.promotionCode),
                        ],
                      )
                    : item.promotionCode.isNotEmpty &&
                            item.promotionCode.length >= context.k_8.toInt()
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Use Code -',
                                style: ADTextStyle400.size14.setTextColor(
                                  context.adColors.darkGreyTextColor,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    item.promotionCode,
                                    style: ADTextStyle400.size12.setTextColor(
                                      context.adColors.greyTextColor,
                                    ),
                                  ),
                                  CopyIcon(promotionCode: item.promotionCode),
                                ],
                              ).paddingBySide(top: context.k_4),
                            ],
                          )
                        : const SizedBox.shrink(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CopyIcon extends StatelessWidget {
  final String promotionCode;

  const CopyIcon({Key? key, required this.promotionCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      SvgAssets.copyCode,
      width: context.k_14,
      height: context.k_14,
      color: const Color(0xFF555555),
    ).paddingBySide(
      left: context.k_6,
      bottom: context.k_2,
    );
  }
}
