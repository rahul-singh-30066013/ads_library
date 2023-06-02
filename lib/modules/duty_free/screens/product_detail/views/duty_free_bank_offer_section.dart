/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:math';

import 'package:adani_airport_mobile/modules/duty_free/screen_helper/automation_keys/product_detail_automation_keys.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/views/offer_tile.dart';
import 'package:adani_airport_mobile/modules/offers/model/offer_dashboard_response.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class DutyFreeBankOfferSection extends StatefulWidget {
  const DutyFreeBankOfferSection({Key? key, required this.offerList})
      : super(key: key);
  final List<WidgetItem> offerList;

  @override
  State<DutyFreeBankOfferSection> createState() =>
      _DutyFreeBankOfferSectionState();
}

class _DutyFreeBankOfferSectionState extends State<DutyFreeBankOfferSection> {
  int currentCount = 2;
  bool seeAll = false;

  @override
  Widget build(BuildContext context) {
    return widget.offerList.isNotEmpty
        ? Column(
            children: [
              Divider(
                color: context.adColors.dividerColor,
                thickness: 1,
              ).paddingBySide(
                top: context.k_20,
                bottom: context.k_30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'best_offers'.localize(context),
                      style: ADTextStyle600.size18,
                    ),
                  ),
                  if (!seeAll && widget.offerList.length > currentCount)
                    InkWell(
                      onTap: () => setState(() {
                        seeAll = true;
                      }),
                      child: Text(
                        'see_all'.localize(context),
                        style: ADTextStyle400.size18.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                ],
              ),
              ADSizedBox(
                height: context.k_20,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: seeAll
                    ? widget.offerList.length
                    : min(
                        widget.offerList.length,
                        currentCount,
                      ),
                itemBuilder: (context, index) {
                  // return SizedBox.shrink();
                  return OfferTile(
                    key: Key(
                      '${ProductDetailAutomationKeys.offerKey}$index',
                    ),
                    text: widget.offerList[index].bankOfferText,
                    termsAndCondition: widget.offerList[index].termCondition,
                  );
                },
              ),
            ],
          )
        : const ADSizedBox.shrink();
  }
}
