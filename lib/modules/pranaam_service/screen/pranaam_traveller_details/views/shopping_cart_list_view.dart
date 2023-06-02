/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/pranaam_service/model/common_api_data/cart_response.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/cart/local_cart_model.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/screen/pranaam_traveller_details/views/shopping_cart_item_view.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/state_management/pranaam_app_data_state_management.dart';
import 'package:adani_airport_mobile/modules/pranaam_service/utils/helpers/pranaam_helper.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/localization/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/constants/ad_text_styles.dart';
import 'package:superapp_mobile_style_guide/extensions/color_scheme_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/size_config_extension.dart';
import 'package:superapp_mobile_style_guide/extensions/text_style_extension.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

const int listCount = 2;

class ShoppingCartListView extends StatefulWidget {
  /// This is used to draw list of your booked items like package and addons.
  const ShoppingCartListView({
    Key? key,
  }) : super(key: key);

  @override
  State<ShoppingCartListView> createState() => _ShoppingCartListViewState();
}

class _ShoppingCartListViewState extends State<ShoppingCartListView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    adLog('Widget build', className: this);
    return Selector<PranaamAppDataStateManagement, CartResponse?>(
      selector: (context, viewModel) => viewModel.cartDataResponse,
      builder: (context, cartDataResponse, child) {
        final List<LocalCartModel> cartList = getCartAdded(cartDataResponse);
        final cartQty = getAddonAddedByUserCount(cartDataResponse);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: context.k_16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'cart'.localize(context),
                  style: ADTextStyle700.size22,
                  children: [
                    TextSpan(
                      text: ' ($cartQty item)',
                      style: ADTextStyle400.size22.setTextColor(
                        context.adColors.brownishGrey,
                      ),
                    ),
                  ],
                ),
              ),
              ADSizedBox(
                height: context.k_20,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  vertical: context.k_10,
                ),
                shrinkWrap: true,
                itemCount: cartList.length,
                itemBuilder: (context, index) => ShoppingCartItemView(
                  isAddOn: cartList[index].isCartAddOn,
                  addonImage: cartList[index].isCartAddOn
                      ? cartList[index].packageAddOn?.addOnImage ??
                          'lib/assets/images/pranaam/porter2.png'
                      : cartList[index].packageImage != '' &&
                              cartList[index].packageImage != null
                          ? cartList[index].packageImage ?? ''
                          : 'lib/assets/images/pranaam/pranaam_logo.png',
                  lastIndex: cartList.length - 1 != index,
                  packagePrice: cartList[index].isCartAddOn
                      ? cartList[index].price * cartList[index].quantity
                      : cartList[index].price * 1,
                  packageType: cartList[index].name,
                  quantity: cartList[index].isCartAddOn
                      ? cartList[index].quantity
                      : 1,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

List<ShoppingItem> shoppingItemList = [
  ShoppingItem(
    packageType: 'Elite',
    quantity: 1,
    packagePrice: 1525,
  ),
  ShoppingItem(
    packageType: 'Bouquet of Red Roses',
    quantity: 1,
    packagePrice: 800,
  ),
];

///TODO generic move to one class

class ShoppingItem {
  final String packageType;
  final int quantity;
  final double packagePrice;

  ShoppingItem({
    required this.packageType,
    required this.quantity,
    required this.packagePrice,
  });
}
