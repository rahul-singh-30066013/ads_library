/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/screen_helper/automation_keys/duty_free_cart_automation_keys.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

///[ADDutyFreeShowProductImage] is used for show item product image
class ADDutyFreeShowProductImage extends StatelessWidget {
  const ADDutyFreeShowProductImage({
    Key? key,
    required this.productIcon,
    required this.inStock,
  }) : super(key: key);
  final String productIcon;
  final bool inStock;

  @override
  Widget build(BuildContext context) {
    final productImageHeight = 108.sp;

    return Container(
      height: productImageHeight,
      alignment: Alignment.center,
      key: Key(
        '${DutyFreeCartAutomationKeys.dutyFreeCartProductImage}$productIcon',
      ),
      child: ColorFiltered(
        colorFilter: inStock
            ? const ColorFilter.mode(
                Colors.transparent,
                BlendMode.multiply,
              )
            : const ColorFilter.mode(
                Colors.white,
                BlendMode.saturation,
              ),
        child: FadeInImage.memoryNetwork(
          image: productIcon,
          fit: BoxFit.contain,
          imageCacheHeight: productImageHeight.toInt(),
          height: productImageHeight,
          placeholder: kTransparentImage,
          imageErrorBuilder: (context, error, stackTrace) => Container(
            color: context.adColors.cardBgColor,
            alignment: Alignment.center,
            child: const SizedBox(),
          ),
        ),
      ),
    );
  }
}
