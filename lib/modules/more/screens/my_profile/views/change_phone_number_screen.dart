/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */
import 'package:adani_airport_mobile/modules/more/screens/my_profile/views/change_profile_template.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';

class ChangePhoneNumberScreen extends StatelessWidget {
  const ChangePhoneNumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeProfileTemplate(
      title: 'change_mobile_no'.localize(context),
      subtitle: 'new_phone_num_otp'.localize(context),
      ///TODO:Add phone number textfield
      child: Container(),
      ///TODO:Add send otp to new number callback
      onTap: () => adLog('Otp to new number'),
    );
  }
}