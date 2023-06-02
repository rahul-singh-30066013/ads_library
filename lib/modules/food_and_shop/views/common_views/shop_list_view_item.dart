/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/string_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

///this class is used to show shop list
///it can be use as a list item and individual element
///
final double bannerImageSize = 200.sp;

///*[shopBannerImage] used to show Shop/Brand banner
///*[shopName] used to show Shop/Brand name
///*[shopAddress] used to show Shop/Brand location at airport terminal
///*[shopBadgeImage] used to show Shop/Brand badge image
///*[placeHolder] used to show as place holder
///

class ShopListViewItem extends StatelessWidget {
  final String shopBannerImage;

  final String? shopBadgeImage;

  final String shopName;
  final String? placeHolder;

  final String shopAddress;
  final double bannerWidth;

  ///use the typedef [ADTapCallback] a callback for item pressed.
  final ADTapCallback? onTapHandler;

  const ShopListViewItem({
    Key? key,
    required this.shopBannerImage,
    required this.shopName,
    required this.shopAddress,
    this.shopBadgeImage,
    this.placeHolder,
    this.onTapHandler,
    required this.bannerWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTapHandler,
          child: _SetShopImage(
            shopBannerImage: shopBannerImage,
            shopBadgeImage: shopBadgeImage ?? '',
            bannerWidth: bannerWidth,
          ).paddingBySide(bottom: context.k_20),
        ),
        Text(
          shopName,
          style: ADTextStyle700.size18
              .setTextColor(context.adColors.neutralInfoMsg),
        ).paddingBySide(bottom: context.k_10),
        Text(
          shopAddress,
          style: ADTextStyle400.size14
              .setTextColor(context.adColors.darkGreyTextColor),
        ).paddingBySide(bottom: context.k_48),
      ],
    );
  }
}

class _SetShopImage extends StatelessWidget {
  final String shopBannerImage;
  final String shopBadgeImage;
  // final String? placeHolder;
  final double bannerWidth;
  const _SetShopImage({
    Key? key,
    required this.shopBannerImage,
    required this.shopBadgeImage,
    required this.bannerWidth,
    // this.placeHolder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(context.k_10)),
          child: Utils.startsWithHttp(shopBannerImage)
              ? FadeInImage.assetNetwork(
                  image: shopBannerImage,
                  height: bannerImageSize,
                  width: bannerWidth.sp,
                  fit: BoxFit.cover,
                  // placeholder: placeHolder.validateWithDefaultValue(),
                  placeholder: '',
                )
              : Image.asset(
                  shopBannerImage,
                  height: bannerImageSize,
                  width: bannerWidth.sp,
                  fit: BoxFit.cover,
                ),
        ),
        Visibility(
          visible: !shopBadgeImage.isNullOrEmpty,
          child: Utils.startsWithHttp(shopBadgeImage)
              ? FadeInImage.assetNetwork(
                  image: shopBadgeImage,
                  height: context.k_60,
                  width: context.k_60,
                  fit: BoxFit.cover,
                  // placeholder: placeHolder ?? '',
                  placeholder: '',
                ).paddingAllSide(context.k_10)
              : Image.asset(
                  shopBadgeImage,
                  height: context.k_60,
                  width: context.k_60,
                  fit: BoxFit.cover,
                ).paddingAllSide(context.k_10),
        ),
      ],
    );
  }
}
