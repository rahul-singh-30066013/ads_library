/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:collection';

import 'package:adani_airport_mobile/analytics/click_events.dart';
import 'package:adani_airport_mobile/modules/app_state_management/app_session_state/app_session_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/request/duty_free_add_to_cart_request.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/duty_free_cart_response.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/duty_free_product_data_model.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/catalog/item_detail_response.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/dashboard/duty_free_item.dart';
import 'package:adani_airport_mobile/modules/duty_free/models/response/duty_free_cancel_order/duty_free_cancel_order_sku_details.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/catalog/duty_free_state.dart';
import 'package:adani_airport_mobile/modules/duty_free/state_management/duty_free_order_cancellation_state/duty_free_order_state.dart';
import 'package:adani_airport_mobile/modules/flight_booking/state_management/payment_method_state.dart';
import 'package:adani_airport_mobile/utils/ad_log.dart';
import 'package:adani_airport_mobile/utils/constants/constants.dart';
import 'package:adani_airport_mobile/utils/utils.dart';
import 'package:adani_mobile_utility/network/response_state.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class DutyFreeEventState {
  /// *[dutyFreeState] is the instance of DutyFreeState state class, taken here to access the public property to this class.
  ///
  DutyFreeState? dutyFreeState;
  DutyFreeOrderState? dutyFreeOrderState;

  /// this event occur whenever item added in cart
  void addToCartEvent({
    required String skuCode,
    required int quantity,
    required bool isExclusive,
  }) {
    final Map<String, Object?> eventRequestMap = HashMap();
    final ItemDetailResponse lastAddedItem =
        getLastModifiedItemFromAddToCartResponse(skuCode) ??
            const ItemDetailResponse();
    eventRequestMap[Parameters.category.name] = 'duty_free';
    eventRequestMap[Parameters.sub_category.name] = 'purchase';
    eventRequestMap[Parameters.product_category.name] =
        lastAddedItem.materialName;
    eventRequestMap[Parameters.currency.name] = 'INR';
    eventRequestMap[Parameters.country.name] = 'India';
    eventRequestMap[Parameters.cart_item.name] =
        dutyFreeState?.dutyFreeCartResponse?.itemDetails.length ?? 0;

    eventRequestMap[Parameters.total_price.name] =
        dutyFreeState?.dutyFreeCartResponse?.finalAmount?.amount ?? 0;
    eventRequestMap[Parameters.cart_amount.name] =
        dutyFreeState?.dutyFreeCartResponse?.unitPriceResponse?.amount ?? 0;
    eventRequestMap[Parameters.total_discount.name] =
        getTotalDiscount(dutyFreeState?.dutyFreeCartResponse);
    eventRequestMap[Parameters.value.name] =
        dutyFreeState?.dutyFreeCartResponse?.finalAmount?.amount ?? 0;

    eventRequestMap[Parameters.rewards_earned.name] =
        lastAddedItem.loyaltyPoints;
    eventRequestMap[Parameters.rewards_multiplier.name] =
        lastAddedItem.earn2XString;

    eventRequestMap[Parameters.item_id_list.name] = lastAddedItem.skuCode;
    eventRequestMap[Parameters.item_name_list.name] = lastAddedItem.skuName;

    final List<AnalyticsEventItem> itemList = <AnalyticsEventItem>[];

    adLog(
      'prmotion add_To_Cart ${dutyFreeState?.dealProductModel?.isExclusive}',
    );

    itemList.add(
      AnalyticsEventItem(
        affiliation: 'N/A',
        currency: 'INR',
        coupon: 'N/A',
        creativeName: 'N/A',
        creativeSlot: 'N/A',
        discount: lastAddedItem.unitPrice - lastAddedItem.discountedPrice,
        index: -1,
        itemBrand: lastAddedItem.brandName,
        itemCategory: lastAddedItem.materialName,
        itemCategory2: lastAddedItem.categoryName,
        itemCategory4: itemCategory4(
          isExclusive: isExclusive,
          isOffers: lastAddedItem.promotion != null,
        ),
        itemCategory5: lastAddedItem.productImage,
        itemId: lastAddedItem.skuCode,
        itemListId: 'N/A',
        itemListName: 'N/A',
        itemName: lastAddedItem.skuName,
        itemVariant: 'N/A',
        locationId: 'N/A',
        price: lastAddedItem.unitPrice.toDouble(),
        promotionId: 'N/A',
        promotionName: 'N/A',
        itemCategory3: lastAddedItem.subCategoryName,
        quantity: quantity,
      ),
    );
    ClickEvents.add_to_cart
        .logAnalyticsEventItem(parameters: eventRequestMap, items: itemList);
  }

  /// this event fired when item remove from cart.
  void removeFromCartEvent({
    required DutyFreeAddToCartRequest request,
    required int quantity,
    required bool isExclusive,
    required bool isPromotion,
  }) {
    final Map<String, Object?> eventRequestMap = HashMap();
    final ItemDetailResponse removedItem = ItemDetailResponse(
      storeType: request.storeType,
      materialName: request.materialName,
      categoryName: request.categoryName,
      subCategoryName: request.subCategoryName,
      brandName: request.brandName,
      skuCode: request.skuCode,
      skuName: request.skuName,
      quantity: quantity,
      unitPrice: request.unitPrice,
      totalPrice: request.totalPrice,
      discountedPrice: request.discountedPrice,
      productImage: request.productImage,
    );

    eventRequestMap[Parameters.category.name] = 'duty_free';
    eventRequestMap[Parameters.sub_category.name] = 'purchase';
    eventRequestMap[Parameters.product_category.name] =
        removedItem.materialName;
    eventRequestMap[Parameters.currency.name] = 'INR';

    eventRequestMap[Parameters.remove_item_quantity.name] = quantity;

    eventRequestMap[Parameters.cart_item.name] =
        dutyFreeState?.dutyFreeCartResponse?.itemDetails.length ?? 0;

    eventRequestMap[Parameters.total_price.name] =
        dutyFreeState?.dutyFreeCartResponse?.finalAmount?.amount ?? 0;
    eventRequestMap[Parameters.cart_amount.name] =
        dutyFreeState?.dutyFreeCartResponse?.unitPriceResponse?.amount ?? 0;
    eventRequestMap[Parameters.total_discount.name] =
        getTotalDiscount(dutyFreeState?.dutyFreeCartResponse);

    eventRequestMap[Parameters.value.name] =
        dutyFreeState?.dutyFreeCartResponse?.finalAmount?.amount ?? 0;

    eventRequestMap[Parameters.rewards_earned.name] = removedItem.loyaltyPoints;
    eventRequestMap[Parameters.rewards_multiplier.name] =
        removedItem.earn2XString.isNotEmpty ? removedItem.earn2XString : 'N/A';

    adLog('=====> $eventRequestMap');
    final List<AnalyticsEventItem> itemList = <AnalyticsEventItem>[];

    eventRequestMap[Parameters.item_id_list.name] = removedItem.skuCode;
    eventRequestMap[Parameters.item_name_list.name] = removedItem.skuName;

    adLog('');
    // adLog('promotion is empty $isPromotion');
    itemList.add(
      AnalyticsEventItem(
        affiliation: 'N/A',
        currency: 'INR',
        coupon: 'N/A',
        creativeName: 'N/A',
        creativeSlot: 'N/A',
        discount: removedItem.discountedPrice > 0
            ? (removedItem.unitPrice - removedItem.discountedPrice)
            : 0,
        index: -1,
        itemBrand: removedItem.brandName,
        itemCategory: removedItem.materialName,
        itemCategory2: removedItem.categoryName,
        itemCategory3: removedItem.subCategoryName,
        itemCategory4: itemCategory4(
          isExclusive: isExclusive,
          isOffers: isPromotion,
        ),
        itemCategory5: removedItem.productImage,
        itemId: removedItem.skuCode,
        itemListId: 'N/A',
        itemListName: 'N/A',
        itemName: removedItem.skuName,
        itemVariant: 'N/A',
        locationId: 'N/A',
        price: removedItem.unitPrice.toDouble(),
        promotionId: 'N/A',
        promotionName: 'N/A',
        quantity: quantity,
      ),
    );

    ClickEvents.remove_from_cart.logAnalyticsEventItem(
      parameters: eventRequestMap,
      items: itemList,
    );
  }

  /// this event fired when click on remove .
  void removeFromCartRequestEvent({
    required ItemDetailResponse request,
  }) {
    final Map<String, Object?> eventRequestMap = HashMap();

    eventRequestMap[Parameters.category.name] = 'duty_free';
    eventRequestMap[Parameters.sub_category.name] = 'purchase';
    eventRequestMap[Parameters.product_category.name] = request.materialName;
    eventRequestMap[Parameters.currency.name] = 'INR';
    eventRequestMap[Parameters.cart_item.name] =
        dutyFreeState?.dutyFreeCartResponse?.itemDetails.length ?? 0;
    eventRequestMap[Parameters.remove_item_quantity.name] = request.quantity;

    eventRequestMap[Parameters.total_price.name] =
        dutyFreeState?.dutyFreeCartResponse?.finalAmount?.amount ?? 0;
    eventRequestMap[Parameters.cart_amount.name] =
        dutyFreeState?.dutyFreeCartResponse?.unitPriceResponse?.amount ?? 0;
    eventRequestMap[Parameters.total_discount.name] =
        getTotalDiscount(dutyFreeState?.dutyFreeCartResponse);

    eventRequestMap[Parameters.rewards_earned.name] = request.loyaltyPoints;
    eventRequestMap[Parameters.rewards_multiplier.name] =
        request.earn2XString.isEmpty ? 'N/A' : request.earn2XString;
    eventRequestMap[Parameters.source.name] = 'cart_screen';
    eventRequestMap[Parameters.page_type.name] = 'cart';

    ClickEvents.remove_from_cart_request.logEvent(
      parameters: eventRequestMap,
    );
  }

  /// this method return last modified item
  ItemDetailResponse? getLastModifiedItemFromAddToCartResponse(String skuCode) {
    final List<ItemDetailResponse> itemList =
        dutyFreeState?.dutyFreeCartResponse?.itemDetails ?? [];
    return itemList.singleWhere(
      (element) => element.skuCode == skuCode,
    );
  }

  List<ItemDetailResponse> getItemDetailResponseItem() {
    final List<ItemDetailResponse> itemList =
        dutyFreeState?.dutyFreeCartResponse?.itemDetails ?? [];
    return itemList;
  }

  /// this method is used to return the ItemDetailResponse type object from
  /// DutyfreeAddToCartRequest

  ItemDetailResponse getItemDetailResponseModel(
    DutyFreeAddToCartRequest? addToCartRequest,
  ) {
    return ItemDetailResponse(
      storeType: addToCartRequest?.storeType ?? '',
      materialName: addToCartRequest?.materialName ?? '',
      categoryName: addToCartRequest?.categoryName ?? '',
      subCategoryName: addToCartRequest?.subCategoryName ?? '',
      brandName: addToCartRequest?.brandName ?? '',
      skuCode: addToCartRequest?.skuCode ?? '',
      skuName: addToCartRequest?.skuName ?? '',
      // quantity: quantity,
      unitPrice: addToCartRequest?.unitPrice ?? 0,
      totalPrice: addToCartRequest?.totalPrice ?? 0,
      discountedPrice: addToCartRequest?.discountedPrice ?? 0,
      productImage: addToCartRequest?.productImage ?? '',
    );
  }

  /// this event fires when user see their cart. view cart event
  void viewCartEvent({required List<ItemDetailResponse> productList}) {
    final Map<String, Object?> eventRequestMap = HashMap();
    eventRequestMap[Parameters.category.name] = 'duty_free';
    eventRequestMap[Parameters.sub_category.name] = 'purchase';
    eventRequestMap[Parameters.product_category.name] = '';
    eventRequestMap[Parameters.currency.name] = 'INR';
    eventRequestMap[Parameters.total_price.name] =
        dutyFreeState?.dutyFreeCartResponse?.finalAmount?.amount ?? 0;
    eventRequestMap[Parameters.cart_amount.name] =
        dutyFreeState?.dutyFreeCartResponse?.unitPriceResponse?.amount ?? 0;
    eventRequestMap[Parameters.total_discount.name] =
        getTotalDiscount(dutyFreeState?.dutyFreeCartResponse);

    eventRequestMap[Parameters.cart_item.name] =
        dutyFreeState?.dutyFreeCartResponse?.itemDetails.length ?? 0;

    eventRequestMap[Parameters.rewards_earned.name] =
        dutyFreeState?.dutyFreeCartResponse?.loyaltyPotentialPoint ?? 0;

    eventRequestMap[Parameters.coupon.name] =
        dutyFreeState?.dutyFreeCartResponse?.promoCoupon?.promoCode ?? 'N/A';
    eventRequestMap[Parameters.coupon_value.name] =
        dutyFreeState?.dutyFreeCartResponse?.promoCoupon?.offerValue ?? 0;

    final List<AnalyticsEventItem> itemList = <AnalyticsEventItem>[];

    adLog('');

    final itemIdList = StringBuffer();
    final itemNameList = StringBuffer();
    final itemMaterialGroup = StringBuffer();

    for (int index = 0; index < productList.length; index++) {
      itemIdList.write('${productList[index].skuCode},');
      itemNameList.write('${productList[index].skuName},');
      itemMaterialGroup.write('${productList[index].materialName},');
      itemList.add(
        AnalyticsEventItem(
          affiliation: 'N/A',
          currency: 'INR',
          coupon: 'N/A',
          creativeName: 'N/A',
          creativeSlot: 'N/A',
          discount: productList[index].discountedPrice > 0
              ? productList[index].unitPrice -
                  productList[index].discountedPrice
              : 0,
          index: index,
          itemBrand: productList[index].brandName,
          itemCategory: productList[index].materialName,
          itemCategory2: productList[index].categoryName,
          itemCategory4: itemCategory4(
            isExclusive: productList[index].isExclusive,
            isOffers: productList[index].promotion != null,
          ),
          itemCategory5: productList[index].productImage,
          itemId: productList[index].skuCode,
          itemListId: 'N/A',
          itemListName: 'N/A',
          itemName: productList[index].skuName,
          itemVariant: 'N/A',
          locationId: 'N/A',
          price: productList[index].unitPrice,
          promotionId: 'N/A',
          itemCategory3: productList[index].subCategoryName,
          promotionName: 'N/A',
          // promotionName:
          //     '${Utils.removeExtraZeros(productList[index].promotion?.offer?.toString() ?? '0')}% off',
          quantity: productList[index].quantity,
        ),
      );
    }

    if (productList.isNotEmpty) {
      final String ids =
          itemIdList.toString().substring(0, itemIdList.length - 1);
      final String names =
          itemNameList.toString().substring(0, itemNameList.length - 1);
      final String materialGroup = itemMaterialGroup
          .toString()
          .substring(0, itemMaterialGroup.length - 1);
      eventRequestMap[Parameters.item_id_list.name] = ids;
      eventRequestMap[Parameters.item_name_list.name] = names;
      eventRequestMap[Parameters.product_category.name] = materialGroup;
    }

    ClickEvents.view_cart.logAnalyticsEventItem(
      parameters: eventRequestMap,
      items: itemList,
    );
  }

  /// this event fires when user click on place order
  void checkoutEvent() {
    final Map<String, Object?> eventRequestMap = HashMap();
    eventRequestMap[Parameters.category.name] = 'duty_free';
    eventRequestMap[Parameters.sub_category.name] = 'purchase';
    eventRequestMap[Parameters.currency.name] = 'INR';
    eventRequestMap[Parameters.click_text.name] = 'Place Order';
    eventRequestMap[Parameters.cart_item.name] =
        dutyFreeState?.dutyFreeCartResponse?.itemDetails.length ?? 0;
    eventRequestMap[Parameters.total_price.name] =
        dutyFreeState?.dutyFreeCartResponse?.finalAmount?.amount ?? 0;
    eventRequestMap[Parameters.cart_amount.name] =
        dutyFreeState?.dutyFreeCartResponse?.unitPriceResponse?.amount ?? 0;
    eventRequestMap[Parameters.total_discount.name] =
        getTotalDiscount(dutyFreeState?.dutyFreeCartResponse);

    eventRequestMap[Parameters.country.name] = 'India';
    eventRequestMap[Parameters.rewards_earned.name] =
        dutyFreeState?.dutyFreeCartResponse?.loyaltyPotentialPoint ?? 0;
    eventRequestMap[Parameters.coupon.name] =
        dutyFreeState?.dutyFreeCartResponse?.promoCoupon?.promoCode ?? 'N/A';
    eventRequestMap[Parameters.coupon_value.name] =
        dutyFreeState?.dutyFreeCartResponse?.promoCoupon?.offerValue ?? 0;
    eventRequestMap[Parameters.value.name] =
        dutyFreeState?.dutyFreeCartResponse?.finalAmount?.amount ?? 0;
    eventRequestMap[Parameters.page_type.name] = 'cart_screen';

    final List<AnalyticsEventItem> itemList = <AnalyticsEventItem>[];

    final List<ItemDetailResponse> productList =
        dutyFreeState?.dutyFreeCartResponse?.itemDetails ?? [];
    adLog('');

    final StringBuffer itemIdList = StringBuffer();
    final StringBuffer itemNameList = StringBuffer();
    final StringBuffer itemMaterialGroup = StringBuffer();

    for (int index = 0; index < productList.length; index++) {
      itemIdList.write('${productList[index].skuCode},');
      itemNameList.write('${productList[index].skuName},');
      itemMaterialGroup.write('${productList[index].materialName},');
      itemList.add(
        AnalyticsEventItem(
          currency: 'INR',
          discount: productList[index].discountedPrice > 0
              ? productList[index].unitPrice -
                  productList[index].discountedPrice
              : 0,
          itemBrand: productList[index].brandName,
          itemCategory: productList[index].materialName,
          itemCategory2: productList[index].categoryName,
          itemId: productList[index].skuCode,
          itemName: productList[index].skuName,
          price: productList[index].unitPrice,
          promotionName: '${Utils.removeExtraZeros(
            productList[index].promotion?.offer?.toString() ?? '0',
          )}% off',
          quantity: productList[index].quantity,
          index: index,
          affiliation: 'N/A',
          coupon: 'N/A',
          creativeName: 'N/A',
          creativeSlot: 'N/A',
          itemCategory3: productList[index].subCategoryName,
          itemCategory4: itemCategory4(
            isExclusive: productList[index].isExclusive,
            isOffers: productList[index].promotion != null,
          ),
          itemCategory5: productList[index].productImage,
          itemListId: 'N/A',
          itemListName: 'N/A',
          itemVariant: 'N/A',
          locationId: 'N/A',
          promotionId: 'N/A',
        ),
      );
    }

    if (productList.isNotEmpty) {
      final String ids =
          itemIdList.toString().substring(0, itemIdList.length - 1);
      final String names =
          itemNameList.toString().substring(0, itemNameList.length - 1);
      final String materialGroup = itemMaterialGroup
          .toString()
          .substring(0, itemMaterialGroup.length - 1);

      eventRequestMap[Parameters.item_id_list.name] = ids;
      eventRequestMap[Parameters.item_name_list.name] = names;
      eventRequestMap[Parameters.product_category.name] = materialGroup;
    }

    ClickEvents.begin_checkout.logAnalyticsEventItem(
      parameters: eventRequestMap,
      items: itemList,
    );
  }

  /// this event fires when user click on item to show their details.
  void selectItemEvent(DutyFreeProductDataModel item, String screenName) {
    final Map<String, Object?> eventRequestMap = HashMap();
    eventRequestMap[Parameters.category.name] = 'duty_free';
    eventRequestMap[Parameters.sub_category.name] = 'ecommerce';
    eventRequestMap[Parameters.currency.name] = 'INR';
    eventRequestMap[Parameters.country.name] = 'india';
    eventRequestMap[Parameters.item_id_list.name] = item.skuCode;
    eventRequestMap[Parameters.item_name_list.name] = item.skuName;

    eventRequestMap[Parameters.product_category.name] = item.materialGroup;

    eventRequestMap[Parameters.cart_items.name] =
        dutyFreeState?.dutyFreeCartResponse?.itemDetails.length ?? 0;
    eventRequestMap[Parameters.rewards_earned.name] = item.loyaltyPoints;
    eventRequestMap[Parameters.rewards_multiplier.name] = item.earn2XString;
    eventRequestMap[Parameters.source.name] = screenName;
    eventRequestMap[Parameters.label.name] = item.skuName;

    eventRequestMap[Parameters.total_price.name] =
        dutyFreeState?.dutyFreeCartResponse?.finalAmount?.amount ?? 0;
    eventRequestMap[Parameters.cart_amount.name] =
        dutyFreeState?.dutyFreeCartResponse?.unitPriceResponse?.amount ?? 0;
    eventRequestMap[Parameters.total_discount.name] =
        getTotalDiscount(dutyFreeState?.dutyFreeCartResponse);

    eventRequestMap[Parameters.value.name] =
        dutyFreeState?.dutyFreeCartResponse?.finalAmount?.amount ?? 0;

    final List<AnalyticsEventItem> selectedItemList = <AnalyticsEventItem>[
      AnalyticsEventItem(
        currency: 'INR',
        discount:
            item.discountPrice > 0 ? (item.price - item.discountPrice) : 0,
        itemBrand: item.brand,
        itemCategory: item.materialGroup,
        itemCategory2: item.category,
        itemId: item.skuCode,
        itemName: item.skuName,
        price: item.price,
        // promotionName: item.promotions.isNotEmpty
        //     ? '${Utils.removeExtraZeros(item.promotions.first.offer.toString())}% off'
        //     : '',
        quantity: item.quantity,
        index: -1,
        affiliation: 'N/A',
        coupon: 'N/A',
        creativeName: 'N/A',
        creativeSlot: 'N/A',
        itemCategory3: item.subCategory,
        itemCategory4: itemCategory4(
          isExclusive: item.isExclusive,
          isOffers: item.promotions.isNotEmpty,
        ),
        itemCategory5:
            item.productImages.isNotEmpty ? item.productImages.first : 'N/A',
        itemListId: 'N/A',
        itemListName: 'N/A',
        itemVariant: 'N/A',
        locationId: 'N/A',
        promotionId: 'N/A',
        promotionName: 'N/A',
      ),
    ];

    ClickEvents.select_item.logAnalyticsEventItem(
      parameters: eventRequestMap,
      items: selectedItemList,
    );
  }

  /// this event fires when user is watching the item details.
  void viewItemEvent(DutyFreeProductDataModel item) {
    final Map<String, Object?> eventRequestMap = HashMap();
    eventRequestMap[Parameters.category.name] = 'duty_free';
    eventRequestMap[Parameters.sub_category.name] = 'ecommerce';
    eventRequestMap[Parameters.currency.name] = 'INR';
    eventRequestMap[Parameters.country.name] = 'india';
    eventRequestMap[Parameters.item_id_list.name] = item.skuCode;
    eventRequestMap[Parameters.item_name_list.name] = item.skuName;
    eventRequestMap[Parameters.cart_items.name] =
        dutyFreeState?.dutyFreeCartResponse?.itemDetails.length ?? 0;
    eventRequestMap[Parameters.rewards_earned.name] = item.loyaltyPoints;
    eventRequestMap[Parameters.rewards_multiplier.name] = item.earn2XString;

    eventRequestMap[Parameters.product_category.name] = item.materialGroup;
    eventRequestMap[Parameters.label.name] =
        dutyFreeState?.materialGroupCode ?? 'N/A';
    eventRequestMap[Parameters.source.name] = 'product_detail_screen';

    eventRequestMap[Parameters.total_price.name] =
        dutyFreeState?.dutyFreeCartResponse?.finalAmount?.amount ?? 0;
    eventRequestMap[Parameters.cart_amount.name] =
        dutyFreeState?.dutyFreeCartResponse?.unitPriceResponse?.amount ?? 0;
    eventRequestMap[Parameters.total_discount.name] =
        getTotalDiscount(dutyFreeState?.dutyFreeCartResponse);

    eventRequestMap[Parameters.value.name] =
        dutyFreeState?.dutyFreeCartResponse?.finalAmount?.amount ?? 0;

    final List<AnalyticsEventItem> selectedItemList = <AnalyticsEventItem>[
      AnalyticsEventItem(
        currency: 'INR',
        discount: item.discountPrice > 0 ? item.price - item.discountPrice : 0,
        itemBrand: item.brand,
        itemCategory: item.category,
        itemCategory2: item.subCategory,
        itemId: item.skuCode,
        itemName: item.skuName,
        price: item.price,
        // promotionName: item.promotions.isNotEmpty
        //     ? '${Utils.removeExtraZeros(item.promotions.first.offer.toString())}% off'
        //     : '',
        quantity: item.quantity,
        index: -1,
        affiliation: 'N/A',
        coupon: 'N/A',
        creativeName: 'N/A',
        creativeSlot: 'N/A',
        itemCategory3: 'N/A',
        itemCategory4: itemCategory4(
          isExclusive: item.isExclusive,
          isOffers: item.promotions.isNotEmpty,
        ),
        itemCategory5:
            item.productImages.isNotEmpty ? item.productImages.first : 'N/A',
        itemListId: 'N/A',
        itemListName: 'N/A',
        itemVariant: 'N/A',
        locationId: 'N/A',
        promotionId: 'N/A',
        promotionName: 'N/A',
      ),
    ];

    ClickEvents.view_item.logAnalyticsEventItem(
      parameters: eventRequestMap,
      items: selectedItemList,
    );
  }

  /// this method return total discount applied on added items in cart.
  num getTotalDiscount(DutyFreeCartResponse? dutyFreeCartResponse) {
    return dutyFreeCartResponse?.promoCoupon == null
        ? (dutyFreeCartResponse?.discountPrice?.amount ?? 0) +
            (dutyFreeCartResponse?.preOrderDiscount?.amount ?? 0)
        : (dutyFreeCartResponse?.discountPrice?.amount ?? 0) +
            (dutyFreeCartResponse?.promoCoupon?.offerValue ?? 0) +
            (dutyFreeCartResponse?.preOrderDiscount?.amount ?? 0);

    // dutyFreeCartResponse?.promoCoupon.offerValue
  }

  /// this event fires when user will show the item list
  void viewItemListEvent({
    required List<DutyFreeProductDataModel> productList,
  }) {
    final Map<String, Object?> eventRequestMap = HashMap();
    eventRequestMap[Parameters.category.name] = 'duty_free';
    eventRequestMap[Parameters.sub_category.name] = 'purchase';
    // eventRequestMap[Parameters.product_category.name] =
    //     dutyFreeState?.materialGroupCode ?? 'N/A';
    eventRequestMap[Parameters.currency.name] = 'INR';
    eventRequestMap[Parameters.label.name] =
        dutyFreeState?.materialGroupCode ?? 'N/A';
    eventRequestMap[Parameters.source.name] = 'catalog_list_screen';
    eventRequestMap[Parameters.filter_category.name] =
        dutyFreeState?.getCategory().join('|');

    eventRequestMap[Parameters.total_price.name] =
        dutyFreeState?.dutyFreeCartResponse?.finalAmount?.amount ?? 0;
    eventRequestMap[Parameters.cart_amount.name] =
        dutyFreeState?.dutyFreeCartResponse?.unitPriceResponse?.amount ?? 0;
    eventRequestMap[Parameters.total_discount.name] =
        getTotalDiscount(dutyFreeState?.dutyFreeCartResponse);

    eventRequestMap[Parameters.value.name] =
        dutyFreeState?.dutyFreeCartResponse?.finalAmount?.amount ?? 0;

    final List<AnalyticsEventItem> itemList = <AnalyticsEventItem>[];

    adLog('');

    final itemIdList = StringBuffer();
    final itemNameList = StringBuffer();
    final itemMaterialGroup = StringBuffer();

    for (int index = 0; index < productList.length; index++) {
      itemList.add(
        AnalyticsEventItem(
          currency: 'INR',
          discount: productList[index].discountPrice > 0
              ? (productList[index].price - productList[index].discountPrice)
              : 0,
          itemBrand: productList[index].brand,
          itemCategory: productList[index].category,
          itemCategory2: productList[index].subCategory,
          itemId: productList[index].skuCode,
          itemName: productList[index].skuName,
          price: productList[index].price,
          index: index,
          affiliation: 'N/A',
          coupon: 'N/A',
          creativeName: 'N/A',
          creativeSlot: 'N/A',
          itemCategory3: 'N/A',
          itemCategory4: itemCategory4(
            isExclusive: productList[index].isExclusive,
            isOffers: productList[index].promotions.isNotEmpty,
          ),
          itemCategory5: productList[index].productImages.isNotEmpty
              ? productList[index].productImages.first
              : 'N/A',
          itemListId: 'N/A',
          itemListName: 'N/A',
          itemVariant: 'N/A',
          locationId: 'N/A',
          promotionId: 'N/A',
          promotionName: 'N/A',
          quantity: (dutyFreeState?.checkSkuAvailable(
                    productList[index].skuCode,
                    storeType: productList[index].storeType,
                    airportCode: productList[index].airportCode,
                  ) ??
                  false)
              ? dutyFreeState?.getSkuQty(
                  productList[index].skuCode,
                  storeType: productList[index].storeType,
                  airportCode: productList[index].airportCode,
                )
              : productList[index].quantity,
        ),
      );

      itemIdList.write('${productList[index].skuCode},');
      itemNameList.write('${productList[index].skuName},');
      itemMaterialGroup.write('${productList[index].materialGroup},');
    }

    if (productList.isNotEmpty) {
      final String ids =
          itemIdList.toString().substring(0, itemIdList.length - 1);
      final String names =
          itemNameList.toString().substring(0, itemNameList.length - 1);
      final String materialGroup = itemMaterialGroup
          .toString()
          .substring(0, itemMaterialGroup.length - 1);
      eventRequestMap[Parameters.item_id_list.name] = ids;
      eventRequestMap[Parameters.item_name_list.name] = names;
      eventRequestMap[Parameters.product_category.name] = materialGroup;
    }

    ClickEvents.view_item_list.logAnalyticsEventItem(
      parameters: eventRequestMap,
      items: itemList,
    );
  }

  /// this event fires when user applied sorting on list
  void sortSelectEvent({
    required String sortParam,
  }) {
    final Map<String, Object?> eventRequestMap = HashMap();
    eventRequestMap[Parameters.category.name] = 'duty_free';
    eventRequestMap[Parameters.sub_category.name] = 'purchase';
    eventRequestMap[Parameters.product_category.name] =
        dutyFreeState?.materialGroupCode ?? 'N/A';
    eventRequestMap[Parameters.type.name] = sortParam;
    ClickEvents.sort_select.logEvent(parameters: eventRequestMap);
  }

  /// this event fires when user applied filters on item list
  void filterSelectEvent() {
    final Map<String, Object?> eventRequestMap = HashMap();
    eventRequestMap[Parameters.category.name] = 'duty_free';
    eventRequestMap[Parameters.sub_category.name] = 'purchase';
    eventRequestMap[Parameters.type.name] =
        dutyFreeState?.getSubCategory().join('|');
    eventRequestMap[Parameters.filter_category.name] =
        dutyFreeState?.getCategory().join('|');
    //Newly Added
    eventRequestMap[Parameters.label.name] = 'N/A';
    eventRequestMap[Parameters.product_category.name] =
        dutyFreeState?.materialGroupCode ?? 'N/A';
    ClickEvents.filter_select.logEvent(parameters: eventRequestMap);
  }

  /// this event fires when user reset the filter
  void filterResetEvent() {
    final Map<String, Object?> eventRequestMap = HashMap();
    eventRequestMap[Parameters.category.name] = 'duty_free';
    eventRequestMap[Parameters.sub_category.name] =
        dutyFreeState?.materialGroupCode ?? 'N/A';
    ClickEvents.filter_reset.logEvent(parameters: eventRequestMap);
  }

  /// this event fires when clicked category showing in duty free
  /// dashboard (like liqour, beauty, electronic etc...)
  void dashBoardCategoryItemEvent(String selectedCode) {
    final Map<String, Object?> eventRequestMap = HashMap();
    eventRequestMap[Parameters.category.name] = 'duty_free';
    eventRequestMap[Parameters.sub_category.name] = 'purchase';
    eventRequestMap[Parameters.product_category.name] = selectedCode;

    ClickEvents.duty_free_slick_list_selection
        .logEvent(parameters: eventRequestMap);
  }

  /// this event fires when applied age confirmation
  void ageConfirmationEvent({required bool isAgeAbove}) {
    final Map<String, Object?> eventRequestMap = HashMap();
    eventRequestMap[Parameters.category.name] = 'duty_free';
    eventRequestMap[Parameters.sub_category.name] = 'purchase';
    eventRequestMap[Parameters.label.name] =
        isAgeAbove ? 'Yes, I am above 25' : 'No, I am not';
    ClickEvents.duty_free_age_confirmation
        .logEvent(parameters: eventRequestMap);
  }

  // add payment info
  void addPaymentInfo(
    DutyFreeState dutyFreeState,
    PaymentMethodState paymentMethodState,
    AppSessionState appSessionState, {
    String? errorText,
    String? label,
  }) {
    adLog(paymentMethodState.rewardPoint.value.toString());
    final Map<String, Object?> eventRequestMap = HashMap();
    eventRequestMap[Parameters.category.name] = 'duty_free';
    eventRequestMap[Parameters.sub_category.name] = 'purchase';
    eventRequestMap[Parameters.currency.name] = 'INR';
    eventRequestMap[Parameters.page_type.name] = 'payment_screen';
    eventRequestMap[Parameters.flight_number.name] =
        dutyFreeState.flightNumberController.text;

    eventRequestMap[Parameters.cart_items.name] =
        (dutyFreeState.dutyFreeCartResponse?.itemDetails ?? []).length;
    eventRequestMap[Parameters.nationality.name] =
        dutyFreeState.countryNameController.text;
    eventRequestMap[Parameters.coupon.name] =
        dutyFreeState.dutyFreeCartResponse?.promoCoupon?.promoCode ?? 'N/A';
    eventRequestMap[Parameters.coupon_value.name] =
        dutyFreeState.dutyFreeCartResponse?.promoCoupon?.offerValue ?? 0;
    eventRequestMap[Parameters.total_price.name] =
        dutyFreeState.dutyFreeCartResponse?.finalAmount?.amount ?? 0;
    eventRequestMap[Parameters.purchase_revenue.name] =
        dutyFreeState.dutyFreeCartResponse?.finalAmount?.amount ?? 0;
    eventRequestMap[Parameters.cart_amount.name] =
        dutyFreeState.dutyFreeCartResponse?.unitPriceResponse?.amount ?? 0;
    eventRequestMap[Parameters.total_discount.name] =
        getTotalDiscount(dutyFreeState.dutyFreeCartResponse);
    eventRequestMap[Parameters.payment_type.name] =
        paymentMethodState.selectedOption?.mode?.name ?? 'N/A';
    eventRequestMap[Parameters.error_text.name] = errorText ?? 'N/A';
    eventRequestMap[Parameters.label.name] = label ?? 'N/A';
    eventRequestMap[Parameters.payment_bank.name] =
        paymentMethodState.selectedOption?.name ?? 'N/A';
    eventRequestMap[Parameters.payment_gateway.name] = 'pine_labs';
    eventRequestMap[Parameters.payment_aggregator.name] = 'pine_labs';
    // eventRequestMap[Parameters.rewards_earned.name] = paymentMethodState
    //     .dutyFreeOrderDetailResponse?.loyaltyPoint?.earnedRewardPoints;
    eventRequestMap[Parameters.rewards_earned.name] =
        dutyFreeState.dutyFreeCartResponse?.loyaltyPotentialPoint ?? 0;
    eventRequestMap[Parameters.rewards_multiplier.name] = 'N/A';
    eventRequestMap[Parameters.rewards_burned.name] =
        paymentMethodState.isRedeemPointsChecked
            ? (((paymentMethodState.totalAmount) <
                    appSessionState.rewardBalance.value)
                ? paymentMethodState.totalAmount
                : appSessionState.rewardBalance.value)
            : 0;
    eventRequestMap[Parameters.date_of_birth.name] =
        Utils.getFormattedDateOrTime(
      date: dutyFreeState.dateOfBirthController.text,
    );
    eventRequestMap[Parameters.pick_up_date.name] =
        Utils.getFormattedDateOrTime(
      date: dutyFreeState.pickupDateController.text,
    );
    eventRequestMap[Parameters.pick_up_time.name] =
        dutyFreeState.pickupTimeController.text;
    eventRequestMap[Parameters.nationality.name] =
        dutyFreeState.countryNameController.text;

    eventRequestMap[Parameters.value.name] =
        dutyFreeState.dutyFreeCartResponse?.finalAmount?.amount ?? 0;
    final List<AnalyticsEventItem> itemList = <AnalyticsEventItem>[];

    final itemIdList = StringBuffer();
    final itemNameList = StringBuffer();
    final itemMaterialGroup = StringBuffer();

    final List<ItemDetailResponse> itemDetails =
        dutyFreeState.dutyFreeCartResponse?.itemDetails ?? [];
    for (int index = 0; index < itemDetails.length; index++) {
      itemIdList.write('${itemDetails[index].skuCode},');
      itemNameList.write('${itemDetails[index].skuName},');
      itemMaterialGroup.write('${itemDetails[index].materialName},');
      itemList.add(
        AnalyticsEventItem(
          affiliation: 'N/A',
          currency: 'INR',
          coupon: 'N/A',
          creativeName: 'N/A',
          creativeSlot: 'N/A',
          discount: itemDetails[index].discountedPrice > 0
              ? itemDetails[index].unitPrice -
                  itemDetails[index].discountedPrice
              : 0,
          index: index,
          itemBrand: itemDetails[index].brandName,
          itemCategory: itemDetails[index].materialName,
          itemCategory2: itemDetails[index].categoryName,
          itemCategory4: itemCategory4(
            isExclusive: itemDetails[index].isExclusive,
            isOffers: itemDetails[index].promotion != null,
          ),
          itemCategory5: itemDetails[index].productImage,
          itemId: itemDetails[index].skuCode,
          itemListId: 'N/A',
          itemListName: 'N/A',
          itemName: itemDetails[index].skuName,
          itemVariant: 'N/A',
          locationId: 'N/A',
          price: itemDetails[index].unitPrice,
          promotionId: 'N/A',
          promotionName: 'N/A',
          itemCategory3: itemDetails[index].subCategoryName,
          quantity: itemDetails[index].quantity,
        ),
      );
    }
    if (itemDetails.isNotEmpty) {
      final String ids =
          itemIdList.toString().substring(0, itemIdList.length - 1);
      final String names =
          itemNameList.toString().substring(0, itemNameList.length - 1);
      final String materialGroup = itemMaterialGroup
          .toString()
          .substring(0, itemMaterialGroup.length - 1);

      eventRequestMap[Parameters.item_id_list.name] = ids;
      eventRequestMap[Parameters.item_name_list.name] = names;
      eventRequestMap[Parameters.product_category.name] = materialGroup;
    }

    ClickEvents.add_payment_info.logAnalyticsEventItem(
      parameters: eventRequestMap,
      items: itemList,
    );
  }

  // purchase event
  void purchase(
    PaymentMethodState paymentMethodState,
    String referenceId,
  ) {
    final Map<String, Object?> purchaseRequest = HashMap();
    purchaseRequest[Parameters.category.name] = 'duty_free';
    purchaseRequest[Parameters.sub_category.name] = 'purchase';
    purchaseRequest[Parameters.currency.name] = 'INR';

    purchaseRequest[Parameters.flight_number.name] =
        dutyFreeState?.flightNumberController.text;

    purchaseRequest[Parameters.transaction_id.name] = referenceId;
    purchaseRequest[Parameters.order_id.name] = paymentMethodState.orderId;
    purchaseRequest[Parameters.affiliation.name] = '';
    purchaseRequest[Parameters.source.name] = 'success_confirmation';
    purchaseRequest[Parameters.page_type.name] = 'success_confirmation';
    purchaseRequest[Parameters.shipping.name] = '';
    purchaseRequest[Parameters.tax.name] = '';
    purchaseRequest[Parameters.payment_type.name] =
        paymentMethodState.selectedOption?.mode?.name;
    purchaseRequest[Parameters.payment_bank.name] =
        paymentMethodState.selectedOption?.name;
    purchaseRequest[Parameters.payment_gateway.name] = 'pine_labs';
    purchaseRequest[Parameters.payment_aggregator.name] = 'pine_labs';
    purchaseRequest[Parameters.rewards_earned.name] =
        dutyFreeState?.dutyFreeCartResponse?.loyaltyPotentialPoint ?? 0;
    purchaseRequest[Parameters.rewards_multiplier.name] = '';
    purchaseRequest[Parameters.rewards_burned.name] = paymentMethodState
            .dutyFreeOrderDetailResponse
            ?.orderDetail
            ?.dutyfreeDetail
            ?.loyaltyPotentialPoint ??
        0;
    final List<AnalyticsEventItem> itemList = <AnalyticsEventItem>[];

    purchaseRequest[Parameters.total_price.name] =
        getTotalPrice(paymentMethodState);
    purchaseRequest[Parameters.purchase_revenue.name] =
        getTotalPrice(paymentMethodState);
    purchaseRequest[Parameters.cart_amount.name] = paymentMethodState
            .dutyFreeOrderDetailResponse
            ?.orderDetail
            ?.dutyfreeDetail
            ?.unitPriceResponse
            ?.amount ??
        0;
    purchaseRequest[Parameters.value.name] = paymentMethodState
            .dutyFreeOrderDetailResponse
            ?.orderDetail
            ?.dutyfreeDetail
            ?.finalAmount ??
        0;
    purchaseRequest[Parameters.coupon.name] = paymentMethodState
            .dutyFreeOrderDetailResponse
            ?.orderDetail
            ?.dutyfreeDetail
            ?.promoCoupon
            .promoCode ??
        'N/A';
    purchaseRequest[Parameters.coupon_value.name] = paymentMethodState
            .dutyFreeOrderDetailResponse
            ?.orderDetail
            ?.dutyfreeDetail
            ?.promoCoupon
            .offerValue ??
        0;
    purchaseRequest[Parameters.total_discount.name] = (paymentMethodState
                .dutyFreeOrderDetailResponse
                ?.orderDetail
                ?.dutyfreeDetail
                ?.discountPrice
                ?.amount ??
            0) +
        (paymentMethodState.dutyFreeOrderDetailResponse?.orderDetail
                ?.dutyfreeDetail?.preOrderDiscount?.amount ??
            0) +
        (paymentMethodState.dutyFreeOrderDetailResponse?.orderDetail
                ?.dutyfreeDetail?.promoCoupon.offerValue ??
            0);

    purchaseRequest[Parameters.date_of_birth.name] =
        (dutyFreeState?.dateOfBirthController.text.isNotEmpty ?? false)
            ? Utils.getFormattedDateOrTime(
                date: dutyFreeState?.dateOfBirthController.text ?? '',
              )
            : 'N/A';
    purchaseRequest[Parameters.pick_up_date.name] =
        (dutyFreeState?.pickupDateController.text.isNotEmpty ?? false)
            ? Utils.getFormattedDateOrTime(
                date: dutyFreeState?.pickupDateController.text ?? '',
              )
            : 'N/A';
    purchaseRequest[Parameters.pick_up_time.name] =
        dutyFreeState?.pickupTimeController.text;
    purchaseRequest[Parameters.nationality.name] =
        dutyFreeState?.countryNameController.text;
    adLog('');

    final itemIdList = StringBuffer();
    final itemNameList = StringBuffer();
    final itemMaterialGroup = StringBuffer();

    final List<DutyFreeCancelOrderSKUDetails> skuDetail = paymentMethodState
            .dutyFreeOrderDetailResponse
            ?.orderDetail
            ?.dutyfreeDetail
            ?.itemDetails ??
        [];
    for (int index = 0; index < skuDetail.length; index++) {
      itemIdList.write('${skuDetail[index].skuCode},');
      itemNameList.write('${skuDetail[index].skuName},');
      itemMaterialGroup.write('${skuDetail[index].materialName},');
      itemList.add(
        AnalyticsEventItem(
          affiliation: 'N/A',
          currency: 'INR',
          coupon: 'N/A',
          creativeName: 'N/A',
          creativeSlot: 'N/A',
          discount: (skuDetail[index].discountedPrice ?? 0) > 0
              ? (skuDetail[index].unitPrice ?? 0) -
                  (skuDetail[index].discountedPrice ?? 0)
              : 0,
          index: index,
          itemBrand: skuDetail[index].brandName,
          itemCategory: skuDetail[index].materialName,
          itemCategory2: skuDetail[index].categoryName,
          itemCategory4: itemCategory4(
            isExclusive: skuDetail[index].isExclusive,
            isOffers: skuDetail[index].promotion != null,
          ),
          itemCategory5: skuDetail[index].productImage,
          itemId: skuDetail[index].skuCode,
          itemListId: 'N/A',
          itemListName: 'N/A',
          itemName: skuDetail[index].skuName,
          itemVariant: 'N/A',
          locationId: 'N/A',
          price: skuDetail[index].unitPrice,
          promotionId: 'N/A',
          promotionName: 'N/A',
          itemCategory3: skuDetail[index].subCategoryName,
          quantity: skuDetail[index].quantity,
        ),
      );
    }
    if (skuDetail.isNotEmpty) {
      final String ids =
          itemIdList.toString().substring(0, itemIdList.length - 1);
      final String names =
          itemNameList.toString().substring(0, itemNameList.length - 1);
      final String materialGroup = itemMaterialGroup
          .toString()
          .substring(0, itemMaterialGroup.length - 1);

      purchaseRequest[Parameters.item_id_list.name] = ids;
      purchaseRequest[Parameters.item_name_list.name] = names;
      purchaseRequest[Parameters.product_category.name] = materialGroup;
    }

    try {
      ClickEvents.purchase
          .logAnalyticsEventItem(parameters: purchaseRequest, items: itemList);
    } catch (e) {
      adLog(e.toString());
    }
  }

  // purchase success event
  void purchaseSuccess(
    PaymentMethodState paymentMethodState,
    AppSessionState appSessionState,
    String referenceId,
  ) {
    final Map<String, Object?> purchaseSuccessRequest = HashMap();
    purchaseSuccessRequest[Parameters.category.name] = 'duty_free';
    purchaseSuccessRequest[Parameters.sub_category.name] = 'purchase';
    purchaseSuccessRequest[Parameters.product_category.name] = '';
    purchaseSuccessRequest[Parameters.currency.name] = 'INR';
    purchaseSuccessRequest[Parameters.flight_number.name] =
        dutyFreeState?.flightNumberController.text;

    purchaseSuccessRequest[Parameters.transaction_id.name] = referenceId;
    purchaseSuccessRequest[Parameters.order_id.name] =
        paymentMethodState.orderId;
    purchaseSuccessRequest[Parameters.value.name] = paymentMethodState
            .dutyFreeOrderDetailResponse
            ?.orderDetail
            ?.dutyfreeDetail
            ?.finalAmount
            ?.amount ??
        0;
    purchaseSuccessRequest[Parameters.affiliation.name] = '';

    purchaseSuccessRequest[Parameters.shipping.name] = '';
    purchaseSuccessRequest[Parameters.tax.name] = '';
    purchaseSuccessRequest[Parameters.payment_type.name] =
        paymentMethodState.selectedOption?.mode?.name ?? 'N/A';
    purchaseSuccessRequest[Parameters.payment_bank.name] =
        paymentMethodState.selectedOption?.name ?? 'N/A';
    purchaseSuccessRequest[Parameters.payment_gateway.name] = 'pine_labs';
    purchaseSuccessRequest[Parameters.payment_aggregator.name] = 'pine_labs';
    purchaseSuccessRequest[Parameters.rewards_earned.name] = paymentMethodState
            .dutyFreeOrderDetailResponse
            ?.orderDetail
            ?.dutyfreeDetail
            ?.loyaltyPotentialPoint ??
        0;
    purchaseSuccessRequest[Parameters.rewards_multiplier.name] = '';
    purchaseSuccessRequest[Parameters.rewards_burned.name] =
        paymentMethodState.isRedeemPointsChecked
            ? (((paymentMethodState.totalAmount) <
                    appSessionState.rewardBalance.value)
                ? paymentMethodState.totalAmount
                : appSessionState.rewardBalance.value)
            : 0;

    purchaseSuccessRequest[Parameters.total_price.name] =
        getTotalPrice(paymentMethodState);
    purchaseSuccessRequest[Parameters.purchase_revenue.name] =
        getTotalPrice(paymentMethodState);

    purchaseSuccessRequest[Parameters.cart_amount.name] = paymentMethodState
            .dutyFreeOrderDetailResponse
            ?.orderDetail
            ?.dutyfreeDetail
            ?.unitPriceResponse
            ?.amount ??
        0;

    purchaseSuccessRequest[Parameters.coupon.name] = paymentMethodState
            .dutyFreeOrderDetailResponse
            ?.orderDetail
            ?.dutyfreeDetail
            ?.promoCoupon
            .promoCode ??
        'N/A';
    purchaseSuccessRequest[Parameters.coupon_value.name] = paymentMethodState
            .dutyFreeOrderDetailResponse
            ?.orderDetail
            ?.dutyfreeDetail
            ?.promoCoupon
            .offerValue ??
        0;
    purchaseSuccessRequest[Parameters.total_discount.name] = (paymentMethodState
                .dutyFreeOrderDetailResponse
                ?.orderDetail
                ?.dutyfreeDetail
                ?.discountPrice
                ?.amount ??
            0) +
        (paymentMethodState.dutyFreeOrderDetailResponse?.orderDetail
                ?.dutyfreeDetail?.preOrderDiscount?.amount ??
            0) +
        (paymentMethodState.dutyFreeOrderDetailResponse?.orderDetail
                ?.dutyfreeDetail?.promoCoupon.offerValue ??
            0);

    purchaseSuccessRequest[Parameters.date_of_birth.name] =
        (dutyFreeState?.dateOfBirthController.text.isNotEmpty ?? false)
            ? Utils.getFormattedDateOrTime(
                date: dutyFreeState?.dateOfBirthController.text ?? '',
              )
            : 'N/A';
    purchaseSuccessRequest[Parameters.pick_up_date.name] =
        (dutyFreeState?.pickupDateController.text.isNotEmpty ?? false)
            ? Utils.getFormattedDateOrTime(
                date: dutyFreeState?.pickupDateController.text ?? '',
              )
            : 'N/A';
    purchaseSuccessRequest[Parameters.pick_up_time.name] =
        dutyFreeState?.pickupTimeController.text;
    purchaseSuccessRequest[Parameters.nationality.name] =
        dutyFreeState?.countryNameController.text;

    purchaseSuccessRequest[Parameters.source.name] = 'success_confirmation';
    purchaseSuccessRequest[Parameters.page_type.name] = 'success_confirmation';
    purchaseSuccessRequest[Parameters.af_currency.name] = 'INR';
    purchaseSuccessRequest[Parameters.af_revenue.name] =
        getTotalPrice(paymentMethodState);

    try {
      ClickEvents.duty_free_purchase_success.logEvent(
        parameters: purchaseSuccessRequest,
      );
    } catch (e) {
      adLog(e.toString());
    }
  }

  // purchase failed
  void purchasePaymentFailed(
    PaymentMethodState paymentMethodState,
    ADResponseState adResponseState,
    String referenceId,
  ) {
    final Map<String, Object?> eventRequestMap = HashMap();
    eventRequestMap[Parameters.category.name] = 'duty_free';
    eventRequestMap[Parameters.sub_category.name] = 'purchase';
    eventRequestMap[Parameters.product_category.name] = '';
    eventRequestMap[Parameters.currency.name] = 'INR';
    eventRequestMap[Parameters.source.name] = '';
    eventRequestMap[Parameters.flight_number.name] =
        dutyFreeState?.flightNumberController.text;

    eventRequestMap[Parameters.transaction_id.name] = referenceId;
    eventRequestMap[Parameters.order_id.name] = paymentMethodState.orderId;
    eventRequestMap[Parameters.value.name] =
        dutyFreeState?.dutyFreeCartResponse?.finalAmount?.amount ?? 0;
    eventRequestMap[Parameters.affiliation.name] = '';
    eventRequestMap[Parameters.coupon.name] =
        dutyFreeState?.dutyFreeCartResponse?.promoCoupon?.promoCode ?? 'N/A';
    eventRequestMap[Parameters.coupon_value.name] =
        dutyFreeState?.dutyFreeCartResponse?.promoCoupon?.offerValue ?? 0;

    eventRequestMap[Parameters.shipping.name] = '';
    eventRequestMap[Parameters.tax.name] = '';
    eventRequestMap[Parameters.payment_type.name] =
        paymentMethodState.selectedOption?.mode?.name ?? 'N/A';
    eventRequestMap[Parameters.payment_bank.name] =
        paymentMethodState.selectedOption?.name ?? 'N/A';
    eventRequestMap[Parameters.payment_gateway.name] = 'pine_labs';
    eventRequestMap[Parameters.payment_aggregator.name] = 'pine_labs';
    eventRequestMap[Parameters.rewards_earned.name] = paymentMethodState
            .dutyFreeOrderDetailResponse
            ?.orderDetail
            ?.dutyfreeDetail
            ?.loyaltyPotentialPoint ??
        0;
    eventRequestMap[Parameters.rewards_multiplier.name] = '';
    eventRequestMap[Parameters.rewards_burned.name] = paymentMethodState
            .dutyFreeOrderDetailResponse
            ?.orderDetail
            ?.dutyfreeDetail
            ?.loyaltyPotentialPoint ??
        0;
    eventRequestMap[Parameters.error_text.name] =
        adResponseState.message.toString();
    eventRequestMap[Parameters.error_code.name] =
        adResponseState.errorCode.toString();

    eventRequestMap[Parameters.date_of_birth.name] =
        (dutyFreeState?.dateOfBirthController.text.isNotEmpty ?? false)
            ? Utils.getFormattedDateOrTime(
                date: dutyFreeState?.dateOfBirthController.text ?? '',
              )
            : 'N/A';
    eventRequestMap[Parameters.pick_up_date.name] =
        (dutyFreeState?.pickupDateController.text.isNotEmpty ?? false)
            ? Utils.getFormattedDateOrTime(
                date: dutyFreeState?.pickupDateController.text ?? '',
              )
            : 'N/A';
    eventRequestMap[Parameters.pick_up_time.name] =
        dutyFreeState?.pickupTimeController.text ?? 'N/A';
    eventRequestMap[Parameters.nationality.name] =
        dutyFreeState?.countryNameController.text ?? 'N/A';

    eventRequestMap[Parameters.total_price.name] =
        dutyFreeState?.dutyFreeCartResponse?.finalAmount?.amount ?? 0;
    eventRequestMap[Parameters.purchase_revenue.name] =
        dutyFreeState?.dutyFreeCartResponse?.finalAmount?.amount ?? 0;
    eventRequestMap[Parameters.cart_amount.name] =
        dutyFreeState?.dutyFreeCartResponse?.unitPriceResponse?.amount ?? 0;
    eventRequestMap[Parameters.total_discount.name] =
        getTotalDiscount(dutyFreeState?.dutyFreeCartResponse);

    ClickEvents.duty_free_payment_fail.logEvent(
      parameters: eventRequestMap,
    );
  }

  void checkoutFailed(ADResponseState responseState) {
    final Map<String, Object?> eventRequestMap = HashMap();
    eventRequestMap[Parameters.category.name] = 'duty_free';
    eventRequestMap[Parameters.sub_category.name] = 'ecommerce';
    eventRequestMap[Parameters.currency.name] = 'INR';
    eventRequestMap[Parameters.click_text.name] = 'Place Order';
    eventRequestMap[Parameters.cart_item.name] =
        dutyFreeState?.dutyFreeCartResponse?.itemDetails.length ?? 0;
    eventRequestMap[Parameters.total_price.name] =
        dutyFreeState?.dutyFreeCartResponse?.finalAmount?.amount ?? 0;
    eventRequestMap[Parameters.cart_amount.name] =
        dutyFreeState?.dutyFreeCartResponse?.unitPriceResponse?.amount ?? 0;
    eventRequestMap[Parameters.value.name] =
        dutyFreeState?.dutyFreeCartResponse?.finalAmount?.amount ?? 0;
    eventRequestMap[Parameters.total_discount.name] =
        getTotalDiscount(dutyFreeState?.dutyFreeCartResponse);
    eventRequestMap[Parameters.flight_number.name] =
        dutyFreeState?.flightNumberController.text ?? 'N/A';
    eventRequestMap[Parameters.country.name] = 'India';
    eventRequestMap[Parameters.nationality.name] =
        dutyFreeState?.countryNameController ?? 'N/A';
    eventRequestMap[Parameters.cart_item.name] =
        dutyFreeState?.dutyFreeCartResponse?.itemDetails.length ?? 0;
    eventRequestMap[Parameters.coupon.name] =
        dutyFreeState?.dutyFreeCartResponse?.promoCoupon?.promoCode ?? 'N/A';

    eventRequestMap[Parameters.coupon_value.name] =
        dutyFreeState?.dutyFreeCartResponse?.promoCoupon?.offerValue ?? 0;

    eventRequestMap[Parameters.error_text.name] = responseState.message;
    eventRequestMap[Parameters.error_code.name] = responseState.errorCode;

    eventRequestMap[Parameters.date_of_birth.name] =
        (dutyFreeState?.dateOfBirthController.text.isNotEmpty ?? false)
            ? Utils.getFormattedDateOrTime(
                date: dutyFreeState?.dateOfBirthController.text ?? '',
              )
            : 'N/A';
    eventRequestMap[Parameters.pick_up_date.name] =
        (dutyFreeState?.pickupDateController.text.isNotEmpty ?? false)
            ? Utils.getFormattedDateOrTime(
                date: dutyFreeState?.pickupDateController.text ?? '',
              )
            : 'N/A';
    eventRequestMap[Parameters.pick_up_time.name] =
        dutyFreeState?.pickupTimeController.text ?? 'N/A';
    eventRequestMap[Parameters.nationality.name] =
        dutyFreeState?.countryNameController.text ?? 'N/A';

    eventRequestMap[Parameters.source.name] = 'cart_screen';
    eventRequestMap[Parameters.label.name] = 'cart';

    eventRequestMap[Parameters.rewards_earned.name] =
        dutyFreeState?.dutyFreeCartResponse?.loyaltyPotentialPoint ?? 0;

    final itemIdList = StringBuffer();
    final itemNameList = StringBuffer();

    final List<ItemDetailResponse> productList =
        dutyFreeState?.dutyFreeCartResponse?.itemDetails ?? [];
    adLog('');

    for (int index = 0; index < productList.length; index++) {
      itemIdList.write('${productList[index].skuCode},');
      itemNameList.write('${productList[index].skuName},');
    }

    if (productList.isNotEmpty) {
      final String ids =
          itemIdList.toString().substring(0, itemIdList.length - 1);
      final String names =
          itemNameList.toString().substring(0, itemNameList.length - 1);
      eventRequestMap[Parameters.item_id_list.name] = ids;
      eventRequestMap[Parameters.item_name_list.name] = names;
    }

    ClickEvents.duty_free_checkout_fail.logEvent(
      parameters: eventRequestMap,
    );
  }

  void addDetailsEvent() {
    final Map<String, Object?> eventRequestMap = HashMap();
    eventRequestMap[Parameters.category.name] = 'duty_free';
    eventRequestMap[Parameters.sub_category.name] = 'purchase';
    eventRequestMap[Parameters.currency.name] = 'INR';
    eventRequestMap[Parameters.click_text.name] = 'Place Order';
    eventRequestMap[Parameters.country.name] = 'India';
    eventRequestMap[Parameters.cart_item.name] =
        dutyFreeState?.dutyFreeCartResponse?.itemDetails.length ?? 0;
    eventRequestMap[Parameters.total_price.name] =
        dutyFreeState?.dutyFreeCartResponse?.finalAmount?.amount ?? 0;
    eventRequestMap[Parameters.cart_amount.name] =
        dutyFreeState?.dutyFreeCartResponse?.unitPriceResponse?.amount ?? 0;
    eventRequestMap[Parameters.total_discount.name] =
        getTotalDiscount(dutyFreeState?.dutyFreeCartResponse);
    eventRequestMap[Parameters.flight_number.name] =
        dutyFreeState?.flightNumberController.text ?? 'N/A';

    eventRequestMap[Parameters.coupon.name] =
        dutyFreeState?.dutyFreeCartResponse?.promoCoupon?.promoCode ?? 'N/A';
    eventRequestMap[Parameters.coupon_value.name] =
        dutyFreeState?.dutyFreeCartResponse?.promoCoupon?.offerValue ?? 0;
    eventRequestMap[Parameters.rewards_earned.name] =
        dutyFreeState?.dutyFreeCartResponse?.loyaltyPotentialPoint ?? 0;

    eventRequestMap[Parameters.date_of_birth.name] =
        (dutyFreeState?.dateOfBirthController.text.isNotEmpty ?? false)
            ? Utils.getFormattedDateOrTime(
                date: dutyFreeState?.dateOfBirthController.text ?? '',
              )
            : 'N/A';
    eventRequestMap[Parameters.pick_up_date.name] =
        (dutyFreeState?.pickupDateController.text.isNotEmpty ?? false)
            ? Utils.getFormattedDateOrTime(
                date: dutyFreeState?.pickupDateController.text ?? '',
              )
            : 'N/A';
    eventRequestMap[Parameters.pick_up_time.name] =
        dutyFreeState?.pickupTimeController.text ?? 'N/A';
    eventRequestMap[Parameters.nationality.name] =
        dutyFreeState?.countryNameController.text ?? 'N/A';
    eventRequestMap[Parameters.page_type.name] = 'customer_information_screen';
    eventRequestMap[Parameters.source.name] = 'customer_information_screen';

    final itemIdList = StringBuffer();
    final itemNameList = StringBuffer();
    final rewardMultiplier = StringBuffer();

    final List<ItemDetailResponse> productList =
        dutyFreeState?.dutyFreeCartResponse?.itemDetails ?? [];

    for (int index = 0; index < productList.length; index++) {
      itemIdList.write('${productList[index].skuCode},');
      itemNameList.write('${productList[index].skuName},');
      rewardMultiplier.write('${productList[index].earn2XString},');
    }

    if (productList.isNotEmpty) {
      final String ids =
          itemIdList.toString().substring(0, itemIdList.length - 1);
      final String names =
          itemNameList.toString().substring(0, itemNameList.length - 1);
      final String rewards =
          rewardMultiplier.toString().substring(0, rewardMultiplier.length - 1);
      eventRequestMap[Parameters.item_id_list.name] = ids;
      eventRequestMap[Parameters.item_name_list.name] = names;
      eventRequestMap[Parameters.rewards_multiplier.name] = rewards;
    }

    ClickEvents.duty_free_add_details.logEvent(
      parameters: eventRequestMap,
    );
  }

  void otherServices(String tittle) {
    final Map<String, Object?> eventRequestMap = HashMap();
    eventRequestMap[Parameters.category.name] = 'duty_free';
    eventRequestMap[Parameters.sub_category.name] = 'More Services';
    eventRequestMap[Parameters.currency.name] = 'INR';
    eventRequestMap[Parameters.click_text.name] = 'Place Order';
    eventRequestMap[Parameters.product_category.name] = 'Success Page';
    eventRequestMap[Parameters.service_select.name] = tittle;
    ClickEvents.duty_free_other_services.logEvent(
      parameters: eventRequestMap,
    );
  }

  ///Cancellation

  void orderCancellationStartEvent() {
    final Map<String, Object?> eventRequestMap = HashMap();
    eventRequestMap[Parameters.category.name] = 'duty_free';
    eventRequestMap[Parameters.sub_category.name] = 'cancellation';
    eventRequestMap[Parameters.transaction_id.name] =
        dutyFreeOrderState?.transactionId ?? 'N/A';
    ClickEvents.duty_free_order_cancellation_start.logEvent(
      parameters: eventRequestMap,
    );
  }

  void cancellationReasonEvent() {
    final Map<String, Object?> eventRequestMap = HashMap();
    eventRequestMap[Parameters.category.name] = 'duty_free';
    eventRequestMap[Parameters.sub_category.name] = 'cancellation';
    eventRequestMap[Parameters.transaction_id.name] =
        dutyFreeOrderState?.transactionId ?? 'N/A';
    eventRequestMap[Parameters.cancel_reason.name] =
        dutyFreeOrderState?.dutyFreeCancellationRequest.reason;
    eventRequestMap[Parameters.total_price.name] = dutyFreeOrderState
            ?.dutyFreeCancelOrderDetailsResponseModel
            ?.orderDetail
            ?.dutyfreeDetail
            ?.finalAmount
            ?.amount ??
        0;
    eventRequestMap[Parameters.cart_amount.name] =
        dutyFreeState?.dutyFreeCartResponse?.unitPriceResponse?.amount ?? 0;
    eventRequestMap[Parameters.currency.name] = 'INR';
    ClickEvents.duty_free_cancellation_reason.logEvent(
      parameters: eventRequestMap,
    );
  }

  void confirmCancellationPopupEvent() {
    final Map<String, Object?> eventRequestMap = HashMap();
    eventRequestMap[Parameters.category.name] = 'duty_free';
    eventRequestMap[Parameters.sub_category.name] = 'cancellation';
    eventRequestMap[Parameters.transaction_id.name] =
        dutyFreeOrderState?.transactionId ?? 'N/A';
    eventRequestMap[Parameters.cancel_reason.name] =
        dutyFreeOrderState?.dutyFreeCancellationRequest.reason ?? '';
    eventRequestMap[Parameters.total_price.name] = dutyFreeOrderState
            ?.dutyFreeCancelOrderDetailsResponseModel
            ?.orderDetail
            ?.dutyfreeDetail
            ?.finalAmount
            ?.amount ??
        0;
    eventRequestMap[Parameters.cart_amount.name] =
        dutyFreeState?.dutyFreeCartResponse?.unitPriceResponse?.amount ?? 0;
    eventRequestMap[Parameters.currency.name] = 'INR';
    eventRequestMap[Parameters.label.name] = 'cancel';
    ClickEvents.duty_free_confirm_cancellation_popup.logEvent(
      parameters: eventRequestMap,
    );
  }

  void cancellationSuccessEvent() {
    final Map<String, Object?> eventRequestMap = HashMap();
    eventRequestMap[Parameters.category.name] = 'duty_free';
    eventRequestMap[Parameters.sub_category.name] = 'cancellation';
    eventRequestMap[Parameters.transaction_id.name] =
        dutyFreeOrderState?.transactionId ?? 'N/A';
    eventRequestMap[Parameters.cancel_reason.name] =
        dutyFreeOrderState?.dutyFreeCancellationRequest.reason ?? '';
    eventRequestMap[Parameters.total_price.name] = dutyFreeOrderState
            ?.dutyFreeCancelOrderDetailsResponseModel
            ?.orderDetail
            ?.dutyfreeDetail
            ?.finalAmount
            ?.amount ??
        0;
    eventRequestMap[Parameters.cart_amount.name] =
        dutyFreeState?.dutyFreeCartResponse?.unitPriceResponse?.amount ?? 0;
    eventRequestMap[Parameters.currency.name] = 'INR';
    ClickEvents.duty_free_cancellation_success.logEvent(
      parameters: eventRequestMap,
    );
  }

  /// Reschedule
  void rescheduleStartEvent() {
    final Map<String, Object?> eventRequestMap = HashMap();
    eventRequestMap[Parameters.category.name] = 'duty_free';
    eventRequestMap[Parameters.sub_category.name] = 'reschedule';
    eventRequestMap[Parameters.transaction_id.name] =
        dutyFreeOrderState?.transactionId ?? 'N/A';
    ClickEvents.duty_free_reschedule_start.logEvent(
      parameters: eventRequestMap,
    );
  }

  /// Reschedule
  void rescheduleSubmitEvent(DutyFreeOrderState dutyFreeOrderState) {
    final Map<String, Object?> eventRequestMap = HashMap();
    eventRequestMap[Parameters.category.name] = 'duty_free';
    eventRequestMap[Parameters.sub_category.name] = 'reschedule';
    eventRequestMap[Parameters.transaction_id.name] =
        dutyFreeOrderState.transactionId;
    eventRequestMap[Parameters.date.name] = (dutyFreeOrderState
                .dutyFreeCancelOrderDetailsResponseModel
                ?.orderDetail
                ?.dutyfreeDetail
                ?.passengerDetail
                .first
                .pickupDate
                .isNotEmpty ??
            false)
        ? Utils.getFormattedDateOrTime(
            date: dutyFreeOrderState
                    .dutyFreeCancelOrderDetailsResponseModel
                    ?.orderDetail
                    ?.dutyfreeDetail
                    ?.passengerDetail
                    .first
                    .pickupDate ??
                '',
          )
        : 'N/A';
    eventRequestMap[Parameters.scheduled_time.name] =
        Utils.convertSingleTimeToAmPm(
      dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel?.orderDetail
              ?.dutyfreeDetail?.passengerDetail.first.pickupTime ??
          '',
    );
    eventRequestMap[Parameters.flight_number.name] = dutyFreeOrderState
            .dutyFreeCancelOrderDetailsResponseModel
            ?.orderDetail
            ?.dutyfreeDetail
            ?.passengerDetail
            .first
            .flightNo ??
        'N/A';
    eventRequestMap[Parameters.rescheduled_time.name] =
        dutyFreeOrderState.pickupTimeSlot;
    eventRequestMap[Parameters.rescheduled_flight_number.name] =
        dutyFreeOrderState.flightNumber;
    eventRequestMap[Parameters.rescheduled_date.name] =
        Utils.getFormattedDateOrTime(date: dutyFreeOrderState.pickupDate);
    ClickEvents.duty_free_reschedule_submit.logEvent(
      parameters: eventRequestMap,
    );
  }

  void rescheduleSuccessEvent(DutyFreeOrderState dutyFreeOrderState) {
    final Map<String, Object?> eventRequestMap = HashMap();
    eventRequestMap[Parameters.category.name] = 'duty_free';
    eventRequestMap[Parameters.sub_category.name] = 'reschedule';
    eventRequestMap[Parameters.transaction_id.name] =
        dutyFreeOrderState.transactionId;
    eventRequestMap[Parameters.date.name] = (dutyFreeOrderState
                .dutyFreeCancelOrderDetailsResponseModel
                ?.orderDetail
                ?.dutyfreeDetail
                ?.passengerDetail
                .first
                .pickupDate
                .isNotEmpty ??
            false)
        ? Utils.getFormattedDateOrTime(
            date: dutyFreeOrderState
                    .dutyFreeCancelOrderDetailsResponseModel
                    ?.orderDetail
                    ?.dutyfreeDetail
                    ?.passengerDetail
                    .first
                    .pickupDate ??
                '',
          )
        : 'N/A';
    eventRequestMap[Parameters.scheduled_time.name] =
        Utils.convertSingleTimeToAmPm(
      dutyFreeOrderState.dutyFreeCancelOrderDetailsResponseModel?.orderDetail
              ?.dutyfreeDetail?.passengerDetail.first.pickupTime ??
          '',
    );
    eventRequestMap[Parameters.flight_number.name] = dutyFreeOrderState
            .dutyFreeCancelOrderDetailsResponseModel
            ?.orderDetail
            ?.dutyfreeDetail
            ?.passengerDetail
            .first
            .flightNo ??
        'N/A';
    eventRequestMap[Parameters.rescheduled_time.name] =
        dutyFreeOrderState.pickupTimeSlot;
    eventRequestMap[Parameters.rescheduled_flight_number.name] =
        dutyFreeOrderState.flightNumber;
    eventRequestMap[Parameters.rescheduled_date.name] =
        Utils.getFormattedDateOrTime(date: dutyFreeOrderState.pickupDate);
    ClickEvents.duty_free_reschedule_success.logEvent(
      parameters: eventRequestMap,
    );
  }

  void rescheduleFail(ADResponseState adResponseState) {
    final Map<String, Object?> eventRequestMap = HashMap();
    eventRequestMap[Parameters.category.name] = 'duty_free';
    eventRequestMap[Parameters.sub_category.name] = 'reschedule';
    eventRequestMap[Parameters.error_text.name] = adResponseState.message;
    eventRequestMap[Parameters.error_code.name] = adResponseState.errorCode;
    ClickEvents.duty_free_reschedule_fail.logEvent(
      parameters: eventRequestMap,
    );
  }

  void rescheduleSubmitFail(ADResponseState adResponseState) {
    final Map<String, Object?> eventRequestMap = HashMap();
    eventRequestMap[Parameters.category.name] = 'duty_free';
    eventRequestMap[Parameters.sub_category.name] = 'reschedule';
    eventRequestMap[Parameters.error_text.name] = adResponseState.message;
    eventRequestMap[Parameters.error_code.name] = adResponseState.errorCode;
    ClickEvents.duty_free_reschedule_submit_fail.logEvent(
      parameters: eventRequestMap,
    );
  }

  void applyAndRemoveCoupon(ClickEvents clickEvents) {
    final Map<String, Object?> eventRequestMap = HashMap();
    eventRequestMap[Parameters.category.name] = 'duty_free';
    eventRequestMap[Parameters.sub_category.name] = 'purchase';
    eventRequestMap[Parameters.currency.name] = 'INR';
    eventRequestMap[Parameters.click_text.name] = 'coupon';
    eventRequestMap[Parameters.country.name] = 'India';
    eventRequestMap[Parameters.cart_item.name] =
        dutyFreeState?.dutyFreeCartResponse?.itemDetails.length ?? 0;
    eventRequestMap[Parameters.total_price.name] =
        dutyFreeState?.dutyFreeCartResponse?.finalAmount?.amount ?? 0;
    eventRequestMap[Parameters.cart_amount.name] =
        dutyFreeState?.dutyFreeCartResponse?.unitPriceResponse?.amount ?? 0;
    eventRequestMap[Parameters.total_discount.name] =
        getTotalDiscount(dutyFreeState?.dutyFreeCartResponse);

    eventRequestMap[Parameters.coupon.name] =
        dutyFreeState?.dutyFreeCartResponse?.promoCoupon?.promoCode ?? 'N/A';
    eventRequestMap[Parameters.coupon_value.name] =
        dutyFreeState?.dutyFreeCartResponse?.promoCoupon?.offerValue ?? 0;

    eventRequestMap[Parameters.coupon_unit.name] =
        dutyFreeState?.dutyFreeCartResponse?.promoCoupon?.promoValueType ??
            'N/A';

    clickEvents.logEvent(
      parameters: eventRequestMap,
      // items: itemList,
    );
  }

  void couponListEvent() {
    final Map<String, Object?> eventRequestMap = HashMap();
    eventRequestMap[Parameters.category.name] = 'duty_free';
    eventRequestMap[Parameters.sub_category.name] = 'purchase';
    eventRequestMap[Parameters.currency.name] = 'INR';
    eventRequestMap[Parameters.click_text.name] = 'coupon';
    eventRequestMap[Parameters.country.name] = 'India';
    eventRequestMap[Parameters.cart_item.name] =
        dutyFreeState?.dutyFreeCartResponse?.itemDetails.length ?? 0;
    eventRequestMap[Parameters.total_price.name] =
        dutyFreeState?.dutyFreeCartResponse?.finalAmount?.amount ?? 0;
    eventRequestMap[Parameters.cart_amount.name] =
        dutyFreeState?.dutyFreeCartResponse?.unitPriceResponse?.amount ?? 0;
    eventRequestMap[Parameters.total_discount.name] =
        getTotalDiscount(dutyFreeState?.dutyFreeCartResponse);
    ClickEvents.duty_free_coupon.logEvent(
      parameters: eventRequestMap,
    );
  }

  void applyCouponClick({required String? loginStatus}) {
    final Map<String, Object?> eventRequestMap = HashMap();
    eventRequestMap[Parameters.category.name] = 'duty_free';
    eventRequestMap[Parameters.sub_category.name] = 'purchase';
    eventRequestMap[Parameters.login_status.name] = loginStatus;
    ClickEvents.duty_free_apply_coupon_click.logEvent(
      parameters: eventRequestMap,
    );
  }

  void viewBannerEvent(DutyFreeItem data) {
    final Map<String, Object?> eventRequestMap = HashMap();
    eventRequestMap[Parameters.category.name] = 'duty_free';
    eventRequestMap[Parameters.sub_category.name] = 'purchase';
    eventRequestMap[Parameters.product_category.name] = data.category;
    eventRequestMap[Parameters.source.name] = 'duty_free';
    eventRequestMap[Parameters.label.name] = data.title;
    eventRequestMap[Parameters.banner_category.name] =
        '${data.category}_homepage_banner';

    ClickEvents.view_banner.logEvent(
      parameters: eventRequestMap,
    );
  }

  void retryPaymentEvent() {
    final Map<String, Object?> eventRequestMap = HashMap();
    eventRequestMap[Parameters.category.name] = 'duty_free';
    eventRequestMap[Parameters.sub_category.name] = 'purchase';
    ClickEvents.duty_free_retry_payment.logEvent(
      parameters: eventRequestMap,
    );
  }

  void otherPaymentEvent() {
    final Map<String, Object?> eventRequestMap = HashMap();
    eventRequestMap[Parameters.category.name] = 'duty_free';
    eventRequestMap[Parameters.sub_category.name] = 'purchase';
    ClickEvents.duty_free_other_payment.logEvent(
      parameters: eventRequestMap,
    );
  }

  num getTotalPrice(PaymentMethodState paymentMethodState) {
    return (paymentMethodState.dutyFreeOrderDetailResponse?.orderDetail
                ?.dutyfreeDetail?.finalAmount?.amount ??
            0) +
        (paymentMethodState.dutyFreeOrderDetailResponse?.orderDetail
                ?.dutyfreeDetail?.loyaltyPotentialPoint ??
            0);
  }

  void cartUpdated({
    String? skuCode,
    DutyFreeAddToCartRequest? addToCartRequest,
    required int quantity,
    required String type,
    required bool isExclusive,
  }) {
    try {
      final Map<String, Object?> cartUpdatedRequest = HashMap();

      final ItemDetailResponse itemDetailResponse = skuCode == null
          ? getItemDetailResponseModel(addToCartRequest)
          : getLastModifiedItemFromAddToCartResponse(skuCode) ??
              const ItemDetailResponse();

      cartUpdatedRequest[Parameters.type.name] = type;
      cartUpdatedRequest[Parameters.category.name] = 'duty_free';
      cartUpdatedRequest[Parameters.sub_category.name] = 'purchase';

      cartUpdatedRequest[Parameters.currency.name] = 'INR';
      cartUpdatedRequest[Parameters.country.name] = 'India';
      cartUpdatedRequest[Parameters.quantity.name] = quantity;
      cartUpdatedRequest[Parameters.cart_item.name] =
          dutyFreeState?.dutyFreeCartResponse?.itemDetails.length ?? 0;

      cartUpdatedRequest[Parameters.total_price.name] =
          dutyFreeState?.dutyFreeCartResponse?.finalAmount?.amount ?? 0;
      cartUpdatedRequest[Parameters.cart_amount.name] =
          dutyFreeState?.dutyFreeCartResponse?.unitPriceResponse?.amount ?? 0;
      cartUpdatedRequest[Parameters.total_discount.name] =
          getTotalDiscount(dutyFreeState?.dutyFreeCartResponse);
      cartUpdatedRequest[Parameters.value.name] =
          dutyFreeState?.dutyFreeCartResponse?.finalAmount?.amount ?? 0;

      cartUpdatedRequest[Parameters.coupon.name] =
          dutyFreeState?.dutyFreeCartResponse?.promoCoupon?.promoCode ?? 'N/A';
      cartUpdatedRequest[Parameters.coupon_value.name] =
          dutyFreeState?.dutyFreeCartResponse?.promoCoupon?.offerValue ?? 0;

      cartUpdatedRequest[Parameters.rewards_earned.name] =
          itemDetailResponse.loyaltyPoints;
      cartUpdatedRequest[Parameters.rewards_multiplier.name] =
          itemDetailResponse.earn2XString;

      cartUpdatedRequest[Parameters.airport_name.name] =
          selectedAirportsData?.airportName;
      cartUpdatedRequest[Parameters.terminal.name] =
          dutyFreeState?.terminalModel.value.title;

      final List<AnalyticsEventItem> itemList = <AnalyticsEventItem>[];
      final itemIdList = StringBuffer();
      final itemNameList = StringBuffer();
      final productCategories = StringBuffer();

      adLog('');

      final List<ItemDetailResponse> itemDetails =
          dutyFreeState?.dutyFreeCartResponse?.itemDetails ?? [];
      for (int index = 0; index < itemDetails.length; index++) {
        itemIdList.write('${itemDetails[index].skuCode},');
        itemNameList.write('${itemDetails[index].skuName},');
        productCategories.write('${itemDetails[index].materialName},');
        itemList.add(
          AnalyticsEventItem(
            affiliation: 'N/A',
            currency: 'INR',
            coupon: 'N/A',
            creativeName: 'N/A',
            creativeSlot: 'N/A',
            discount: itemDetails[index].discountedPrice > 0
                ? itemDetails[index].unitPrice -
                    itemDetails[index].discountedPrice
                : 0,
            index: index,
            itemBrand: itemDetails[index].brandName,
            itemCategory: itemDetails[index].materialName,
            itemCategory2: itemDetails[index].subCategoryName,
            itemCategory4: itemCategory4(
              isExclusive: isExclusive,
              isOffers: itemDetails[index].promotion != null,
            ),
            itemCategory5: itemDetails[index].productImage,
            itemId: itemDetails[index].skuCode,
            itemListId: 'N/A',
            itemListName: 'N/A',
            itemName: itemDetails[index].skuName,
            itemVariant: 'N/A',
            locationId: 'N/A',
            price: itemDetails[index].unitPrice,
            promotionId: 'N/A',
            promotionName: 'N/A',
            itemCategory3: 'N/A',
            quantity: itemDetails[index].quantity,
          ),
        );
      }
      if (itemDetails.isNotEmpty) {
        final String ids =
            itemIdList.toString().substring(0, itemIdList.length - 1);
        final String names =
            itemNameList.toString().substring(0, itemNameList.length - 1);
        final String category = productCategories
            .toString()
            .substring(0, productCategories.length - 1);

        cartUpdatedRequest[Parameters.item_id_list.name] = ids;
        cartUpdatedRequest[Parameters.item_name_list.name] = names;
        cartUpdatedRequest[Parameters.product_category.name] = category;
      }

      ClickEvents.cart_updated.logAnalyticsEventItem(
        parameters: cartUpdatedRequest,
        items: itemList,
      );
    } catch (e) {
      debugPrintStack(label: e.toString());
    }
  }

  void clearCartEvent({
    DutyFreeCartResponse? response,
    bool? isExclusive,
    required CartType type,
  }) {
    try {
      final Map<String, Object?> cartUpdatedRequest = HashMap();
      cartUpdatedRequest[Parameters.type.name] = type.name;
      cartUpdatedRequest[Parameters.category.name] = 'duty_free';
      cartUpdatedRequest[Parameters.sub_category.name] = 'purchase';

      cartUpdatedRequest[Parameters.currency.name] = 'INR';
      cartUpdatedRequest[Parameters.country.name] = 'India';

      cartUpdatedRequest[Parameters.cart_item.name] =
          response?.itemDetails.length ?? 0;

      cartUpdatedRequest[Parameters.total_price.name] =
          response?.finalAmount?.amount ?? 0;
      cartUpdatedRequest[Parameters.cart_amount.name] =
          response?.unitPriceResponse?.amount ?? 0;
      cartUpdatedRequest[Parameters.total_discount.name] =
          getTotalDiscount(dutyFreeState?.dutyFreeCartResponse);
      cartUpdatedRequest[Parameters.value.name] =
          response?.finalAmount?.amount ?? 0;

      cartUpdatedRequest[Parameters.coupon.name] =
          response?.promoCoupon?.promoCode ?? 'N/A';
      cartUpdatedRequest[Parameters.coupon_value.name] =
          response?.promoCoupon?.offerValue ?? 0;

      cartUpdatedRequest[Parameters.airport_name.name] =
          selectedAirportsData?.airportName;
      cartUpdatedRequest[Parameters.terminal.name] =
          dutyFreeState?.terminalModel.value.title;

      final List<AnalyticsEventItem> itemList = <AnalyticsEventItem>[];
      final itemIdList = StringBuffer();
      final itemNameList = StringBuffer();
      final productCategories = StringBuffer();

      adLog('');

      final List<ItemDetailResponse> itemDetails = response?.itemDetails ?? [];
      for (int index = 0; index < itemDetails.length; index++) {
        itemIdList.write('${itemDetails[index].skuCode},');
        itemNameList.write('${itemDetails[index].skuName},');
        productCategories.write('${itemDetails[index].materialName},');
        itemList.add(
          AnalyticsEventItem(
            affiliation: 'N/A',
            currency: 'INR',
            coupon: 'N/A',
            creativeName: 'N/A',
            creativeSlot: 'N/A',
            discount: itemDetails[index].discountedPrice > 0
                ? itemDetails[index].unitPrice -
                    itemDetails[index].discountedPrice
                : 0,
            index: index,
            itemBrand: itemDetails[index].brandName,
            itemCategory: itemDetails[index].materialName,
            itemCategory2: itemDetails[index].subCategoryName,
            itemCategory4: itemCategory4(
              isExclusive: isExclusive,
              isOffers: itemDetails[index].promotion != null,
            ),
            itemCategory5: itemDetails[index].productImage,
            itemId: itemDetails[index].skuCode,
            itemListId: 'N/A',
            itemListName: 'N/A',
            itemName: itemDetails[index].skuName,
            itemVariant: 'N/A',
            locationId: 'N/A',
            price: itemDetails[index].unitPrice,
            promotionId: 'N/A',
            promotionName: 'N/A',
            itemCategory3: 'N/A',
            quantity: itemDetails[index].quantity,
          ),
        );
      }
      if (itemDetails.isNotEmpty) {
        final String ids =
            itemIdList.toString().substring(0, itemIdList.length - 1);
        final String names =
            itemNameList.toString().substring(0, itemNameList.length - 1);
        final String category = productCategories
            .toString()
            .substring(0, productCategories.length - 1);

        cartUpdatedRequest[Parameters.item_id_list.name] = ids;
        cartUpdatedRequest[Parameters.item_name_list.name] = names;
        cartUpdatedRequest[Parameters.product_category.name] = category;
      }

      ClickEvents.clear_cart.logAnalyticsEventItem(
        parameters: cartUpdatedRequest,
        items: itemList,
      );
    } catch (e) {
      debugPrintStack(label: e.toString());
    }
  }

  String? itemCategory4({
    required isExclusive,
    required bool isOffers,
  }) {
    if ((isExclusive ?? false) && (!isOffers)) {
      return 'Exclusive';
    } else if ((isExclusive == false) && isOffers) {
      return 'Offers';
    } else if ((isExclusive ?? false) && isOffers) {
      return 'Exclusive + Offers';
    } else if (isExclusive == false && !isOffers) {
      return 'Regular';
    }
    return null;
  }
}
