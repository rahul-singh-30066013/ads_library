import 'dart:typed_data';

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:adani_airport_mobile/utils/offer_banner/offer_banner_remote.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_constants.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class DialogBoxBanner extends StatelessWidget {
  final ADTapCallbackWithValue? onTap;
  final ByteData imageData;

  const DialogBoxBanner({Key? key, this.onTap, required this.imageData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int containerBorderColors = 0xffd9d9d9;
    final double heightArrowIconContainer = 42.sp;
    final Uint8List bytes = imageData.buffer.asUint8List();
    final offerBannerRemoteModel = OfferBannerRemote().offerBannerRemoteModel;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: GestureDetector(
        onTap: () => onTap?.call(offerBannerRemoteModel?.actionItem),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(containerBorderColors),
                ),
                // color: Colors.red,
                borderRadius: BorderRadius.circular(
                  context.k_26,
                ),
              ),
              width: heightArrowIconContainer,
              height: heightArrowIconContainer,
              child: Material(
                borderRadius: BorderRadius.all(Radius.circular(context.k_30)),
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(context.k_30)),
                  onTap: () => Navigator.of(context).pop(),
                  child: SvgPicture.asset(
                    SvgAssets.closeIcon,
                    width: context.k_10,
                    height: context.k_10,
                    color: context.adColors.blackTextColor,
                  ).paddingAllSide(context.k_14),
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: context.k_16,
                ),
                Material(
                  borderRadius: BorderRadius.circular(context.k_16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(context.k_10),
                    child: Image.memory(
                      bytes,
                      fit: BoxFit.fill,
                      width: context.widthOfScreen - context.k_48.sp,
                      height: (context.widthOfScreen - context.k_48.sp) *
                          (offerBannerRemoteModel
                                  ?.widgetItem?.heightMultiplier ??
                              0),
                    ),
                  ),
                ),
                SizedBox(
                  height: context.k_26,
                ),
                SizedBox(
                  width: context.widthOfScreen - context.k_48.sp,
                  height: context.k_48 + context.k_2,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        const StadiumBorder(),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        context.adColors.blueColor,
                      ),
                    ),
                    onPressed: null,
                    child: Text(
                      offerBannerRemoteModel?.widgetItem?.btnText ??
                          'book_now_label'.localize(context),
                      style: ADTextStyle700.size16
                          .setTextColor(context.adColors.whiteTextColor),
                    ),
                  ),
                ),
                SizedBox(
                  height: context.k_16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
