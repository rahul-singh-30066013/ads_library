/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/more/screens/customer_feedback/views/authorities_contact_information.dart';
import 'package:adani_airport_mobile/modules/more/state_management/feedback_state_management.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

/// this class is use for showing static contact us information
class ContactUsInformation extends StatefulWidget {
  const ContactUsInformation({Key? key, required this.feedbackStateManagement})
      : super(key: key);
  final FeedbackStateManagement feedbackStateManagement;

  @override
  State<ContactUsInformation> createState() => _ContactUsInformationState();
}

class _ContactUsInformationState extends State<ContactUsInformation> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.feedbackStateManagement.isAirportSelect,
      child: Container(),
      builder: (context, String value, child) {
        final airport = widget.feedbackStateManagement.airportController.text
                .toString()
                .isEmpty
            ? widget.feedbackStateManagement.elementsField?.airportDetails
                ?.firstWhere(
                (item) => item.airportCode == 'ONE',
              )
            : widget.feedbackStateManagement.elementsField?.airportDetails
                ?.firstWhere(
                (item) =>
                    item.airportName ==
                    widget.feedbackStateManagement.airportController.text
                        .toString(),
              );

        final List<String> phoneNumbers =
            airport?.airportMobile?.split('|') ?? [];
        final List<String> emails = airport?.airportEmail?.split('|') ?? [];
        final List<String> supportEmail =
            airport?.supportEmail?.split('|') ?? [];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (airport?.airportAddress?.isNotEmpty ?? false)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: context.k_16,
                    width: context.k_16,
                    child: SvgPicture.asset(
                      SvgAssets.mapIcon,
                    ),
                  ).paddingBySide(
                    right: context.k_10,
                    top: context.k_2,
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      airport?.airportAddress ?? '',
                      style: ADTextStyle400.size16.setTextColor(
                        context.adColors.blackTextColor,
                      ),
                    ),
                  ),
                ],
              ).paddingBySide(
                left: context.k_16,
                right: context.k_16,
              ),
            if (airport?.airportMobile?.isNotEmpty ?? false)
              ADSizedBox(
                height: context.k_18,
              ),
            if (airport?.airportMobile?.isNotEmpty ?? false)
              Row(
                children: [
                  Container(
                    height: context.k_16,
                    width: context.k_16,
                    child: SvgPicture.asset(
                      SvgAssets.callIcon,
                    ),
                  ).paddingBySide(
                    right: context.k_10,
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: RichText(
                      text: TextSpan(
                        text: '',
                        children: List.generate(
                          phoneNumbers.length,
                          (index) => TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: phoneNumbers[index],
                                style: ADTextStyle400.size16
                                    .setTextColor(
                                      context.adColors.blackTextColor,
                                    )
                                    .copyWith(
                                      decoration: TextDecoration.underline,
                                    ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Utils.redirectToPhoneEmail(
                                      phoneNumbers[index],
                                    );
                                  },
                              ),
                              if (phoneNumbers.length > 1 &&
                                  index != phoneNumbers.length - 1)
                                TextSpan(
                                  text: ' , ',
                                  style: ADTextStyle400.size16
                                      .setTextColor(
                                        context.adColors.greyTextColor,
                                      )
                                      .copyWith(
                                        fontSize: fifteenFontSize,
                                      ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ).paddingBySide(
                left: context.k_16,
                right: context.k_16,
                top: context.k_8,
                bottom: context.k_8,
              ),
            if (airport?.airportEmail?.isNotEmpty ?? false)
              ADSizedBox(
                height: context.k_14,
              ),
            if (airport?.airportEmail?.isNotEmpty ?? false)
              Row(
                children: [
                  Container(
                    height: context.k_16,
                    width: context.k_16,
                    child: SvgPicture.asset(
                      SvgAssets.mailIcon,
                    ),
                  ).paddingBySide(
                    right: context.k_10,
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: RichText(
                      text: TextSpan(
                        text: '',
                        children: List.generate(
                          emails.length,
                          (index) => TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: emails[index],
                                style: ADTextStyle400.size16
                                    .setTextColor(
                                      context.adColors.blackTextColor,
                                    )
                                    .copyWith(
                                      decoration: TextDecoration.underline,
                                    ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Utils.redirectToPhoneEmail(
                                      emails[index],
                                    );
                                  },
                              ),
                              if (emails.length > 1 &&
                                  index != emails.length - 1)
                                TextSpan(
                                  text: ' , ',
                                  style: ADTextStyle400.size16
                                      .setTextColor(
                                        context.adColors.greyTextColor,
                                      )
                                      .copyWith(
                                        fontSize: fifteenFontSize,
                                      ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ).paddingBySide(
                top: context.k_8,
                bottom: context.k_8,
                left: context.k_16,
                right: context.k_16,
              ),
            if (airport?.emailText?.isNotEmpty ?? false)
              Container(
                margin: EdgeInsets.only(
                  left: context.k_16,
                  right: context.k_16,
                  top: context.k_30,
                  bottom: context.k_30,
                ),
                height: 1,
                color: context.adColors.dividerColor,
              ),
            if (airport?.supportEmail?.isNotEmpty ?? false)
              Text(
                airport?.emailText ?? '',
                style: ADTextStyle700.size16.setTextColor(
                  context.adColors.blackTextColor,
                ),
              ).paddingBySide(
                left: context.k_16,
                right: context.k_16,
              ),
            if (airport?.supportEmail?.isNotEmpty ?? false)
              Row(
                children: [
                  Container(
                    height: context.k_16,
                    width: context.k_16,
                    child: SvgPicture.asset(
                      SvgAssets.mailIcon,
                    ),
                  ).paddingBySide(
                    right: context.k_10,
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: RichText(
                      text: TextSpan(
                        text: '',
                        children: List.generate(
                          supportEmail.length,
                          (index) => TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: supportEmail[index],
                                style: ADTextStyle400.size16
                                    .setTextColor(
                                      context.adColors.blackTextColor,
                                    )
                                    .copyWith(
                                      decoration: TextDecoration.underline,
                                    ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Utils.redirectToPhoneEmail(
                                      supportEmail[index],
                                    );
                                  },
                              ),
                              if (supportEmail.length > 1 &&
                                  index != supportEmail.length - 1)
                                TextSpan(
                                  text: ' , ',
                                  style: ADTextStyle400.size16
                                      .setTextColor(
                                        context.adColors.greyTextColor,
                                      )
                                      .copyWith(
                                        fontSize: fifteenFontSize,
                                      ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ).paddingBySide(
                top: context.k_20,
                left: context.k_16,
                right: context.k_16,
              ),
            AuthoritiesContactInformation(
              airportDetail: airport,
            ),
            ADSizedBox(
              height: context.k_48,
            ),
          ],
        );
      },
    );
  }
}
