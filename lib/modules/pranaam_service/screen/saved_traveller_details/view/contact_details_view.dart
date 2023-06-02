/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/main/configuration/environment.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/ad_text_field.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/text_field_with_suffix.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';

class ContactDetailsView extends StatelessWidget {
  const ContactDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'contact_details'.localize(context),
          style: ADTextStyle700.size22
              .setTextColor(context.adColors.darkGreyTextColor),
        ).paddingBySide(
          top: context.k_24,
          left: context.k_16,
          right: context.k_16,
        ),
        Text(
          'e_ticket'.localize(context),
          style: ADTextStyle400.size16
              .setTextColor(context.adColors.greyTextColor),
        ).paddingBySide(
          top: context.k_24,
          left: context.k_16,
          right: context.k_16,
          bottom: context.k_24,
        ),
        TextFieldWithSuffix(
          prefixLabelText: 'Country Code',
          labelText: 'Mobile No.',
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.k_10),
            child: Image.network(
              '${Environment.instance.configuration.cmsImageBaseUrl}-/media/Feature/Adani/CountryFlags/flags/in.png?h=39&iar=0&w=60&hash=5190E21452F6BADC10EE1257FEF2F7F7',
              width: context.k_20,
              height: context.k_20,
            ),
          ),
          onPrefixTap: (value) => adLog('onTap'),
        ).paddingBySide(
          left: context.k_16,
          right: context.k_16,
          bottom: context.k_24,
        ),
        const ADTextField(label: 'Email ID').paddingBySide(
          left: context.k_16,
          right: context.k_16,
          bottom: context.k_24,
        ),
        CheckboxListTile(
          activeColor: context.adColors.blackTextColor,
          contentPadding: EdgeInsets.symmetric(horizontal: context.k_16),
          //    <-- label
          value: false,
          onChanged: (newValue) => adLog('value'),
          title: Text(
            'booking_details_whatsapp'.localize(context),
            style: ADTextStyle400.size14.setTextColor(
              context.adColors.greyTextColor,
            ),
          ),
          controlAffinity: ListTileControlAffinity.leading,
        ),
        Divider(
          height: context.k_20,
          color: context.adColors.dividerColor,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'add_gst_details'.localize(context),
              style: ADTextStyle400.size14
                  .setTextColor(context.adColors.greyTextColor),
            ),
            const Icon(Icons.chevron_right),
          ],
        ).paddingBySide(
          left: context.k_16,
          right: context.k_16,
          bottom: context.k_24,
        ),
      ],
    );
  }
}
