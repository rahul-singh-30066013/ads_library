/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/touchable_opacity/touchable_opacity.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/views/duty_free_offers_terms_condition.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/bottom_sheet_utils.dart';
import 'package:adani_airport_mobile/modules/offers/model/offer_dashboard_response.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class CartAvailableOffers extends StatefulWidget {
  const CartAvailableOffers({Key? key, required this.offers}) : super(key: key);

  final List<WidgetItem> offers;

  @override
  State<CartAvailableOffers> createState() => _CartAvailableOffersState();
}

class _CartAvailableOffersState extends State<CartAvailableOffers> {
  final ValueNotifier<bool> _isExpanded = ValueNotifier(false);
  final iconQuarterTurns = 3;
  List<WidgetItem> filteredOffers = [];
  @override
  void dispose() {
    _isExpanded.dispose();
    super.dispose();
  }

  Future<void> filterOffers() async {
    for (final item in widget.offers) {
      if (item.bankOfferText.isNotEmpty) {
        filteredOffers.add(item);
      }
    }
    setState(() => {});
  }

  @override
  void initState() {
    filterOffers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return filteredOffers.isNotEmpty
        ? Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: context.adColors.lightGreyGridSeparatorColor,
              ),
              borderRadius: BorderRadius.circular(
                context.k_6,
              ),
            ),
            padding: EdgeInsets.only(
              left: context.k_16,
              right: context.k_16,
              top: context.k_16,
              bottom: context.k_16,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RotatedBox(
                  quarterTurns: 1,
                  child: Icon(
                    Icons.local_offer_outlined,
                    size: context.k_18,
                    color: context.adColors.neutralInfoMsg,
                  ),
                ).paddingBySide(
                  right: context.k_12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'available_offers'.localize(context),
                        style: ADTextStyle600.size16,
                      ),
                      ValueListenableBuilder(
                        valueListenable: _isExpanded,
                        builder: (context, bool value, child) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: value
                                  ? filteredOffers.length
                                  : filteredOffers.isNotEmpty
                                      ? 1
                                      : 0,
                              itemBuilder: (context, index) => filteredOffers[
                                          index]
                                      .bankOfferText
                                      .isNotEmpty
                                  ? RichText(
                                      text: TextSpan(
                                        text:
                                            '${filteredOffers[index].bankOfferText} ',
                                        children: [
                                          TextSpan(
                                            text: 'T_C'.localize(context),
                                            style: ADTextStyle400.size16
                                                .setTextColor(
                                                  context
                                                      .adColors.blackTextColor,
                                                )
                                                .copyWith(
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () =>
                                                  termsAndConditionBottomsSheet(
                                                    context,
                                                    filteredOffers[index]
                                                        .termCondition,
                                                  ),
                                          ),
                                        ],
                                        style: ADTextStyle400.size16,
                                      ),
                                    ).paddingBySide(top: context.k_10)
                                  : const ADSizedBox.shrink(),
                            ),
                            TouchableOpacity(
                              onTap: () =>
                                  _isExpanded.value = !_isExpanded.value,
                              child: value
                                  ? Row(
                                      children: [
                                        Text(
                                          'showLess'.localize(context),
                                          style: ADTextStyle400.size16
                                              .copyWith(
                                                color: context
                                                    .adColors.blackTextColor,
                                              )
                                              .copyWith(
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                        ).paddingBySide(
                                          right: context.k_2,
                                        ),
                                        RotatedBox(
                                          quarterTurns: iconQuarterTurns,
                                          child: Icon(
                                            Icons.chevron_right,
                                            color: context.adColors.black,
                                            size: context.k_20,
                                          ),
                                        ),
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        Text(
                                          'showMore'.localize(context),
                                          style: ADTextStyle400.size16
                                              .copyWith(
                                                color: context
                                                    .adColors.blackTextColor,
                                              )
                                              .copyWith(
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                        ).paddingBySide(
                                          right: context.k_2,
                                        ),
                                        RotatedBox(
                                          quarterTurns: 1,
                                          child: Icon(
                                            Icons.chevron_right,
                                            color: context.adColors.black,
                                            size: context.k_20,
                                          ),
                                        ),
                                      ],
                                    ),
                            ).paddingBySide(top: context.k_10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ).paddingBySide(
            left: context.k_16,
            right: context.k_16,
            bottom: context.k_30,
          )
        : const ADSizedBox.shrink();
  }

  void termsAndConditionBottomsSheet(
    BuildContext context,
    List<String> terms,
  ) =>
      BottomSheetUtils.showDraggableBottomSheetDialog(
        context,
        // ReschedulePage(),
        DutyFreeOffersTermsCondition(
          terms: terms,
        ),
        'terms_and_condition'.localize(context),
      );
}
