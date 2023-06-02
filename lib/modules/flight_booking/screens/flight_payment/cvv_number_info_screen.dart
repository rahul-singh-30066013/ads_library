/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/site_core/model/site_core_payment/promo_card.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';

const imageWidth = 148.0;
const imageHeight = 106.0;

class CvvNumberInfoScreen extends StatefulWidget {
  final List<PromoCard>? promoCards;

  const CvvNumberInfoScreen({
    Key? key,
    required this.promoCards,
  }) : super(key: key);

  @override
  _CvvNumberInfoScreenState createState() => _CvvNumberInfoScreenState();
}

class _CvvNumberInfoScreenState extends State<CvvNumberInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: widget.promoCards?.length ?? 0,
      itemBuilder: (context, index) {
        return widget.promoCards != null
            ? CvvInfoView(
                cardImage: widget.promoCards?[index].imageSmall,
                cardName: widget.promoCards?[index].heading ?? '',
                cardDescription: widget.promoCards?[index].description ?? '',
              )
            : const SizedBox.shrink();
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          thickness: 1,
          color: context.adColors.dividerColor,
        ).paddingBySide(
          left: context.k_40,
          right: context.k_40,
          bottom: context.k_20,
        );
      },
    );
  }
}

class CvvInfoView extends StatelessWidget {
  final String? cardImage;
  final String? cardName;
  final String? cardDescription;

  const CvvInfoView({
    Key? key,
    required this.cardImage,
    required this.cardName,
    required this.cardDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          cardImage ?? '',
          // height: imageHeight.sp,
          // width: imageWidth.sp,
          fit: BoxFit.fill,
        ).paddingBySide(top: context.k_20, bottom: context.k_30),
        Text(
          cardName ?? '',
          style: ADTextStyle700.size18
              .copyWith(color: context.adColors.blackTextColor),
        ).paddingBySide(bottom: context.k_10),
        Text(
          cardDescription ?? '',
          textAlign: TextAlign.center,
          style: ADTextStyle400.size16
              .copyWith(color: context.adColors.neutralInfoMsg),
        ).paddingBySide(
          left: context.k_48,
          right: context.k_48,
          bottom: context.k_40,
        ),
      ],
    );
  }
}
