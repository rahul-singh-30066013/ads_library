/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/components/no_record_found.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';

class PranaamCartEmpty extends StatelessWidget {
  const PranaamCartEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NoRecordFound(
      errorMessage: 'your_cart_looks_empty'.localize(context),
      subTitleError: 'lets_fill_it_with_some_goodness'.localize(context),
      buttonText: 'start_shopping'.localize(context),
      imagePath: 'lib/assets/gif/empty_cart.gif',
    );
  }
}
