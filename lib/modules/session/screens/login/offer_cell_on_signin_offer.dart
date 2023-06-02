import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class OfferCellOnSignInOffer extends StatefulWidget {
  final String offerName;
  final String offerDescription;
  final String couponCode;
  final double containerWidth;
  const OfferCellOnSignInOffer({
    required this.offerName,
    required this.offerDescription,
    required this.couponCode,
    required this.containerWidth,
    Key? key,
  }) : super(key: key);

  @override
  _OfferCellOnSignInOfferState createState() => _OfferCellOnSignInOfferState();
}

class _OfferCellOnSignInOfferState extends State<OfferCellOnSignInOffer> {
  final double fontSize13 = 13;
  final int maxLinesLimit = 2;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.adColors.paleGrey,
        borderRadius: BorderRadius.all(Radius.circular(context.k_30)),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            SvgAssets.couponCode,
            width: context.k_18,
            height: context.k_18,
            color: context.adColors.black,
          ),
          SizedBox(
            width: widget.containerWidth,
            child: Text(
              '${widget.offerDescription} - ${widget.couponCode}',
              style: ADTextStyle500.size12
                  .setTextColor(
                    context.adColors.blackTextColor,
                  )
                  .copyWith(fontSize: fontSize13),
              maxLines: maxLinesLimit,
            ),
          ).paddingBySide(
            top: context.k_14,
            bottom: context.k_14,
            left: context.k_10,
          ),
          /*Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                // widget.offerName,
                '${widget.offerDescription} - ${widget.couponCode}',
                style: ADTextStyle500.size14
                    .setTextColor(context.adColors.blackTextColor)
                    .copyWith(fontSize: fontSize13),
              ),
              const SizedBox(
                height: 1,
              ),
              */ /*Text(
                widget.offerDescription,
                style: ADTextStyle400.size14
                    .setTextColor(context.adColors.blackTextColor),
              ),*/ /*
            ],
          ).paddingBySide(
            top: context.k_14,
            bottom: context.k_14,
            left: context.k_10,
          ),*/
        ],
      ).paddingBySide(
        left: context.k_20,
        right: context.k_20,
      ),
    );
  }
}
