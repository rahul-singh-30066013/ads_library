/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:math';

import 'package:adani_airport_mobile/modules/duty_free/screens/cached_image/ad_cached_image.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';

class DeepLinkModel {
  final String? image;
  final String deepLink;

  DeepLinkModel({this.image, required this.deepLink});
}

class ADDeepLinkTile extends StatelessWidget {
  const ADDeepLinkTile({
    Key? key,
    required this.deepLinkData,
    this.onTapHandler,
    this.child,
  }) : super(key: key);

  final DeepLinkModel deepLinkData;
  final ADTapCallbackWithValue? onTapHandler;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final String imageString = deepLinkData.image ?? '';
    return GestureDetector(
      child: Utils.startsWithHttp(imageString)
          ? ADCachedImage(
              maxHeightDiskCache: context.heightOfScreen.toInt(),
              maxWidthDiskCache: context.heightOfScreen.toInt(),
              imageUrl: deepLinkData.image ?? '',
              isShowErrorView: false,
            )
          : Image.asset(deepLinkData.image ?? ''),
      onTap: () => onTapHandler?.call(deepLinkData),
    );
  }
}

class RandomColorModel {
  Random random = Random();
  final int randomValue_300 = 300;

  Color getColor() {
    return Color.fromARGB(
      random.nextInt(randomValue_300),
      random.nextInt(randomValue_300),
      random.nextInt(randomValue_300),
      random.nextInt(randomValue_300),
    );
  }
}
