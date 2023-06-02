/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/local_cart_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/confirmation/view/product_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

class OrderSummaryView extends StatelessWidget {
  final bool showHeading;

  /// this is used to draw the no of item you have ordered including addons.
  const OrderSummaryView({
    Key? key,
    this.showHeading = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    final PranaamAppDataStateManagement pranaamAppDataStateManagement =
        context.read<PranaamAppDataStateManagement>();
    final List<LocalCartModel> cartList = getCartAdded(
      pranaamAppDataStateManagement.cartDataResponse,
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.k_16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showHeading)
            ADSizedBox(
              height: context.k_20,
            ),
          if (showHeading)
            Text(
              'order_summary'.localize(context),
              style: ADTextStyle700.size22,
            )
          else
            const SizedBox.shrink(),
          ADSizedBox(
            height: context.k_8,
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: cartList.length,
            itemBuilder: (context, index) {
              final standAloneImage = pranaamAppDataStateManagement
                  .cartDataResponse?.standaloneProductDetails.imageUrl;
              return ProductView(
                isStandAlone: isStandAloneService(
                  pranaamAppDataStateManagement
                          .cartDataResponse?.pranaamBookingType ??
                      '',
                ),
                standAloneImage: (standAloneImage?.isNotEmpty ?? false)
                    ? standAloneImage ?? 'lib/assets/images/pranaam/porter2.png'
                    : 'lib/assets/images/pranaam/porter2.png',
                standAloneName: pranaamAppDataStateManagement
                        .cartDataResponse?.standaloneProductDetails.name ??
                    '',
                standAlonePrice: pranaamAppDataStateManagement.cartDataResponse
                        ?.standaloneProductDetails.pricingInfo.totalFare.amount
                        .toString() ??
                    '',
                isAddOn: cartList[index].isCartAddOn,
                image: index == 0
                    ? cartList[index].packageImage != '' &&
                            cartList[index].packageImage != null
                        ? cartList[index].packageImage ?? ''
                        : 'lib/assets/images/pranaam/pranaam_logo.png'
                    : cartList[index].packageAddOn?.addOnImage ??
                        'lib/assets/images/pranaam/porter2.png',
                packagePrice: cartList[index].isCartAddOn
                    ? cartList[index].packageAddOn?.totalPrice.toString() ?? ''
                    : cartList[index].price.toString(),
                packageType: cartList[index].name,
                quantity: cartList[index].isCartAddOn
                    ? cartList[index].quantity.toString()
                    : '1',
              );
            },
          ),
        ],
      ),
    );
  }
}
