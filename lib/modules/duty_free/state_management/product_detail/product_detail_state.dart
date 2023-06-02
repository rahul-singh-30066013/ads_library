/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'dart:async' show Future;
import 'dart:convert';

import 'package:adani_airport_mobile/modules/duty_free/models/product_detail_model.dart';
import 'package:adani_mobile_utility/base/base_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class ProductDetailState extends BaseViewModel {
  ProductDetailModel? _productDetailData;

  Future<void> getProductDetails(String jsonPath) async {
    updateState(ViewState.loading);
    await getProductDetailsFromJson(jsonPath).then((value) {
      _productDetailData = value;
      notifyListeners();
    }).then((value) => updateState(ViewState.success));
  }

  static Future<ProductDetailModel?> getProductDetailsFromJson(
    String jsonPath,
  ) async {
    final jsonString = await rootBundle.loadString(jsonPath);
    return compute(_parseProductDetailData, jsonString);
  }

  static ProductDetailModel _parseProductDetailData(String jsonBody) {
    final parsed = json.decode(jsonBody);
    return ProductDetailModel.fromJson(parsed);
  }

  ProductDetailModel get productDetailData =>
      _productDetailData ?? ProductDetailModel();
}
