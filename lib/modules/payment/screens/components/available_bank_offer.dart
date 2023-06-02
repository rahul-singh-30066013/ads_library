/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

class AvailableBankOffer extends StatefulWidget {
  final String bankOfferHeader;
  final String bankOfferDescription;

  /// its use for bank offer
  final String offerImage;

  const AvailableBankOffer({
    required this.bankOfferHeader,
    required this.bankOfferDescription,
    required this.offerImage,
    Key? key,
  }) : super(key: key);

  @override
  _AvailableBankOfferState createState() => _AvailableBankOfferState();
}

class _AvailableBankOfferState extends State<AvailableBankOffer> {
  double rightMargin = 52.sp;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: context.k_22,
              height: context.k_22,
              child: SvgPicture.network(
                widget.offerImage,
              ),
            ).paddingBySide(
              left: context.k_20,
            ),
            Text(
              widget.bankOfferHeader,
              style: ADTextStyle700.size16.setTextColor(
                context.adColors.black,
              ),
            ).paddingBySide(
              left: context.k_10,
            ),
          ],
        ),
        Text(
          widget.bankOfferDescription,
          style: ADTextStyle400.size14.setTextColor(
            context.adColors.neutralInfoMsg,
          ),
        ).paddingBySide(
          left: rightMargin,
          top: context.k_8,
        ),
      ],
    );
  }
}
