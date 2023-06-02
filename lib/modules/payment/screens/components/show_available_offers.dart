/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/cabs/repository/cab_googleanalytics.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/views/duty_free_offers_terms_condition.dart';
import 'package:adani_airport_mobile/modules/duty_free/utils/constant/svg_assets.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/payment_method_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/utils/bottom_sheet_utils.dart';
import 'package:adani_airport_mobile/modules/offers/model/offer_dashboard_response.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

// this class will show all available offers
class ShowAvailableOffers extends StatefulWidget {
  final List<WidgetItem> offerList;
  final bool isBorderRequired;
  final PaymentMethodState? paymentMethodViewModel;

  const ShowAvailableOffers({
    this.paymentMethodViewModel,
    required this.offerList,
    this.isBorderRequired = true,
    Key? key,
  }) : super(key: key);

  @override
  State<ShowAvailableOffers> createState() => _ShowAvailableOffersState();
}

class _ShowAvailableOffersState extends State<ShowAvailableOffers> {
  bool isWidgetExpand = false;
  int tempListSize = 0;
  int minimumShowItem = 1;

  @override
  void initState() {
    tempListSize = widget.offerList.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.offerList.isNotEmpty
        ? Container(
            padding: EdgeInsets.symmetric(
              horizontal: widget.isBorderRequired ? context.k_14 : 0,
              vertical: widget.isBorderRequired ? context.k_14 : 0,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: widget.isBorderRequired
                    ? context.adColors.lightGreyGridSeparatorColor
                    : context.adColors.transparentColor,
              ),
              borderRadius: BorderRadius.circular(context.k_8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      SvgAssets.icTag,
                      height: context.k_18,
                      width: context.k_18,
                      color: context.adColors.blackTextColor,
                      fit: BoxFit.cover,
                    ).paddingBySide(right: context.k_12),
                    Text(
                      'available_offer'.localize(context),
                      style: ADTextStyle500.size16
                          .setTextColor(context.adColors.blackTextColor),
                    ),
                  ],
                ),
                ADSizedBox(
                  height: context.k_10,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${widget.offerList.first.bankOfferText} ',
                        style: ADTextStyle400.size14.setTextColor(
                          context.adColors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'T_C'.localize(context),
                        style: ADTextStyle500.size14
                            .setTextColor(
                              context.adColors.black,
                            )
                            .copyWith(
                              decoration: TextDecoration.underline,
                            ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => termsAndConditionBottomsSheet(
                                context,
                                widget.offerList.first.termCondition,
                              ),
                      ),
                    ],
                  ),
                ).paddingBySide(
                  left: context.k_30,
                  right: context.k_2,
                  bottom: context.k_10,
                ),
                if (isWidgetExpand && tempListSize > minimumShowItem)
                  MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    removeBottom: true,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: tempListSize - 1,
                      itemBuilder: (context, index) {
                        return RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: widget.offerList[index + 1].bankOfferText,
                                style: ADTextStyle400.size14.setTextColor(
                                  context.adColors.black,
                                ),
                              ),
                              TextSpan(
                                text: ' ${'T_C'.localize(context)}',
                                style: ADTextStyle500.size14
                                    .setTextColor(
                                      context.adColors.black,
                                    )
                                    .copyWith(
                                      decoration: TextDecoration.underline,
                                    ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => termsAndConditionBottomsSheet(
                                        context,
                                        widget
                                            .offerList[index + 1].termCondition,
                                      ),
                              ),
                            ],
                          ),
                        ).paddingBySide(top: context.k_2, bottom: context.k_6);
                        /*return Text(
                  'This is test offer, This is test offer, This is test offer, This is test offer, This is test offer, This is test offer',
                  style: ADTextStyle400.size14
                      .setTextColor(context.adColors.black),
                ).paddingBySide(top: context.k_2, bottom: context.k_6);*/
                      },
                    ).paddingBySide(left: context.k_30, right: context.k_6),
                  ),
                if (tempListSize > minimumShowItem)
                  InkWell(
                    onTap: () => updateWidget(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          !isWidgetExpand
                              ? 'show_more'.localize(context)
                              : 'showLess'.localize(context),
                          style: ADTextStyle400.size14
                              .setTextColor(context.adColors.blackTextColor)
                              .copyWith(
                                decoration: TextDecoration.underline,
                              ),
                        ),
                        Icon(
                          !isWidgetExpand
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_up,
                          size: context.k_22,
                        ),
                      ],
                    ).paddingBySide(left: context.k_30),
                  ),
              ],
            ),
          )
        : const SizedBox.shrink();
  }

  void termsAndConditionBottomsSheet(
    BuildContext context,
    List<String> terms,
  ) {
    if (widget.paymentMethodViewModel?.paymentModule ==
        PaymentModule.cabBooking) {
      CabGoogleAnalytics()
          .sendGAParametersAvailableOffers(widget.paymentMethodViewModel);
    }
    BottomSheetUtils.showDraggableBottomSheetDialog(
      context,
      // ReschedulePage(),
      DutyFreeOffersTermsCondition(
        terms: terms,
      ),
      'terms_and_condition'.localize(context),
    ).then((value) => null);
  }

  void updateWidget() {
    setState(() {
      isWidgetExpand ? isWidgetExpand = false : isWidgetExpand = true;
    });
  }
}
