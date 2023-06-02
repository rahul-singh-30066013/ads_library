/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/car_parking/screens/components/header_dialog.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

class ParkingBookingConfirmation extends StatelessWidget {
  ParkingBookingConfirmation({Key? key}) : super(key: key);

  static const int textMaxLines = 2;
  static const double borderRadius = 20;
  static const double secondaryBorderRadius = 8;
  static const double tertiaryBorderRadius = 4;

  final double amount = 750;

  final double spaceBetweenHeaders = 52;
  final double listViewLargeTileHeight = 450.sp;
  final double imageHeightForMoreServices = 270.sp;
  final double heightForQrCode = 142.sp;
  final double iconSize = 18.sp;

  final int leftFlex = 3;
  final int rightFlex = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: // dialog head
            <Widget>[
                  HeaderDialog(
                    emailId: 'mohit.arora@gmail.com',
                  ),
                ] +
                // qr code info
                [
                  Column(
                    children: [
                      Container(
                        height: heightForQrCode,
                        width: heightForQrCode,
                        color: context.adColors.lightGreyColor,
                      ).paddingBySide(
                        bottom: context.k_12,
                        top: context.k_30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: context.adColors.headerContainerBg,
                            size: iconSize,
                          ),
                          Text(
                            'apple_wallet'.localize(context).toUpperCase(),
                            style: ADTextStyle600.size14.setTextColor(
                              context.adColors.headerContainerBg,
                            ),
                          ).paddingBySide(
                            left: context.k_4,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Spacer(
                            flex: leftFlex,
                          ),
                          Expanded(
                            flex: rightFlex,
                            child: Text(
                              'show_qr_to_parking_executive'.localize(context),
                              maxLines: textMaxLines,
                              textAlign: TextAlign.center,
                              style: ADTextStyle500.size14.setTextColor(
                                context.adColors.blackTextColor,
                              ),
                            ).paddingBySide(
                              top: context.k_10,
                            ),
                          ),
                          Spacer(
                            flex: leftFlex,
                          ),
                        ],
                      ),
                    ],
                  ),
                ] +
                // booking details
                [
                  SizedBox(
                    height: context.k_30,
                  ),
                  Container(
                    color: const Color(0xffFBFBFB),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: leftFlex,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ParkingDetailsText(
                                title: 'vehicle_number'.localize(context),
                                value: 'DL 2C K8169',
                              ),
                              SizedBox(
                                height: context.k_30,
                              ),
                              ParkingDetailsText(
                                title: 'duration'.localize(context),
                                value: '6 hrs to 8 hrs',
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: rightFlex,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ParkingDetailsText(
                                title: 'entry_date_time'.localize(context),
                                value: 'Thu, 18 Nov, 09 - 10 am',
                              ),
                              SizedBox(
                                height: context.k_30,
                              ),
                              ParkingDetailsText(
                                title: 'location'.localize(context),
                                value: 'Terminal 1',
                                optionalText:
                                    'Chhatrapati Shivaji Maharaj International Airport',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ).paddingAllSide(context.k_16),
                  ),
                ] +
                // buttons
                [
                  SizedBox(
                    height: context.k_10,
                  ),
                ] +
                ['cancel_booking', 'get_directions']
                    .map(
                      (element) => Container(
                        height: context.k_40,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              borderRadius,
                            ),
                          ),
                          border: Border.all(
                            color: context.adColors.blackTextColor,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            element.localize(context),
                            style: ADTextStyle600.size14.setTextColor(
                              context.adColors.blackTextColor,
                            ),
                          ).paddingBySide(
                            top: context.k_10,
                            bottom: context.k_10,
                          ),
                        ),
                      ).paddingBySide(
                        top: context.k_20,
                        left: context.k_16,
                        right: context.k_16,
                      ),
                    )
                    .toList() +
                // notice banner
                [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffFFFCF6),
                      borderRadius: BorderRadius.all(
                        Radius.circular(tertiaryBorderRadius),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.info_outline_rounded,
                          size: iconSize,
                          color: context.adColors.darkGreyTextColor,
                        ).paddingBySide(right: context.k_10),
                        Flexible(
                          child: Text(
                            'parking_duration_description'.localize(context),
                            style: ADTextStyle500.size14.setTextColor(
                              context.adColors.neutralInfoMsg,
                            ),
                          ),
                        ),
                      ],
                    ).paddingAllSide(
                      context.k_16,
                    ),
                  ).paddingBySide(
                    left: context.k_16,
                    right: context.k_16,
                    top: context.k_20,
                  ),
                ] +
                //price details
                [
                  SizedBox(
                    height: spaceBetweenHeaders,
                  ),
                  const HeaderText(title: 'price_details').paddingBySide(
                    left: context.k_16,
                    right: context.k_16,
                    top: context.k_8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'booking_fee'.localize(context),
                        style: ADTextStyle500.size16.setTextColor(
                          context.adColors.greyTextColor,
                        ),
                      ),
                      Text(
                        '₹${amount.toStringAsFixed(0)}',
                        style: ADTextStyle600.size16.setTextColor(
                          context.adColors.neutralInfoMsg,
                        ),
                      ),
                    ],
                  ).paddingBySide(
                    left: context.k_16,
                    right: context.k_16,
                    top: context.k_20,
                  ),
                  Divider(
                    color: context.adColors.dividerColor,
                  ).paddingBySide(
                    left: context.k_16,
                    right: context.k_16,
                    top: context.k_20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'total_amount_paid'.localize(context),
                        style: ADTextStyle600.size20.setTextColor(
                          context.adColors.neutralInfoMsg,
                        ),
                      ),
                      Text(
                        '₹${amount.toStringAsFixed(0)}',
                        style: ADTextStyle700.size20.setTextColor(
                          context.adColors.neutralInfoMsg,
                        ),
                      ),
                    ],
                  ).paddingBySide(
                    left: context.k_16,
                    right: context.k_16,
                    top: context.k_20,
                  ),
                  Divider(
                    color: context.adColors.dividerColor,
                  ).paddingBySide(
                    left: context.k_16,
                    right: context.k_16,
                    top: context.k_16,
                  ),
                ] +
                // other services
                [
                  SizedBox(
                    height: spaceBetweenHeaders,
                  ),
                  const HeaderText(
                    title: 'other_services',
                  ).paddingBySide(
                    left: context.k_16,
                    right: context.k_16,
                  ),
                  Container(
                    height: listViewLargeTileHeight,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: {
                        'Baby Strollers':
                            'Can I make changes after two days of booking?',
                        'Kids Area':
                            'Can I make changes after two days of booking?',
                      }
                          .entries
                          .map(
                            (element) => Container(
                              width: imageHeightForMoreServices,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: imageHeightForMoreServices,
                                    decoration: const BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          secondaryBorderRadius,
                                        ),
                                      ),
                                    ),
                                  ).paddingBySide(top: context.k_20),
                                  Text(
                                    element.key,
                                    style: ADTextStyle600.size16.setTextColor(
                                      context.adColors.blackTextColor,
                                    ),
                                  ).paddingBySide(
                                    top: context.k_20,
                                  ),
                                  Expanded(
                                    child: Text(
                                      element.value,
                                      style: ADTextStyle400.size16.setTextColor(
                                        context.adColors.blackTextColor,
                                      ),
                                    ).paddingBySide(
                                      top: context.k_12,
                                    ),
                                  ),
                                ],
                              ),
                            ).paddingBySide(
                              right: context.k_20,
                            ),
                          )
                          .toList(),
                    ),
                  ).paddingBySide(
                    left: context.k_16,
                    right: context.k_16,
                  ),
                ],
      ),
    );
  }
}
