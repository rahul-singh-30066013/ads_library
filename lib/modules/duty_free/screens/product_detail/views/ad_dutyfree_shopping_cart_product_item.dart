/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:adani_airport_mobile/modules/duty_free/models/deal_product_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/item_detail_response.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/views/ad_dutyfree_show_product.dart';
import 'package:adani_airport_mobile/modules/duty_free/screens/product_detail/views/ad_dutyfree_show_product_image.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/utils/router_navigation/routes_constants.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/app_utils/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:superapp_mobile_style_guide/extensions/theme_extensions.dart';
import 'package:superapp_mobile_style_guide/primary_components/ad_sized_box.dart';

///this class is used to show list item in cart -basically to show product image and info inside a item
///It can be used as a list element or individual element on screen
///*[productList] is used to manipulate model data

/// This class will return product list item as per param
class ADDutyFreeShoppingCartProductItem extends StatelessWidget {
  /// usage sample code
  /// ShoppingCartProductItemView(shoppingCartViewModel:shoppingCartViewModel)

  const ADDutyFreeShoppingCartProductItem({
    Key? key,
    required this.productList,
  }) : super(key: key);
  static const imageRatio = 3;
  static const detailRatio = 7;
  static const containerBottomSpace = 52;

  final List<ItemDetailResponse> productList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.only(top: context.k_40),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: productList.length,
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: imageRatio,
                  child: InkWell(
                    onTap: () => apiCall(context, index),
                    child: ADDutyFreeShowProductImage(
                      inStock: productList[index].inStock,
                      productIcon: Utils.validateAndAppendBaseUrl(
                        productList[index].productImage,
                      ),
                    ),
                  ),
                ),
                ADSizedBox(
                  width: context.k_18,
                ),
                Expanded(
                  flex: detailRatio,
                  child: ADDutyFreeShowProduct(
                    productList: productList[index],
                    isProgress: context
                        .read<DutyFreeState>()
                        .isProgressMap
                        .containsKey(productList[index].skuCode),
                  ),
                ),
              ],
            ).paddingBySide(bottom: containerBottomSpace.sp),
          ],
        );
      },
    );
  }

  void apiCall(BuildContext context, int index) {
    // final DutyFreeState dutyFreeState = context.read<DutyFreeState>();

    navigateToScreenUsingNamedRouteWithArguments(
      context,
      productDetailDutyFreeScreen,
      rootNavigator: false,
      argumentObject: DealProductModel(
        skuCode: productList[index].skuCode,
        index: 0,
        from: 'cart',
        airportCode: productList[index].airportCode,
        storeType: productList[index].storeType,
      ),
    );

    // if (dutyFreeState.cartItemClick == Status.loading) {
    //   return;
    // }
    // dutyFreeState
    //   ..cartItemClick = Status.loading
    //   ..notifyListeners();
    // CatalogListResponseModel? pdpPageResponse;
    // final DutyFreeProductListRequest dutyFreeProductListRequest =
    //     DutyFreeProductListRequest(
    //   language: 'en',
    //   materialGroup: productList[index].materialName,
    //   pageSize: 1,
    //   channel: 'app',
    //   skuCode: [productList[index].skuCode],
    // );
    // dutyFreeState.repository
    //     .getDutyFreeProducts(
    //   catalogRequest: dutyFreeProductListRequest,
    // )
    //     .then((value) {
    //   pdpPageResponse = value.data != null
    //       ? CatalogListResponseModel.fromJson(value.data)
    //       : null;
    //
    //   dutyFreeState
    //     ..cartItemClick = Status.complete
    //     ..notifyListeners();
    //   navigateToScreenUsingNamedRouteWithArguments(
    //     context,
    //     productDetailDutyFreeScreen,
    //     rootNavigator: false,
    //     argumentObject: DealProductModel(
    //       item: pdpPageResponse?.result.first,
    //       index: 0,
    //       from: 'cart',
    //     ),
    //   );
    // });
  }
}
