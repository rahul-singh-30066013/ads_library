/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/duty_free_important_policies_response.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/customer_information/views/customer_info_files/duty_free_cancellation_date_change_policies.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/ad_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

final _heightOfContaier = 69.sp;

class CancellationDateChangeView extends StatelessWidget {
  const CancellationDateChangeView({Key? key, required this.policiesList})
      : super(key: key);
  final List<DutyFreeImportantPoliciesResponse> policiesList;
  @override
  Widget build(BuildContext context) {
    return policiesList.isEmpty
        ? ADSizedBox(
            height: context.k_4,
          )
        : Container(
            height: _heightOfContaier,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: context.k_8,
                  color: context.adColors.cardBackgroundColor,
                ),
                bottom: BorderSide(
                  width: context.k_8,
                  color: context.adColors.cardBackgroundColor,
                ),
              ),
            ),
            margin: EdgeInsets.only(bottom: context.k_34),
            child: InkWell(
              onTap: () =>
                  _cancellationAndDateChangePloicies(context, policiesList),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Cancellation & Date Change Policy',
                      style: ADTextStyle600.size16.setTextColor(
                        context.adColors.neutralInfoMsg,
                      ),
                    ).paddingBySide(left: context.k_20),
                  ),
                  // Spacer(),
                  SvgPicture.asset(
                    SvgAssets.arrowRight,
                    width: context.k_14,
                    height: context.k_14,
                    color: context.adColors.greyTextColor,
                  ),
                  ADSizedBox(
                    width: context.k_20,
                  ),
                ],
              ),
            ),
          );
  }

  void _cancellationAndDateChangePloicies(
    BuildContext context,
    List<DutyFreeImportantPoliciesResponse> policiesList,
  ) {
    adShowBottomSheet(
      isHeaderRequired: false,
      context: context,
      childWidget: DutyfreeCancellationDateChangePolicies(
        poiliciesList: policiesList,
      ),
      headerTitle: '',
      isPaddingRequired: false,
    );
    return;
  }
}
