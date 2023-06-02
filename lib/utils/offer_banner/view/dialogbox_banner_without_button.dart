import 'dart:typed_data';

import 'package:adani_airport_mobile/utils/offer_banner/offer_banner_remote.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

const double paddingTop = 100;

class DialogBoxBannerWithoutButton extends StatelessWidget {
  final ADTapCallbackWithValue? onTap;
  final ByteData imageData;

  const DialogBoxBannerWithoutButton({
    Key? key,
    this.onTap,
    required this.imageData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Uint8List bytes = imageData.buffer.asUint8List();
    final offerBannerRemoteModel = OfferBannerRemote().offerBannerRemoteModel;

    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => onTap?.call(offerBannerRemoteModel?.actionItem),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(context.k_10),
                  child: Image.memory(
                    bytes,
                    fit: BoxFit.fill,
                    width: context.widthOfScreen - context.k_48.sp,
                    height: (context.widthOfScreen - context.k_48.sp) *
                        (offerBannerRemoteModel?.widgetItem?.heightMultiplier ??
                            0),
                  ),
                ),
                SizedBox(
                  height: context.k_30,
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            style: ElevatedButton.styleFrom(
              shadowColor: context.adColors.transparentColor,
              primary: context.adColors.transparentColor,
              shape: const StadiumBorder(),
            ),
            child: Text(
              'Dismiss',
              style: ADTextStyle500.size16
                  .setTextColor(
                    context.adColors.whiteTextColor,
                  )
                  .copyWith(
                    decoration: TextDecoration.underline,
                  ),
            ).paddingAllSide(context.k_16),
          ),
        ],
      ).paddingBySide(left: context.k_16, right: context.k_16),
    ).paddingBySide(
      top: paddingTop,
    );
  }
}
