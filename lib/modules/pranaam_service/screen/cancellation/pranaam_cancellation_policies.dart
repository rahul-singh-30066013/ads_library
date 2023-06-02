/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/constants/assets/svg_assets.dart';
import 'package:adani_airport_mobile/modules/more/state_management/site_core_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/model/cancellation_policies/cancellation_policies_model.dart'
    as policies;
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cancellation/view/cancellation_policies_table.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/bottom_sheets/ad_draggable_sheet_header.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class PranaamCancellationPolicies extends StatefulWidget {
  final policies.Element pranaamCancellationPolicies;
  const PranaamCancellationPolicies({
    Key? key,
    required this.pranaamCancellationPolicies,
  }) : super(key: key);

  @override
  State<PranaamCancellationPolicies> createState() =>
      _PranaamCancellationPoliciesState();
}

class _PranaamCancellationPoliciesState
    extends State<PranaamCancellationPolicies> {
  SiteCoreStateManagement pranaamSitecoreStateManagement =
      SiteCoreStateManagement();
  @override
  void initState() {
    pranaamSitecoreStateManagement = context.read<SiteCoreStateManagement>();
    adLog(
      'pranaamSitecoreStateManagement cancellationPolicies ${widget.pranaamCancellationPolicies}',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ADSizedBox(
          height: context.k_28,
        ),
        InkWell(
          splashColor: context.adColors.transparentColor,
          onTap: () => {
            Navigator.pop(context),
          },

          ///Image that will be used to Left Top close button
          child: Container(
            width: context.k_34,
            height: context.k_34,
            child: SvgPicture.asset(
              SvgAssets.closeIcon,
              height: context.k_14,
              width: context.k_14,
              color: closeIconColor,
            ).paddingAllSide(context.k_10),
          ),
        ).paddingBySide(left: context.k_10),
        Text(
          'Cancellation Policy',
          textAlign: TextAlign.left,
          style: ADTextStyle700.size22.setTextColor(context.adColors.black),
        ).paddingAllSide(context.k_16),
        Text(
          'application_on_all_sectors'.localize(context),
          style: ADTextStyle400.size16
              .copyWith(color: context.adColors.greyTextColor),
        ).paddingBySide(
          top: context.k_4,
          left: context.k_16,
          right: context.k_16,
          bottom: context.k_30,
        ),
        CancellationPoliciesTable(
          pranaamCancellationPolicies: widget.pranaamCancellationPolicies,
        ),
      ],
    );
  }
}
