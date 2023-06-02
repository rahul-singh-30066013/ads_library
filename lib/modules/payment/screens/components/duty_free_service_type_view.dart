/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

const int serviceTypeCardColor = 0xfff5faff;

class DutyFreeServiceTypeView extends StatefulWidget {
  const DutyFreeServiceTypeView({
    Key? key,
    required this.onInfoTap,
  }) : super(key: key);
  final GestureTapCallback onInfoTap;

  @override
  State<DutyFreeServiceTypeView> createState() =>
      _DutyFreeServiceTypeViewState();
}

class _DutyFreeServiceTypeViewState extends State<DutyFreeServiceTypeView> {
  DutyFreeState _dutyFreeState = DutyFreeState();

  @override
  void initState() {
    _dutyFreeState = context.read<DutyFreeState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const double circleIconSize = 6;
    return Container(
      padding: EdgeInsets.all(context.k_16),
      margin: EdgeInsets.symmetric(
        horizontal: context.k_16,
      ),
      decoration: BoxDecoration(
        color: const Color(serviceTypeCardColor),
        borderRadius: BorderRadius.circular(context.k_4),
      ),
      child: InkWell(
        onTap: widget.onInfoTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ADSizedBox(
                  //   height: context.k_10,
                  // ),
                  RichText(
                    text: TextSpan(
                      text: 'duty_free'.localize(context),
                      style: ADTextStyle700.size16.setTextColor(
                        context.adColors.blackColor,
                      ),
                      children: [
                        TextSpan(
                          text:
                              ' (${_dutyFreeState.dutyFreeCartResponse?.itemDetails.length} ${(_dutyFreeState.dutyFreeCartResponse?.itemDetails.length ?? 0) > 1 ? 'items'.localize(context) : 'item'.localize(context)})',
                          style: ADTextStyle400.size14.setTextColor(
                            context.adColors.greyTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ADSizedBox(
                    height: context.k_6,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${_dutyFreeState.airportData?.city}',
                          style: ADTextStyle400.size14,
                        ),
                        WidgetSpan(
                          child: ADSizedBox(
                            width: context.k_6,
                          ),
                        ),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Icon(
                            Icons.circle,
                            size: circleIconSize,
                            color: context.adColors.circleGreyTextColor,
                          ),
                        ),
                        WidgetSpan(
                          child: ADSizedBox(
                            width: context.k_6,
                          ),
                        ),
                        TextSpan(
                          text: '${_dutyFreeState.collectionPointName}',
                          style: ADTextStyle400.size14,
                        ),
                      ],
                    ),
                  ),
                  ADSizedBox(
                    height: context.k_6,
                  ),
                  Text(
                    '${'pickup'.localize(context)} - ${(DateFormat('EEE, d MMM,').format(DateFormat('dd/MM/yyyy').parse('${_dutyFreeState.dutyFreeCartResponse?.passengerDetail.first.pickupDate}'))).replaceAll("AM", "am").replaceAll("PM", "pm")} ${_dutyFreeState.pickupTimeController.text}'
                      ..replaceAll('AM', 'am').replaceAll('PM', 'pm'),
                    style: ADTextStyle400.size14,
                  ),
                ],
              ),
            ),
            ADSizedBox(
              width: context.k_10,
            ),
            GestureDetector(
              onTap: widget.onInfoTap,
              child: SvgPicture.asset(
                'lib/assets/images/svg/icons/shopping/i_common.svg',
                height: context.k_18,
                color: context.adColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
