/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/widget_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///creating header with vertical list for cart item
const colorTopHeader = 0xfffef6ea;

class DutyFreeCreateCartListHeader extends StatelessWidget {
  const DutyFreeCreateCartListHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // shoppingCartViewModel.getShoppingCartItem(productList);

    return ValueListenableBuilder(
      valueListenable: context.read<DutyFreeState>().cartError,
      builder: (
        context,
        String value,
        child,
      ) =>
          value.isEmpty
              ? const ADSizedBox.shrink()
              : Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(context.k_4),
                    ),
                    color: const Color(colorTopHeader),
                  ),
                  padding: EdgeInsets.all(context.k_16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: context.adColors.blackTextColor,
                        size: context.k_20,
                      ),
                      Expanded(
                        child: Text(
                          value.isEmpty
                              ? ''
                              : context.read<DutyFreeState>().cartError.value,
                          style: ADTextStyle400.size12
                              .setTextColor(context.adColors.blackTextColor),
                        ).paddingBySide(left: context.k_8),
                      ),
                    ],
                  ),
                ),
    );
  }
}
