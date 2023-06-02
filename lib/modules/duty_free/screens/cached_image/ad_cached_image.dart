/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

const k_56 = 56.0;

///this class is used to for image caching
class ADCachedImage extends StatelessWidget {
  final String imageUrl;
  final bool isShowPlaceHolder;
  final bool isShowErrorView;
  final BoxFit boxFit;
  final double placeHolderSize;
  final int? maxHeightDiskCache;
  final int? maxWidthDiskCache;
  final double? height;
  final double? width;
  final CacheManager? cacheManager;

  const ADCachedImage({
    Key? key,
    required this.imageUrl,
    this.isShowPlaceHolder = true,
    this.isShowErrorView = true,
    this.boxFit = BoxFit.cover,
    this.placeHolderSize = k_56,
    this.height,
    this.width,
    this.maxWidthDiskCache,
    this.maxHeightDiskCache,
    this.cacheManager,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (maxHeightDiskCache != null && maxWidthDiskCache != null)
        ? CachedNetworkImage(
            imageUrl: imageUrl,
            maxWidthDiskCache: maxWidthDiskCache,
            maxHeightDiskCache: maxHeightDiskCache,
            width: (maxWidthDiskCache ?? context.k_40).toDouble(),
            height: (maxHeightDiskCache ?? context.k_40).toDouble(),
            filterQuality: FilterQuality.high,
            cacheManager: cacheManager,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: imageProvider, fit: boxFit),
              ),
            ),
            placeholder: (context, url) => isShowPlaceHolder
                ? Image.memory(kTransparentImage)
                : const SizedBox.shrink(),
            errorWidget: (context, url, error) => isShowErrorView
                ? Container(
                    color: context.adColors.cardBgColor,
                    child: const SizedBox(),
                  )
                : const SizedBox.shrink(),
          )
        : CachedNetworkImage(
            imageUrl: imageUrl,
            filterQuality: FilterQuality.high,
            height: height,
            width: width,
            cacheManager: cacheManager,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: imageProvider, fit: boxFit),
              ),
            ),
            placeholder: (context, url) => isShowPlaceHolder
                ? Image.memory(kTransparentImage)
                : const SizedBox.shrink(),
            errorWidget: (context, url, error) => isShowErrorView
                ? Container(
                    color: context.adColors.cardBgColor,
                    alignment: Alignment.center,
                    child: const SizedBox(),
                  )
                : const SizedBox.shrink(),
          );
  }
}
