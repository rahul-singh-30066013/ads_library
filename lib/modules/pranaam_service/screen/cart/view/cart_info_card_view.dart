/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_cart_utils.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/colors/ad_colors.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class CartInfoCardView extends StatelessWidget {
  const CartInfoCardView({
    Key? key,
    required this.serviceName,
    required this.serviceAirPort,
  }) : super(key: key);
  final String serviceName;
  final String serviceAirPort;

  @override
  Widget build(BuildContext context) {
    const infoCardColor = Color.fromRGBO(246, 233, 208, 0.5);
    return Container(
      decoration: BoxDecoration(
        color: infoCardColor,
        borderRadius: BorderRadius.all(Radius.circular(context.k_6)),
      ),
      padding: EdgeInsets.only(
        top: context.k_22,
        bottom: context.k_22,
        left: context.k_20,
        right: context.k_16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Important_information_about_cart'.localize(context),
            style: ADTextStyle700.size16.setTextColor(ADColors.black),
          ),
          SizedBox(
            height: context.k_16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: ADColors.black,
                  shape: BoxShape.circle,
                ),
                height: context.k_6,
                width: context.k_6,
              ).paddingBySide(top: context.k_4, right: context.k_8),
              Flexible(
                child: FutureBuilder(
                  future: AppCartUtils().readCartName(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    return snapshot.hasData
                        ? RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: (snapshot.data as String)
                                              .toLowerCase() ==
                                          'dutyfree'
                                      ? 'item_belongs_to'.localize(context)
                                      : '${'Your_cart_contains'.localize(context)} $serviceName ${"Service_package_added_at".localize(context)} ',
                                  style: ADTextStyle500.size16.setTextColor(
                                    context.adColors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: (snapshot.data as String)
                                              .toLowerCase() ==
                                          'dutyfree'
                                      ? '$serviceAirPort ${'Duty Free'}.'
                                      : '$serviceAirPort ${"airportTitle".localize(context)}. ',
                                  style: ADTextStyle700.size16.setTextColor(
                                    context.adColors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Click_to_continue_to_proceed'
                                      .localize(context),
                                  style: ADTextStyle500.size16.setTextColor(
                                    context.adColors.black,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const ADSizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: context.k_10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: ADColors.black,
                  shape: BoxShape.circle,
                ),
                height: context.k_6,
                width: context.k_6,
              ).paddingBySide(top: context.k_4, right: context.k_8),
              Flexible(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Wish_to_go_back_to'.localize(context),
                        style: ADTextStyle500.size16.setTextColor(
                          context.adColors.black,
                        ),
                      ),
                      TextSpan(
                        text: (selectedAirportsData?.isNonAdaniAirport ?? false)
                            ? '${selectedAirportNotifier.value}? '
                            : '${selectedAirportNotifier.value} ${"airportTitle".localize(context)}? ',
                        style: ADTextStyle700.size16.setTextColor(
                          context.adColors.black,
                        ),
                      ),
                      WidgetSpan(
                        child: InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Text(
                            'click_here_customer_information_page'
                                .localize(context),
                            style: ADTextStyle500.size16
                                .setTextColor(
                                  context.adColors.black,
                                )
                                .copyWith(
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ).paddingBySide(
      left: context.k_16,
      right: context.k_16,
    );
  }
}
